/*
				Copyright <SWGEmu>
		See file COPYING for copying conditions.
 */

#include "GroundZoneComponent.h"
#include "server/zone/objects/scene/SceneObject.h"
#include "server/zone/objects/area/ActiveArea.h"
#include "server/zone/objects/building/BuildingObject.h"
#include "server/zone/Zone.h"
#include "server/zone/packets/object/DataTransform.h"
#include "server/zone/packets/object/DataTransformWithParent.h"
#include "server/zone/packets/scene/UpdateTransformMessage.h"
#include "server/zone/packets/scene/UpdateTransformWithParentMessage.h"
#include "server/zone/packets/scene/LightUpdateTransformMessage.h"
#include "server/zone/packets/scene/LightUpdateTransformWithParentMessage.h"
#include "templates/building/SharedBuildingObjectTemplate.h"
#include "server/zone/objects/intangible/TheaterObject.h"

void GroundZoneComponent::notifyInsertToZone(SceneObject* sceneObject, Zone* newZone) const {
	debug("inserting to zone");

	if (newZone == nullptr)
		return;

	//Locker locker(sceneObject);

	sceneObject->teleport(sceneObject->getPositionX(), sceneObject->getPositionZ(), sceneObject->getPositionY(), sceneObject->getParentID());

	insertChildObjectsToZone(sceneObject, newZone);
}

void GroundZoneComponent::insertChildObjectsToZone(SceneObject* sceneObject, Zone* zone) const {
	SortedVector<ManagedReference<SceneObject*> >* childObjects = sceneObject->getChildObjects();

	//Insert all outdoor child objects to zone
	for (int i = 0; i < childObjects->size(); ++i) {
		ManagedReference<SceneObject*> outdoorChild = childObjects->get(i);

		if (outdoorChild == nullptr)
			continue;

		if (outdoorChild->getContainmentType() != 4 && outdoorChild->getParent() == nullptr) {
			Locker clocker(outdoorChild, sceneObject);

			zone->transferObject(outdoorChild, -1, true);
		}
	}
}

void GroundZoneComponent::teleport(SceneObject* sceneObject, float newPositionX, float newPositionZ, float newPositionY, uint64 parentID) const {
	ZoneServer* zoneServer = sceneObject->getZoneServer();
	Zone* zone = sceneObject->getZone();

	if (zone == nullptr) {
		return;
	}

	Locker locker(zone);

	if (parentID != 0) {
		Reference<SceneObject*> newParent = zoneServer->getObject(parentID);

		if (newParent == nullptr || !newParent->isCellObject()) {
			return;
		}

		if (newPositionX != sceneObject->getPositionX() || newPositionZ != sceneObject->getPositionZ() || newPositionY != sceneObject->getPositionY()) {
			sceneObject->setPosition(newPositionX, newPositionZ, newPositionY);
			sceneObject->updateZoneWithParent(newParent, false, false);
		}

		sceneObject->incrementMovementCounter();

		DataTransformWithParent* pack = new DataTransformWithParent(sceneObject);
		sceneObject->broadcastMessage(pack, true, false);
	} else {
		if (newPositionX != sceneObject->getPositionX() || newPositionZ != sceneObject->getPositionZ() || newPositionY != sceneObject->getPositionY()) {
			sceneObject->setPosition(newPositionX, newPositionZ, newPositionY);
			sceneObject->updateZone(false, false);
		}

		sceneObject->incrementMovementCounter();

		DataTransform* pack = new DataTransform(sceneObject);
		sceneObject->broadcastMessage(pack, true, false);
	}
}

void GroundZoneComponent::updateZone(SceneObject* sceneObject, bool lightUpdate, bool sendPackets) const {
	ManagedReference<SceneObject*> parent = sceneObject->getParent().get();
	Zone* zone = sceneObject->getZone();
	ManagedReference<SceneObject*> sceneObjectRootParent = sceneObject->getRootParent();

	if (zone == nullptr) {
		if (sceneObjectRootParent == nullptr)
			return;

		zone = sceneObjectRootParent->getZone();
	}

	if (parent != nullptr && (parent->isVehicleObject() || parent->isMount()))
		sceneObject->updateVehiclePosition(sendPackets);

	Locker _locker(zone);

	bool zoneUnlocked = false;

	if (parent != nullptr && parent->isCellObject()) {
		SceneObject* rootParent = parent->getRootParent();

		if (rootParent == nullptr)
			return;

		zone = rootParent->getZone();

		zone->transferObject(sceneObject, -1, false);

		zone->unlock();
		zoneUnlocked = true;
	} else {
		if (sceneObject->getLocalZone() != nullptr) {
			zone->update(sceneObject);

			zone->unlock();
			zoneUnlocked = true;

			try {
				zone->inRange(sceneObject, zone->getZoneObjectRange());
			} catch (Exception& e) {
				sceneObject->error(e.getMessage());
				e.printStackTrace();
			}
		}
	}

	try {
		bool isInvis = false;

		TangibleObject* tano = sceneObject->asTangibleObject();

		if (tano != nullptr) {
			zone->updateActiveAreas(tano);

			if (tano->isInvisible())
				isInvis = true;
		}

		if (!isInvis && sendPackets && (parent == nullptr || (!parent->isVehicleObject() && !parent->isMount()))) {
			if (lightUpdate) {
				LightUpdateTransformMessage* message = new LightUpdateTransformMessage(sceneObject);
				sceneObject->broadcastMessage(message, false, true);
			} else {
				UpdateTransformMessage* message = new UpdateTransformMessage(sceneObject);
				sceneObject->broadcastMessage(message, false, true);
			}
		}

		try {
			notifySelfPositionUpdate(sceneObject);
		} catch (Exception& e) {
			sceneObject->error("Exception caught while calling notifySelfPositionUpdate(sceneObject) in GroundZoneComponent::updateZone");
			sceneObject->error(e.getMessage());
		}
	} catch (Exception& e) {
		sceneObject->error(e.getMessage());
		e.printStackTrace();
	}

	if (zoneUnlocked)
		zone->wlock();
}

void GroundZoneComponent::updateZoneWithParent(SceneObject* sceneObject, SceneObject* newParent, bool lightUpdate, bool sendPackets) const {
	ManagedReference<Zone*> zone = sceneObject->getZone();
	ManagedReference<SceneObject*> oldParent = sceneObject->getParent().get();

	if (oldParent != nullptr && !oldParent->isCellObject()) {
		return;
	}

	if (zone == nullptr) {
		zone = newParent->getRootParent()->getZone();
	}

	Locker _locker(zone);

	 // Object is going from zone to new parent (cell, vehicle, mount, inventory, backpack etc)
	if (oldParent == nullptr) {
		newParent->transferObject(sceneObject, -1, true);

		zone->unlock();
	// Object already has a parent, so is either transferring to a new one or moving within the current and checking for active areas update
	} else {
		// Object is going from one parent to another (cell to cell, backpack to inventory etc)
		if (oldParent != newParent) {
			newParent->transferObject(sceneObject, -1, true);

			zone->unlock();
		// Object is not changing parents, unlock the zone and just check for active areas upate.
		} else {
			zone->unlock();

			try {
				TangibleObject* tano = sceneObject->asTangibleObject();

				if (tano != nullptr) {
					zone->updateActiveAreas(tano);
				}
			} catch (Exception& e) {
				sceneObject->error(e.getMessage());
				e.printStackTrace();
			}
		}
	}

	// Notify COV that sceneObject has moved
	try {
		CloseObjectsVector* closeObjects = sceneObject->getCloseObjects();

		if (closeObjects != nullptr) {
			SortedVector<TreeEntry*> objects(closeObjects->size(), 10);
			closeObjects->safeCopyTo(objects);

			for (int i = 0; i < objects.size(); ++i) {
				auto object = static_cast<SceneObject*>(objects.getUnsafe(i));

				try {
					object->notifyPositionUpdate(sceneObject);
				} catch (Exception& e) {
					object->error("exception while calling notifyPositionUpdate: " + e.getMessage());
				}
			}
		}

		bool isInvis = false;

		TangibleObject* tano = sceneObject->asTangibleObject();

		if (tano != nullptr) {
			if (tano->isInvisible())
				isInvis = true;
		}

		if (sendPackets && !isInvis) {
			if (lightUpdate) {
				LightUpdateTransformWithParentMessage* message = new LightUpdateTransformWithParentMessage(sceneObject);
				sceneObject->broadcastMessage(message, false, true);
			} else {
				UpdateTransformWithParentMessage* message = new UpdateTransformWithParentMessage(sceneObject);
				sceneObject->broadcastMessage(message, false, true);
			}
		}

		try {
			notifySelfPositionUpdate(sceneObject);
		} catch (Exception& e) {
			sceneObject->error("Exception caught while calling notifySelfPositionUpdate(sceneObject) in GroundZoneComponent::updateZoneWithParent");
			sceneObject->error(e.getMessage());
		}
	} catch (Exception& e) {
		sceneObject->error(e.getMessage());
		e.printStackTrace();
	}

	zone->wlock();
}

void GroundZoneComponent::switchZone(SceneObject* sceneObject, const String& newTerrainName, float newPostionX, float newPositionZ, float newPositionY, uint64 parentID, bool toggleInvisibility, int playerArrangement) const {
	Zone* zone = sceneObject->getZone();
	ManagedReference<SceneObject*> thisLocker = sceneObject;

	Zone* newZone = sceneObject->getZoneServer()->getZone(newTerrainName);

	if (newZone == nullptr) {
		sceneObject->error("attempting to switch to unkown/disabled zone " + newTerrainName);
		return;
	}

	ManagedReference<SceneObject*> newParent = sceneObject->getZoneServer()->getObject(parentID);

	if (newParent != nullptr && newParent->getZone() == nullptr)
		return;

	if (newParent != nullptr && !newParent->isCellObject())
		newParent = nullptr;

	if (newPositionZ == 0 && newParent == nullptr) {
		newPositionZ = newZone->getHeight(newPostionX, newPositionY);
	}

	sceneObject->destroyObjectFromWorld(false);

	if (toggleInvisibility) {
		TangibleObject* tano = sceneObject->asTangibleObject();

		if (tano != nullptr) {
			tano->setInvisible(!tano->isInvisible());
		}
	}

	Locker locker(newZone);

	sceneObject->initializePosition(newPostionX, newPositionZ, newPositionY);
	sceneObject->incrementMovementCounter();

	if (newParent != nullptr) {
		if (zone == newZone) {
			if (newParent->transferObject(sceneObject, -1, false)) {
				sceneObject->sendToOwner(true);
			}
		} else {
			if (newParent->transferObject(sceneObject, -1, false, false, false)) {
				sceneObject->sendToOwner(true);

				if (newParent->isCellObject()) {
					auto rootParent = sceneObject->getRootParent();

					if (rootParent != nullptr)
						rootParent->notifyObjectInsertedToChild(sceneObject, newParent, nullptr);
				}
			}
		}
	} else {
		newZone->transferObject(sceneObject, -1, true);
	}

	sceneObject->setMovementCounter(0);
}

void GroundZoneComponent::notifyRemoveFromZone(SceneObject* sceneObject) const {
}

void GroundZoneComponent::destroyObjectFromWorld(SceneObject* sceneObject, bool sendSelfDestroy) const {
	ManagedReference<SceneObject*> par = sceneObject->getParent().get();

	if (!sceneObject->isActiveArea()) {
		sceneObject->broadcastDestroy(sceneObject, sendSelfDestroy);
	}

	Zone* rootZone = sceneObject->getZone();
	Zone* zone = sceneObject->getLocalZone();

	if (par != nullptr) {
		uint64 parentID = sceneObject->getParentID();
		par->removeObject(sceneObject, nullptr, false);

		if (par->isCellObject()) {
			ManagedReference<BuildingObject*> build = par->getParent().get().castTo<BuildingObject*>();

			if (build != nullptr) {
				CreatureObject* creature = sceneObject->asCreatureObject();

				if (creature != nullptr)
					build->onExit(creature, parentID);
			}
		}

		sceneObject->notifyObservers(ObserverEventType::OBJECTREMOVEDFROMZONE, sceneObject, 0);
	} else if (zone != nullptr) {
		zone->removeObject(sceneObject, nullptr, false);
	}

	removeObjectFromZone(sceneObject, rootZone, par);
}

void GroundZoneComponent::removeObjectFromZone(SceneObject* sceneObject, Zone* zone, SceneObject* par) const {
	if (zone == nullptr)
		return;

	Locker locker(zone);

	zone->dropSceneObject(sceneObject);

	if (sceneObject->isActiveArea()) {
		return;
	}

	zone->remove(sceneObject);

	SharedBuildingObjectTemplate* objtemplate = dynamic_cast<SharedBuildingObjectTemplate*>(sceneObject->getObjectTemplate());

	if (objtemplate != nullptr) {
		String modFile = objtemplate->getTerrainModificationFile();

		if (!modFile.isEmpty()) {
			zone->getPlanetManager()->getTerrainManager()->removeTerrainModification(sceneObject->getObjectID());
		}
	}

	if (sceneObject->isTheaterObject()) {
		TheaterObject* theater = static_cast<TheaterObject*>(sceneObject);

		if (theater != nullptr && theater->shouldFlattenTheater()) {
			zone->getPlanetManager()->getTerrainManager()->removeTerrainModification(theater->getObjectID());
		}
	}

	locker.release();

	SortedVector<ManagedReference<TreeEntry*> > closeSceneObjects;

	CloseObjectsVector* closeobjects = sceneObject->getCloseObjects();
	ManagedReference<SceneObject*> vectorOwner = sceneObject;

	if (closeobjects == nullptr && par != nullptr) {
		vectorOwner = par;
		closeobjects = vectorOwner->getCloseObjects();
	}

	while (closeobjects == nullptr && vectorOwner != nullptr) {
		vectorOwner = vectorOwner->getParent().get();

		if (vectorOwner != nullptr) {
			closeobjects = vectorOwner->getCloseObjects();
		}
	}

	if (closeobjects != nullptr) {
		removeAllObjectsFromCOV(closeobjects, closeSceneObjects, sceneObject, vectorOwner);
	} else {
#ifdef COV_DEBUG
		String templateName = "none";
		if (sceneObject->getObjectTemplate() != nullptr)
			templateName = sceneObject->getObjectTemplate()->getTemplateFileName();

		sceneObject->info("Null closeobjects vector in GroundZoneComponent::destroyObjectFromWorld with template: " + templateName + " and OID: " + String::valueOf(sceneObject->getObjectID()), true);
#endif

		zone->getInRangeObjects(sceneObject->getPositionX(), sceneObject->getPositionZ(), sceneObject->getPositionY(), zone->getZoneObjectRange() + 64, &closeSceneObjects, false);

		for (int i = 0; i < closeSceneObjects.size(); ++i) {
			TreeEntry* obj = closeSceneObjects.getUnsafe(i);

			if (obj != sceneObject && obj->getCloseObjects() != nullptr)
				obj->removeInRangeObject(sceneObject);
		}
	}

	TangibleObject* tano = sceneObject->asTangibleObject();

	if (tano != nullptr) {
		SortedVector<ManagedReference<ActiveArea*> >* activeAreas = tano->getActiveAreas();

		while (activeAreas->size() > 0) {
			Locker _alocker(sceneObject->getContainerLock());
			ManagedReference<ActiveArea*> area = activeAreas->get(0);
			activeAreas->remove(0);

			_alocker.release();

			area->enqueueExitEvent(sceneObject);
		}
	} else if (sceneObject->isStaticObjectClass()) {
		// hack to get around notifyEnter/Exit only working with tangible objects
		Vector3 worldPos = sceneObject->getWorldPosition();

		SortedVector<ActiveArea* > objects;
		zone->getInRangeActiveAreas(worldPos.getX(), worldPos.getZ(), worldPos.getY(), &objects, false);

		for(auto& area : objects) {
			NavArea *mesh = area->asNavArea();

			if (mesh != nullptr) {
				if (mesh->containsPoint(worldPos.getX(), worldPos.getY())) {
					mesh->updateNavMesh(sceneObject, true);
				}
			}
		}
	}
}

void GroundZoneComponent::notifySelfPositionUpdate(SceneObject* sceneObject) const {
	sceneObject->notifySelfPositionUpdate();
}

void GroundZoneComponent::removeAllObjectsFromCOV(CloseObjectsVector *closeobjects,
					SortedVector<ManagedReference<TreeEntry *> > &closeSceneObjects,
					SceneObject *sceneObject, SceneObject *vectorOwner) {
	for (int i = 0; closeobjects->size() != 0 && i < 100; i++) {
		closeobjects->safeCopyTo(closeSceneObjects);

		for (auto& obj : closeSceneObjects) {
			if (obj != nullptr && obj != sceneObject && obj->getCloseObjects() != nullptr) {
				obj->removeInRangeObject(sceneObject);
			}

			if (vectorOwner == sceneObject) {
				try {
					vectorOwner->removeInRangeObject(obj, false);
				} catch (ArrayIndexOutOfBoundsException &e) {
					Logger::console.error("exception removing in range object: " + e.getMessage());
				}
			}
		}

		closeSceneObjects.removeAll();
	}
}
