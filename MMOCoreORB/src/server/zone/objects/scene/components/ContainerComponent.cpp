/*
				Copyright <SWGEmu>
		See file COPYING for copying conditions.
*/

#include "ContainerComponent.h"
#include "server/zone/objects/scene/SceneObject.h"
#include "server/zone/objects/building/BuildingObject.h"
#include "server/zone/Zone.h"
#include "server/zone/objects/creature/CreatureObject.h"
#include "server/zone/objects/player/PlayerObject.h"
#include "server/zone/objects/player/sessions/SlicingSession.h"

int ContainerComponent::canAddObject(SceneObject* sceneObject, SceneObject* object, int containmentType, String& errorDescription) const {
	if (sceneObject == object) {
		errorDescription = "@container_error_message:container02"; //You cannot add something to itself.

		return TransferErrorCode::CANTADDTOITSELF;
	}

	if ((object->isNoTrade() || object->containsNoTradeObjectRecursive()) && !object->isVendor()) {
		ManagedReference<SceneObject*> containerPlayerParent = sceneObject->getParentRecursively(SceneObjectType::PLAYERCREATURE);
		ManagedReference<SceneObject*> containerBuildingParent = sceneObject->getParentRecursively(SceneObjectType::BUILDING);
		ManagedReference<SceneObject*> containerFactoryParent = sceneObject->getParentRecursively(SceneObjectType::FACTORY);
		ManagedReference<SceneObject*> objPlayerParent = object->getParentRecursively(SceneObjectType::PLAYERCREATURE);
		ManagedReference<SceneObject*> objCreatureParent = object->getParentRecursively(SceneObjectType::CREATURE);
		ManagedReference<SceneObject*> objNpcCreatureParent = object->getParentRecursively(SceneObjectType::NPCCREATURE);
		ManagedReference<SceneObject*> objBuildingParent = object->getParentRecursively(SceneObjectType::BUILDING);


		if (containerFactoryParent != nullptr) {
			errorDescription = "@container_error_message:container28";
			return TransferErrorCode::CANTADD;
		} else if (objPlayerParent == nullptr && objCreatureParent == nullptr && objNpcCreatureParent == nullptr && objBuildingParent != nullptr) {
			ManagedReference<BuildingObject*> buio = cast<BuildingObject*>( objBuildingParent.get());

			if (buio != nullptr ) {
				uint64 bid = buio->getOwnerObjectID();

				if ((containerPlayerParent != nullptr && bid != containerPlayerParent->getObjectID()) || (sceneObject->isPlayerCreature() && bid != sceneObject->getObjectID())) {
					errorDescription = "@container_error_message:container27";
					return TransferErrorCode::CANTREMOVE;
				}
			}
		} else if (objPlayerParent != nullptr && containerPlayerParent == nullptr && containerBuildingParent != nullptr && !sceneObject->isPlayerCreature()) {
			ManagedReference<BuildingObject*> buio = cast<BuildingObject*>( containerBuildingParent.get());

			if (buio != nullptr && (buio->getOwnerObjectID() != objPlayerParent->getObjectID() || buio->isCivicStructure())) {
				errorDescription = "@container_error_message:container28";
				return TransferErrorCode::CANTADD;
			}
		}

	} else if (object->isVendor()) {
		ManagedReference<SceneObject*> containerPlayerParent = sceneObject->getParentRecursively(SceneObjectType::PLAYERCREATURE);

		if (!sceneObject->isCellObject() && (!sceneObject->hasArrangementDescriptor("inventory") || containerPlayerParent == nullptr)) {
			return TransferErrorCode::CANTADD;
		}
	}

	String validationError;

	switch (sceneObject->getContainerType()) {
	case ContainerType::NONE: // Nothing allowed
		validationError = "ContainerType is NONE";
		break;

	case ContainerType::SLOTTED: // Only slot transfer allowed
		if (containmentType < 4) {
			validationError = "ContainerType is SLOTTED but ContainerType < 4";
		}
		break;

	case ContainerType::VOLUME: // Only container transfer allowed of tangible object
		if (containmentType != -1 || !object->isTangibleObject()) {
			validationError = "ContainerType is VOLUME but !isTangibleObject()";
		}
		break;

	case ContainerType::INTANGIBLE: // Only intagible objects allowed
		if (containmentType != -1 || object->isTangibleObject()) {
			validationError = "ContainerType is INTANGIBLE but isTangibleObject()";
		}
		break;

	case ContainerType::GENERIC: // Generic container transfer
		if (containmentType != -1) {
			validationError = "ContainerType is GENERIC but containmentType != -1";
		}
		break;

	case ContainerType::RIDABLE: // Rideable
		if (containmentType < 4) {
			validationError = "ContainerType is RIDABLE but containmentType < 4";
		} else if (!(object->isVehicleObject() || object->isMount())) {
			validationError = "ContainerType is RIDABLE but not (isVehicleObject or isMount)";
		}
		break;
	}

	if (validationError.isEmpty()) {
		// Check for any parent that is containerType == NONE
		for (auto parent = sceneObject->getParent().get(); parent != nullptr; parent = parent->getParent().get()) {
			Locker lock(parent);

			if (parent->getContainerType() == ContainerType::NONE) {
				validationError = "ContainerType==NONE: oid " + String::valueOf(parent->getObjectID());
				break;
			}
		}
	}

	if (!validationError.isEmpty()) {
		sceneObject->error()
			<< "canAddObject: invalid attempt for containmentType "
			<< containmentType << " to add " << object->getObjectID()
			<< " into " << sceneObject->getObjectID() << " (ContainerType " << sceneObject->getContainerType() << ") - "
			<< validationError
			;
		errorDescription = "@container_error_message:container28";
		return TransferErrorCode::CANTADD;
	}

	Locker contLocker(sceneObject->getContainerLock());

	const VectorMap<String, ManagedReference<SceneObject*> >* slottedObjects = sceneObject->getSlottedObjects();
	VectorMap<uint64, ManagedReference<SceneObject*> >* containerObjects = sceneObject->getContainerObjects();

	if (containmentType >= 4) {
		int arrangementGroup = containmentType - 4;

		if (object->getArrangementDescriptorSize() > arrangementGroup) {
			const Vector<String>* descriptors = object->getArrangementDescriptor(arrangementGroup);

			for (int i = 0; i < descriptors->size(); ++i){
				const String& childArrangement = descriptors->get(i);

				if (slottedObjects->contains(childArrangement)) {
					errorDescription = "@container_error_message:container04"; //This slot is already occupied.
					return TransferErrorCode::SLOTOCCUPIED;
				}
			}
		}
	} else if (containmentType == -1) {
		if (containerObjects->size() >= sceneObject->getContainerVolumeLimit()) {
			errorDescription = "@container_error_message:container03"; //This container is full.

			return TransferErrorCode::CONTAINERFULL;
		}
	} else {
		sceneObject->error("unknown containmentType in canAddObject type " + String::valueOf(containmentType));
		errorDescription = "DEBUG: cant move item unknown containmentType type";
		return TransferErrorCode::UNKNOWNCONTAIMENTTYPE;
	}

	return 0;
}

bool ContainerComponent::checkContainerPermission(SceneObject* sceneObject, CreatureObject* creature, uint16 permission) const {
	auto permissions = sceneObject->getContainerPermissions();

	// creature->info(true) << "ContainerComponent::checkContainerPermission -- Perm: " << permission << " Object ID: " << sceneObject->getObjectID();

	if (permissions->getOwnerID() == creature->getObjectID()) {
		return permissions->hasOwnerPermission(permission);
	}

	PlayerObject* ghost = creature->getPlayerObject();

	if (ghost == nullptr) {
		return false;
	}

	if ((permission == ContainerPermissions::OPEN || permission == ContainerPermissions::WALKIN) && ghost->isPrivileged()) {
		return true;
	}

	ManagedReference<SceneObject*> parent = sceneObject->getParent().get();

	if (permission != ContainerPermissions::MOVECONTAINER && permissions->hasInheritPermissionsFromParent() && parent != nullptr && parent != sceneObject) {
		return parent->checkContainerPermission(creature, permission);
	} else if (permission == ContainerPermissions::MOVECONTAINER && sceneObject->isClientObject()) {
		return false;
	}

	SortedVector<String>* groups = ghost->getPermissionGroups();

	uint16 allowPermissions = 0, denyPermissions = 0;

	for (int i = 0; i < groups->size(); ++i) {
		const String& group = groups->get(i);

		uint16 allow = permissions->getAllowPermissions(group);

		allowPermissions |= allow;

		uint16 deny = permissions->getDenyPermissions(group);

		denyPermissions |= deny;
	}

	return permission & (allowPermissions & ~denyPermissions);
}

bool ContainerComponent::transferObject(SceneObject* sceneObject, SceneObject* object, int containmentType, bool notifyClient, bool allowOverflow, bool notifyRoot) const {
	if (sceneObject == object) {
		return false;
	}

#ifdef DEBUG_CONTAINER_TRANSFER
	if (object->isPlayerCreature()) {
		object->info(true) << "---------- " << object->getDisplayedName() << " --- STARTING container Transfer into new Parent - ID: " << sceneObject->getObjectID() << " ---------- ";
	}
#endif // DEBUG_CONTAINER_TRANSFER

	if (!object->canBeTransferred(sceneObject)) {
		return false;
	}

	// Terminate any active slicing sessions on the object being transferred
	if (object->containsActiveSession(SessionFacadeType::SLICING)) {
		ManagedReference<Facade*> facade = object->getActiveSession(SessionFacadeType::SLICING);
		ManagedReference<SlicingSession*> session = dynamic_cast<SlicingSession*>(facade.get());

		if (session != nullptr) {
			session->cancelSession();
		}
	}

	ManagedReference<SceneObject*> objParent = object->getParent().get();

	ManagedReference<Zone*> objZone = object->getLocalZone();
	ManagedReference<Zone*> oldRootZone = object->getZone();

	if (objParent != nullptr || objZone != nullptr) {
		bool nullifyParent = (sceneObject == nullptr);

		if (objParent != nullptr) {
			/*	Call the previous parent to remove
			*	Don't notify client yet, if you do here it confuses the client and drops tiems from toolbar etc
			*	Only nullify the object being transferreds' parent if the new parent is null, or it causes an issue during transitions for out of range object removal
			*/
			objParent->removeObject(object, sceneObject, false, nullifyParent);
		}

		if (nullifyParent && object->getParent() != nullptr) {
			object->error() << "Failed to remove object from old parent: " << object->getDisplayedName() << " ID: " << object->getObjectID() << " to container: " << sceneObject->getDisplayedName() << " ID: " << sceneObject->getObjectID();

			return false;
		}

		if (objZone != nullptr) {
			objZone->remove(object);
		}

		object->setZone(nullptr);

		if (objParent == nullptr) {
			objParent = objZone;
		}
	}

	// Lock the container
	Locker contLocker(sceneObject->getContainerLock());

	VectorMap<String, ManagedReference<SceneObject*> >* slottedObjects = sceneObject->getSlottedObjects();
	VectorMap<uint64, ManagedReference<SceneObject*> >* containerObjects = sceneObject->getContainerObjects();

	bool update = true;

	if (containmentType >= 4) {
		int arrangementGroup = containmentType - 4;

		if (object->getArrangementDescriptorSize() > arrangementGroup) {
			const Vector<String>* descriptors = object->getArrangementDescriptor(arrangementGroup);

			for (int i = 0; i < descriptors->size(); ++i){
				const String& childArrangement = descriptors->get(i);

				if (slottedObjects->contains(childArrangement)) {
					return false;
				}
			}

			for (int i = 0; i < descriptors->size(); ++i)	{
				 slottedObjects->put(descriptors->get(i), object);
			}
		} else {
			return false;
		}

		// Set the new parent
		object->setParent(sceneObject);
		object->setContainmentType(containmentType);
	} else if (containmentType == -1) {
#ifdef DEBUG_CONTAINER_TRANSFER
		if (object->isPlayerCreature()) {
			object->info(true) << object->getDisplayedName() << " --- container transfer will be using containment type -1";
		}
#endif // DEBUG_CONTAINER_TRANSFER

		// Check for volume limit if overflow is not allowed
		if (!allowOverflow && containerObjects->size() >= sceneObject->getContainerVolumeLimit()){
			return false;
		}

		// Attempt to add the object in the container
		if (containerObjects->put(object->getObjectID(), object) == -1) {
			update = false;
		}

		// Set the new parent
		object->setParent(sceneObject);
		object->setContainmentType(containmentType);

#ifdef DEBUG_CONTAINER_TRANSFER
		if (object->isPlayerCreature()) {
			object->info(true) << object->getDisplayedName() << " --- new parent succesfully set!";
		}
#endif // DEBUG_CONTAINER_TRANSFER

		ManagedReference<Zone*> newRootZone = object->getZone();

		if (newRootZone != nullptr && newRootZone != oldRootZone && newRootZone->isGroundZone()) {
			bool shouldRegister = true;

			// Prevent GCW PvE Base Terminals Registering when inserted in cell container
			if (object->isTerminal() && sceneObject->getParent().get() != nullptr) {
				SceneObject* containerParent = sceneObject->getParent().get();

				if (containerParent != nullptr && containerParent->isBuildingObject()) {
					BuildingObject* building = containerParent->asBuildingObject();

					if (building != nullptr && building->isGCWBase() && !(building->getPvpStatusBitmask() & ObjectFlag::OVERT)) {
						shouldRegister = false;
					}
				}
			}

			if (shouldRegister) {
				newRootZone->registerObjectWithPlanetaryMap(object);
			}
		}
	} else {
		object->error() << "transferObject - Failed to assign: " << object->getDisplayedName() << " ID: " << object->getObjectID() << " to container: " << sceneObject->getDisplayedName() << " ID: " << sceneObject->getObjectID() << " - unknown containment type: " <<containmentType;

		StackTrace::printStackTrace();
		return false;
	}

	contLocker.release();

	if ((containmentType >= 4) && (objZone == nullptr)) {
		sceneObject->broadcastObject(object, true);
	} else if (notifyClient) {
		sceneObject->broadcastMessage(object->link(sceneObject->getObjectID(), containmentType), true);
	}

	notifyObjectInserted(sceneObject, object);

	if (update) {
		sceneObject->updateToDatabase();
	}

	ManagedReference<SceneObject*> rootParent = object->getRootParent();

	if (rootParent != nullptr && notifyRoot) {
		rootParent->notifyObjectInsertedToChild(object, sceneObject, objParent);
	}

	object->notifyObservers(ObserverEventType::PARENTCHANGED, sceneObject);

#ifdef DEBUG_CONTAINER_TRANSFER
	if (object->isPlayerCreature()) {
		object->info(true) << "---------- " << object->getDisplayedName() << " COMPLETED container transfer into new Parent ID: " << sceneObject->getObjectID() << " ----------";
	}
#endif // DEBUG_CONTAINER_TRANSFER

	return true;
}

bool ContainerComponent::removeObject(SceneObject* sceneObject, SceneObject* object, SceneObject* destination, bool notifyClient, bool nullifyParent) const {
#ifdef DEBUG_CONTAINER_TRANSFER
	if (object->isPlayerCreature()) {
		object->info(true) << object->getDisplayedName() << " --- removeObject function START";
	}
#endif // DEBUG_CONTAINER_TRANSFER

	Locker contLocker(sceneObject->getContainerLock());

	VectorMap<String, ManagedReference<SceneObject*> >* slottedObjects = sceneObject->getSlottedObjects();
	VectorMap<uint64, ManagedReference<SceneObject*> >* containerObjects = sceneObject->getContainerObjects();

	ManagedReference<SceneObject*> objectKeeper = object;

	if (object->getParent() != nullptr && object->getParent() != sceneObject) {
		ManagedReference<SceneObject*> objParent = object->getParent();

		containerObjects->drop(object->getObjectID());

		if (objParent->hasObjectInContainer(object->getObjectID()) || objParent->hasObjectInSlottedContainer(object)) {
			sceneObject->error("trying to remove an object that is in a different object");
			objParent->info("i am the parent", true);

			return false;
		} else if (nullifyParent) {
			object->setParent(nullptr);
		}
	}

	int containedType = object->getContainmentType();
	int arrangementSize = object->getArrangementDescriptorSize();
	int arrangementGroup = Math::max(0, containedType - 4);

	if (arrangementSize > arrangementGroup) {
		bool removeFromSlot = false;

		const Vector<String>* descriptors = object->getArrangementDescriptor(arrangementGroup);

		for (int i = 0; i < descriptors->size(); ++i){
			const String& childArrangement = descriptors->get(i);

			ManagedReference<SceneObject*> slottedObj = slottedObjects->get(childArrangement);

			if (slottedObj == object) {
				removeFromSlot = true;
				break;
			}
		}

		if (removeFromSlot) {
			for (int i = 0; i < descriptors->size(); ++i) {
				slottedObjects->drop(descriptors->get(i));
			}
		}
	}

	if (containerObjects->contains(object->getObjectID())) {
		containerObjects->drop(object->getObjectID());
	}

	if (nullifyParent) {
		object->setParent(nullptr);
	}

	contLocker.release();

	if (notifyClient) {
		sceneObject->broadcastMessage(object->link((uint64) 0, 0xFFFFFFFF), true);
	}

	notifyObjectRemoved(sceneObject, object, destination);

	sceneObject->updateToDatabase();
	object->updateToDatabase();

	if (sceneObject->getParent() == nullptr) {
		sceneObject->notifyObjectRemovedFromChild(object, sceneObject);
	} else {
		ManagedReference<SceneObject*> rootParent = sceneObject->getRootParent();

		if (rootParent != nullptr) {
			rootParent->notifyObjectRemovedFromChild(object, sceneObject);
		} else {
			sceneObject->notifyObjectRemovedFromChild(object, sceneObject);
		}
	}

#ifdef DEBUG_CONTAINER_TRANSFER
	if (object->isPlayerCreature()) {
		object->info(true) << object->getDisplayedName() << " --- removeObject function COMPLETE";
	}
#endif // DEBUG_CONTAINER_TRANSFER

	return true;
}

/**
 * Is called when this object has been inserted with an object
 * @param object object that has been inserted
 */
int ContainerComponent::notifyObjectInserted(SceneObject* sceneObject, SceneObject* object) const {
	return sceneObject->notifyObjectInserted(object);
}

/**
 * Is called when an object was removed
 * @param object object that has been inserted
 */
int ContainerComponent::notifyObjectRemoved(SceneObject* sceneObject, SceneObject* object, SceneObject* destination) const {
	return sceneObject->notifyObjectRemoved(object);
}

