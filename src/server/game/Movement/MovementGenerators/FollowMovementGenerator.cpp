/*
 * This file is part of the TrinityCore Project. See AUTHORS file for Copyright information
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

#include "FollowMovementGenerator.h"
#include "CreatureAI.h"
#include "G3DPosition.hpp"
#include "MoveSpline.h"
#include "MoveSplineInit.h"
#include "PathGenerator.h"
#include "Pet.h"
#include "Unit.h"
#include "Util.h"

FollowMovementGenerator::FollowMovementGenerator(Unit* target, float range, float angle) : AbstractFollower(ASSERT_NOTNULL(target)),
    _range(range), _angle(angle), _hasStopped(false), _canCatchUp(false) { }

FollowMovementGenerator::~FollowMovementGenerator() { }

static void DoMovementInform(Unit* owner, Unit* target)
{
    if (owner->GetTypeId() != TYPEID_UNIT)
        return;
    if (UnitAI* ai = owner->GetAI())
        static_cast<CreatureAI*>(ai)->MovementInform(FOLLOW_MOTION_TYPE, target->GetGUID().GetCounter());
}

void FollowMovementGenerator::Initialize(Unit* owner)
{
    owner->AddUnitState(UNIT_STATE_FOLLOW);
    _followMovementTimer.Reset(0);
    _hasStopped = false;

    if (TempSummon const* summon = owner->ToTempSummon())
        if ((summon->m_Properties && summon->m_Properties->Control != SUMMON_CATEGORY_WILD) || summon->IsPet())
            _canCatchUp = true;
}

bool FollowMovementGenerator::Update(Unit* owner, uint32 diff)
{
    // owner might be dead or gone
    if (!owner->IsAlive())
        return false;

    // our target might have gone away
    Unit* const target = GetTarget();
    if (!target)
        return false;

    if (owner->HasUnitState(UNIT_STATE_NOT_MOVE) || owner->IsMovementPreventedByCasting())
    {
        owner->StopMoving();
        _hasStopped = true;
        _followMovementTimer.Reset(0);
        return true;
    }

    _followMovementTimer.Update(diff);
    if (_followMovementTimer.Passed())
    {
        _followMovementTimer.Reset(FOLLOW_MOVEMENT_INTERVAL);

        // Follow target is moving
        if (!target->movespline->Finalized() || target->isMoving())
        {
            Position dest = target->GetPosition();

            target->MovePositionToFirstCollision(dest, _range, _angle);

            // Determine our follow speed
            float velocity = target->IsWalking() ? target->GetSpeed(MOVE_WALK) : target->GetSpeed(MOVE_RUN);

            // Determine catchup speed for pets, minions and allied summons
            if (_canCatchUp && !dest.HasInArc(float(M_PI), owner)) // pet is behind follow target
            {
                // Limit catchup speed to a total of 1.5 times of the follow target's velocity
                float distance = owner->GetExactDist2d(dest);
                float distMod = 1.f + std::min<float>(distance * 0.1f, 0.5f);
                velocity *= distMod;
            }

            // Now we predict our follow destination by moving ahead (according to sniff spline distances are roundabout velocity * 2)
            target->MovePositionToFirstCollision(dest, velocity * 2, 0.f);

            Movement::MoveSplineInit init(owner);
            init.MoveTo(PositionToVector3(dest));
            init.SetVelocity(velocity);
            init.Launch();

            owner->AddUnitState(UNIT_STATE_FOLLOW_MOVE);
            _hasStopped = false;

            return true;
        }

    }

    // Follow target has stopped moving, allign to current position and inform AI
    if (!_hasStopped && target->movespline->Finalized() && !target->isMoving())
    {
        Position dest = target->GetPosition();
        target->MovePositionToFirstCollision(dest, _range, _angle);
        float velocity = target->IsWalking() ? target->GetSpeed(MOVE_WALK) : target->GetSpeed(MOVE_RUN);

        Movement::MoveSplineInit init(owner);
        init.MoveTo(PositionToVector3(dest));
        init.SetFacing(dest.GetOrientation());
        init.SetVelocity(velocity);
        init.Launch();

        if (owner->HasUnitState(UNIT_STATE_FOLLOW_MOVE))
        {
            owner->ClearUnitState(UNIT_STATE_FOLLOW_MOVE);
            DoMovementInform(owner, target);
        }

        _hasStopped = true;
        return true;
    }

    return true;
}

void FollowMovementGenerator::Finalize(Unit* owner)
{
    owner->ClearUnitState(UNIT_STATE_FOLLOW | UNIT_STATE_FOLLOW_MOVE);
}
