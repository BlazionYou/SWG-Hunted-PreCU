local ObjectManager = require("managers.object.object_manager")

DisarmCommand = {
    name = "disarm",
    animation = "disarm",  -- You may need to define or use an existing animation
    combatSpam = "disarm",
    range = 7,  -- Range within which the command can be executed
    damage = 0,  -- No damage, just disarming
    speed = 1.0,  -- Speed of the command execution
    forceCost = 0,  -- Force cost, if applicable
    visMod = 25,  -- Visibility modifier, if applicable
    accuracySkillMod = "disarm_accuracy",  -- Skill modifier for accuracy
    attackType = RANGEDATTACK,  -- Attack type, adjust as needed
    damageType = KINETIC,  -- Damage type, adjust as needed
    poolsToDamage = HEALTH,  -- Pools to damage, adjust as needed
    weaponCertifications = {},  -- Weapon certifications required, if any
    weaponType = NONE,  -- Weapon type, adjust as needed
    areaRange = 0,  -- Area range, if applicable
    areaAction = false,  -- Area action, if applicable
    areaType = NONE,  -- Area type, if applicable
    areaSpeed = 0,  -- Area speed, if applicable
    areaRangeMod = 0,  -- Area range modifier, if applicable
    areaActionCost = 0,  -- Area action cost, if applicable
    areaVisMod = 0,  -- Area visibility modifier, if applicable
    areaAccuracySkillMod = "",  -- Area accuracy skill modifier, if applicable
    areaAttackType = NONE,  -- Area attack type, if applicable
    areaDamageType = NONE,  -- Area damage type, if applicable
    areaPoolsToDamage = NONE,  -- Area pools to damage, if applicable
    areaWeaponCertifications = {},  -- Area weapon certifications, if applicable
    areaWeaponType = NONE,  -- Area weapon type, if applicable
}

-- Helper function to unequip all weapons from the target
local function unequipWeapons(pTarget)
    local pInventory = CreatureObject(pTarget):getSlottedObject("inventory")

    if (pInventory == nil) then
        return
    end

    -- Unequip primary weapon
    local pPrimaryWeapon = CreatureObject(pTarget):getSlottedObject("default_weapon")
    if (pPrimaryWeapon ~= nil) then
        CreatureObject(pTarget):unequipPrimaryWeapon()
    end

    -- Unequip secondary weapon (if applicable)
    local pSecondaryWeapon = CreatureObject(pTarget):getSlottedObject("hold_r")
    if (pSecondaryWeapon ~= nil) then
        CreatureObject(pTarget):unequipSecondaryWeapon()
    end

    -- Unequip tertiary weapon (if applicable)
    local pTertiaryWeapon = CreatureObject(pTarget):getSlottedObject("hold_l")
    if (pTertiaryWeapon ~= nil) then
        CreatureObject(pTarget):unequipTertiaryWeapon()
    end
end

function DisarmCommand:execute(pPlayer, pTarget)
    if (pTarget == nil) then
        CreatureObject(pPlayer):sendSystemMessage("You must have a target to disarm.")
        return
    end

    if (not CreatureObject(pPlayer):isInRangeWithObject(pTarget, self.range)) then
        CreatureObject(pPlayer):sendSystemMessage("You are too far away to disarm your target.")
        return
    end

    if (not CreatureObject(pPlayer):checkCooldownRecovery("disarm")) then
        CreatureObject(pPlayer):sendSystemMessage("You cannot disarm again yet.")
        return
    end

    -- Check if the target is a creature and can be disarmed
    if (not CreatureObject(pTarget):isCreature()) then
        CreatureObject(pPlayer):sendSystemMessage("You cannot disarm that target.")
        return
    end

    -- Perform the disarm action
    CreatureObject(pPlayer):doCombatAnimation(pTarget, self.animation, self.combatSpam)

    -- Unequip all weapons from the target
    unequipWeapons(pTarget)

    CreatureObject(pPlayer):sendSystemMessage("You have disarmed your target.")
    CreatureObject(pTarget):sendSystemMessage("You have been disarmed!")

    -- Set cooldown for the disarm command
    CreatureObject(pPlayer):addCooldown("disarm", 30)  -- 30 seconds cooldown
end

return DisarmCommand
