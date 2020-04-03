/*
 * Copyright (C) 2017-2019 AshamaneProject <https://github.com/AshamaneProject>
 * Copyright (C) 2008-2014 Forgotten Lands <http://www.forgottenlands.eu/>
 *
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the
 * Free Software Foundation; either version 2 of the License, or (at your
 * option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
 * more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program. If not, see <http://www.gnu.org/licenses/>.
 */

#include "ObjectMgr.h"
#include "ScriptMgr.h"
#include "ScriptedCreature.h"
#include "SpellScript.h"
#include "SpellAuraEffects.h"
#include "SpellMgr.h"
#include "Player.h"
#include "PhasingHandler.h"
#include "PassiveAI.h"
#include "InstanceScript.h"
#include "MotionMaster.h"
#include "ObjectAccessor.h"
#include "TemporarySummon.h"
#include "Map.h"
#include "Unit.h"
#include "Creature.h"
#include "bastion_of_twilight.h"
#include "SpellAuras.h"
#include "GameObject.h"
#include "GameObjectAI.h"


enum Yells
{
    /***** SINESTRA *****/

    SAY_AGGRO      = 0,  // We were fools to entrust an imbecile like Cho'gall with such a sacred duty. I will deal with you intruders myself!
    SAY_ADDS       = 1,  // Feed, children! Take your fill from their meaty husks!
    SAY_KILL_1     = 2,  // My brood will feed on your bones!
    SAY_KILL_2     = 3,  // Powerless...
    SAY_SPECIAL_1  = 4,  // The energy infused within my clutch is mine to reclaim!
    SAY_SPECIAL_2  = 5,  // SUFFER!
    SAY_SPECIAL_3  = 6,  // FEEL MY HATRED!
    SAY_PHASE_2    = 7,  // I tire of this. Do you see this clutch amidst which you stand? I have nurtured the spark within them, but that life-force is and always will be mine. Behold, power beyond your comprehension!
    SAY_PHASE_3    = 8,  // Enough! Drawing upon this source will set us back months. You should feel honored to be worthy of its expenditure. Now... die!
    SAY_FIGHT_W    = 9,  // You mistake this for weakness? Fool!
    SAY_FIGHT_N    = 10, // This will be your tomb as well as theirs!
    SAY_FIGHT_L    = 11, // My brood will feast upon your essence!
    SAY_DEATH      = 12, // Deathwing! I have fallen.... The brood... is lost.
    SAY_DRAKE      = 13, // Come forth, children of Twilight!
    SAY_SPITECALL  = 14, // YOUR MOTHER CALLS!

    /**  Warnings   **/

    SAY_SLICER     = 15, // Twilight Slicers are active!
};

enum CalenYells
{
    SAY_ENTRANCE   = 0, // Heroes! You are not alone in this dark place!
    SAY_CALEN_W    = 1, // You are weakening, Sintharia! Accept the inevitable!
    SAY_CALEN_N    = 2, // Sintharia! Your master owes me a great debt... one that I intend to extract from his consort's hide!
    SAY_CALEN_L    = 3, // Heroes! My power wanes....
    SAY_PREMATURE  = 4, // All is lost.... Forgive me, my Queen....
    SAY_RECHARGE   = 5, // Flame of life, burn within me and renew my vigor!
    SAY_CALEN_P3   = 6, // After Sinestra he says - The fires dim, champions.... Take this, the last of my power. Succeed where I have failed. Avenge me. Avenge the world...
};

enum spells
{
    /***** SINESTRA *****/
    SPELL_SUBMERGED                              = 66936,
    SPELL_SUBMERGED_INTR                         = 96725,

    SPELL_WRACK                                   = 89421,
    SPELL_WRACK_JUMP                              = 89435,
    SPELL_FLAME_BREATH                            = 90125,
    SPELL_TWILIGHT_SLICER                         = 92851,
    SPELL_TWILIGHT_PULSE                          = 92957,
    SPELL_DRAINED                                 = 89350,
    SPELL_PURPLE_BEAM                             = 88518,
    SPELL_SIN_TWILIGHT_BLAST                      = 89280,
    SPELL_TWILIGHT_SPIT                           = 89299,
    SPELL_TWILIGHT_POWER                          = 87220,
    SPELL_FIERY_RESOLVE                           = 87221,
    SPELL_MANA_BARRIER                            = 87299,
    SPELL_PYRRHIC_FOCUS                           = 87323,
    SPELL_TWILIGHT_CARAPACE                       = 87654,
    SPELL_ESSENCE_OF_THE_RED                      = 87946,
    SPELL_ABSORB_ESSENCE                          = 90107,
    SPELL_TWILIGHT_BREATH                         = 110212,
    SPELL_UNLEASH_ESSENCE                         = 90028,
    SPELL_FIREBARRIER                             = 95791, // Visual + cast time

    /** Twilight Essence **/
    SPELL_TWI_ESSENCE                             = 89284, // On death spawns mob, revives whelps on essence. 88146 is spellscripted. 89284 triggers it every 2 seconds.
    SPELL_TWI_INCREASE                            = 89288, // Spell that makes essence bigger 15% at a time.

    /** Egg Siphon **/
    SPELL_SIPHON_EGG                              = 82354, //definitely not the right visual.

    /** Phase 2 **/
    SPELL_TWI_EXTINCTION                          = 87945, //Bum-bum motherfucker!
    SPELL_EXTINCT_DUMMY                           = 86227, /**Requires spell link to 86226**/
};

enum events
{
    EVENT_INTRO = 1,
    EVENT_WRACK,
    EVENT_FLAME_BREATH,
    EVENT_TWILIGHT_SLICER,
    EVENT_RESET_ORBS,
    EVENT_ORB_START_CHANNEL,
    EVENT_CHECK_MELEE,
    EVENT_WHELP,
    EVENT_START_MAGIC_FIGHT,
    EVENT_TWILIGHT_DRAKE,
    EVENT_SPITECALLER,
    EVENT_CALEN_LASER,
    EVENT_SIPHON_EGG,
    EVENT_INTRO_2,
    EVENT_WIPE,
    EVENT_BATTLE_CHECK,
    EVENT_FIRESHIELD,
};

enum sharedDatas
{
    DATA_PRIVATE_ORB0 = 0,
};

enum Phases
{
    PHASE_NONE = 0,
    PHASE_ONE = 1,
    PHASE_TWO = 2,
    PHASE_THREE = 3
};

enum sinestraActions
{
    ACTION_START_PHASE_3 = 1,
};

Position const spawnPos[9] =
{
    {-985.92f, -819.84f, 438.59f, 0.87f},
    {-975.81f, -815.15f, 438.59f, 1.02f},
    {-962.71f, -805.22f, 438.59f, 1.77f},
    {-948.02f, -799.14f, 438.59f, 2.09f},
    {-943.09f, -787.05f, 438.59f, 2.59f},
    {-994.34f, -739.91f, 438.59f, 5.39f},
    {-1005.45f, -746.29f, 438.59f, 5.51f},
    {-1018.57f, -760.42f, 438.59f, 5.71f},
    {-1029.42f, -774.76f, 438.59f, 0.22f},
};

/*Position const flamesPos[4] =
{
    {-895.89f, -765.88f, 442.16f, 0.22f},
    {-912.87f, -770.63f, 440.43f, 0.22f},
    {-994.33f, -665.81f, 440.45f, 0.22f},
    {-999.33f, -693.72f, 440.87f, 0.22f},
}; */

class boss_sinestra : public CreatureScript
{
    public:
        boss_sinestra() : CreatureScript("boss_sinestra") {}

        struct boss_sinestraAI : public BossAI
        {
            boss_sinestraAI(Creature * creature) : BossAI(creature, DATA_SINESTRA), summons(me)
            {
                instance = creature->GetInstanceScript();
                Initialize();
            }

            InstanceScript* instance;
            EventMap events;
            Creature* orbs[2];
            Creature* eggs[2];
            SummonList summons;
            uint8 killedEggs;
            bool introDone;

            void Initialize()
            {
                orbs[0] = NULL;
                orbs[1] = NULL;
                eggs[0] = NULL;
                eggs[1] = NULL;
                killedEggs = 0;
                introDone = false;
                events.SetPhase(PHASE_NONE);

                if (!introDone)
                {
                    me->AddAura(SPELL_SUBMERGED, me);
                    me->AddAura(SPELL_SUBMERGED_INTR, me);
                    me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
                }

                me->AddAura(SPELL_DRAINED, me);
                me->SetHealth(me->GetMaxHealth() / 5 * 3);
                me->setRegeneratingHealth(false);
                me->SetMaxPower(POWER_MANA, 0);
                me->SetPower(POWER_MANA, 0);

                if (instance)
                    instance->SetBossState(DATA_SINESTRA, NOT_STARTED);

                me->ApplySpellImmune(0, IMMUNITY_ID, SPELL_WRACK, true);
                me->ApplySpellImmune(0, IMMUNITY_ID, SPELL_WRACK_JUMP, true);
            }

            void Reset() override
            {
                _Reset();

                DespawnTrigger(48018);
                summons.DespawnAll();

                std::list<Creature*> unitList;
                me->GetCreatureListWithEntryInGrid(unitList, NPC_TWILIGHT_WHELP, 250.0f);
                for (std::list<Creature*>::const_iterator itr = unitList.begin(); itr != unitList.end(); ++itr)
                {// despawn twilight whelps
                    (*itr)->DespawnOrUnsummon();
                }
                me->GetCreatureListWithEntryInGrid(unitList, NPC_ESSENCE, 250.0f);
                for (std::list<Creature*>::const_iterator itr = unitList.begin(); itr != unitList.end(); ++itr)
                {// despawn twilight essence
                    (*itr)->DespawnOrUnsummon();
                }

                Initialize();
            }

            void MoveInLineOfSight(Unit* who) override
            {
                if (!introDone && who->IsWithinDistInMap(me, 40.0f))
                {
                    Talk(SAY_AGGRO);
                    introDone = true;
                    me->RemoveAurasDueToSpell(SPELL_SUBMERGED);
                    me->RemoveAurasDueToSpell(SPELL_SUBMERGED_INTR);
                    me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
                }
            }

            void JustEngagedWith(Unit* /*who*/) override
            {
                _JustEngagedWith();

                DoCast(me, SPELL_DRAINED);
                /** Sinestra begin fight with 60 % hp **/
                events.SetPhase(PHASE_ONE);
                Talk(SAY_AGGRO);

                if (instance)
                {
                    instance->SetBossState(DATA_SINESTRA, IN_PROGRESS);
                    instance->SendEncounterUnit(ENCOUNTER_FRAME_ENGAGE, me); // Add
                }

                // Summon first egg
                if (Creature* egg = me->SummonCreature(NPC_PULSING_TWILIGHT_EGG, -993.72f, -669.54f, 440.20f, 4.57f, TEMPSUMMON_CORPSE_DESPAWN))
                {
                    eggs[0] = egg;
                    egg->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_REMOVE_CLIENT_CONTROL);
                    egg->SetReactState(REACT_PASSIVE);
                    egg->AttackStop();
                    egg->StopMoving();
                    me->AddAura(SPELL_TWILIGHT_CARAPACE, egg);
                }

                // Summon second egg
                if (Creature* egg = me->SummonCreature(NPC_PULSING_TWILIGHT_EGG, -901.25f, -768.70f, 441.35f, 3.33f, TEMPSUMMON_CORPSE_DESPAWN))
                {
                    eggs[1] = egg;
                    egg->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_REMOVE_CLIENT_CONTROL);
                    egg->SetReactState(REACT_PASSIVE);
                    egg->AttackStop();
                    egg->StopMoving();
                    me->AddAura(SPELL_TWILIGHT_CARAPACE, egg);
                }

                events.ScheduleEvent(EVENT_WRACK, 15s, PHASE_ONE);
                events.ScheduleEvent(EVENT_FLAME_BREATH, 20s, PHASE_ONE);
                events.ScheduleEvent(EVENT_TWILIGHT_SLICER, 28s, PHASE_ONE);
                events.ScheduleEvent(EVENT_CHECK_MELEE, 5s, PHASE_ONE);
                events.ScheduleEvent(EVENT_WHELP, 45s, PHASE_ONE);
            }

            void DespawnTrigger(uint32 entry)
            {
                std::list<Creature*> creatures;
                GetCreatureListWithEntryInGrid(creatures, me, entry, 1000.0f);
                if (creatures.empty())
                    return;
                for (std::list<Creature*>::iterator iter = creatures.begin(); iter != creatures.end(); ++iter)
                    (*iter)->DespawnOrUnsummon();
            }

            void JustSummoned(Creature* summon) override
            {
                summons.Summon(summon);

                DoZoneInCombat(summon);
            }

            void JustDied(Unit* /*killer*/) override
            {
                Talk(SAY_DEATH);
                summons.DespawnAll();
                DespawnTrigger(48018);
                me->DespawnOrUnsummon(15000);

                if (instance)
                {
                    instance->SetBossState(DATA_SINESTRA, DONE);
                    instance->SendEncounterUnit(ENCOUNTER_FRAME_DISENGAGE, me); // Remove
                }

                // Summon the loot chest
                 me->SummonGameObject(GO_SINESTRA_CHEST, Position(-962.91f, -749.71f, 438.59f, 0.f), QuaternionData(), DAY);

                _JustDied();
            }

            void KilledUnit(Unit* /*victim*/) override
            {
                Talk(RAND(SAY_KILL_1, SAY_KILL_2));
            }

            void DamageTaken(Unit* /*attacker*/, uint32& /*damage*/) override
            {
                if (me->GetHealthPct() <= 30.0f && events.IsInPhase(PHASE_ONE))
                {
                    me->RemoveAura(SPELL_DRAINED);
                    me->AddAura(SPELL_MANA_BARRIER, me);
                    events.SetPhase(PHASE_TWO);

                    events.ScheduleEvent(EVENT_INTRO_2, 3s, PHASE_TWO);
                    events.ScheduleEvent(EVENT_START_MAGIC_FIGHT, 5s, PHASE_TWO);
                    //events.ScheduleEvent(EVENT_FLAMES_TRIGGER, 12s, PHASE_TWO);
                    events.ScheduleEvent(EVENT_SIPHON_EGG, 7s, PHASE_TWO); // Apply to trigger.
                    events.ScheduleEvent(EVENT_WIPE, 10s, PHASE_TWO);
                    events.ScheduleEvent(EVENT_TWILIGHT_DRAKE, 10s);
                    events.ScheduleEvent(EVENT_SPITECALLER, 15s);
                }
            }

            ObjectGuid GetGuidData(uint32 type)
            {
                switch (type)
                {
                    case DATA_PRIVATE_ORB0:
                        if (orbs[0])
                            return orbs[0]->GetGUID();
                        break;
                }

                return ObjectGuid::Empty;
            }

            void EnterEvadeMode()
            {
                Talk(SAY_FIGHT_L);

                Reset();
                DoCast(me, SPELL_DRAINED);
                me->GetMotionMaster()->MoveTargetedHome();

                if (instance)
                {
                    instance->SetBossState(DATA_SINESTRA, FAIL);
                    instance->SendEncounterUnit(ENCOUNTER_FRAME_DISENGAGE, me); // Remove
                }

                _EnterEvadeMode();
            }

            void SummonedCreatureDespawn(Creature* summon) override
            {
                if (summon->GetEntry() == NPC_PULSING_TWILIGHT_EGG)
                {
                    killedEggs++;

                    if (killedEggs >= 2 && events.IsInPhase(PHASE_TWO))
                    {
                        events.SetPhase(PHASE_THREE);
                        me->CastStop();
                        me->RemoveAura(SPELL_MANA_BARRIER);

                        if (Creature* calen = me->FindNearestCreature(NPC_CALEN, 100.0f, true))
                        {
                            calen->CastStop();
                            if (Unit *pTarget = SelectTarget(SELECT_TARGET_RANDOM, 0))
                                calen->CastSpell(pTarget, SPELL_ESSENCE_OF_THE_RED, true);
                            calen->DisappearAndDie();
                        }

                        events.ScheduleEvent(EVENT_WRACK, 15s, PHASE_THREE);
                        events.ScheduleEvent(EVENT_FLAME_BREATH, 20s, PHASE_THREE);
                        events.ScheduleEvent(EVENT_TWILIGHT_SLICER, 28s, PHASE_THREE);
                        events.ScheduleEvent(EVENT_CHECK_MELEE, 2s, PHASE_THREE);
                        events.ScheduleEvent(EVENT_WHELP, 45s, PHASE_THREE);
                    }
                }
            }

            void UpdateAI(uint32 diff) override
            {
                if (!UpdateVictim() || (me->HasUnitState(UNIT_STATE_CASTING) && !events.IsInPhase(PHASE_TWO)))
                    return;

                events.Update(diff);

                if(events.IsInPhase(PHASE_ONE) || events.IsInPhase(PHASE_THREE)) {
                    while (uint32 eventId = events.ExecuteEvent()) {
                        switch (eventId) {
                            case EVENT_WRACK:
                                if (Unit * target = SelectTarget(SELECT_TARGET_RANDOM, 0.0f, 100.0f, true, 0))
                                    DoCast(target, SPELL_WRACK, true);

                                events.Repeat(75s);
                                break;
                            case EVENT_FLAME_BREATH:
                                DoCastAOE(SPELL_FLAME_BREATH);
                                events.Repeat(20s);
                                break;
                            case EVENT_TWILIGHT_SLICER:
                                for (uint8 i = 0; i < 2; i++) {
                                    if (Unit * target = SelectTarget(SELECT_TARGET_RANDOM, 0.0f, 100.0f, true,
                                                                     -SPELL_PURPLE_BEAM)) {
                                        Position pos = target->GetPosition();
                                        float width = frand(5, 20);
                                        float degree = frand(0, 6.28f);
                                        pos.Relocate(pos.GetPositionX() + cos(degree) * width,
                                                     pos.GetPositionY() + sin(degree) * width);
                                        if (Creature * orb = me->SummonCreature(NPC_SHADOW_ORB, pos,
                                                                                TEMPSUMMON_TIMED_DESPAWN, 15s, 0)) {
                                            if (!orbs[0]) {
                                                orbs[0] = orb;
                                                if (instance)
                                                    instance->SetGuidData(DATA_ORB_0, orb->GetGUID());
                                            } else {
                                                orbs[1] = orb;

                                                if (instance)
                                                    instance->SetGuidData(DATA_ORB_1, orb->GetGUID());
                                            }

                                            orb->SetFlag(UNIT_FIELD_FLAGS, UnitFlags(
                                                    UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_NOT_SELECTABLE));
                                            orb->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_REMOVE_CLIENT_CONTROL);
                                            orb->AddThreat(target, 1000000.0f);
                                            orb->Attack(target, true);

                                            // Twilight pulse!
                                            orb->CastSpell(orb, SPELL_TWILIGHT_PULSE, true);
                                            if (Aura * aur = orb->AddAura(SPELL_PURPLE_BEAM, target))
                                                aur->SetDuration(60000);
                                        }
                                    }
                                }
                                events.ScheduleEvent(EVENT_RESET_ORBS, 18s);
                                events.Repeat(28s);
                                events.ScheduleEvent(EVENT_ORB_START_CHANNEL, 35s);
                                break;
                            case EVENT_ORB_START_CHANNEL:
                                if (orbs[0] && orbs[1]) {
                                    orbs[1]->CastSpell(orbs[0], SPELL_TWILIGHT_SLICER, true);
                                    orbs[1]->ClearUnitState(UNIT_STATE_CASTING);

                                    if (orbs[1]->GetVictim())
                                        orbs[1]->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_REMOVE_CLIENT_CONTROL);
                                    orbs[1]->GetMotionMaster()->MoveChase(orbs[1]->GetVictim());

                                    if (orbs[0]->GetVictim())
                                        orbs[0]->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_REMOVE_CLIENT_CONTROL);
                                    orbs[0]->GetMotionMaster()->MoveChase(orbs[0]->GetVictim());
                                }
                                break;
                            case EVENT_RESET_ORBS:
                                orbs[0] = NULL;
                                orbs[1] = NULL;
                                break;
                            case EVENT_CHECK_MELEE:
                                if (Unit * victim = me->GetVictim()) {
                                    if (me->GetDistance2d(victim) >= 5.0f) {
                                        if (Unit * target = SelectTarget(SELECT_TARGET_RANDOM, 0.0f, 100.0f, true,
                                                                         0))
                                            DoCast(target, SPELL_SIN_TWILIGHT_BLAST, false);
                                    }
                                }
                                events.Repeat(2s);
                                break;
                            case EVENT_WHELP:
                                for (uint8 i = 0; i < 5; i++) {
                                    uint8 posId = urand(0, 8);
                                    me->SummonCreature(NPC_TWILIGHT_WHELP, spawnPos[posId]);
                                }

                                Talk(SAY_ADDS);
                                events.Repeat(45s);
                                break;
                            case EVENT_TWILIGHT_DRAKE:
                                if (events.IsInPhase(PHASE_THREE)) {
                                    me->SummonCreature(NPC_TWILIGHT_DRAKE, spawnPos[urand(0, 8)]);
                                    Talk(SAY_DRAKE);
                                    events.Repeat(urand(18000, 30000));
                                    break;
                                }
                                break;
                            case EVENT_SPITECALLER:
                                if (events.IsInPhase(PHASE_THREE)) {
                                    me->SummonCreature(NPC_SPITCALLER, spawnPos[urand(0, 8)]);
                                    Talk(SAY_SPITECALL);
                                    events.Repeat(urand(18000, 30000));
                                    break;
                                }
                                break;
                            default:
                                break;
                        }
                    }
                }
                else if(events.IsInPhase(PHASE_TWO))
                {
                    while (uint32 eventId = events.ExecuteEvent()) {
                        switch (eventId) {
                            case EVENT_WHELP:
                                for (uint8 i = 0; i < 5; i++) {
                                    uint8 posId = urand(0, 8);
                                    me->SummonCreature(NPC_TWILIGHT_WHELP, spawnPos[posId]);
                                }

                                Talk(SAY_ADDS);
                                events.Repeat(45s);
                                break;
                            /*case EVENT_FLAMES_TRIGGER:
                                if (events.IsInPhase(PHASE_TWO)) {
                                    for (uint8 i = 0; i < 4; i++) {
                                        uint8 posId = i;
                                        me->SummonCreature(NPC_FLAME_TRIGGER, flamesPos[posId]);
                                    }
                                    break;
                                }
                                break; */
                            case EVENT_TWILIGHT_DRAKE:
                                if (!events.IsInPhase(PHASE_ONE)) {
                                    me->SummonCreature(NPC_TWILIGHT_DRAKE, spawnPos[urand(0, 8)]);
                                    Talk(SAY_DRAKE);
                                    events.Repeat(urand(18000, 30000));
                                    break;
                                }
                                break;
                            case EVENT_SPITECALLER:
                                if (!events.IsInPhase(PHASE_ONE)) {
                                    me->SummonCreature(NPC_SPITCALLER, spawnPos[urand(0, 8)]);
                                    Talk(SAY_SPITECALL);
                                    events.Repeat(urand(18000, 30000));
                                    break;
                                }
                                break;
                            case EVENT_START_MAGIC_FIGHT:
                                if (events.IsInPhase(PHASE_TWO)) {
                                    if (Creature * calen = me->SummonCreature(NPC_CALEN, -1009.35f, -801.97f, 438.59f,
                                                                              0.81f)) {
                                        if (Creature* target = me->SummonCreature(NPC_LASER_TRIGGER, -979.41f, -778.21f, 445.40f, 0.72f))
                                        {
                                            target->SetHover(true);
                                            target->SetDisableGravity(true);
                                            target->SetCanFly(true);
                                            target->SetFlag(UNIT_FIELD_FLAGS, UnitFlags(UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_NOT_SELECTABLE));
                                            target->GetMotionMaster()->MoveTakeoff(0, target->GetHomePosition());

                                            DoCast(target, SPELL_TWILIGHT_POWER);
                                        }
                                    }
                                    Talk(SAY_PHASE_2);

                                    if(eggs[0])
                                        me->AddAura(95823, eggs[0]);
                                    if(eggs[1])
                                        me->AddAura(95823, eggs[1]);

                                    break;
                                }
                                break;
                            case EVENT_SIPHON_EGG:
                                if (Creature* eggnog = me->FindNearestCreature(NPC_PULSING_TWILIGHT_EGG, 200.0f, true))
                                    if (eggnog->HasAura(SPELL_TWILIGHT_CARAPACE))
                                    {
                                        eggs[0]->RemoveAura(SPELL_TWILIGHT_CARAPACE);
                                        eggs[1]->RemoveAura(SPELL_TWILIGHT_CARAPACE);

                                        DoCast(eggnog, SPELL_SIPHON_EGG);

                                        Talk(SAY_SPECIAL_1);
                                    }
                                events.Repeat(60s);
                                break;
                            case EVENT_WIPE: // BLAST THE BITCHES!
                                DoCastSelf(SPELL_TWI_EXTINCTION);
                                break;
                            case EVENT_INTRO_2: // BLAST THE BITCHES!
                                DoCastSelf(SPELL_EXTINCT_DUMMY);
                                break;
                            default:
                                break;
                        }
                    }
                }
                DoMeleeAttackIfReady();
            }
        };

        CreatureAI* GetAI(Creature* creature) const override
        {
            return GetBastionOfTwilightAI<boss_sinestraAI>(creature);
        }
};

class npc_calen : public CreatureScript
{
public:
    npc_calen() : CreatureScript("npc_calen")
    { }

    struct npc_calenAI : public ScriptedAI
    {
        npc_calenAI(Creature * creature) : ScriptedAI(creature) {}

        EventMap events;

        void IsSummonedBy(Unit* /*summoner*/) override
        {
            me->Yell("Sintharia! Your master owes me a great debt... one that I intend to extract from his consort's hide!", LANG_UNIVERSAL, 0);
            me->AddAura(SPELL_PYRRHIC_FOCUS, me);
            events.ScheduleEvent(EVENT_CALEN_LASER, 5s);
            events.ScheduleEvent(EVENT_FIRESHIELD, 3s);
            Talk(SAY_ENTRANCE);
        }


        void UpdateAI(uint32 uiDiff) override
        {
            events.Update(uiDiff);
            while (uint32 eventId = events.ExecuteEvent())
            {
                switch (eventId)
                {
                    case EVENT_FIRESHIELD:
                        DoCast(me, SPELL_FIREBARRIER);
                        break;
                    case EVENT_CALEN_LASER:
                        if(events.IsInPhase(PHASE_TWO)) {
                            if (Creature* target = me->FindNearestCreature(NPC_LASER_TRIGGER, 100.f, true))
                            {
                                DoCast(target, SPELL_FIERY_RESOLVE);
                                me->setRegeneratingHealth(false);
                            }
                            events.Repeat(5s);
                            break;
                        }
                        break;
                }
            }
        }

        void JustDied(Unit* /*killer*/) override
        {
            Talk(SAY_CALEN_P3);
        }
    };

    CreatureAI* GetAI(Creature* creature) const override
    {
        return GetBastionOfTwilightAI<npc_calenAI>(creature);
    }
};

/*********************
 ** NPC Controller (46277).
 **********************/
class npc_controller: public CreatureScript
{
public:

    npc_controller() :
            CreatureScript("npc_controller"){}

    struct npc_controllerAI: public ScriptedAI
    {

        npc_controllerAI(Creature * creature) :
                ScriptedAI(creature)
        {
            instance = creature->GetInstanceScript();
        }

        InstanceScript* instance;
        EventMap events;
        uint8 talkcount;

        void IsSummonedBy(Unit* summoner)
        {
            me->SetInCombatWith(summoner);
            me->AddThreat(summoner, 250.0f);
            me->SetReactState(REACT_PASSIVE);
            me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
            me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
            events.ScheduleEvent(EVENT_BATTLE_CHECK, 25000);
            talkcount = 0;
        }

        void UpdateAI(const uint32 diff)
        {
            events.Update(diff);

            while (uint32 eventId = events.ExecuteEvent())
            {
                switch (eventId)
                {
                    case EVENT_BATTLE_CHECK:
                        if (Creature* egg = me->FindNearestCreature(NPC_PULSING_TWILIGHT_EGG, 200.0f, true))
                            if (!egg->HasAura(SPELL_TWILIGHT_CARAPACE))
                            {
                                if (egg->HealthAbovePct(75) && talkcount == 0)
                                {
                                    if (Creature* calen = me->FindNearestCreature(NPC_CALEN, 200.0f, true))
                                        calen->AI()->Talk(SAY_CALEN_N);
                                    if (Creature* sinestra = me->FindNearestCreature(BOSS_SINESTRA, 200.0f,
                                                                                     true))
                                        sinestra->AI()->Talk(SAY_FIGHT_N);

                                    talkcount++;
                                }
                                if (egg->HealthBelowPct(75) && talkcount == 0)
                                {
                                    if (Creature* calen = me->FindNearestCreature(NPC_CALEN, 200.0f, true))
                                        calen->AI()->Talk(SAY_CALEN_W);
                                    if (Creature* sinestra = me->FindNearestCreature(BOSS_SINESTRA, 200.0f,
                                                                                     true))
                                        sinestra->AI()->Talk(SAY_FIGHT_W);

                                    talkcount++;
                                }
                                if (egg->HealthAbovePct(65) && talkcount == 1)
                                {
                                    if (Creature* calen = me->FindNearestCreature(NPC_CALEN, 200.0f, true))
                                        calen->AI()->Talk(SAY_CALEN_L);
                                    if (Creature* sinestra = me->FindNearestCreature(BOSS_SINESTRA, 200.0f,
                                                                                     true))
                                        sinestra->AI()->Talk(SAY_FIGHT_L);

                                    talkcount++;

                                    if (egg->HealthAbovePct(75))
                                        if (Creature* calen = me->FindNearestCreature(NPC_CALEN, 200.0f, true))
                                        {
                                            calen->AI()->Talk(SAY_PREMATURE);
                                            me->Kill(calen);
                                        }
                                }
                                if (egg->HealthBelowPct(75) && egg->HealthAbovePct(50) && talkcount == 1)
                                {
                                    if (Creature* calen = me->FindNearestCreature(NPC_CALEN, 200.0f, true))
                                        calen->AI()->Talk(SAY_CALEN_N);
                                    if (Creature* sinestra = me->FindNearestCreature(BOSS_SINESTRA, 200.0f,
                                                                                     true))
                                        sinestra->AI()->Talk(SAY_FIGHT_N);

                                    talkcount++;
                                }
                                if (egg->HealthBelowPct(50) && talkcount == 1)
                                {
                                    if (Creature* calen = me->FindNearestCreature(NPC_CALEN, 200.0f, true))
                                        calen->AI()->Talk(SAY_CALEN_W);
                                    if (Creature* sinestra = me->FindNearestCreature(BOSS_SINESTRA, 200.0f,
                                                                                     true))
                                        sinestra->AI()->Talk(SAY_FIGHT_W);

                                    talkcount++;
                                }
                                if (egg->HealthAbovePct(40) && talkcount == 2)
                                {
                                    if (Creature* calen = me->FindNearestCreature(NPC_CALEN, 200.0f, true))
                                        calen->AI()->Talk(SAY_CALEN_L);
                                    if (Creature* sinestra = me->FindNearestCreature(BOSS_SINESTRA, 200.0f,
                                                                                     true))
                                        sinestra->AI()->Talk(SAY_FIGHT_L);

                                    talkcount = 0;
                                    if (egg->HealthAbovePct(50))
                                        if (Creature* calen = me->FindNearestCreature(NPC_CALEN, 200.0f, true))
                                        {
                                            calen->AI()->Talk(SAY_PREMATURE);
                                        }
                                }
                                if (egg->HealthBelowPct(50) && egg->HealthAbovePct(25) && talkcount == 2)
                                {
                                    if (Creature* calen = me->FindNearestCreature(NPC_CALEN, 200.0f, true))
                                        calen->AI()->Talk(SAY_CALEN_N);
                                    if (Creature* sinestra = me->FindNearestCreature(BOSS_SINESTRA, 200.0f,
                                                                                     true))
                                        sinestra->AI()->Talk(SAY_FIGHT_N);
                                    talkcount = 0;
                                }
                                if (egg->HealthBelowPct(25) && talkcount == 2)
                                {
                                    if (Creature* calen = me->FindNearestCreature(NPC_CALEN, 200.0f, true))
                                        calen->AI()->Talk(SAY_CALEN_W);
                                    if (Creature* sinestra = me->FindNearestCreature(BOSS_SINESTRA, 200.0f,
                                                                                     true))
                                        sinestra->AI()->Talk(SAY_FIGHT_W);

                                    talkcount = 0;
                                }
                                events.Repeat(25s);
                            }
                        break;
                }
            }
        }
    };

    CreatureAI* GetAI(Creature* creature) const override
    {
        return GetBastionOfTwilightAI<npc_controllerAI>(creature);
    }
};

enum whelpEvents
{
    EVENT_SPIT = 1,
};

enum whelpActions
{
    ACTION_SET_AS_RESPWANED = 1,
};

class npc_sinestra_twilight_whelp : public CreatureScript
{
    public:
        npc_sinestra_twilight_whelp() : CreatureScript("npc_sinestra_twilight_whelp")
        { }

        struct npc_sinestra_twilight_whelpAI : public ScriptedAI
        {
            npc_sinestra_twilight_whelpAI(Creature * creature) : ScriptedAI(creature)
            {
                Initialize();
            }

            InstanceScript* pInstance;
            EventMap events;
            bool respawned;

            void Initialize()
            {
                events.ScheduleEvent(EVENT_SPIT, urand(10000, 35000));
            }

            void IsSummonedBy(Unit* /*summoner*/) override
            {
                respawned = false;
            }

            void DoAction(int32 actionId) override
            {
                switch (actionId)
                {
                    case ACTION_SET_AS_RESPWANED:
                        respawned = true;
                        break;
                }
            }

            void JustDied(Unit* /*killer*/) override
            {
                if (respawned)
                    return;

                Position pos = me->GetPosition();
                if (Creature* essence = me->SummonCreature(NPC_ESSENCE, pos, TEMPSUMMON_MANUAL_DESPAWN, 0, 0))
                {
                    DoZoneInCombat(essence);
                    essence->SetFlag(UNIT_FIELD_FLAGS, UnitFlags(UNIT_FLAG_REMOVE_CLIENT_CONTROL | UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_NOT_SELECTABLE));
                    essence->SetReactState(REACT_PASSIVE);
                    essence->AttackStop();
                    essence->StopMoving();
                }
            }

            void UpdateAI(uint32 uiDiff) override
            {
                events.Update(uiDiff);

                while (uint32 eventId = events.ExecuteEvent())
                {
                    switch (eventId)
                    {
                        case EVENT_SPIT:
                            DoCastVictim(SPELL_TWILIGHT_SPIT);
                            events.ScheduleEvent(EVENT_SPIT, urand(35000, 50000));
                            break;
                    }
                }
            }
        };

        CreatureAI* GetAI(Creature* creature) const override
        {
            return GetBastionOfTwilightAI<npc_sinestra_twilight_whelpAI>(creature);
        }
};


enum sinestraAddEvents
{
    EVENT_TWILIGHT_BREATH = 1,
    EVENT_UNLEASH_ESSENCE,
};

class npc_sinestra_add : public CreatureScript
{
    public:
        npc_sinestra_add() : CreatureScript("npc_sinestra_add")
        { }

        struct npc_sinestra_addAI : public ScriptedAI
        {
            npc_sinestra_addAI(Creature * creature) : ScriptedAI(creature) {}

            InstanceScript* instance;
            EventMap events;
            bool respawned;

            void Reset() override
            {
                events.Reset();
            }

            void JustEngagedWith(Unit* /*who*/) override
            {
                if (me->GetEntry() == NPC_TWILIGHT_DRAKE)
                    events.ScheduleEvent(EVENT_TWILIGHT_BREATH, urand(7000, 10000));
                else
                    events.ScheduleEvent(EVENT_UNLEASH_ESSENCE, urand(22000, 30000));
            }

            void UpdateAI(uint32 uiDiff) override
            {
                if (!UpdateVictim())
                    return;

                events.Update(uiDiff);

                while (uint32 eventId = events.ExecuteEvent())
                {
                    switch (eventId)
                    {
                        case EVENT_TWILIGHT_BREATH:
                            DoCastVictim(SPELL_TWILIGHT_BREATH);
                            events.ScheduleEvent(EVENT_TWILIGHT_BREATH, urand(15000, 20000));
                            break;
                        case EVENT_UNLEASH_ESSENCE:
                            DoCastAOE(SPELL_UNLEASH_ESSENCE);
                            events.ScheduleEvent(EVENT_UNLEASH_ESSENCE, urand(22000, 30000));
                            break;
                    }
                }

                DoMeleeAttackIfReady();
            }
        };

        CreatureAI* GetAI(Creature* creature) const override
        {
            return GetBastionOfTwilightAI<npc_sinestra_addAI>(creature);
        }
};

class spell_sinestra_wreck : public SpellScriptLoader
{
    public:
        spell_sinestra_wreck() : SpellScriptLoader("spell_sinestra_wreck") { }

        class spell_sinestra_wreck_AuraScript : public AuraScript
        {
            PrepareAuraScript(spell_sinestra_wreck_AuraScript);

            void Apply (AuraEffect const* /*aurEff*/, AuraEffectHandleModes /*mode*/)
            {
                if (!GetTargetApplication())
                    return;

                if (!GetTargetApplication()->GetBase())
                    return;

                if (GetTargetApplication()->GetRemoveMode() == AURA_REMOVE_BY_ENEMY_SPELL)
                {
                    if (Unit* target = GetTarget())
                    {
                        CustomSpellValues values;
                        values.AddSpellMod(SPELLVALUE_MAX_TARGETS, 2);
                        values.AddSpellMod(SPELLVALUE_BASE_POINT1, GetTargetApplication()->GetBase()->GetDuration());
                        target->CastCustomSpell(SPELL_WRACK_JUMP, values, nullptr, TRIGGERED_FULL_MASK, nullptr, nullptr, GetCasterGUID());
                    }
                }
            }

            void Register() override
            {
                AfterEffectRemove += AuraEffectRemoveFn(spell_sinestra_wreck_AuraScript::Apply, EFFECT_0, SPELL_AURA_PERIODIC_DAMAGE, AURA_EFFECT_HANDLE_REAL);
            }
        };

        AuraScript* GetAuraScript() const override
        {
            return new spell_sinestra_wreck_AuraScript();
        }
};


class spell_sinestra_wrack_jump : public SpellScriptLoader
{
    public:
        spell_sinestra_wrack_jump() :  SpellScriptLoader("spell_sinestra_wrack_jump") { }

        class spell_sinestra_wrack_jump_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_sinestra_wrack_jump_SpellScript);

            void FilterTargets(std::list<WorldObject*>& targets)
            {
                targets.remove(GetCaster());
                targets.sort(Trinity::ObjectDistanceOrderPred(GetCaster()));

                if (targets.size() < 3)
                    return;

                targets.resize(2);
            }

            void HandleBeforeHit()
            {
                if (!GetHitUnit())
                    return;

                if (!GetCaster())
                    return;

                if (!GetOriginalCaster())
                    return;

                if (Aura* debuff = GetOriginalCaster()->AddAura(89421, GetHitUnit()))
                    if (Aura* aura = GetExplTargetUnit()->GetAura(89421, GetCaster()->GetGUID()))
                        debuff->SetDuration(aura->GetDuration());
            }

            void Register() override
            {
                OnObjectAreaTargetSelect += SpellObjectAreaTargetSelectFn(spell_sinestra_wrack_jump_SpellScript::FilterTargets, EFFECT_0, TARGET_UNIT_SRC_AREA_ENTRY);
                OnObjectAreaTargetSelect += SpellObjectAreaTargetSelectFn(spell_sinestra_wrack_jump_SpellScript::FilterTargets, EFFECT_1, TARGET_UNIT_SRC_AREA_ENTRY);
                BeforeHit += SpellHitFn(spell_sinestra_wrack_jump_SpellScript::HandleBeforeHit);
            }
        };

        SpellScript* GetSpellScript() const override
        {
            return new spell_sinestra_wrack_jump_SpellScript();
        }
};

class OrientationCheck : public std::unary_function<Unit*, bool>
{
    public:
        explicit OrientationCheck(Unit* _orb1, Unit* _orb2) : orb1(_orb1), orb2(_orb2) { }
        bool operator()(WorldObject* object)
        {
            return !object->IsInBetween(orb1, orb2, 2.0f);
        }

    private:
        Unit* orb1;
        Unit* orb2;
};

class spell_sinestra_twilight_slicer : public SpellScriptLoader
{
    public:
        spell_sinestra_twilight_slicer() :  SpellScriptLoader("spell_sinestra_twilight_slicer") { }

        class spell_sinestra_twilight_slicer_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_sinestra_twilight_slicer_SpellScript);

            void FilterTargets(std::list<WorldObject*>& targets)
            {
                // Select Other orb, and filter targets between twos
                if (InstanceScript* instance = GetCaster()->GetInstanceScript())
                {
                    if (Unit* orb0 = instance->GetCreature(DATA_ORB_0))
                    {
                        if (Unit* orb1 = instance->GetCreature(DATA_ORB_1))
                        {
                            targets.remove_if(OrientationCheck(orb1, orb0));
                        }
                    }
                }
            }

            void Register() override
            {
                OnObjectAreaTargetSelect += SpellObjectAreaTargetSelectFn(spell_sinestra_twilight_slicer_SpellScript::FilterTargets, EFFECT_0, TARGET_UNIT_SRC_AREA_ENEMY);
            }
        };

        SpellScript* GetSpellScript() const override
        {
            return new spell_sinestra_twilight_slicer_SpellScript();
        }
};

class ExactDistanceCheck
{
    public:
        ExactDistanceCheck(Unit* source, float dist) : _source(source), _dist(dist) {}

        bool operator()(WorldObject* unit)
        {
            return _source->GetExactDist2d(unit) > _dist;
        }

    private:
        Unit* _source;
        float _dist;
};

class spell_sinestra_twilight_essence : public SpellScriptLoader
{
    public:
        spell_sinestra_twilight_essence() : SpellScriptLoader("spell_sinestra_twilight_essence") { }

        class spell_sinestra_twilight_essence_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_sinestra_twilight_essence_SpellScript);

            void CorrectRange1(std::list<WorldObject*>& targets)
            {
                targets.remove_if(ExactDistanceCheck(GetCaster(), 5.0f * GetCaster()->GetObjectScale()));

                // Remove also the nearest dragon
                if (GetCaster()->ToTempSummon() && GetCaster()->ToTempSummon()->GetSummoner())
                    targets.remove(GetCaster()->ToTempSummon()->GetSummoner());
            }

            void CorrectRange2(std::list<WorldObject*>& targets)
            {
                targets.remove_if(ExactDistanceCheck(GetCaster(), 5.0f * GetCaster()->GetObjectScale()));
            }

            void HandleHit(SpellEffIndex /*effIndex*/)
            {
                if (!GetHitUnit())
                    return;

                if (!GetHitUnit()->ToCreature())
                    return;

                if (GetHitUnit()->GetEntry() == NPC_TWILIGHT_WHELP)
                {
                    if (GetHitUnit()->IsAlive())
                        return;

                    if (InstanceScript* instance = GetHitUnit()->GetInstanceScript())
                    {
                        if (Creature* sinestra = instance->GetCreature(DATA_SINESTRA))
                        {
                            GetHitUnit()->ToCreature()->Respawn();
                            sinestra->AI()->DoZoneInCombat(GetHitUnit()->ToCreature());
                            GetHitUnit()->ToCreature()->AI()->DoAction(ACTION_SET_AS_RESPWANED);
                        }
                    }
                    return;
                }

                if (GetHitUnit()->GetEntry() == NPC_TWILIGHT_DRAKE)
                {
                    // Remove two stack of aura
                    if (GetCaster())
                    {
                        if (Aura* essence = GetCaster()->GetAura(89288, GetCaster()->GetGUID()))
                        {
                            uint8 stacks = essence->GetStackAmount();

                            if (stacks <= 3)
                            {
                                GetCaster()->ToCreature()->DisappearAndDie();
                                return;
                            }

                            essence->SetStackAmount(stacks - 3);
                        }
                        GetHitUnit()->AddAura(SPELL_ABSORB_ESSENCE, GetHitUnit());
                    }
                    return;
                }

            }

            void Register() override
            {
                OnObjectAreaTargetSelect += SpellObjectAreaTargetSelectFn(spell_sinestra_twilight_essence_SpellScript::CorrectRange1, EFFECT_0, TARGET_UNIT_SRC_AREA_ENTRY);
                OnObjectAreaTargetSelect += SpellObjectAreaTargetSelectFn(spell_sinestra_twilight_essence_SpellScript::CorrectRange2, EFFECT_1, TARGET_UNIT_SRC_AREA_ENEMY);
                OnEffectHitTarget += SpellEffectFn(spell_sinestra_twilight_essence_SpellScript::HandleHit, EFFECT_0, SPELL_EFFECT_APPLY_AURA);
            }
        };

        SpellScript* GetSpellScript() const override
        {
            return new spell_sinestra_twilight_essence_SpellScript();
        }
};

class spell_sinestra_phyrric_focus : public SpellScriptLoader
{
    public:
        spell_sinestra_phyrric_focus() : SpellScriptLoader("spell_sinestra_phyrric_focus") { }

        class spell_sinestra_phyrric_focus_AuraScript : public AuraScript
        {
            PrepareAuraScript(spell_sinestra_phyrric_focus_AuraScript);

            void HandlePeriodicTick(AuraEffect const* /*aurEff*/)
            {
                PreventDefaultAction();
                if (Unit* caster = GetCaster())
                {
                    if (caster->GetHealthPct() <= 1)
                    {
                        if (InstanceScript* instance = caster->GetInstanceScript())
                        {
                            if (Creature* sinestra = instance->GetCreature(DATA_SINESTRA))
                            {
                                sinestra->CastStop();
                                sinestra->AI()->DoAction(ACTION_START_PHASE_3);
                            }
                        }
                        caster->Yell("All is lost.... Forgive me, my Queen....", LANG_UNIVERSAL, 0);
                        caster->DealDamage(caster, caster->GetMaxHealth() + 100);
                        return;
                    }
                    caster->DealDamage(caster, caster->GetMaxHealth() * 0.01f);
                }
            }

            void Register() override
            {
                OnEffectPeriodic += AuraEffectPeriodicFn(spell_sinestra_phyrric_focus_AuraScript::HandlePeriodicTick, EFFECT_0, SPELL_AURA_PERIODIC_TRIGGER_SPELL);
            }
        };

        AuraScript* GetAuraScript() const override
        {
            return new spell_sinestra_phyrric_focus_AuraScript();
        }
};

void AddSC_boss_sinestra()
{
    new boss_sinestra();
    new npc_calen();
    new npc_controller();
    new npc_sinestra_twilight_whelp();
    new npc_sinestra_add();
    new spell_sinestra_wreck();
    new spell_sinestra_wrack_jump();
    new spell_sinestra_twilight_slicer();
    new spell_sinestra_twilight_essence();
    new spell_sinestra_phyrric_focus();
}
