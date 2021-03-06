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
 
#ifndef TRINITY_PETFOLLOWMOVEMENTGENERATOR_H
#define TRINITY_PETFOLLOWMOVEMENTGENERATOR_H

#include "AbstractFollower.h"
#include "MovementGenerator.h"
#include "Optional.h"

class PathGenerator;
class Unit;

class PetFollowMovementGenerator : public MovementGenerator, public AbstractFollower
{
    public:
        MovementGeneratorType GetMovementGeneratorType() const override { return FOLLOW_MOTION_TYPE; }

        PetFollowMovementGenerator(Unit* target, float range, float angle);
        ~PetFollowMovementGenerator();

        void Initialize(Unit* owner) override;
        void Reset(Unit* owner) override { Initialize(owner); }
        bool Update(Unit* owner, uint32 diff) override;
        void Finalize(Unit* owner) override;

    private:
        static constexpr uint32 FOLLOW_MOVEMENT_INTERVAL = 800; // sniffed (2 batch update cycles)
        #define FOLLOW_RANGE_TOLERANCE 1.0f

        float const _range;
        float const _angle;
        bool _hasStopped;
        
        TimeTrackerSmall _followMovementTimer;
};

#endif
