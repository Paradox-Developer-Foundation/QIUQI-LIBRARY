NNavy = {
	-- Peace Conference
	WAR_SCORE_GAIN_FOR_SUNK_SHIP_MANPOWER_FACTOR = 0.004,			-- war score gained for every manpower killed when sinking a ship
	WAR_SCORE_GAIN_FOR_SUNK_SHIP_PRODUCTION_COST_FACTOR = 0.020,		-- war score gained for every IC of the sunk ship
	WAR_SCORE_GAIN_FOR_SUNK_CONVOY = 0.08,							-- war score gained for every sunk convoy
	WAR_SCORE_DECAY_FOR_BUILT_CONVOY = 0.01,  						-- war score deducted when convoy-raided enemy produces one new convoy
	PEACE_ACTION_TRANSFER_NAVY_EXPERIENCE_RETAINED = 0.25,			-- % of experience to retain after being transferred in a peace conference

	-- Convoy Priorities START
	NAVAL_INVASION_PRIORITY = 1,									-- Default convoy priority for naval invasions
	NAVAL_TRANSFER_PRIORITY = 1,									-- Default convoy priority for naval transports
	SUPPLY_PRIORITY = 2,											-- Default convoy priority for supplying units via sea
	RESOURCE_LENDLEASE_PRIORITY = 3,								-- Default convoy priority for export lend lease
	RESOURCE_EXPORT_PRIORITY = 4,									-- Default convoy priority for export trade
	RESOURCE_ORIGIN_PRIORITY = 5,									-- Default convoy priority for resources shipped internally
	RESOURCE_PURCHASE_PRIORITY = 6,									-- Default convoy priority for export equipment purchase
	UNDERWAY_REPLENISHMENT_PRIORITY = 7,							-- Default convoy priority for underway replenishment
	-- Convoy Priorities END

	ADMIRAL_TASKFORCE_CAP = 10,										-- admirals will start getting penalties after this amount of taskforces

	DETECTION_CHANCE_MULT_BASE = 0.1,								-- base multiplier value for detection chance. Later the chance is an average between our detection and enemy visibility, mult by surface/sub detection chance in the following defines.
	DETECTION_CHANCE_MULT_RADAR_BONUS = 0.1,						-- detection chance bonus from radars.
	DETECTION_CHANCE_MULT_AIR_SUPERIORITY_BONUS = 0.25,			-- bonus from air superiority.

	MAX_CAPITALS_PER_AUTO_TASK_FORCE = 5,							-- maximum number of capital ships the auto-task force creation will put together when designing SurfaceActionGroup
	MAX_SUBMARINES_PER_AUTO_TASK_FORCE = 30,						-- maximum number of submarines the auto-task force creation will put together when designing wolfpack
	BEST_CAPITALS_TO_CARRIER_RATIO = 1,							-- capitals / carriers ratio used when auto-task force creation designs CarrierTaskForce
	BEST_CAPITALS_TO_SCREENS_RATIO = 0.25, 							-- capitals / screens ratio used for creating FEX groups in naval combat
	COMBAT_BASE_HIT_CHANCE = 0.1,									-- base chance for hit

	COMBAT_MIN_HIT_CHANCE = 0.05,									-- never less hit chance then this?
	COMBAT_EVASION_TO_HIT_CHANCE = 0.007,							-- we take ship evasion stats, and mult by this value, so it gives hit chance reduction. So if reduction is 0.025 and ship evasion = 10, then there will be 0.25 (25%) lower hit chance. (Fe. 50% base -25% from evasion +10% bcoz it's very close).
	COMBAT_EVASION_TO_HIT_CHANCE_TORPEDO_MULT = 10.0,				-- the above evasion hit chance is multiplied by 400% if shooting with torpedoes. Torpedoes are slow, so evasion matters more.
	MIN_HIT_PROFILE_MULT = 0.0,										-- largest hit profile penalty to hitting
	COMBAT_LOW_ORG_HIT_CHANCE_PENALTY = -0.5,						-- % of penalty applied to hit chance when ORG is very low.
	COMBAT_LOW_MANPOWER_HIT_CHANCE_PENALTY = -0.25,					-- % of penalty applied to hit chance when manpower is very low.
	COMBAT_DAMAGE_RANDOMNESS = 0.5,									-- random factor in damage. So if max damage is fe. 10, and randomness is 30%, then damage will be between 7-10.
	COMBAT_TORPEDO_CRITICAL_CHANCE = 0.1,							-- chance for critical hit from torpedo.
	COMBAT_TORPEDO_CRITICAL_DAMAGE_MULT = 2.0,						-- multiplier to damage when got critical hit from torpedo. (Critical hits are devastating as usualy torpedo_attack are pretty high base values).

	COMBAT_DAMAGE_TO_STR_FACTOR = 0.6,								-- casting damage value to ship strength multiplier. Use it ot balance the game difficulty.
	COMBAT_DAMAGE_TO_ORG_FACTOR = 1.0,								-- casting damage value to ship organisation multiplier. Use it to balance the game difficulty.

	NAVY_MAX_XP = 100,
	COMBAT_ON_THE_WAY_INIT_DISTANCE_BALANCE = 0.25, 				-- Value to balance initial distance to arrive for ships that are "on the way"
	COMBAT_CHASE_RESIGNATION_HOURS = 8,								-- Before we resign chasing enemy, give them some minimum time so the combat doesn't end instantly.

	COMBAT_MAX_GROUPS = 1,											-- Max amount of "Fire Exchange" groups (FEX).
	COMBAT_MIN_DURATION = 8,										-- Min combat duration before we can retreat. It's a balancing variable so it's not possible to always run with our weak ships agains big flotillas.
	COMBAT_INITIAL_DURATION = 6,									-- Number of hours that is considered the "initial phase" of naval combat, used for modifiers like surprise attack during "initial combat"
	COMBAT_RETREAT_DECISION_CHANCE = 0.22, 							-- There is also random factor in deciding if we should retreat or not. That causes a delay in taking decision, that sooner or later will be picked. It's needed so damaged fast ships won't troll the combat.
	COMBAT_DETECTED_CONVOYS_FROM_SURFACE_DETECTION_STAT = 0.1,		-- Each 1.0 of surface_detection that ship has (equipment stat), gives x% of convoys discovered from total travelling along the route.
	COMBAT_BASE_CRITICAL_CHANCE = 0.05,								-- Base chance for receiving a critical chance. It get's scaled down with ship reliability.
	COMBAT_CRITICAL_DAMAGE_MULT = 5.0,								-- Multiplier for the critical damage. Scaled down with the ship reliability.
	COMBAT_ARMOR_PIERCING_CRITICAL_BONUS = 1.0,						-- Bonus to critical chance when shooter armor piercing is higher then target armor.
	COMBAT_ARMOR_PIERCING_DAMAGE_REDUCTION = 0,					-- All damage reduction % when target armor is >= then shooter armor piercing. (depricated)
	REPAIR_AND_RETURN_PRIO_LOW = 0.2,								-- % of total Strength. When below, navy will go to home base to repair.
	REPAIR_AND_RETURN_PRIO_MEDIUM = 0.5,							-- % of total Strength. When below, navy will go to home base to repair.
	REPAIR_AND_RETURN_PRIO_HIGH = 0.9,								-- % of total Strength. When below, navy will go to home base to repair.
	REPAIR_AND_RETURN_PRIO_LOW_COMBAT = 0.6,						-- % of total Strength. When below, navy will go to home base to repair (in combat).
	REPAIR_AND_RETURN_PRIO_MEDIUM_COMBAT = 0.3,						-- % of total Strength. When below, navy will go to home base to repair (in combat).
	REPAIR_AND_RETURN_PRIO_HIGH_COMBAT = 0.1,						-- % of total Strength. When below, navy will go to home base to repair (in combat).
	REPAIR_AND_RETURN_AMOUNT_SHIPS_LOW = 0.2,						-- % of total damaged ships, that will be sent for repair-and-return in one call.
	REPAIR_AND_RETURN_AMOUNT_SHIPS_MEDIUM = 0.4,					-- % of total damaged ships, that will be sent for repair-and-return in one call.
	REPAIR_AND_RETURN_AMOUNT_SHIPS_HIGH = 0.8,						-- % of total damaged ships, that will be sent for repair-and-return in one call.
	REPAIR_AND_RETURN_UNIT_DYING_STR = 0.2,							-- Str below this point is considering a single ship "dying", and a high priority to send to repair.
	EXPERIENCE_LOSS_FACTOR = 1.00,                 					-- percentage of experienced solders who die when manpower is removed
	NAVY_EXPENSIVE_IC = 5500,										-- How much IC is considering the fleet to be expensive. Those expensive will triger the alert, when are on low STR.
	MISSION_MAX_REGIONS = 0,										-- Limit of the regions that can be assigned to naval mission. Set to 0 for unlimited.
	CONVOY_EFFICIENCY_LOSS_MODIFIER = 1.25,							-- How much efficiency drops when losing convoys. If modifier is 0.5, then losing 100% of convoys in short period, the efficiency will drop by 50%.
	CONVOY_EFFICIENCY_REGAIN_AFTER_DAYS = 7,						-- Convoy starts regaining it's efficiency after X days without any convoys being sink.
	CONVOY_EFFICIENCY_REGAIN_BASE_SPEED = 0.04,						-- How much efficiency regains every day.
	CONVOY_EFFICIENCY_MIN_VALUE = 0.05,								-- To avoid complete 0% efficiency, set the lower limit.
	CONVOY_ROUTE_SIZE_CONVOY_SCALE = 0.5,                           -- scales impact of convoy route size (0 to turn off)
	ANTI_AIR_TARGETTING_TO_CHANCE = 0.2,							-- Balancing value to convert averaged equipment stats (anti_air_targetting and naval_strike_agility) to probability chances of airplane being hit by navies AA.
	ANTI_AIR_ATTACK_TO_AMOUNT = 0.01,								-- Balancing value to convert equipment stat anti_air_attack to the random % value of airplanes being hit.
	CONVOY_SINKING_SPILLOVER = 0.5,                 				-- Damaged convoys roll for if they sink in the end of combat by accumulating the damage. This scales that chance.
	UNIT_EXPERIENCE_PER_COMBAT_HOUR = 10,
	UNIT_EXPERIENCE_SCALE = 1,
	EXPERIENCE_FACTOR_CONVOY_ATTACK = 0.04,
	EXPERIENCE_FACTOR_NON_CARRIER_GAIN = 0.04,						-- Xp gain by non-carrier ships in the combat
	EXPERIENCE_FACTOR_CARRIER_GAIN = 0.08,							-- Xp gain by carrier ships in the combat
	FIELD_EXPERIENCE_SCALE = 0.075,
	FIELD_EXPERIENCE_MAX_PER_DAY = 50,								-- Most xp you can gain per day
	LEADER_EXPERIENCE_SCALE = 1.0,
	BATTLE_NAME_VP_FACTOR = 100,									-- Name is given by ((VP value) * BATTLE_NAME_VP_FACTOR) / (Distance VP -> battle)
	BATTLE_NAME_VP_CUTOFF = 1.0,									-- If best score of above calculation is below this, name will be that of region.
	AMPHIBIOUS_LANDING_PENALTY = -0.5,								-- amphibious landing penalty
	AMPHIBIOUS_INVADE_SPEED_BASE = 0.5, 							-- every hour movement progress on amphibious invasion
	AMPHIBIOUS_INVADE_MOVEMENT_COST = 24.0, 						-- total progress cost of movement while amphibious invading
	AMPHIBIOUS_INVADE_ATTACK_LOW = 0.2, 							-- low and high cap of attack modifier scale. Scale interpolated by invasion progress.
	AMPHIBIOUS_INVADE_ATTACK_HIGH = 1.0,
	AMPHIBIOUS_INVADE_DEFEND_LOW = 1.5, 							-- low and high cap of defend modifier scale. Scale interpolated by invasion progress.
	AMPHIBIOUS_INVADE_DEFEND_HIGH = 1.0,
	AMPHIBIOUS_INVADE_LANDING_PENALTY_DECREASE = 3.5, 				-- scale of bonus that decreases "amphibious penalty" during combat, relative to invading transporter tech.
	BASE_CARRIER_SORTIE_EFFICIENCY = 0.5,							-- factor of planes that can sortie by default from a carrier
	CONVOY_ATTACK_BASE_FACTOR = 0.15,                               -- base % of convoys that get intercepted
	NAVAL_SPEED_MODIFIER = 0.1,	                    				-- basic speed control
	NAVAL_RANGE_TO_INGAME_DISTANCE = 0.12,							-- Scale the ship stats "naval_range" to the ingame distance
	NAVAL_INVASION_PREPARE_HOURS = 168,								-- base hours needed to prepare an invasion
	NAVAL_COMBAT_RESULT_TIMEOUT_YEARS = 2,							-- after that many years, we clear the naval combat results, so they don't get stuck forever in the memory.
	CONVOY_LOSS_HISTORY_TIMEOUT_MONTHS = 24,						-- after this many months remove the history of lost convoys to not bloat savegames and memory since there is no way to see them anyway
	NAVAL_TRANSFER_BASE_SPEED = 6,                                  -- base speed of units on water being transported
	NAVAL_TRANSFER_BASE_NAVAL_DIST_ADD = 100,						-- Extra cost for naval movement ( compared to land movement ) when deciding what ports to use for a naval transfer
	NAVAL_TRANSFER_BASE_NAVAL_DIST_MULT = 20,						-- Multiplier for the cost of naval movement ( compared to land movement ) when deciding what ports to use for naval transfer
	NAVAL_SUPREMACY_CAN_INVADE = 0.5,								-- required naval supremacy to perform invasions on an area
	CARRIER_STACK_PENALTY = 4,										-- The most efficient is 4 carriers in combat. 5+ brings the penalty to the amount of wings in battle.
	CARRIER_STACK_PENALTY_EFFECT = 0.2,								-- Each carrier above the optimal amount decreases the amount of airplanes being able to takeoff by such %.
	SHORE_BOMBARDMENT_CAP = 0.25,
	ANTI_AIR_TARGETING = 0.9,                                       -- how good ships are at hitting aircraft
	MIN_TRACTED_ASSIST_DAMAGE_RATIO = 0.05,							-- How much damage counts as assist damage
	SUPPLY_NEED_FACTOR = 4,										    -- multiplies supply usage
	DECRYPTION_SPOTTING_BONUS = 0.2,
	DISBAND_MANPOWER_LOSS = 0.0,
	MANPOWER_LOSS_RATIO_ON_SUNK = 0.5,								-- sunk ships will lose this ratio of their current manpower
	MANPOWER_LOSS_RATIO_ON_STR_LOSS = 0.5,							-- losing strength will make you also lose manpower at this ratio of total manpower
	MIN_MANPOWER_RATIO_TO_DROP = 0.1,								-- ships will not lose man power to below this ratio
	DAILY_MANPOWER_GAIN_RATIO = 0.05,								-- the ships not in combat will be able to gain this ratio of their max manpower
	PRIDE_OF_THE_FLEET_UNASSIGN_COST = 100,							-- cost to unassign/replace pride of the fleet
	PRIDE_OF_THE_FLEET_LOST_TEMP_MODIFIER_DURATION = 30,			-- duration for temp modifiers that you get when you lose your pride of the fleet
	XP_GAIN_FACTOR = 1.0,	   			   							-- xp gain factor for navy

	NAVAL_TRANSFER_DAMAGE_REDUCTION = 0.25,							-- its hard to specifically balance 1-tick naval strikes vs unit transports so here is a factor for it
	CARRIER_ONLY_COMBAT_ACTIVATE_TIME = 0,							-- hours from start of combat when carriers get to fight
	CAPITAL_ONLY_COMBAT_ACTIVATE_TIME = 6,                          -- hours from start of combat when only carriers, capitals and subs get to attack
	ALL_SHIPS_ACTIVATE_TIME = 8,                                    -- hours where all get to attack

	MINIMUM_SHIP_SPEED = 1.0,										-- slowest speed a ship can have

	REPAIR_SPLIT_TASKFORCE_SIZE = 5,								-- if a country does not have empty naval naval bases for repairs, it will split ships with this sizes and distribute them around
	NAVY_REPAIR_BASE_SEARCH_SCORE_PER_SHIP_WAITING_EXTRA_SHIP = 5,  -- if a naval base has more ships than it can repair, it will get penalties
	NAVY_REPAIR_BASE_SEARCH_SCORE_PER_SLOT = 1.0,					-- while searching for a naval base for repairs, the bases gets a bonus to their scores per empty slot they have
	NAVY_REPAIR_BASE_SEARCH_BOOST_FOR_SAME_COUNTRY = 5,				-- while searching for a naval base for repairs, your own bases gets a bonus


	CONVOY_SPOTTING_COOLDOWN = 0.3,  -- % of travel time
	CONVOY_SPOTTING_COOLDOWN_MIN = 36, -- minimum cooldown time
	CONVOY_SPOTTING_COOLDOWN_MAX = 168, -- maximum cooldown time
	CONVOY_SPOTTING_COOLDOWN_MIN_FROM_EFFICIENCY = 15, -- clamped min value after screening efficiency has been applied

	MISSION_FUEL_COSTS = {  -- fuel cost for each mission
		0.0, -- HOLD (consumes fuel HOLD_MISSION_MOVEMENT_COST fuel while moving)
		1.0, -- PATROL
		1.0, -- STRIKE FORCE (does not cost fuel at base, and uses IN_COMBAT_FUEL_COST in combat. this is just for the movement in between)
		1.0, -- CONVOY RAIDING
		1.0, -- CONVOY ESCORT
		1.0, -- MINES PLANTING
		1.0, -- MINES SWEEPING
		0.6, -- TRAIN
		0.0, -- RESERVE_FLEET (consumes fuel HOLD_MISSION_MOVEMENT_COST fuel while moving)
		1.0, -- NAVAL_INVASION_SUPPORT (does not cost fuel at base, only costs while doing bombardment and escorting units)
	},

	HOLD_MISSION_MOVEMENT_COST = 1.0,								-- ships on hold cost this much fuel while moving
	ON_BASE_FUEL_COST = 0.0,										-- ships that waits at naval bases cost this ratio
	IN_COMBAT_FUEL_COST = 2.0,										-- ships in combat will get this ratio for fuel cost
	TRAINING_FUEL_COST_FOR_ESCORT_SHIPS = 0.15,						-- ships that are on training mission but not training (ie they are at max xp and training will cancel at max xp) will consume this ratio of fuel

	MAX_FUEL_FLOW_MULT = 2.0, -- max fuel flow ratio for ships, which will be multiplied by supply
	FUEL_COST_MULT = 0.10, -- fuel multiplier for all naval missions

	OUT_OF_FUEL_SPEED_FACTOR = -0.75,
	OUT_OF_FUEL_RANGE_FACTOR = -0.75,
	OUT_OF_FUEL_ATTACK_FACTOR = -0.5,
	OUT_OF_FUEL_TORPEDO_FACTOR = -0.8,

	UNDERWAY_REPLENISHMENT_RANGE_FACTOR = 0.4,			-- bonus factor applied to task force's range when underway replenishment is activated (e.g. 0.2 means +20%)
	UNDERWAY_REPLENISHMENT_CONVOY_COST_PER_FUEL = 0.28,	-- Cost in convoys for underway replenishment multiplied by max daily fuel consumption (rounded up)

	MISSION_SPREADS = {  -- mission spreads in the case a ship join combat, which is calculated for number of ships that will be in combat. 1 means no ship will be at start
		0.0, -- HOLD
		0.0, -- PATROL
		0.0, -- STRIKE FORCE
		0.0, -- CONVOY RAIDING
		0.0, -- CONVOY ESCORT
		0.7, -- MINES PLANTING
		0.7, -- MINES SWEEPING
		0.5, -- TRAIN
		0.0, -- RESERVE_FLEET
		0.0, -- NAVAL_INVASION_SUPPORT
	},
	MISSION_DEFAULT_SPREAD_BASE = 1.0, -- multiplier for mission spreads. higher = less ships on start

	AGGRESSION_SETTINGS_VALUES = { -- ships will use this values while deciding to attack enemies
		0,		-- do not engage
		0.5,	-- low
		0.9,	-- medium
		2.0,	-- high
		10000,	-- I am death incarnate!
	},

	AGGRESION_MULTIPLIER_FOR_COMBAT = 1.2,				-- ships are more aggresive in combat

	AGGRESSION_ARMOR_EFFICIENCY_MULTIPLIER = 1.0,		-- armor to enemy piercing ratio is multiplied by this value, which will increase the strength of ships while considering them for aggression
	AGGRESSION_MIN_ARMOR_EFFICIENCY = 0.5,              -- armor multiplier has a min and max caps while being factored in aggression
	AGGRESSION_MAX_ARMOR_EFFICIENCY = 1.5,              -- armor multiplier has a min and max caps while being factored in aggression

	AGGRESSION_LIGHT_GUN_EFFICIENCY_ON_LIGHT_SHIPS = 1.0, -- ratio for scoring for different gun types against light ships
	AGGRESSION_HEAVY_GUN_EFFICIENCY_ON_LIGHT_SHIPS = 0.25,-- ratio for scoring for different gun types against light ships
	AGGRESSION_TORPEDO_EFFICIENCY_ON_LIGHT_SHIPS = 0.1,   -- ratio for scoring for different gun types against light ships

	AGGRESSION_LIGHT_GUN_EFFICIENCY_ON_HEAVY_SHIPS = 0.1, -- ratio for scoring for different gun types against heavy ships
	AGGRESSION_HEAVY_GUN_EFFICIENCY_ON_HEAVY_SHIPS = 1.0, -- ratio for scoring for different gun types against heavy ships
	AGGRESSION_TORPEDO_EFFICIENCY_ON_HEAVY_SHIPS = 1.1,   -- ratio for scoring for different gun types against heavy ships

	AGGRESSION_CONVOY_STRENGTH_FACTOR = 0.3,			  -- convoys in combat gets a penalty to their strength in aggression calculations

	SUBMARINE_ESCAPE_RATIOS = { -- subs will escape battle in convoy raid if there are enemies that can attack
		1000,     -- do not engage
		15,   -- low
		3.0,   -- medium
		1.0,   -- high
		0.1,   -- I am death incarnate!
	},

	MIN_REPAIR_FOR_JOINING_COMBATS = { -- strikeforces/patrol forces will not join combats if they are not repaired enough
		0.0,	-- do not repair
		0.5,	-- low
		0.7,	-- medium
		0.9,	-- high
	},

	ORG_COST_WHILE_MOVING = { -- org cost while the ships are moving
		0.3, -- HOLD
		0.2, -- PATROL
		0.25, -- STRIKE FORCE
		0.2, -- CONVOY RAIDING
		0.2, -- CONVOY ESCORT
		0.2, -- MINES PLANTING
		0.2, -- MINES SWEEPING
		0.2, -- TRAIN
		0.3, -- RESERVE_FLEET
		0.2, -- NAVAL_INVASION_SUPPORT
	},

	ORG_COST_WHILE_MOVING_IN_MISSION_ZONE = { -- org cost while moving in mission zone
		0.0, -- HOLD
		0.0, -- PATROL
		0.0, -- STRIKE FORCE
		0.0, -- CONVOY RAIDING
		0.0, -- CONVOY ESCORT
		0.0, -- MINES PLANTING
		0.0, -- MINES SWEEPING
		0.0, -- TRAIN
		0.0, -- RESERVE_FLEET
		0.0, -- NAVAL_INVASION_SUPPORT
	},

	MAX_ORG_ON_MANUAL_MOVE = 0.66,	-- org will clamped to this ratio on manual move
	MIN_ORG_ON_MANUAL_MOVE = 0.1,	-- org will clamped to this ratio on manual move

	INITIAL_ALLOWED_DOCKYARD_RATIO_FOR_REPAIRS = 0.25,				-- initially countries will allocate this ratio of dockyards for repairs


	MISSION_SUPREMACY_RATIOS = { -- supremacy multipliers for different mission types
		0.0, -- HOLD
		1.0, -- PATROL
		1.0, -- STRIKE FORCE
		0.5, -- CONVOY RAIDING
		0.5, -- CONVOY ESCORT
		0.3, -- MINES PLANTING
		0.3, -- MINES SWEEPING
		0.0, -- TRAIN
		0.0, -- RESERVE_FLEET
		1.0, -- NAVAL_INVASION_SUPPORT
	},

	SUPREMACY_PER_SHIP_PER_MANPOWER = 0.05,							-- supremacy of a ship is calculated using its IC, manpower and a base define
	SUPREMACY_PER_SHIP_PER_IC = 0.005,
	SUPREMACY_PER_SHIP_BASE = 0,

	NAVAL_MINES_IN_REGION_MAX = 1000.0,								-- Max number of mines that can be layed by the ships. The value should be hidden from the user, as we present % so it's an abstract value that should be used for balancing.
	NAVAL_MINES_PLANTING_SPEED_MULT = 0.01,						-- Value used to overall balance of the speed of planting naval mines
	NAVAL_MINES_SWEEPING_SPEED_MULT = 0.009,						-- Value used to overall balance of the speed of sweeping naval mines
	NAVAL_MINES_DECAY_AT_PEACE_TIME = 0.25,							-- How fast mines are decaying in peace time. Planting mines in peace time may be exploitable, so it's blocked atm. That's why after war we should decay them too.
	NAVAL_MINES_SWEEPERS_REDUCTION_ON_PENALTY_EFFECT = 3.3,			-- How much is the task force's sweeping attribute reducing the penalty effect.
	NAVAL_MINES_INTEL_DIFF_FACTOR = 0.5,							-- Better our decryption over enemy encryption will reduce the penalties from the enemy mines in the region. This value is a factor to be used for balancing.
	NAVAL_MINES_NAVAL_SUPREMACY_FACTOR = 1.0,						-- Factor for max amount of mines increasing naval supremacy

	ATTRITION_WHILE_MOVING_FACTOR = 1.5,							-- attrition multiplier while moving & doing missions
	ATTRITION_DAMAGE_ORG = 0.01,					   				-- damage from attrition to Organisation (relative to max org)
	ATTRITION_DAMAGE_STR = 0.03,					   				-- damage from attrition to str (relative to max str)
	ATTRITION_STR_DAMAGE_CHANCE = 0.2,								-- chance to get damaged at highest attrition

	NAVAL_ACCIDENT_CHANCE_REDUCTION_ON_POTF = 0.01,					-- Scale of the current chance for an accident to happen, applied for the pride of the fleet.
	NAVAL_ACCIDENT_CRITICAL_HIT_CHANCE_REDUCTION_POTF = 0.01,		-- Scale of the current chance for a critical hit when an accident happens, applied for the pride of the fleet.

	NAVAL_MINES_ACCIDENT_CRITICAL_HIT_CHANCES = 0.14,				-- If an accident happens, how likely it is to be a critical hit (caused by naval mines)
	NAVAL_MINES_ACCIDENT_CRITICAL_HIT_DAMAGE_SCALE = 5.0,			-- Scale the value below in case of critical hit (caused by naval mines)
	NAVAL_MINES_ACCIDENT_STRENGTH_LOSS = 50.0,						-- Amount of strength loss when hit by naval mine
	NAVAL_MINES_ACCIDENT_ORG_LOSS_FACTOR = 0.5,						-- Amount of strength loss when hit by naval mine

	TRAINING_ACCIDENT_CHANCES = 0.02,						-- Chances one ship get damage each hour while on training
	TRAINING_ACCIDENT_CRITICAL_HIT_CHANCES = 0.3,					-- If an accident happens, how likely it is to be a critical hit
	TRAINING_ACCIDENT_CRITICAL_HIT_DAMAGE_SCALE = 4.0,				-- Scale the value below in case of critical hit
	TRAINING_ACCIDENT_STRENGTH_LOSS = 4.0,							-- Amount of strength loss in a training accident
	TRAINING_ACCIDENT_STRENGTH_LOSS_FACTOR = 0.05,						-- Amount of strength loss in a training accident, propotional to the maximum strength of the ship
	TRAINING_ACCIDENT_ORG_LOSS_FACTOR = 0.3,						-- Amount of current organization the ship lose

	ACCIDENTS_CHANCE_BALANCE_FACTOR = 0.04,							-- General chance for naval accidents for balancing the gameplay.

																	-- The Formula: Min( TRAINING_MAX_DAILY_COUNTRY_EXP * Ratio, TRAINING_DAILY_COUNTRY_EXP_FACTOR * ( TRAINING_DAILY_COUNTRY_EXP_SHIP_RATIO_FACTOR * TrainingShipCount / CountryShipCount
																	--              + TRAINING_DAILY_COUNTRY_EXP_MANPOWER_FACTOR * Manpower + TRAINING_DAILY_COUNTRY_EXP_MANPOWER_RATIO_FACTOR * Manpower / CountryShipCount ) )
	TRAINING_EXPERIENCE_FACTOR = 0.3,								-- Amount of exp each ship gain every 24h while training (before modifiers)
	TRAINING_DAILY_COUNTRY_EXP_FACTOR = 0.001,						-- Factor used to scale the Daily Country Navy XP gain
	TRAINING_DAILY_COUNTRY_EXP_MANPOWER_FACTOR = 0.006,					-- Factor used to scale the sum of the training manpower for the Daily Country Navy XP gain
	TRAINING_DAILY_COUNTRY_EXP_MANPOWER_RATIO_FACTOR = 0.01,				-- Factor used to scale the sum of the manpower divided by the country's number of ship for the Daily Country Navy XP gain
	TRAINING_DAILY_COUNTRY_EXP_SHIP_RATIO_FACTOR =  300.0,					-- Factor used to scale the ratio of training ships for the Daily Country Navy XP gain
	TRAINING_MAX_DAILY_COUNTRY_EXP = 3.5,							-- Maximum navy XP daily gain
	TRAINING_MIN_STRENGTH = 0.1,									-- if strength is less than this, the unit will not contribute to training and cant be damaged by training

	TRAINING_ORG = 0.2,												-- max organization on traiaing mission

	BASE_SPOTTING = 1,												-- base spotting percentage for navy
	BASE_SPOTTING_FROM_RADAR = 5,									-- base spotting percentage that comes from full radar coverage
	NAVY_SPOTTER_DETECTION_FACTOR = 0.1,							-- multiplier for task forces' detection value before logistic transform
	BASE_SPOTTING_FROM_NAVY = 10,									-- base spotting percentage that comes from task forces in area
	AIR_SPOTTER_NORMALIZED_AIRWING_SIZE = 100,						-- each plane will contribute 1/this of the air-wing's detection stat
	AIR_SPOTTER_DETECTION_FACTOR = 0.025,							-- multiplier for air-wings' detection value before logistic transform
	BASE_SPOTTING_FROM_AIR = 20,									-- base spotting percentage that comes from air-wings in area
	BASE_SPOTTING_FROM_DECRYPTION = 10,								-- base spotting percentage that comes from decryption, can go negative (enemy decryption is subtracted)
	MIN_SPOTTING_PROGRESS = 0.01,									-- Minimum spotting progress (in percent) per hourly tick
	AIR_MISSION_SPOTTING_FACTORS = {								-- Multiplier for air-wings' spotting contribution per mission type
		0.50, -- AIR_SUPERIORITY
		0, -- CAS
		0.25, -- INTERCEPTION
		0, -- STRATEGIC_BOMBER
		0.50, -- NAVAL_BOMBER
		0, -- DROP_NUKE
		0, -- PARADROP
		0.25, -- NAVAL_KAMIKAZE
		0, -- PORT_STRIKE
		0, -- ATTACK_LOGISTICS
		0, -- AIR_SUPPLY
		0, -- TRAINING
		0.25, -- NAVAL_MINES_PLANTING
		0.50, -- NAVAL_MINES_SWEEPING
		1.00, -- RECON
		1.50, -- NAVAL_PATROL
	},

	MIN_HOURS_TO_SHUFFLE_NEWLY_ASSIGNED_PATROLS = 7 * 24,			-- if a fleet has less patrol than it needs to cover all of it areas, it will shuffle the patrols around. it will wait this much hour before shuffling a task force to new area
	SPOTTING_ENEMY_SPOTTING_MULTIPLIER_FOR_RUNNING_AWAY = 0.80,		-- enemy spotting is multiplied by this value to simulate running away
	SPOTTING_MULTIPLIER_FOR_SURFACE = 1.0,							-- task force surface spotting value is multiplied by this and added to spotting percentage every hour
	SPOTTING_MULTIPLIER_FOR_SUB = 1.0,								-- task force sub spotting value is multiplied by this and added to spotting percentage every hour
	SPOTTING_SPEED_MULT_FOR_RUNNING_AWAY = 0.5,						-- task forces that does not want to engage will reduce enemy spotting rate every hour by speed diff mult this ratio
	SPOTTING_SPEED_MULT_FOR_CATCHING_UP = 0.2,						-- speed diff bonus rate that is added to spotting every hour
	SPOTTING_MISSION_DETECTION_THRESHOLD_LOW = 10.0,					-- value between 0 and 100 above which to show very coarse information about the spotted task force
	SPOTTING_MISSION_DETECTION_THRESHOLD_MEDIUM = 70.0,					-- value between 0 and 100 above which to show coarse information about the spotted task force. Note: accurate information are shown when spotting reach 100.
	NAVY_VISIBILITY_BONUS_ON_RETURN_FOR_REPAIR = 0.9,				-- Multiplier for the surface/sub visiblity when the heavily damaged fleet is returning to the home base for reparation. 1.0 = no bonus. 0.0 = invisible.
	VISIBILITY_MULTIPLIER_FOR_SPOTTING = 0.1,						-- multiplier for visibility stat
	INTEL_LEVEL_LOW_HALF_RANGE_PERCENTAGE = 10,							-- Integer representing the maximum offset of the displayed value to the original, in percentage (divided by 100 in code). For spotting level "low".
	INTEL_LEVEL_MEDIUM_HALF_RANGE_PERCENTAGE = 5,							-- Same as above but for the spotting level "medium"
	INTEL_LEVEL_LOW_HALF_RANGE_MIN_SHIPS = 3,							-- If the percentage of the value is lower than this, use this value instead. For spotting level "low"
	INTEL_LEVEL_LOW_HALF_RANGE_MIN_CAPITALS = 1,							-- Same as above but for capital ships
	INTEL_LEVEL_MEDIUM_HALF_RANGE_MIN_SHIPS = 1,							-- If the percentage of the value is lower than this, use this value instead. For spotting level "medium"
	INTEL_LEVEL_MEDIUM_HALF_RANGE_MIN_CAPITALS = 1,							-- Same as above but for capital ships. NOTE: overriden to 0 if the total number of ships in the task force is less than four.
	INTEL_LEVEL_LOW_STRENGTH_ESTIMATE_HALF_RANGE_PERCENTAGE = 20,					-- Integer representing the maximum offset of the estimated enemy strength to the original, in percentage (divided by 100 in code). For spotting level "low".
	INTEL_LEVEL_MEDIUM_STRENGTH_ESTIMATE_HALF_RANGE_PERCENTAGE = 10,					-- Same as above for spotting level "medium"
	BASE_SPOTTING_SPEED = 0.0,										-- daily base spotting speed
	BASE_ESCAPE_SPEED = 0.045,										-- daily base escape speed (gained as percentagE)
	SPEED_TO_ESCAPE_SPEED = 0.95,									-- ratio to converstion from ship speed to escape speed (divided by hundred)
	ESCAPE_SPEED_PER_COMBAT_DAY = 0.01,								-- daily increase in escape speed during combat duration
	MAX_ESCAPE_SPEED_FROM_COMBAT_DURATION = 0.15,					-- max escape speed that will be gained from combat duration
	ESCAPE_SPEED_SUB_BASE = 0.08,									-- subs get faster escape speed. gets replaced by hidden version below if hidden
	ESCAPE_SPEED_HIDDEN_SUB = 0.18,									-- hidden subs get faster escape speed

	SUB_DETECTION_CHANCE_BASE = 5,									-- to start spotting a submarine, a dice is rolled and checked if it succeeds this percentage. if not, that enemy sub force won't be spotted on this tick
	SUB_DETECTION_CHANCE_BASE_SPOTTING_EFFECT = 0.5,				-- effect of base spotting for initial spotting of pure submarine forces. this along with next value is added together and rolled against a random to start spotting
	SUB_DETECTION_CHANCE_SPOTTING_SPEED_EFFECT = 2.0,				-- effect of spotting speed for initial spotting of pure submarine forces. this along with prev value is added together and rolled against a random to start spotting
	SUB_DETECTION_CHANCE_BASE_SPOTTING_POW_EFFECT = 1.5,			-- effect of spotting speed will be powered by this for initial spotting of pure submarine forces. this along with prev value is added together and rolled against a random to start spotting

	BASE_CONVOY_SPOTTING_SPEED = 0.0,								-- daily base spotting speed against convoys
	BASE_UNIT_TRANSFER_SPOTTING_SPEED = 0.0,						-- daily base spotting speed against unit trans
	BASE_NAVAL_INVASION_SPOTTING_SPEED = 0.0,						-- daily base spotting speed against unit transfers

	CONVOY_SPOTTING_SPEED_MULT = 1.0,								-- spotting speed mult against convoys
	UNIT_TRANSFER_SPOTTING_SPEED_MULT = 5.0,						-- spotting speed mult against unit transfers
	NAVAL_INVASION_SPOTTING_SPEED_MULT = 10.0,						-- spotting speed mult against naval invasion armies


	CONVOY_DETECTION_CHANCE_BASE = 4.12,							-- regular convoy base chance detection percentage (if this fails, no detection is done on that tick)
	BASE_SPOTTING_EFFECT_FOR_INITIAL_CONVOY_SPOTTING = 0.05,		-- effect of base convoy spotting for initial spotting of regular convoys. this along with next value is added together and rolled a random  once for every convoy to check for spotting
	SPOTTING_SPEED_EFFECT_FOR_INITIAL_CONVOY_SPOTTING = 0.50,		-- effect of convoy spotting speed for initial spotting of regular convoys. this along with prev value is added together and rolled a random once for every convoy to check for spotting
	SPOTTING_MOD_FOR_CONVOY_COUNT = 0.2,							-- a modifier for scaling the count of convoys on a parabolic curve (counvoy_count ^ SPOTTING_MOD_FOR_CONVOY_COUNT)

	UNIT_TRANSFER_DETECTION_CHANCE_BASE = 8.0,							-- unit transfer and naval invasion base chance detection percentage (if this fails, no detection is done on that tick)
	BASE_SPOTTING_EFFECT_FOR_INITIAL_UNIT_TRANSFER_SPOTTING = 2.4,		-- same as BASE_SPOTTING_EFFECT_FOR_INITIAL_CONVOY_SPOTTING, but for naval transfer convoys
	SPOTTING_SPEED_EFFECT_FOR_INITIAL_UNIT_TRANSFER_SPOTTING = 0.12,	-- same as SPOTTING_SPEED_EFFECT_FOR_INITIAL_CONVOY_SPOTTING, but for naval transfer convoys
	BASE_SPOTTING_EFFECT_FOR_INITIAL_NAVAL_INVASION_SPOTTING = 2.4,		-- same as BASE_SPOTTING_EFFECT_FOR_INITIAL_CONVOY_SPOTTING, but for naval invasion convoys
	SPOTTING_SPEED_EFFECT_FOR_INITIAL_NAVAL_INVASION_SPOTTING = 0.12,	-- same as SPOTTING_SPEED_EFFECT_FOR_INITIAL_CONVOY_SPOTTING, but for naval invasion convoys

	MIN_GUN_COOLDOWN = 0.1,											-- minimum cooldown for a gun
	BASE_GUN_COOLDOWNS = { -- number of hours for a gun to be ready after shooting
		1.0,	-- big guns
		4.0,	-- torpedoes
		1.0,	-- small guns
	},

	BASE_JOIN_COMBAT_HOURS						= 2,				-- the taskforces that wants to join existing combats will wait for at least this amount
	LOW_ORG_FACTOR_ON_JOIN_COMBAT_DURATION		= 4.0,				-- low org of the ships will be factored in when a taskforce wants to join combat

	BASE_POSITIONING												= 1.0,	-- base value for positioning

	RELATIVE_SURFACE_DETECTION_TO_POSITIONING_FACTOR				= 0.01,	-- multiples the surface detection difference between two sides. the side with higher detection will get a bonus of this value
	MAX_POSITIONING_BONUS_FROM_SURFACE_DETECTION					= 0.0,  -- will clamp the bonus that you get from detection

	HIGHER_SHIP_RATIO_POSITIONING_PENALTY_FACTOR					= 0.25, -- if one side has more ships than the other, that side will get this penalty for each +100% ship ratio it has
	MAX_POSITIONING_PENALTY_FROM_HIGHER_SHIP_RATIO					= 0.75,  -- maximum penalty to get from larger fleets
	MIN_SHIPS_FOR_HIGHER_SHIP_RATIO_PENALTY                         = 0,    -- the minimum fleet size in ships that a fleet must be before having the large fleet penalty applied to them

	HIGHER_CARRIER_RATIO_POSITIONING_PENALTY_FACTOR					= 0.2;  -- penalty if other side has stronger carrier air force
	MAX_CARRIER_RATIO_POSITIONING_PENALTY_FACTOR 					= 0.2;  -- max penalty from stronger carrier air force

	POSITIONING_PENALTY_FOR_SHIPS_JOINED_COMBAT_AFTER_IT_STARTS		= 0.01, -- each ship that joins the combat will have this penalty to be added into positioning
	MAX_POSITIONING_PENALTY_FOR_NEWLY_JOINED_SHIPS 					= 0.25,  -- the accumulated penalty from new ships will be clamped to this value
	POSITIONING_PENALTY_HOURLY_DECAY_FOR_NEWLY_JOINED_SHIPS			= 0.05,-- the accumulated penalty from new ships will decay hourly by this value

	DAMAGE_PENALTY_ON_MINIMUM_POSITIONING 							= 0.5,	-- damage penalty at 0% positioning
	SCREENING_EFFICIENCY_PENALTY_ON_MINIMUM_POSITIONING				= 0.5,  -- screening efficiency (screen to capital ratio) at 0% positioning
	AA_EFFICIENCY_PENALTY_ON_MINIMUM_POSITIONING					= 0.7,  -- AA penalty at 0% positioning
	SUBMARINE_REVEAL_ON_MINIMUM_POSITIONING                         = 2.0,  -- submarine reveal change on 0% positioning

	SHIP_TO_FLEET_ANTI_AIR_RATIO									= 0.25,	-- total sum of fleet's anti air will be multiplied with this ratio and added to calculations anti-air of individual ships while air damage reduction

	ANTI_AIR_POW_ON_INCOMING_AIR_DAMAGE								= 0.225,	-- received air damage is calculated using following: 1 - ( (ship_anti_air + fleet_anti_air * SHIP_TO_FLEET_ANTI_AIR_RATIO )^ANTI_AIR_POW_ON_INCOMING_AIR_DAMAGE ) * ANTI_AIR_MULT_ON_INCOMING_AIR_DAMAGE
	ANTI_AIR_MULT_ON_INCOMING_AIR_DAMAGE							= 0.18,

	MAX_ANTI_AIR_REDUCTION_EFFECT_ON_INCOMING_AIR_DAMAGE 			= 0.75,	-- damage reduction for incoming air attacks is clamped to this value at maximum.

	CHANCE_TO_DAMAGE_PART_ON_CRITICAL_HIT							= 0.1,	-- the game will roll between 0-1 and will damage a random part if below this val on naval critical hits
	CHANCE_TO_DAMAGE_PART_ON_CRITICAL_HIT_FROM_AIR					= 0.1,	-- the game will roll between 0-1 and will damage a random part if below this val on air critical hits

	SCREEN_RATIO_FOR_FULL_SCREENING_FOR_CAPITALS 					= 3.0,	-- this screen ratio to num capital/carriers is needed for full screening beyond screen line
	SCREEN_RATIO_FOR_FULL_SCREENING_FOR_CONVOYS 					= 0.5,	-- this screen ratio to num convoys is needed for full screening beyond screen line
	CAPITAL_RATIO_FOR_FULL_SCREENING_FOR_CARRIERS 					= 1.0,  -- this capital ratio to num carriers is needed for full screening beyond screen line
	CAPITAL_RATIO_FOR_FULL_SCREENING_FOR_CONVOYS 					= 0.25,  -- this capital ratio to num convoys is needed for full screening beyond screen line

	TASK_FORCE_ROLE_TO_INSIGNIA = {								-- define the index of the insignia to use for a task force designed for a specific role
		6,	-- Role undefined
		15,	-- Wolfpack
		22,	-- Carrier task force
		26,	-- Surface action group
		16,	-- Mine layers
		17,	-- Mine sweepers
		29,	-- Patrol task force
		1,	-- Convoy escort
	},

	-- NOTE: you can see the effect of changing the values down below by running the command tfria with a task force selected
	MIN_SHIP_COUNT_FOR_TASK_FORCE_ROLE_ASSIGNMENT = 4,					-- define the minimum number of ship that should be in a task force for it to be considered a patrol or an escort task force (used to the insignia assignment, see TASK_FORCE_ROLE_TO_INSIGNIA)
	SURFACE_DETECTION_STAT_FOR_SHIP_TO_BE_PATROL = 16,					-- amount of surface detection required for a ship to be considered as part of a patrol task force
	DEPTH_CHARGE_STAT_FOR_SHIP_TO_BE_SUB_HUNTER = 15,					-- amount of depth charge required for a ship to be considred a sub hunter and so good for convoy escort
	SUB_DETECTION_STAT_FOR_SHIP_TO_BE_SUB_HUNTER = 2,					-- amount of sub detection required for a ship to be considered a sub hunter

	HEAVY_GUN_ATTACK_TO_SHORE_BOMBARDMENT							= 0.1,  -- heavy gun attack value is divided by this value * 100 and added to shore bombardment modifier
	LIGHT_GUN_ATTACK_TO_SHORE_BOMBARDMENT							= 0.05, -- light gun attack value is divided by this value * 100 and added to shore bombardment modifier

	GUN_HIT_PROFILES = { -- hit profiles for guns, if target ih profile is lower the gun will have lower accuracy
		80.0,	-- big guns
		100.0,	-- torpedoes
		45.0,	-- small guns
	},

	DEPTH_CHARGES_HIT_CHANCE_MULT 									= 1.1, 		-- multiplies hit chance of small guns
	DEPTH_CHARGES_DAMAGE_MULT 										= 0.7, 		-- multiplies damage of depth charges
	DEPTH_CHARGES_HIT_PROFILE 										= 100.0,	-- hit profile for depth charges

	CONVOY_HIT_PROFILE												= 85.0,  	-- convoys has this contant hit profile
	HIT_PROFILE_MULT 												= 100.0,  	-- multiplies hit profile of every ship
	HIT_PROFILE_SPEED_FACTOR										= 0.5,		-- factors speed value when determining it profile (Vis * HIT_PROFILE_MULT * Ship Hit Profile Mult)
	HIT_PROFILE_SPEED_BASE											= 20,		-- Base value added to hitprofile speed calulation

	CONVOY_RAID_MAX_REGION_TO_TASKFORCE_RATIO						= 1.5,		-- each taskforce in convoy raid mission can at most cover this many regions without losing efficiency
	CONVOY_DEFENSE_MAX_CONVOY_TO_SHIP_RATIO							= 12.0,		-- each ship in convoy defense mission can at most cover this many convoys without losing efficiency
	CONVOY_DEFENSE_MAX_REGION_TO_TASKFORCE_RATIO					= 5.0,		-- each taskforce in convoy defense mission can at most cover this many regions without losing efficiency

	MINE_SWEEPING_SUPREMACY_EFFICIENCY_MAX_REGION_TO_TASKFORCE_RATIO = 1.0,		-- mine missions will get lower supremacies if they are assigned more regions than this
	MINE_PLANTING_SUPREMACY_EFFICIENCY_MAX_REGION_TO_TASKFORCE_RATIO = 1.0,		-- mine missions will get lower supremacies if they are assigned more regions than this

	EFFICIENCY_TO_JOIN_COMBAT_RATIO_PENALTY							= 1.0,		-- at lower efficiencies less ships will be able to join combat
	EFFICIENCY_TO_TIME_TO_JOIN_COMBAT_PENALTY 						= 100.0,	-- at lower efficiencies less time to join combat hour will be increased

	COORDINATION_EFFECT_ON_CONVOY_RAID_EFFICIENCY					= 1.5,		-- coordination will increase the number of areas you can cover in convoy raid
	COORDINATION_EFFECT_ON_CONVOY_DEFENSE_EFFICIENCY				= 1.5,		-- coordination will increase the number of convoys you can cover in convoy defense

	COORDINATION_EFFECT_ON_TIME_TO_JOIN_COMBAT						= 1.0,		-- coordination will reduce the time to join combat penalties
	COORDINATION_EFFECT_ON_MINE_LAYING_SPEED 						= 0.5,      -- affect of coordination modifier in mine laying speed
	COORDINATION_EFFECT_ON_MINE_SWEEPING_SPEED 						= 0.5,      -- affect of coordination modifier in mine sweeping speed
	COORDINATION_EFFECT_ON_PATROL_SPOTTING 							= 1.0,		-- affect of coordination modifier in spotting speed

	COORDINATION_EFFECT_ON_MINE_SWEEPING_SUPREMACY_EFFICIENCY		= 1.0,      -- mine missions supremacy can be buffed by coordination
	COORDINATION_EFFECT_ON_MINE_PLANTING_SUPREMACY_EFFICIENCY		= 1.0,      -- mine missions supremacy can be buffed by coordination

	MISSION_EFFICIENCY_POW_FACTOR									= 1.7,		-- mission efficiencies will be powered up by this to further penalize low efficiencies

	NAVAL_COMBAT_SUB_DETECTION_FACTOR                               = 1.0,      -- balance value for sub detection in combat by ships
	SUBMARINE_HIDE_TIMEOUT 											= 20,		-- Amount of in-game-hours that takes the submarine (with position unrevealed), to hide.
	SUBMARINE_REVEALED_TIMEOUT 										= 16,		-- Amount of in-game-hours that makes the submarine visible if it is on the defender side.
	SUBMARINE_REVEAL_BASE_CHANCE 									= 11,		-- Base factor for submarine detection. It's modified by the difference of a spotter's submarines detection vs submarine visibility. Use this variable for game balancing. setting this too low will cause bad spotting issues.
	SUBMARINE_REVEAL_POW 											= 3.0,		-- A scaling factor that is applied to the reveal chance in order to make large differences in detection vs visibility more pronounced
	SUBMARINE_BASE_TORPEDO_REVEAL_CHANCE 							= 0.035,		-- Chance of a submarine being revealed when it fires. 1.0 is 100%. this chance is then multiplied with modifier created by comparing firer's visibiility and target's detection

	MAX_NUM_HOURS_TO_WAIT_AT_ALLY_DOCKYARDS_FOR_REPAIRS 			= 48,		-- taskforces will wait at most this amount of hours in ally bases for repairs before switching to another base for repairs

	COMBAT_RESULT_PRIORITY_THRESHOLDS = { 										-- the game will use this thresholds to define importance of a naval combat result. it will use the highest level that has higher threshold than the amount of production lost in combat
		0, 		-- low (keep at zero)
		4000,   -- medium
		20000,  -- high
	},
	COMBAT_RESULT_PRIORITY_DAY_TO_LIVE = { 										-- the game will delete the combat results after some duration depending on its importance
		7,
		30,
		120,
	},
	NAVAL_ACCIDENTS_DAYS_TO_LIVE = 120,

	NAVAL_MINE_DANGER_RATIOS = {
		0.1,		-- not owned
		0.5,		-- near controlled
		1.0,		-- near owned
		1.0,		-- controlled
		3.0,		-- owned
	},
	NAVAL_MINE_DANGER_TRIGGER_MIN = 0.0,
	NAVAL_MINE_DANGER_TRIGGER_MAX = 2.0,

	NAVAL_CONVOY_DANGER_RATIOS = {
		0.10,		-- not owned
		0.10,		-- near controlled
		0.10,		-- near owned
		0.15,		-- controlled
		0.15,		-- owned
	},
	NAVAL_CONVOY_DANGER_TRIGGER_MIN = 0.0,
	NAVAL_CONVOY_DANGER_TRIGGER_MAX = 100.0,

	-- those two work together in the formula f(x) = Y(x/(x+X)) where Y is MAX and X is SLOPE
	NAVAL_COMBAT_AIR_SUB_DETECTION_MAX = 10.0,
	NAVAL_COMBAT_AIR_SUB_DETECTION_SLOPE = 10.0,						-- lower means sharper curve (ramps up very fast, then flatten out very fast). Must be >0

	NAVAL_COMBAT_AIR_SUB_DETECTION_EXTERNAL_FACTOR = 1.0,					-- Factor applied to the stats of external air planes
	NAVAL_COMBAT_AIR_SUB_DETECTION_INTERNAL_EFFICIENCY_FACTOR = 1.0,			-- Factor of Carrier's sortie efficiency on the stats bellow
	NAVAL_COMBAT_AIR_AGILITY_TO_SUB_DETECTION = 0.0,					-- Factor to apply to the agility of air planes active in a naval combat to deduce their contibution to sub detection
	NAVAL_COMBAT_AIR_STRIKE_ATTACK_TO_SUB_DETECTION = 0.0,					-- Same, but for strike attack (aka naval attack)
	NAVAL_COMBAT_AIR_STRIKE_TARGETING_TO_SUB_DETECTION = 0.0,				-- Same, but for strike targeting (aka naval targeting)
	NAVAL_COMBAT_AIR_MAX_SPEED_TO_SUB_DETECTION = 0.0,					-- Same, but for Max Speed
	NAVAL_COMBAT_AIR_PLANE_COUNT_TO_SUB_DETECTION = 1.0,					-- Factor applied to the number of active plane in a naval combat to deduce their contribution to sub detection
	NAVAL_COMBAT_AIR_SUB_DETECTION_DECAY_RATE = 1.0,					-- Factor to decay the value of sub detection contributed by planes on the last hour. Note: the maximum value between the decayed value and the newly computed one is taken into account. A decay rate of 1 means that nothing is carried over, the previous value is zerod out. A decay rate of 0 means that the previous value is carried over as is.
	NAVAL_COMBAT_AIR_SUB_DETECTION_FACTOR = 0.0,						-- A global factor that applies after all others, right before the sub detection contributed by plane is added to the global sub detection of a combatant

	NAVAL_COMBAT_AIR_SUB_TARGET_SCORE = 10,                             -- scoring for target picking for planes inside naval combat, one define per ship typ
	NAVAL_COMBAT_AIR_CAPITAL_TARGET_SCORE = 50,
	NAVAL_COMBAT_AIR_CARRIER_TARGET_SCORE = 200,
	NAVAL_COMBAT_AIR_CONVOY_TARGET_SCORE = 1.0,
	NAVAL_COMBAT_AIR_STRENGTH_TARGET_SCORE = 5,                         -- how much score factor from low health (scales between 0->this number)
	NAVAL_COMBAT_AIR_LOW_AA_TARGET_SCORE = 5,                           -- how much score factor from low AA guns (scales between 0->this number)

	NEW_NAVY_LEADER_LEVEL_CHANCES = {									-- chances for new navy leaders to start at a given level
		0.95, -- 95% for level one
		0.05  -- 5% for level two
		      -- 0% for level three to ten
	},

	NAVY_PIERCING_THRESHOLDS = {					-- Our piercing / their armor must be this value to deal damage fraction equal to the index in the array below [higher number = higher penetration]. If armor is 0, 1.00 will be returned.
		2.00,
		1.00,
		0.75,
		0.50,
		0.10,
		0.00 --there isn't much point setting this higher than 0
	},

	NAVY_PIERCING_THRESHOLD_CRITICAL_VALUES = {	-- 0 armor will always receive maximum damage (so add overmatching at your own peril). the system expects at least 2 values, with no upper limit.
		2.00,
		1.00,
		0.75,
		0.50,
		0.10,
		0.00 -- For criticals, you could reduce crit chance unlike damage in army combat, but we do not for now.
	},

	NAVY_PIERCING_THRESHOLD_DAMAGE_VALUES = {	-- 0 armor will always receive maximum damage (so add overmatching at your own peril). the system expects at least 2 values, with no upper limit.
		1.00,
		1.00,
		0.70,
		0.40,
		0.30,
		0.10 --
	},

	-- all of these NEED to be the same size!!!!

},

NNavy = { --海军
	-- 和平会议
	WAR_SCORE_GAIN_FOR_SUNK_SHIP_MANPOWER_FACTOR = 0.004,			-- 每击沉一艘船，根据该船死亡人数获得战争分数
	WAR_SCORE_GAIN_FOR_SUNK_SHIP_PRODUCTION_COST_FACTOR = 0.020,	-- 每击沉一艘船，根据该船工业成本获得战争分数
	WAR_SCORE_GAIN_FOR_SUNK_CONVOY = 0.08,							-- 每击沉一支运输船队获得的战争分数
	WAR_SCORE_DECAY_FOR_BUILT_CONVOY = 0.01,  						-- 敌方每建造一支新运输船，扣减的战争分数
	PEACE_ACTION_TRANSFER_NAVY_EXPERIENCE_RETAINED = 0.25,			-- 在和平会议中转移海军后保留的经验百分比

	-- 运输船优先级 开始
	NAVAL_INVASION_PRIORITY = 1,									-- 海军入侵默认运输船优先级
	NAVAL_TRANSFER_PRIORITY = 1,									-- 海军运输默认优先级
	SUPPLY_PRIORITY = 2,											-- 海上补给默认优先级
	RESOURCE_LENDLEASE_PRIORITY = 3,								-- 租借物资出口默认优先级
	RESOURCE_EXPORT_PRIORITY = 4,									-- 贸易出口默认优先级
	RESOURCE_ORIGIN_PRIORITY = 5,									-- 内部资源运输默认优先级
	RESOURCE_PURCHASE_PRIORITY = 6,									-- 装备采购出口默认优先级
	UNDERWAY_REPLENISHMENT_PRIORITY = 7,							-- 海上补给任务默认优先级
	-- 运输船优先级 结束

	ADMIRAL_TASKFORCE_CAP = 10,										-- 提督指挥超过此数量的特遣舰队后将受到惩罚

	DETECTION_CHANCE_MULT_BASE = 0.1,								-- 基础探测几率倍率
	DETECTION_CHANCE_MULT_RADAR_BONUS = 0.1,						-- 雷达提供的探测几率加成
	DETECTION_CHANCE_MULT_AIR_SUPERIORITY_BONUS = 0.25,			-- 制空权提供的探测几率加成

	MAX_CAPITALS_PER_AUTO_TASK_FORCE = 5,							-- 自动编组时，水面打击群最多包含的主力舰数量
	MAX_SUBMARINES_PER_AUTO_TASK_FORCE = 30,						-- 自动编组时，狼群最多包含的潜艇数量
	BEST_CAPITALS_TO_CARRIER_RATIO = 1,							-- 自动编组航母特遣舰队时的主力舰/航母比例
	BEST_CAPITALS_TO_SCREENS_RATIO = 0.25, 							-- 海战中用于创建火力交换群的主力舰/屏卫舰比例
	COMBAT_BASE_HIT_CHANCE = 0.1,									-- 基础命中几率

	COMBAT_MIN_HIT_CHANCE = 0.05,									-- 最低命中几率
	COMBAT_EVASION_TO_HIT_CHANCE = 0.007,							-- 每点闪避降低的命中几率（例如闪避10点则降低25%）
	COMBAT_EVASION_TO_HIT_CHANCE_TORPEDO_MULT = 10.0,				-- 鱼雷攻击时，闪避对命中的影响放大10倍
	MIN_HIT_PROFILE_MULT = 0.0,										-- 命中惩罚的最小值
	COMBAT_LOW_ORG_HIT_CHANCE_PENALTY = -0.5,						-- 组织度极低时的命中惩罚
	COMBAT_LOW_MANPOWER_HIT_CHANCE_PENALTY = -0.25,					-- 人力极低时的命中惩罚
	COMBAT_DAMAGE_RANDOMNESS = 0.5,									-- 伤害随机波动范围（±50%）
	COMBAT_TORPEDO_CRITICAL_CHANCE = 0.1,							-- 鱼雷暴击几率
	COMBAT_TORPEDO_CRITICAL_DAMAGE_MULT = 2.0,						-- 鱼雷暴击伤害倍率

	COMBAT_DAMAGE_TO_STR_FACTOR = 0.6,								-- 伤害转化为舰船强度的倍率（用于平衡）
	COMBAT_DAMAGE_TO_ORG_FACTOR = 1.0,								-- 伤害转化为组织度的倍率（用于平衡）

	NAVY_MAX_XP = 100,
	COMBAT_ON_THE_WAY_INIT_DISTANCE_BALANCE = 0.25, 				-- 平衡“途中”舰船初始抵达距离的参数
	COMBAT_CHASE_RESIGNATION_HOURS = 8,								-- 追击敌舰前至少持续的最短时间，避免战斗瞬间结束

	COMBAT_MAX_GROUPS = 1,											-- 最大火力交换群数量
	COMBAT_MIN_DURATION = 8,										-- 战斗开始后可撤退的最小持续时间
	COMBAT_INITIAL_DURATION = 6,									-- 战斗初始阶段时长（用于突袭等修正）
	COMBAT_RETREAT_DECISION_CHANCE = 0.22, 							-- 撤退决策的随机延迟概率
	COMBAT_DETECTED_CONVOYS_FROM_SURFACE_DETECTION_STAT = 0.1,		-- 每点水面侦测值可发现航线中x%的运输船
	COMBAT_BASE_CRITICAL_CHANCE = 0.05,								-- 基础暴击几率
	COMBAT_CRITICAL_DAMAGE_MULT = 5.0,								-- 暴击伤害倍率
	COMBAT_ARMOR_PIERCING_CRITICAL_BONUS = 1.0,						-- 穿甲高于目标装甲时的暴击加成
	REPAIR_AND_RETURN_PRIO_LOW = 0.2,								-- 强度低于此比例时自动返港维修（低优先级）
	REPAIR_AND_RETURN_PRIO_MEDIUM = 0.5,							-- 同上（中优先级）
	REPAIR_AND_RETURN_PRIO_HIGH = 0.9,								-- 同上（高优先级）
	REPAIR_AND_RETURN_PRIO_LOW_COMBAT = 0.6,						-- 战斗中强度低于此比例时返港（低优先级）
	REPAIR_AND_RETURN_PRIO_MEDIUM_COMBAT = 0.3,						-- 同上（中优先级）
	REPAIR_AND_RETURN_PRIO_HIGH_COMBAT = 0.1,						-- 同上（高优先级）
	REPAIR_AND_RETURN_AMOUNT_SHIPS_LOW = 0.2,						-- 每次派遣维修的受损舰船比例（低）
	REPAIR_AND_RETURN_AMOUNT_SHIPS_MEDIUM = 0.4,					-- 同上（中）
	REPAIR_AND_RETURN_AMOUNT_SHIPS_HIGH = 0.8,						-- 同上（高）
	REPAIR_AND_RETURN_UNIT_DYING_STR = 0.2,							-- 单舰强度低于此值视为“濒死”，优先维修
	EXPERIENCE_LOSS_FACTOR = 1.00,                 					-- 人力损失时老兵死亡比例
	NAVY_EXPENSIVE_IC = 5500,										-- 舰队IC超过此值视为“昂贵”，触发低强度警报
	MISSION_MAX_REGIONS = 0,										-- 海军任务最大区域限制（0为无限制）
	CONVOY_EFFICIENCY_LOSS_MODIFIER = 1.25,							-- 运输船损失对效率的影响倍率
	CONVOY_EFFICIENCY_REGAIN_AFTER_DAYS = 7,						-- 无运输船被击沉后，效率开始恢复的天数
	CONVOY_EFFICIENCY_REGAIN_BASE_SPEED = 0.04,						-- 每日效率恢复速度
	CONVOY_EFFICIENCY_MIN_VALUE = 0.05,								-- 最低效率下限（避免降至0%）
	CONVOY_ROUTE_SIZE_CONVOY_SCALE = 0.5,                           -- 航线规模对效率的影响倍率
	ANTI_AIR_TARGETTING_TO_CHANCE = 0.2,							-- 防空瞄准与飞机闪避平均值转化为被击中概率的平衡参数
	ANTI_AIR_ATTACK_TO_AMOUNT = 0.01,								-- 防空攻击值转化为飞机被击毁概率的平衡参数
	CONVOY_SINKING_SPILLOVER = 0.5,                 				-- 受损运输船在战斗结束时沉没的概率倍率
	UNIT_EXPERIENCE_PER_COMBAT_HOUR = 10,
	UNIT_EXPERIENCE_SCALE = 1,
	EXPERIENCE_FACTOR_CONVOY_ATTACK = 0.04,
	EXPERIENCE_FACTOR_NON_CARRIER_GAIN = 0.04,						-- 非航母舰船战斗经验获取倍率
	EXPERIENCE_FACTOR_CARRIER_GAIN = 0.08,							-- 航母舰船战斗经验获取倍率
	FIELD_EXPERIENCE_SCALE = 0.075,
	FIELD_EXPERIENCE_MAX_PER_DAY = 50,								-- 每日最大经验获取上限
	LEADER_EXPERIENCE_SCALE = 1.0,
	BATTLE_NAME_VP_FACTOR = 100,									-- 海战命名权重计算：VP值*此系数/距离
	BATTLE_NAME_VP_CUTOFF = 1.0,									-- 若权重低于此值，使用区域名称
	AMPHIBIOUS_LANDING_PENALTY = -0.5,								-- 两栖登陆惩罚
	AMPHIBIOUS_INVADE_SPEED_BASE = 0.5, 							-- 两栖入侵每小时进度
	AMPHIBIOUS_INVADE_MOVEMENT_COST = 24.0, 						-- 两栖入侵总移动进度消耗
	AMPHIBIOUS_INVADE_ATTACK_LOW = 0.2, 							-- 登陆初期攻击修正（插值）
	AMPHIBIOUS_INVADE_ATTACK_HIGH = 1.0,
	AMPHIBIOUS_INVADE_DEFEND_LOW = 1.5, 							-- 登陆初期防御修正（插值）
	AMPHIBIOUS_INVADE_DEFEND_HIGH = 1.0,
	AMPHIBIOUS_INVADE_LANDING_PENALTY_DECREASE = 3.5, 				-- 运输船科技对登陆惩罚的减免倍率
	BASE_CARRIER_SORTIE_EFFICIENCY = 0.5,							-- 航母默认放飞效率
	CONVOY_ATTACK_BASE_FACTOR = 0.15,                               -- 基础运输船队截获比例
	NAVAL_SPEED_MODIFIER = 0.1,	                    				-- 基础海军速度修正
	NAVAL_RANGE_TO_INGAME_DISTANCE = 0.12,							-- 舰船航程参数与游戏内距离换算比例
	NAVAL_INVASION_PREPARE_HOURS = 168,								-- 准备入侵的基础小时数
	NAVAL_COMBAT_RESULT_TIMEOUT_YEARS = 2,							-- 海战结果保存年限（超时清除）
	CONVOY_LOSS_HISTORY_TIMEOUT_MONTHS = 24,						-- 运输船损失记录保存月数
	NAVAL_TRANSFER_BASE_SPEED = 6,                                  -- 海上运输基础速度
	NAVAL_TRANSFER_BASE_NAVAL_DIST_ADD = 100,						-- 海军运输路径选择时，海上距离额外成本
	NAVAL_TRANSFER_BASE_NAVAL_DIST_MULT = 20,						-- 海军运输路径选择时，海上距离倍率
	NAVAL_SUPREMACY_CAN_INVADE = 0.5,								-- 执行入侵所需的海军优势比例
	CARRIER_STACK_PENALTY = 4,										-- 航母战斗效率最优数量为4艘，超过后受惩罚
	CARRIER_STACK_PENALTY_EFFECT = 0.2,								-- 每超一艘航母，放飞飞机数量减少20%
	SHORE_BOMBARDMENT_CAP = 0.25,									-- 岸轰最大加成上限
	ANTI_AIR_TARGETING = 0.9,                                       -- 舰船防空瞄准效率
	MIN_TRACTED_ASSIST_DAMAGE_RATIO = 0.05,							-- 最低计入助攻的伤害比例
	SUPPLY_NEED_FACTOR = 4,										    -- 补给需求倍率
	DECRYPTION_SPOTTING_BONUS = 0.2,
	DISBAND_MANPOWER_LOSS = 0.0,
	MANPOWER_LOSS_RATIO_ON_SUNK = 0.5,								-- 舰船沉没时人力损失比例
	MANPOWER_LOSS_RATIO_ON_STR_LOSS = 0.5,							-- 舰船强度损失时人力损失比例
	MIN_MANPOWER_RATIO_TO_DROP = 0.1,								-- 舰船人力不会低于此比例
	DAILY_MANPOWER_GAIN_RATIO = 0.05,								-- 非战斗舰船每日人力恢复比例
	PRIDE_OF_THE_FLEET_UNASSIGN_COST = 100,							-- 更换旗舰所需政治点数
	PRIDE_OF_THE_FLEET_LOST_TEMP_MODIFIER_DURATION = 30,			-- 失去旗舰后临时修正持续时间
	XP_GAIN_FACTOR = 1.0,	   			   							-- 海军经验获取倍率

	NAVAL_TRANSFER_DAMAGE_REDUCTION = 0.25,							-- 海军运输单位受空袭伤害减免
	CARRIER_ONLY_COMBAT_ACTIVATE_TIME = 0,							-- 航母参战时间（小时）
	CAPITAL_ONLY_COMBAT_ACTIVATE_TIME = 6,                          -- 主力舰参战时间（小时）
	ALL_SHIPS_ACTIVATE_TIME = 8,                                    -- 全体舰船参战时间（小时）

	MINIMUM_SHIP_SPEED = 1.0,										-- 舰船最低速度限制

	REPAIR_SPLIT_TASKFORCE_SIZE = 5,								-- 无空闲船坞时，按此规模拆分支队维修
	NAVY_REPAIR_BASE_SEARCH_SCORE_PER_SHIP_WAITING_EXTRA_SHIP = 5,  -- 船坞超载时每多一艘船扣分
	NAVY_REPAIR_BASE_SEARCH_SCORE_PER_SLOT = 1.0,					-- 每空闲船坞位加分
	NAVY_REPAIR_BASE_SEARCH_BOOST_FOR_SAME_COUNTRY = 5,				-- 本国船坞额外加分

	CONVOY_SPOTTING_COOLDOWN = 0.3,  -- 占航行时间比例
	CONVOY_SPOTTING_COOLDOWN_MIN = 36, -- 最小冷却时间（小时）
	CONVOY_SPOTTING_COOLDOWN_MAX = 168, -- 最大冷却时间（小时）
	CONVOY_SPOTTING_COOLDOWN_MIN_FROM_EFFICIENCY = 15, -- 效率修正后最低冷却时间

	MISSION_FUEL_COSTS = {  -- 各任务燃料消耗倍率
		0.0, -- 待命（仅移动时消耗HOLD_MISSION_MOVEMENT_COST）
		1.0, -- 巡逻
		1.0, -- 打击舰队（仅移动和战斗时消耗）
		1.0, -- 袭击运输船
		1.0, -- 护航运输船
		1.0, -- 布雷
		1.0, -- 扫雷
		0.6, -- 训练
		0.0, -- 预备舰队（仅移动时消耗）
		1.0, -- 入侵支援（仅炮击和护航时消耗）
	},

	HOLD_MISSION_MOVEMENT_COST = 1.0,								-- 待命任务移动时燃料消耗倍率
	ON_BASE_FUEL_COST = 0.0,										-- 停泊港口时燃料消耗倍率
	IN_COMBAT_FUEL_COST = 2.0,										-- 战斗时燃料消耗倍率
	TRAINING_FUEL_COST_FOR_ESCORT_SHIPS = 0.15,						-- 已满经验但仍训练舰船燃料消耗倍率

	MAX_FUEL_FLOW_MULT = 2.0, -- 舰船最大燃料流量倍率
	FUEL_COST_MULT = 0.10, -- 全体海军任务燃料消耗倍率

	OUT_OF_FUEL_SPEED_FACTOR = -0.75, -- 缺油时速度惩罚
	OUT_OF_FUEL_RANGE_FACTOR = -0.75, -- 缺油时航程惩罚
	OUT_OF_FUEL_ATTACK_FACTOR = -0.5, -- 缺油时攻击惩罚
	OUT_OF_FUEL_TORPEDO_FACTOR = -0.8, -- 缺油时鱼雷惩罚

	UNDERWAY_REPLENISHMENT_RANGE_FACTOR = 0.4,			-- 海上补给激活时航程加成（0.4=+40%）
	UNDERWAY_REPLENISHMENT_CONVOY_COST_PER_FUEL = 0.28,	-- 海上补给每最大日耗油所需运输船数（向上取整）

	MISSION_SPREADS = {  -- 任务初始分散度（1=无舰参战）
		0.0, -- 待命
		0.0, -- 巡逻
		0.0, -- 打击舰队
		0.0, -- 袭击运输船
		0.0, -- 护航运输船
		0.7, -- 布雷
		0.7, -- 扫雷
		0.5, -- 训练
		0.0, -- 预备舰队
		0.0, -- 入侵支援
	},
	MISSION_DEFAULT_SPREAD_BASE = 1.0, -- 任务分散度基础倍率（越高初始参战舰越少）

	AGGRESSION_SETTINGS_VALUES = { -- 攻击性设定（用于AI决策）
		0,		-- 不交战
		0.5,	-- 低
		0.9,	-- 中
		2.0,	-- 高
		10000,	-- 死神化身！
	},

	AGGRESION_MULTIPLIER_FOR_COMBAT = 1.2,				-- 战斗中AI攻击性倍率

	AGGRESSION_ARMOR_EFFICIENCY_MULTIPLIER = 1.0,		-- 装甲/穿甲比对攻击性评分的影响倍率
	AGGRESSION_MIN_ARMOR_EFFICIENCY = 0.5,              -- 装甲效率下限
	AGGRESSION_MAX_ARMOR_EFFICIENCY = 1.5,              -- 装甲效率上限

	AGGRESSION_LIGHT_GUN_EFFICIENCY_ON_LIGHT_SHIPS = 1.0, -- 轻炮对轻型舰评分倍率
	AGGRESSION_HEAVY_GUN_EFFICIENCY_ON_LIGHT_SHIPS = 0.25,-- 重炮对轻型舰评分倍率
	AGGRESSION_TORPEDO_EFFICIENCY_ON_LIGHT_SHIPS = 0.1,   -- 鱼雷对轻型舰评分倍率

	AGGRESSION_LIGHT_GUN_EFFICIENCY_ON_HEAVY_SHIPS = 0.1, -- 轻炮对重型舰评分倍率
	AGGRESSION_HEAVY_GUN_EFFICIENCY_ON_HEAVY_SHIPS = 1.0, -- 重炮对重型舰评分倍率
	AGGRESSION_TORPEDO_EFFICIENCY_ON_HEAVY_SHIPS = 1.1,   -- 鱼雷对重型舰评分倍率

	AGGRESSION_CONVOY_STRENGTH_FACTOR = 0.3,			  -- 运输船在战斗中强度评分惩罚

	SUBMARINE_ESCAPE_RATIOS = { -- 潜艇遇敌时逃脱比例
		1000,     -- 不交战
		15,   -- 低
		3.0,   -- 中
		1.0,   -- 高
		0.1,   -- 死神化身！
	},

	MIN_REPAIR_FOR_JOINING_COMBATS = { -- 未修复到以下比例不加入战斗
		0.0,	-- 不修复
		0.5,	-- 低
		0.7,	-- 中
		0.9,	-- 高
	},

	ORG_COST_WHILE_MOVING = { -- 移动时组织度消耗
		0.3, -- 待命
		0.2, -- 巡逻
		0.25, -- 打击舰队
		0.2, -- 袭击运输船
		0.2, -- 护航运输船
		0.2, -- 布雷
		0.2, -- 扫雷
		0.2, -- 训练
		0.3, -- 预备舰队
		0.2, -- 入侵支援
	},

	ORG_COST_WHILE_MOVING_IN_MISSION_ZONE = { -- 在任务区域内移动时组织度消耗
		0.0, -- 待命
		0.0, -- 巡逻
		0.0, -- 打击舰队
		0.0, -- 袭击运输船
		0.0, -- 护航运输船
		0.0, -- 布雷
		0.0, -- 扫雷
		0.0, -- 训练
		0.0, -- 预备舰队
		0.0, -- 入侵支援
	},

	MAX_ORG_ON_MANUAL_MOVE = 0.66,	-- 手动移动时组织度上限比例
	MIN_ORG_ON_MANUAL_MOVE = 0.1,	-- 手动移动时组织度下限比例

	INITIAL_ALLOWED_DOCKYARD_RATIO_FOR_REPAIRS = 0.25,				-- 初始分配船坞维修比例

	MISSION_SUPREMACY_RATIOS = { -- 各任务制海权倍率
		0.0, -- 待命
		1.0, -- 巡逻
		1.0, -- 打击舰队
		0.5, -- 袭击运输船
		0.5, -- 护航运输船
		0.3, -- 布雷
		0.3, -- 扫雷
		0.0, -- 训练
		0.0, -- 预备舰队
		1.0, -- 入侵支援
	},

	SUPREMACY_PER_SHIP_PER_MANPOWER = 0.05,							-- 每人力提供的制海权
	SUPREMACY_PER_SHIP_PER_IC = 0.005,								-- 每IC提供的制海权
	SUPREMACY_PER_SHIP_BASE = 0,									-- 每舰基础制海权

	NAVAL_MINES_IN_REGION_MAX = 1000.0,								-- 区域最大水雷数量（抽象值）
	NAVAL_MINES_PLANTING_SPEED_MULT = 0.01,						-- 布雷速度倍率
	NAVAL_MINES_SWEEPING_SPEED_MULT = 0.009,						-- 扫雷速度倍率
	NAVAL_MINES_DECAY_AT_PEACE_TIME = 0.25,							-- 和平时期水雷自然衰减速度
	NAVAL_MINES_SWEEPERS_REDUCTION_ON_PENALTY_EFFECT = 3.3,			-- 扫雷舰降低水雷惩罚的倍率
	NAVAL_MINES_INTEL_DIFF_FACTOR = 0.5,							-- 破译优势降低水雷惩罚的倍率
	NAVAL_MINES_NAVAL_SUPREMACY_FACTOR = 1.0,						-- 水雷增加制海权的倍率

	ATTRITION_WHILE_MOVING_FACTOR = 1.5,							-- 移动时损耗倍率
	ATTRITION_DAMAGE_ORG = 0.01,					   				-- 损耗对组织度的伤害比例
	ATTRITION_DAMAGE_STR = 0.03,					   				-- 损耗对强度的伤害比例
	ATTRITION_STR_DAMAGE_CHANCE = 0.2,								-- 高强度损耗时触发强度伤害的概率

	NAVAL_ACCIDENT_CHANCE_REDUCTION_ON_POTF = 0.01,					-- 旗舰降低事故概率的比例
	NAVAL_ACCIDENT_CRITICAL_HIT_CHANCE_REDUCTION_POTF = 0.01,		-- 旗舰降低事故暴击概率的比例

	NAVAL_MINES_ACCIDENT_CRITICAL_HIT_CHANCES = 0.14,				-- 水雷事故暴击几率
	NAVAL_MINES_ACCIDENT_CRITICAL_HIT_DAMAGE_SCALE = 5.0,			-- 水雷事故暴击伤害倍率
	NAVAL_MINES_ACCIDENT_STRENGTH_LOSS = 50.0,						-- 水雷事故强度损失
	NAVAL_MINES_ACCIDENT_ORG_LOSS_FACTOR = 0.5,						-- 水雷事故组织度损失比例

	TRAINING_ACCIDENT_CHANCES = 0.02,						-- 训练事故每小时触发概率
	TRAINING_ACCIDENT_CRITICAL_HIT_CHANCES = 0.3,					-- 训练事故暴击概率
	TRAINING_ACCIDENT_CRITICAL_HIT_DAMAGE_SCALE = 4.0,				-- 训练事故暴击伤害倍率
	TRAINING_ACCIDENT_STRENGTH_LOSS = 4.0,							-- 训练事故强度损失
	TRAINING_ACCIDENT_STRENGTH_LOSS_FACTOR = 0.05,						-- 训练事故强度损失比例（基于最大强度）
	TRAINING_ACCIDENT_ORG_LOSS_FACTOR = 0.3,						-- 训练事故组织度损失比例

	ACCIDENTS_CHANCE_BALANCE_FACTOR = 0.04,							-- 全局事故概率平衡参数

	-- 公式：Min(TRAINING_MAX_DAILY_COUNTRY_EXP * 比例, TRAINING_DAILY_COUNTRY_EXP_FACTOR * (TRAINING_DAILY_COUNTRY_EXP_SHIP_RATIO_FACTOR * 训练舰数/国家舰数 + TRAINING_DAILY_COUNTRY_EXP_MANPOWER_FACTOR * 人力 + TRAINING_DAILY_COUNTRY_EXP_MANPOWER_RATIO_FACTOR * 人力/国家舰数))
	TRAINING_EXPERIENCE_FACTOR = 0.3,								-- 每舰每日训练经验（修正前）
	TRAINING_DAILY_COUNTRY_EXP_FACTOR = 0.001,						-- 国家每日海军经验倍率
	TRAINING_DAILY_COUNTRY_EXP_MANPOWER_FACTOR = 0.006,					-- 训练人力对国家经验的影响倍率
	TRAINING_DAILY_COUNTRY_EXP_MANPOWER_RATIO_FACTOR = 0.01,				-- 人力/国家舰数对国家经验的影响倍率
	TRAINING_DAILY_COUNTRY_EXP_SHIP_RATIO_FACTOR = 300.0,					-- 训练舰/国家舰数对国家经验的影响倍率
	TRAINING_MAX_DAILY_COUNTRY_EXP = 3.5,							-- 国家每日海军经验上限
	TRAINING_MIN_STRENGTH = 0.1,									-- 强度低于此值不参与训练且不受损

	TRAINING_ORG = 0.2,												-- 训练任务最大组织度比例

	BASE_SPOTTING = 1,												-- 海军基础侦察百分比
	BASE_SPOTTING_FROM_RADAR = 5,									-- 全雷达覆盖提供的侦察百分比
	NAVY_SPOTTER_DETECTION_FACTOR = 0.1,							-- 特遣舰队侦测值倍率（对数转换前）
	BASE_SPOTTING_FROM_NAVY = 10,									-- 区域内特遣舰队提供的侦察百分比
	AIR_SPOTTER_NORMALIZED_AIRWING_SIZE = 100,						-- 每架飞机贡献1/100的联队侦测值
	AIR_SPOTTER_DETECTION_FACTOR = 0.025,							-- 空军联队侦测值倍率（对数转换前）
	BASE_SPOTTING_FROM_AIR = 20,									-- 区域内空军提供的侦察百分比
	BASE_SPOTTING_FROM_DECRYPTION = 10,								-- 破译提供的侦察百分比（可为负）
	MIN_SPOTTING_PROGRESS = 0.01,									-- 每小时最小侦察进度（百分比）
	AIR_MISSION_SPOTTING_FACTORS = {								-- 各空军任务对侦察贡献的倍率
		0.50, -- 制空
		0, -- 近距支援
		0.25, -- 拦截
		0, -- 战略轰炸
		0.50, -- 海军轰炸
		0, -- 核打击
		0, -- 空降
		0.25, -- 神风特攻
		0, -- 港口打击
		0, -- 攻击后勤
		0, -- 空中补给
		0, -- 训练
		0.25, -- 布雷
		0.50, -- 扫雷
		1.00, -- 侦察
		1.50, -- 海军巡逻
	},

	MIN_HOURS_TO_SHUFFLE_NEWLY_ASSIGNED_PATROLS = 7 * 24,			-- 巡逻区域不足时，重新分配任务的最小间隔
	SPOTTING_ENEMY_SPOTTING_MULTIPLIER_FOR_RUNNING_AWAY = 0.80,		-- 逃跑时敌方侦察值倍率模拟
	SPOTTING_MULTIPLIER_FOR_SURFACE = 1.0,							-- 水面侦察值倍率
	SPOTTING_MULTIPLIER_FOR_SUB = 1.0,								-- 水下侦察值倍率
	SPOTTING_SPEED_MULT_FOR_RUNNING_AWAY = 0.5,						-- 逃跑时降低敌方侦察速度的倍率
	SPOTTING_SPEED_MULT_FOR_CATCHING_UP = 0.2,						-- 追击时增加侦察速度的倍率
	SPOTTING_MISSION_DETECTION_THRESHOLD_LOW = 10.0,					-- 低侦察等级显示粗略信息的阈值
	SPOTTING_MISSION_DETECTION_THRESHOLD_MEDIUM = 70.0,					-- 中侦察等级显示较详细信息的阈值（100%显示精确信息）
	NAVY_VISIBILITY_BONUS_ON_RETURN_FOR_REPAIR = 0.9,				-- 重伤返航舰队隐蔽性倍率（0.9=降低10%）
	VISIBILITY_MULTIPLIER_FOR_SPOTTING = 0.1,						-- 可见性对侦察的影响倍率
	INTEL_LEVEL_LOW_HALF_RANGE_PERCENTAGE = 10,							-- 低情报等级数值误差百分比上限
	INTEL_LEVEL_MEDIUM_HALF_RANGE_PERCENTAGE = 5,							-- 中情报等级数值误差百分比上限
	INTEL_LEVEL_LOW_HALF_RANGE_MIN_SHIPS = 3,							-- 低情报等级最小舰船数误差
	INTEL_LEVEL_LOW_HALF_RANGE_MIN_CAPITALS = 1,							-- 低情报等级最小主力舰数误差
	INTEL_LEVEL_MEDIUM_HALF_RANGE_MIN_SHIPS = 1,							-- 中情报等级最小舰船数误差
	INTEL_LEVEL_MEDIUM_HALF_RANGE_MIN_CAPITALS = 1,							-- 中情报等级最小主力舰数误差（舰队小于4艘时强制为0）
	INTEL_LEVEL_LOW_STRENGTH_ESTIMATE_HALF_RANGE_PERCENTAGE = 20,					-- 低情报强度估算误差百分比
	INTEL_LEVEL_MEDIUM_STRENGTH_ESTIMATE_HALF_RANGE_PERCENTAGE = 10,					-- 中情报强度估算误差百分比
	BASE_SPOTTING_SPEED = 0.0,										-- 每日基础侦察速度
	BASE_ESCAPE_SPEED = 0.045,										-- 每日基础脱战速度（百分比）
	SPEED_TO_ESCAPE_SPEED = 0.95,									-- 舰船速度转化为脱战速度的比例
	ESCAPE_SPEED_PER_COMBAT_DAY = 0.01,								-- 战斗期间每日脱战速度增量
	MAX_ESCAPE_SPEED_FROM_COMBAT_DURATION = 0.15,					-- 战斗持续时间提供的最大脱战速度
	ESCAPE_SPEED_SUB_BASE = 0.08,									-- 潜艇基础脱战速度
	ESCAPE_SPEED_HIDDEN_SUB = 0.18,									-- 隐藏潜艇脱战速度

	SUB_DETECTION_CHANCE_BASE = 5,									-- 初始发现潜艇的基础概率（%）
	SUB_DETECTION_CHANCE_BASE_SPOTTING_EFFECT = 0.5,				-- 基础侦察对纯潜艇部队的初始发现影响
	SUB_DETECTION_CHANCE_SPOTTING_SPEED_EFFECT = 2.0,				-- 侦察速度对纯潜艇部队的初始发现影响
	SUB_DETECTION_CHANCE_BASE_SPOTTING_POW_EFFECT = 1.5,			-- 侦察速度对纯潜艇部队发现的幂次影响

	BASE_CONVOY_SPOTTING_SPEED = 0.0,								-- 基础运输船侦察速度
	BASE_UNIT_TRANSFER_SPOTTING_SPEED = 0.0,						-- 基础单位运输侦察速度
	BASE_NAVAL_INVASION_SPOTTING_SPEED = 0.0,						-- 基础入侵运输侦察速度

	CONVOY_SPOTTING_SPEED_MULT = 1.0,								-- 运输船侦察速度倍率
	UNIT_TRANSFER_SPOTTING_SPEED_MULT = 5.0,						-- 单位运输侦察速度倍率
	NAVAL_INVASION_SPOTTING_SPEED_MULT = 10.0,						-- 入侵运输侦察速度倍率

	CONVOY_DETECTION_CHANCE_BASE = 4.12,							-- 运输船基础发现概率（%）
	BASE_SPOTTING_EFFECT_FOR_INITIAL_CONVOY_SPOTTING = 0.05,		-- 基础侦察对初始发现运输船的影响
	SPOTTING_SPEED_EFFECT_FOR_INITIAL_CONVOY_SPOTTING = 0.50,		-- 侦察速度对初始发现运输船的影响
	SPOTTING_MOD_FOR_CONVOY_COUNT = 0.2,							-- 运输船数量对发现的抛物线修正（count^0.2）

	UNIT_TRANSFER_DETECTION_CHANCE_BASE = 8.0,							-- 单位运输/入侵基础发现概率（%）
	BASE_SPOTTING_EFFECT_FOR_INITIAL_UNIT_TRANSFER_SPOTTING = 2.4,		-- 同上，但用于单位运输
	SPOTTING_SPEED_EFFECT_FOR_INITIAL_UNIT_TRANSFER_SPOTTING = 0.12,	-- 同上，但用于单位运输
	BASE_SPOTTING_EFFECT_FOR_INITIAL_NAVAL_INVASION_SPOTTING = 2.4,		-- 同上，但用于入侵运输
	SPOTTING_SPEED_EFFECT_FOR_INITIAL_NAVAL_INVASION_SPOTTING = 0.12,	-- 同上，但用于入侵运输

	MIN_GUN_COOLDOWN = 0.1,											-- 武器最小冷却时间
	BASE_GUN_COOLDOWNS = { -- 武器射击后冷却时间（小时）
		1.0,	-- 主炮
		4.0,	-- 鱼雷
		1.0,	-- 副炮
	},

	BASE_JOIN_COMBAT_HOURS						= 2,				-- 增援舰队至少等待时间（小时）
	LOW_ORG_FACTOR_ON_JOIN_COMBAT_DURATION		= 4.0,				-- 低组织度对增援等待时间的影响倍率

	BASE_POSITIONING												= 1.0,	-- 基础阵位值

	RELATIVE_SURFACE_DETECTION_TO_POSITIONING_FACTOR				= 0.01,	-- 水面侦察差对阵位的加成倍率
	MAX_POSITIONING_BONUS_FROM_SURFACE_DETECTION					= 0.0,  -- 侦察提供的最大阵位加成

	HIGHER_SHIP_RATIO_POSITIONING_PENALTY_FACTOR					= 0.25, -- 舰船数量优势每100%的惩罚倍率
	MAX_POSITIONING_PENALTY_FROM_HIGHER_SHIP_RATIO					= 0.75,  -- 数量优势最大惩罚
	MIN_SHIPS_FOR_HIGHER_SHIP_RATIO_PENALTY                         = 0,    -- 触发数量惩罚的最小舰队规模

	HIGHER_CARRIER_RATIO_POSITIONING_PENALTY_FACTOR					= 0.2;  -- 航母优势惩罚倍率
	MAX_CARRIER_RATIO_POSITIONING_PENALTY_FACTOR 					= 0.2;  -- 航母优势最大惩罚

	POSITIONING_PENALTY_FOR_SHIPS_JOINED_COMBAT_AFTER_IT_STARTS		= 0.01, -- 每艘战后加入舰船的阵位惩罚
	MAX_POSITIONING_PENALTY_FOR_NEWLY_JOINED_SHIPS 					= 0.25,  -- 新增舰船最大阵位惩罚
	POSITIONING_PENALTY_HOURLY_DECAY_FOR_NEWLY_JOINED_SHIPS			= 0.05,-- 新增舰船阵位惩罚每小时衰减

	DAMAGE_PENALTY_ON_MINIMUM_POSITIONING 							= 0.5,	-- 0%阵位时的伤害惩罚
	SCREENING_EFFICIENCY_PENALTY_ON_MINIMUM_POSITIONING				= 0.5,  -- 0%阵位时的屏卫效率惩罚
	AA_EFFICIENCY_PENALTY_ON_MINIMUM_POSITIONING					= 0.7,  -- 0%阵位时的防空效率惩罚
	SUBMARINE_REVEAL_ON_MINIMUM_POSITIONING                         = 2.0,  -- 0%阵位时的潜艇暴露倍率

	SHIP_TO_FLEET_ANTI_AIR_RATIO									= 0.25,	-- 舰队总防空值按此比例计入单舰防空计算

	ANTI_AIR_POW_ON_INCOMING_AIR_DAMAGE								= 0.225,	-- 防空伤害减免公式：1 - ((单舰防空 + 舰队防空*0.25)^0.225)*0.18
	ANTI_AIR_MULT_ON_INCOMING_AIR_DAMAGE							= 0.18,

	MAX_ANTI_AIR_REDUCTION_EFFECT_ON_INCOMING_AIR_DAMAGE 			= 0.75,	-- 防空伤害减免上限（75%）

	CHANCE_TO_DAMAGE_PART_ON_CRITICAL_HIT							= 0.1,	-- 海军暴击时部件损坏概率
	CHANCE_TO_DAMAGE_PART_ON_CRITICAL_HIT_FROM_AIR					= 0.1,	-- 空袭暴击时部件损坏概率

	SCREEN_RATIO_FOR_FULL_SCREENING_FOR_CAPITALS 					= 3.0,	-- 每艘主力舰需3艘屏卫舰实现完全屏卫
	SCREEN_RATIO_FOR_FULL_SCREENING_FOR_CONVOYS 					= 0.5,	-- 每支运输船需0.5艘屏卫舰实现完全屏卫
	CAPITAL_RATIO_FOR_FULL_SCREENING_FOR_CARRIERS 					= 1.0,  -- 每艘航母需1艘主力舰实现完全屏卫
	CAPITAL_RATIO_FOR_FULL_SCREENING_FOR_CONVOYS 					= 0.25,  -- 每支运输船需0.25艘主力舰实现完全屏卫

	TASK_FORCE_ROLE_TO_INSIGNIA = {								-- 特遣舰队角色对应的图标索引
		6,	-- 未定义角色
		15,	-- 狼群
		22,	-- 航母特遣舰队
		26,	-- 水面打击群
		16,	-- 布雷舰队
		17,	-- 扫雷舰队
		29,	-- 巡逻舰队
		1,	-- 护航舰队
	},

	MIN_SHIP_COUNT_FOR_TASK_FORCE_ROLE_ASSIGNMENT = 4,					-- 特遣舰队最小舰船数（用于图标分配）
	SURFACE_DETECTION_STAT_FOR_SHIP_TO_BE_PATROL = 16,					-- 舰船需达到此水面侦测值才视为巡逻舰
	DEPTH_CHARGE_STAT_FOR_SHIP_TO_BE_SUB_HUNTER = 15,					-- 舰船需达到此深水炸弹值才视为反潜舰
	SUB_DETECTION_STAT_FOR_SHIP_TO_BE_SUB_HUNTER = 2,					-- 舰船需达到此潜艇侦测值才视为反潜舰

	HEAVY_GUN_ATTACK_TO_SHORE_BOMBARDMENT							= 0.1,  -- 主炮攻击值/10/100=岸轰加成
	LIGHT_GUN_ATTACK_TO_SHORE_BOMBARDMENT							= 0.05, -- 副炮攻击值/20/100=岸轰加成

	GUN_HIT_PROFILES = { -- 武器命中剖面（数值越低越难命中）
		80.0,	-- 主炮
		100.0,	-- 鱼雷
		45.0,	-- 副炮
	},

	DEPTH_CHARGES_HIT_CHANCE_MULT 									= 1.1, 		-- 深水炸弹命中倍率
	DEPTH_CHARGES_DAMAGE_MULT 										= 0.7, 		-- 深水炸弹伤害倍率
	DEPTH_CHARGES_HIT_PROFILE 										= 100.0,	-- 深水炸弹命中剖面

	CONVOY_HIT_PROFILE												= 85.0,  	-- 运输船固定命中剖面
	HIT_PROFILE_MULT 												= 100.0,  	-- 全体命中剖面倍率
	HIT_PROFILE_SPEED_FACTOR										= 0.5,		-- 速度对命中剖面的影响倍率
	HIT_PROFILE_SPEED_BASE											= 20,		-- 速度计算基础值

	CONVOY_RAID_MAX_REGION_TO_TASKFORCE_RATIO						= 1.5,		-- 每支袭击舰队最大覆盖区域数
	CONVOY_DEFENSE_MAX_CONVOY_TO_SHIP_RATIO							= 12.0,		-- 每艘护航舰最大保护运输船数
	CONVOY_DEFENSE_MAX_REGION_TO_TASKFORCE_RATIO					= 5.0,		-- 每支护航舰队最大覆盖区域数

	MINE_SWEEPING_SUPREMACY_EFFICIENCY_MAX_REGION_TO_TASKFORCE_RATIO = 1.0,		-- 扫雷任务超区域时制海权效率降低
	MINE_PLANTING_SUPREMACY_EFFICIENCY_MAX_REGION_TO_TASKFORCE_RATIO = 1.0,		-- 布雷任务超区域时制海权效率降低

	EFFICIENCY_TO_JOIN_COMBAT_RATIO_PENALTY							= 1.0,		-- 低效率时参战舰船比例惩罚
	EFFICIENCY_TO_TIME_TO_JOIN_COMBAT_PENALTY 						= 100.0,	-- 低效率时增援时间惩罚

	COORDINATION_EFFECT_ON_CONVOY_RAID_EFFICIENCY					= 1.5,		-- 协同提高袭击任务覆盖区域
	COORDINATION_EFFECT_ON_CONVOY_DEFENSE_EFFICIENCY				= 1.5,		-- 协同提高护航任务保护船数

	COORDINATION_EFFECT_ON_TIME_TO_JOIN_COMBAT						= 1.0,		-- 协同降低增援时间惩罚
	COORDINATION_EFFECT_ON_MINE_LAYING_SPEED 						= 0.5,      -- 协同对布雷速度的影响
	COORDINATION_EFFECT_ON_MINE_SWEEPING_SPEED 						= 0.5,      -- 协同对扫雷速度的影响
	COORDINATION_EFFECT_ON_PATROL_SPOTTING 							= 1.0,		-- 协同对巡逻侦察的影响

	COORDINATION_EFFECT_ON_MINE_SWEEPING_SUPREMACY_EFFICIENCY		= 1.0,      -- 协同对扫雷制海权的影响
	COORDINATION_EFFECT_ON_MINE_PLANTING_SUPREMACY_EFFICIENCY		= 1.0,      -- 协同对布雷制海权的影响

	MISSION_EFFICIENCY_POW_FACTOR									= 1.7,		-- 任务效率惩罚指数（越高对低效率惩罚越重）

	NAVAL_COMBAT_SUB_DETECTION_FACTOR                               = 1.0,      -- 海战中潜艇侦测平衡倍率
	SUBMARINE_HIDE_TIMEOUT 											= 20,		-- 潜艇隐藏所需小时数
	SUBMARINE_REVEALED_TIMEOUT 										= 16,		-- 潜艇暴露持续时间（小时）
	SUBMARINE_REVEAL_BASE_CHANCE 									= 11,		-- 潜艇发现基础概率（平衡参数）
	SUBMARINE_REVEAL_POW 											= 3.0,		-- 侦测/隐蔽差值的指数放大
	SUBMARINE_BASE_TORPEDO_REVEAL_CHANCE 							= 0.035,		-- 鱼雷攻击暴露概率（基于隐蔽与侦测差值）

	MAX_NUM_HOURS_TO_WAIT_AT_ALLY_DOCKYARDS_FOR_REPAIRS 			= 48,		-- 在盟友港口等待维修的最长时间（小时）

	COMBAT_RESULT_PRIORITY_THRESHOLDS = { 										-- 海战结果重要性阈值（基于生产损失）
		0, 		-- 低（保持0）
		4000,   -- 中
		20000,  -- 高
	},
	COMBAT_RESULT_PRIORITY_DAY_TO_LIVE = { 										-- 海战结果保存天数（按重要性）
		7,
		30,
		120,
	},
	NAVAL_ACCIDENTS_DAYS_TO_LIVE = 120,

	NAVAL_MINE_DANGER_RATIOS = { -- 水雷危险等级
		0.1,		-- 非己方
		0.5,		-- 靠近控制区
		1.0,		-- 靠近己方
		1.0,		-- 控制区
		3.0,		-- 己方
	},
	NAVAL_MINE_DANGER_TRIGGER_MIN = 0.0,
	NAVAL_MINE_DANGER_TRIGGER_MAX = 2.0,

	NAVAL_CONVOY_DANGER_RATIOS = { -- 运输船危险等级
		0.10,		-- 非己方
		0.10,		-- 靠近控制区
		0.10,		-- 靠近己方
		0.15,		-- 控制区
		0.15,		-- 己方
	},
	NAVAL_CONVOY_DANGER_TRIGGER_MIN = 0.0,
	NAVAL_CONVOY_DANGER_TRIGGER_MAX = 100.0,

	-- 以下两项共同决定曲线：f(x) = Y*(x/(x+X))，Y为最大值，X为斜率
	NAVAL_COMBAT_AIR_SUB_DETECTION_MAX = 10.0,
	NAVAL_COMBAT_AIR_SUB_DETECTION_SLOPE = 10.0,						-- 值越低曲线越陡峭（必须>0）

	NAVAL_COMBAT_AIR_SUB_DETECTION_EXTERNAL_FACTOR = 1.0,					-- 外部飞机侦测倍率
	NAVAL_COMBAT_AIR_SUB_DETECTION_INTERNAL_EFFICIENCY_FACTOR = 1.0,			-- 航母放飞效率对侦测的影响
	NAVAL_COMBAT_AIR_AGILITY_TO_SUB_DETECTION = 0.0,					-- 飞机机动对潜艇侦测的贡献（未启用）
	NAVAL_COMBAT_AIR_STRIKE_ATTACK_TO_SUB_DETECTION = 0.0,					-- 飞机攻击对潜艇侦测的贡献（未启用）
	NAVAL_COMBAT_AIR_STRIKE_TARGETING_TO_SUB_DETECTION = 0.0,				-- 飞机瞄准对潜艇侦测的贡献（未启用）
	NAVAL_COMBAT_AIR_MAX_SPEED_TO_SUB_DETECTION = 0.0,					-- 飞机速度对潜艇侦测的贡献（未启用）
	NAVAL_COMBAT_AIR_PLANE_COUNT_TO_SUB_DETECTION = 1.0,					-- 飞机数量对潜艇侦测的贡献倍率
	NAVAL_COMBAT_AIR_SUB_DETECTION_DECAY_RATE = 1.0,					-- 飞机侦测贡献每小时衰减倍率（1=完全衰减）
	NAVAL_COMBAT_AIR_SUB_DETECTION_FACTOR = 0.0,						-- 全局飞机侦测最终倍率（未启用）

	NAVAL_COMBAT_AIR_SUB_TARGET_SCORE = 10,                             -- 飞机目标选择评分：潜艇
	NAVAL_COMBAT_AIR_CAPITAL_TARGET_SCORE = 50,
	NAVAL_COMBAT_AIR_CARRIER_TARGET_SCORE = 200,
	NAVAL_COMBAT_AIR_CONVOY_TARGET_SCORE = 1.0,
	NAVAL_COMBAT_AIR_STRENGTH_TARGET_SCORE = 5,                         -- 低血量目标评分加成
	NAVAL_COMBAT_AIR_LOW_AA_TARGET_SCORE = 5,                           -- 低防空目标评分加成

	NEW_NAVY_LEADER_LEVEL_CHANCES = {									-- 新海军将领初始等级概率
		0.95, -- 95%为1级
		0.05  -- 5%为2级
		      -- 3-10级概率为0%
	},

	NAVY_PIERCING_THRESHOLDS = {					-- 穿甲/装甲比值阈值（对应下方伤害比例）
		2.00,
		1.00,
		0.75,
		0.50,
		0.10,
		0.00 -- 装甲为0时始终全额伤害
	},

	NAVY_PIERCING_THRESHOLD_CRITICAL_VALUES = {	-- 暴击阈值（与穿甲阈值对应）
		2.00,
		1.00,
		0.75,
		0.50,
		0.10,
		0.00 -- 目前暴击不随穿甲变化
	},

	NAVY_PIERCING_THRESHOLD_DAMAGE_VALUES = {	-- 伤害比例（与穿甲阈值对应）
		1.00,
		1.00,
		0.70,
		0.40,
		0.30,
		0.10
	},

	-- 以上三项必须等长！！

},