#include "server/zone/objects/tangible/eventperk/JukeboxObserver.h"
#include "server/zone/objects/tangible/eventperk/Jukebox.h"
#include "server/zone/objects/scene/SceneObject.h"
#include "server/zone/objects/creature/CreatureObject.h"

int JukeboxObserverImplementation::notifyObserverEvent(unsigned int eventType, Observable* observable, ManagedObject* arg1, int64 arg2) {
	ManagedReference<Jukebox*> jbox = jukebox.get();

	if (jbox == nullptr) {
		return 1;
	}

	// jbox->info(true) << " JukeboxObserver - notifyObserverEvent -- #" << eventType << " arg1: " << cast<SceneObject*>(arg1)->getDisplayedName();

	if (eventType != ObserverEventType::ENTEREDAREA && eventType != ObserverEventType::EXITEDAREA && eventType != ObserverEventType::PARENTCHANGED) {
		return 0;
	}

	Locker jlocker(jbox);

	if (eventType == ObserverEventType::PARENTCHANGED) {
		ManagedReference<SceneObject*> boxParent = jbox->getParentRecursively(SceneObjectType::PLAYERCREATURE);

		// Jukebox parent is a player, jukebox was picked up
		if ((boxParent != nullptr) && (boxParent->isPlayerCreature())) {
			jbox->destroyChildObjects();
			return 1;
		}

	} else {
		if (arg1 == nullptr) {
			return 0;
		}

		SceneObject* sceno = cast<SceneObject*>(arg1);

		if (sceno == nullptr || !sceno->isPlayerCreature()) {
			return 0;
		}

		ManagedReference<CreatureObject*> player = cast<CreatureObject*>(sceno);

		if (player == nullptr) {
			return 0;
		}

		if (eventType == ObserverEventType::ENTEREDAREA && jbox->isSongPlaying()) {
			jbox->playMusicToPlayer(player, jbox->getCurSong());
		} else if (eventType == ObserverEventType::EXITEDAREA) {
			jbox->playMusicToPlayer(player, "sound/music_silence.snd");
		}
	}

	return 0;
}
