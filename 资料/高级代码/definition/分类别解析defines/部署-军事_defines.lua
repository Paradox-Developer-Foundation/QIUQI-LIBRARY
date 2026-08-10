NDeployment = {
	BASE_DEPLOYMENT_TRAINING = 1,		-- Base training done each day during deployment.
},

NMilitary = {
	COMBAT_VALUE_ORG_IMPORTANCE = 1,		-- Multiplier on TotalOrganisation when determining the combat value of a division
	COMBAT_VALUE_STR_IMPORTANCE = 1,		-- Multiplier on TotalStrength when determining the combat value of a division

	SOFT_ATTACK_TARGETING_FACTOR = 1.0,		-- How much we care about potential soft attacks when evaluating priority combat target
	HARD_ATTACK_TARGETING_FACTOR = 1.2,		-- How much we care about potential hard attacks when evaluating priority combat target

	CASUALTIES_WS_P_PENALTY_DIVISOR = 200,							--Divisor for casualties WS penalty
	CASUALTIES_WS_A_PENALTY_DIVISOR = 600,							--Divisor for casualties WS penalty

	PIERCING_THRESHOLDS = {					-- Our piercing / their armor must be this value to deal damage fraction equal to the index in the array below [higher number = higher penetration]. If armor is 0, 1.00 will be returned.
		1.00,
		0.75,
		0.50,
		0.00, --there isn't much point setting this higher than 0
	},
	PIERCING_THRESHOLD_DAMAGE_VALUES = {	-- 0 armor will always receive maximum damage (so add overmatching at your own peril). the system expects at least 2 values, with no upper limit.
		1.00,
		0.80,
		0.65,
		0.50,
	},

	DIVISIONAL_COMMANDER_TRAIT_XP_REQUIREMENT = 400.0,	--Get a trait if any valid options & xp gained >= this
	NUM_DAYS_FOR_OPERATION_ENTRY = 60,					--Number of days that a unit must have been on a particular active order instance to receive a history entry.
	MAX_LEADERS_TO_SHOW = 50,							--Max officers to show in field officers list, sorted by field EXP. Divisions with awardable entries will potentially supercede this limit
	BASE_FEMALE_DIVISIONAL_COMMANDER_CHANCE = 0,		--Chance to receive a female divisonal commander. This is set to zero in the base game, as we do not have generic female portraits for many graphical culture groups.
														--this expects a value between 0 and 1 and is added to by female_divisional_commander_chance. If you don't have female generic portraits defined, you -will- get silhouettes.

	DIVISIONAL_COMMANDER_RANK_XP_THRESHOLD = { 		-- XP thresholds for divisional commander ranks. [TAG]_DIVISION_EXPERIENCE_TITLE_ARMY_EXPERIENCE_[array index]
		0,
		100.0,
		200.0,
		400.0,
		800.0,
	},

	USE_MULTIPLICATIVE_ORG_LOSS_WHEN_MOVING = true, -- whether to apply org_loss_when_moving modifiers additively or multiplicatively (hardcoded multiplicative pre-2021)
	HOURLY_ORG_MOVEMENT_IMPACT = -0.2,		-- how much org is lost every hour while moving an army.
	ZERO_ORG_MOVEMENT_MODIFIER = -0.8,		-- speed impact at 0 org.
	INFRA_ORG_IMPACT = 0.5,				-- scale factor of infra on org regain.
	ENGAGEMENT_WIDTH_PER_WIDTH = 2.0,	-- how much enemy combat width we are allowed to engage per width of our own

	INFRASTRUCTURE_MOVEMENT_SPEED_IMPACT = -0.05,	-- speed penalty per infrastucture below maximum.

	VPS_FOR_HISTORY_ENTRY = 3,					-- Minimum VPs required to receive an entry in divisional history
	VPS_FOR_HIGH_HISTORY_ENTRY = 8,				-- VPs required for high-level history entry
	ENTRIES_TO_CHECK_FOR_DUPLICATE = 2,			-- Max number of history entries to check back to see if we're being awarded the same entry
	COST_INCREASE_PER_ACTIVE_MEDAL = 0.25,		-- Additional cost factor per active medal
	MAX_ENTRY_ELISION_COUNT = 4,				-- If we do the same type of thing consecutively, each entry will stack locations up to this number
	GENERATE_AI_DIV_COMMAND_HISTORY_ENTRIES = true,	--Should we generate history entries for the AI (may cause savegame bloat)
	FIELD_EXPERIENCE_ON_DIVISION_MULT = 0.04,	-- Multiply field experience gained by this, when applying to divisional commander
	MAX_FIELD_EXPERIENCE_ON_DIVISION = 8000,	-- Max experience that can be gained on divisional commanders
	FIELD_EXPERIENCE_ON_DIVISION_PER_MEDAL_MULT = 0.1,	--Multiply officer field experience gain by this * number of division medals on application
	HISTORY_OPERATION_RANDOM_MAX = 24,			-- max random int to roll when determining whether to grant an awardable entry for operations. 1/N chances.
	CASUALTY_COUNT_FOR_HISTORY_ENTRY = 40000,	-- number of received casualties to receive a history entry (one only)
	FIELD_OFFICER_PROMOTION_PENALTY = 0.25,		--Amount of division experience lost when promoting a commander (reduced by modifiers)

	HISTORICAL_ORDER_NAME_EXHAUSTION = false,	-- Do historically chosen order instances exhaust their case names? If false ie, Operation Barbarossa will appear for any orders fulfilling the conditions for Germany

	WAR_SCORE_LOSSES_RATIO = 0.5,								-- war score gained for every 1000 casualties
	WAR_SCORE_LOSSES_MULT_IF_CAPITULATED = 0.25, 				-- factor applied to war score gained from casualties if capitulated
	WAR_SCORE_STRATEGIC_BOMBING_FACTOR = 0.02,  				-- war score gained for every damage made to enemy's building with strategic bombing
	WAR_SCORE_STRAT_BOMBING_DECAY_PER_CIVILIAN_FACTORY = 0.10,	-- monthly war score deducted from strategic bombing for every civilian factory in service on the bombed enemy side
	WAR_SCORE_AIR_IC_LOSS_FACTOR = 0.08,						-- war score gained for every IC of damage done to an enemy's air mission
	WAR_SCORE_LAND_DAMAGE_FACTOR = 0.1,          				-- war score gained for every strengh damage done to an enemy's army
	WAR_SCORE_ATTACKER_AND_WINNER_FACTOR = 1.2,					-- factor applied to war score gained for strength damage done when being the attacker and the winner
	WAR_SCORE_LAND_IC_LOSS_FACTOR = 0.08,         				-- war score gained for every IC damage done to an enemy's army
	WAR_SCORE_PROVINCE_FACTOR = 4.0,							-- war score gained when capturing a province for the first time, multiplied by province's worth
	WAR_SCORE_LEND_LEASE_GIVEN_IC_FACTOR = 0.003,  				-- war score gained for every IC of lend lease sent to allies
	WAR_SCORE_LEND_LEASE_GIVEN_FUEL_FACTOR = 0.003,  			-- war score gained for every 100 units of fuel lend lease sent to allies
	WAR_SCORE_LEND_LEASE_RECEIVED_IC_FACTOR = 0.002,  			-- war score deducted for every IC of lend lease received from allies
	WAR_SCORE_LEND_LEASE_RECEIVED_FUEL_FACTOR = 0.002, 		-- war score deducted for every 100 units of fuel lend lease received from allies

	CORPS_COMMANDER_DIVISIONS_CAP = 24,			-- how many divisions a corps commander is limited to. 0 = inf, < 0 = blocked
	DIVISION_SIZE_FOR_XP = 8,                   -- how many battalions should a division have to count as a full divisions when calculating XP stuff
	CORPS_COMMANDER_ARMIES_CAP = -1,			-- how many armies a corps commander is limited to. 0 = inf, < 0 = blocked
	FIELD_MARSHAL_DIVISIONS_CAP = 24,			-- how many divisions a field marshall is limited to. 0 = inf, < 0 = blocked
	FIELD_MARSHAL_ARMIES_CAP = 5,				-- how many armies a field marshall is limited to. 0 = inf, < 0 = blocked

	UNIT_LEADER_GENERATION_CAPITAL_CONTINENT_FACTOR = 100, --Integer factor to multiply manpower.

	RECON_SKILL_IMPACT = 5, -- how many skillpoints is a recon advantage worth when picking a tactic.

	MAX_DIVISION_BRIGADE_WIDTH = 5,			-- Max width of regiments in division designer.
	MAX_DIVISION_BRIGADE_HEIGHT = 5,		-- Max height of regiments in division designer.
	MIN_DIVISION_BRIGADE_HEIGHT = 4,		-- Min height of regiments in division designer.
	MAX_DIVISION_SUPPORT_WIDTH = 1,			-- Max width of support in division designer.
	MAX_DIVISION_SUPPORT_HEIGHT = 5,		-- Max height of support in division designer.

	BASE_DIVISION_BRIGADE_GROUP_COST = 20, 	--Base cost to unlock a regiment slot,
	BASE_DIVISION_BRIGADE_CHANGE_COST = 5,	--Base cost to change a regiment column.
	BASE_DIVISION_SUPPORT_SLOT_COST = 10, 	--Base cost to unlock a support slot

	MAX_ARMY_EXPERIENCE = 500,			--Max army experience a country can store
	MAX_NAVY_EXPERIENCE = 500,			--Max navy experience a country can store
	MAX_AIR_EXPERIENCE = 500,				--Max air experience a country can store

	COMBAT_MINIMUM_TIME = 4,			-- Shortest time possible for a combat in hours
	SPOTTING_QUALITY_DROP_HOURS = 4, 	-- Each X hours the intel quality drops after unit was spotted.
	LEADER_GROUP_MAX_SIZE = 1000, --5,			-- Max slots for leader groups.

	MIN_SUPPLY_CONSUMPTION = 0.05,					-- minimum value of supply consumption that a unit can get

	LAND_COMBAT_ORG_DICE_SIZE = 4,                 -- nr of damage dice
	LAND_COMBAT_STR_DICE_SIZE = 2,                 -- nr of damage dice
	LAND_COMBAT_STR_DAMAGE_MODIFIER = 0.060,       -- global damage modifier... but some equipment is returned at end of battles see : EQUIPMENT_COMBAT_LOSS_FACTOR
	LAND_COMBAT_ORG_DAMAGE_MODIFIER = 0.053,       -- global damage modifier
	LAND_AIR_COMBAT_STR_DAMAGE_MODIFIER = 0.032,    -- air global damage modifier
	LAND_AIR_COMBAT_ORG_DAMAGE_MODIFIER = 0.032,    -- global damage modifier
	LAND_AIR_COMBAT_MAX_PLANES_PER_ENEMY_WIDTH = 3, -- how many CAS/TAC can enter a combat depending on enemy width there
	LAND_COMBAT_STR_ARMOR_ON_SOFT_DICE_SIZE = 2,   -- extra damage dice if our armor outclasses enemy
	LAND_COMBAT_ORG_ARMOR_ON_SOFT_DICE_SIZE = 6,   -- extra damage dice if our armor outclasses enemy
	LAND_COMBAT_STR_ARMOR_DEFLECTION_FACTOR = 0.5, -- damage reduction if armor outclassing enemy
	LAND_COMBAT_ORG_ARMOR_DEFLECTION_FACTOR = 0.5, -- damage reduction if armor outclassing enemy
	LAND_COMBAT_COLLATERAL_FORT_FACTOR = 0.005,		-- Factor to scale collateral damage to forts with.
	LAND_COMBAT_COLLATERAL_INFRA_FACTOR = 0.0022,	-- Factor to scale collateral damage to infra with.
	LAND_COMBAT_FORT_DAMAGE_CHANCE = 5,				-- chance to get a hit to damage on forts. (out of 100)
	ATTRITION_DAMAGE_ORG = 0.08,					   -- damage from attrition to Organisation
	ATTRITION_EQUIPMENT_LOSS_CHANCE = 0.1,		   -- Chance for loosing equipment when suffer attrition. Scaled up the stronger attrition is. Then scaled down by equipment reliability.
	ATTRITION_EQUIPMENT_PER_TYPE_LOSS_CHANCE = 0.1, -- Chance for loosing equipment when suffer attrition. Scaled up the stronger attrition is. Then scaled down by equipment reliability.
	ATTRITION_WHILE_MOVING_FACTOR = 1,
	RELIABILITY_ORG_REGAIN = -0.3,                 -- how much reliability affects org regain
	RELIABILITY_ORG_MOVING = -1.0,                 -- how much reliability affects org loss on moving
	RELIABILITY_WEATHER = 3.0,                     -- how much reliability is afffecting weather impact
	RELIABILTY_RECOVERY = 0.40,                     -- factor affecting how much equipment is returned "from the dead"
	BASE_CHANCE_TO_AVOID_HIT = 90,                 -- Base chance to avoid hit if defences left.
	CHANCE_TO_AVOID_HIT_AT_NO_DEF = 60,	           -- chance to avoid hit if no defences left.
	COMBAT_MOVEMENT_SPEED = 0.33,	               -- speed reduction base modifier in combat
	TACTIC_SWAP_FREQUENCEY = 12,                   -- hours between tactic swaps
	PREFERRED_TACTIC_CHARACTER_SKILL_LEVEL_REQUIRED = 5, -- Which level a field marhal or general has to be before they can pick their preferred tactic
	COUNTRY_PREFERRED_TACTIC_WEIGHT_FACTOR = 0.25,  -- extra weight multiplier for the country preferred tactic when doing weighted random
	ARMY_GENERAL_PREFERRED_TACTIC_WEIGHT_FACTOR = 0.5,   -- extra weight multiplier for the army general preferred tactic when doing weighted random
	FIELD_MARSHAL_PREFERRED_TACTIC_WEIGHT_FACTOR = 0.25, -- extra weight multiplier for the field marhsal preferred tactic when doing weighted random
	PREFERRED_TACTIC_COMMAND_POWER_COST = 20,	   -- command point cost for changing preferred tactic
	INITIATIVE_PICK_COUNTER_ADVANTAGE_FACTOR  = 0.35, -- advantage per leader level for picking a counter
	AMPHIBIOUS_INVADE_MOVEMENT_COST = 24.0,        -- total progress cost of movement while amphibious invading
	LAND_SPEED_MODIFIER = 0.05,                    -- basic speed control
	RIVER_CROSSING_PENALTY = -0.3,                 -- small river crossing
	RIVER_CROSSING_PENALTY_LARGE = -0.6,           -- large river crossing
	RIVER_CROSSING_SPEED_PENALTY = -0.25,           -- small river crossing
	RIVER_CROSSING_SPEED_PENALTY_LARGE = -0.5,     -- large river crossing
	RIVER_SMALL_START_INDEX = 0,                   -- color indices for rivers
	RIVER_SMALL_STOP_INDEX = 6,
	RIVER_LARGE_STOP_INDEX = 11,
	BASE_FORT_PENALTY = -0.15, 					   -- fort penalty
	MULTIPLE_COMBATS_PENALTY = -0.5,               -- defender penalty if attacked from multiple directions
	DIG_IN_FACTOR = 0.02,						   -- bonus factor for each dug-in level
	ARMY_LEADER_XP_GAIN_PER_UNIT_IN_COMBAT = 0.1, -- XP gain per unit in combat
	CONSTANT_XP_RATIO_FOR_MULTIPLE_LEADERS_IN_SAME_COMBAT = 0.5, -- if there are multiple leaders in same combat, each one gets thisratio + (1-thisratio)/num leaders. amount of xp each general gets scales 1 0.75 0.66 etc for 1 2 3 generals
	BASE_LEADER_TRAIT_GAIN_XP = 0.45,			   -- Base xp gain for traits per hour for armies
	MAX_NUM_TRAITS = -1,						   -- cant have more, -1 to disable
	ENEMY_AIR_SUPERIORITY_IMPACT = -0.35,          -- effect on defense due to enemy air superiorty
	ENEMY_AIR_SUPERIORITY_DEFENSE = 0.70,	       -- more AA attack will approach this amount of help (diminishing returns)
	ENEMY_AIR_SUPERIORITY_DEFENSE_STEEPNESS = 112, -- how quickly defense approaches the max impact diminishing returns curve
	ENEMY_AIR_SUPERIORITY_SPEED_IMPACT = -0.3,     -- effect on speed due to enemy air superiority

	ANTI_AIR_TARGETTING_TO_CHANCE = 0.07,			-- Balancing value to determine the chance of ground AA hitting an attacking airplane, affecting both the effective average damage done by AA to airplanes, and the reduction of damage done by airplanes due to AA support
	ANTI_AIR_ATTACK_TO_AMOUNT = 0.005,				-- Balancing value to convert equipment stat anti_air_attack to the random % value of airplanes being hit.

	ENCIRCLED_PENALTY = -0.3,                      	-- penalty when completely encircled

	UNIT_EXPERIENCE_PER_COMBAT_HOUR = 0.0001,
	UNIT_EXPERIENCE_SCALE = 1.0,
	UNIT_EXPERIENCE_PER_TRAINING_DAY = 0.0015,
	TRAINING_MAX_LEVEL = 2,
	DEPLOY_TRAINING_MAX_LEVEL = 1,
	TRAINING_EXPERIENCE_SCALE = 62.0,
	TRAINING_ORG = 0.2,
	ARMY_EXP_BASE_LEVEL = 1,
	UNIT_EXP_LEVELS = { 0.1, 0.3, 0.75, 0.9 },		-- Experience needed to progress to the next level
	FIELD_EXPERIENCE_SCALE = 0.0015,
	FIELD_EXPERIENCE_MAX_PER_DAY = 1.2,				-- Most xp you can gain per day
	EXPEDITIONARY_FIELD_EXPERIENCE_SCALE = 0.3,		-- reduction factor in Xp from expeditionary forces
	LEND_LEASE_FIELD_EXPERIENCE_SCALE = 0.0005,		-- Experience scale for lend leased equipment used in combat.
	LEADER_EXPERIENCE_SCALE = 1.0,
	SLOWEST_SPEED = 4,
	REINFORCEMENT_REQUEST_MAX_WAITING_DAYS = 14,   -- Every X days the equipment will be sent, regardless if still didn't produced all that has been requested.
	REINFORCEMENT_REQUEST_DAYS_FREQUENCY = 7,	   -- How many days must pass until we may give another reinforcement request
	EXPERIENCE_COMBAT_FACTOR = 0.25,
	UNIT_DIGIN_CAP = 5,                           -- how "deep" you can dig you can dig in until hitting max bonus
	UNIT_DIGIN_SPEED = 1,						   -- how "deep" you can dig a day.
	PARACHUTE_FAILED_EQUIPMENT_DIV = 50.0,		   -- When the transport plane was shot down, we drop unit with almost NONE equipment
	PARACHUTE_FAILED_MANPOWER_DIV = 100.0,		   -- When the transport plane was shot down, we drop unit with almost NONE manpower
	PARACHUTE_FAILED_STR_DIV = 10.0,			   -- When the transport plane was shot down, we drop unit with almost NONE strenght
	PARACHUTE_DISRUPTED_EQUIPMENT_DIV = 1.5,	   -- When the transport plane was hit, we drop unit with reduced equipment. Penalty is higher as more hits was received (and AA guns was in the state).
	PARACHUTE_DISRUPTED_MANPOWER_DIV = 1.9,	       -- When the transport plane was hit, we drop unit with reduced manpower. Penalty is higher as more hits was received (and AA guns was in the state).
	PARACHUTE_DISRUPTED_STR_DIV = 2.2,			   -- When the transport plane was hit, we drop unit with reduced strength. Penalty is higher as more hits was received (and AA guns was in the state).
	PARACHUTE_PENALTY_RANDOMNESS = 0.1,			   -- Random factor for str,manpower,eq penalties.
	PARACHUTE_DISRUPTED_AA_PENALTY = 1,            -- How much the Air defence in the state (from AA buildings level * air_defence) is scaled to affect overall disruption (equipment,manpower,str).
	PARACHUTE_COMPLETE_ORG = 0.4,				   -- Organisation value (in %) after unit being dropped, regardless if failed, disrupted, or successful.
	PARACHUTE_ORG_REGAIN_PENALTY_DURATION = 120,   -- penalty in org regain after being parachuted. Value is in hours.
	PARACHUTE_ORG_REGAIN_PENALTY_MULT = -0.8,	   -- penalty to org regain after being parachuted.
	SHIP_MORALE_TO_ORG_REGAIN_BASE = 0.2,			   -- Base org regain per hour
	BASE_NIGHT_ATTACK_PENALTY = -0.5,
	EXILE_EQUIPMENT = 1.0,						   -- Amount of equipment to keep
	EXILE_ORG = 0.0,							   -- Amount of org to keep
	EXPERIENCE_LOSS_FACTOR = 1.00,                 -- percentage of experienced solders who die when manpower is removed
	EQUIPMENT_COMBAT_LOSS_FACTOR = 0.70,	 	   -- % of equipment lost to strength ratio in combat, so some % is returned if below 1
	SUPPLY_USE_FACTOR_MOVING = 1.5,                -- Deprecated/Unused
	SUPPLY_USE_FACTOR_INACTIVE = 0.95,			   -- Deprecated/Unused
	SUPPLY_GRACE = 72,							   -- troops always carry 3 days of food and supply
	SUPPLY_GRACE_MAX_REDUCE_PER_HOUR = 2,          -- supply grace is not decreased instantly when it is buffed temporarily and buff is removed
	SUPPLY_ORG_MAX_CAP = 0.35,                     -- Max organization is factored by this if completely out of supply
	MAX_OUT_OF_SUPPLY_DAYS = 30, 				   -- how many days of shitty supply until max penalty achieved
	OUT_OF_SUPPLY_ATTRITION = 0.20,                 -- max attrition when out of supply
	OUT_OF_SUPPLY_SPEED = -0.8,                    -- max speed reduction from supply
	NON_CORE_SUPPLY_SPEED = -0.5,				   -- we are not running on our own VP supply so need to steal stuff along the way
	NON_CORE_SUPPLY_AIR_SPEED = -0.25,			   -- we are not running on our own VP supply so need to steal stuff along the way, a bit less due to air supply
	OUT_OF_SUPPLY_MORALE = -0.2,                   -- max org regain reduction from supply
	TRAINING_ATTRITION = 0.05,		  			   -- amount of extra attrition from being in training
	TRAINING_MIN_STRENGTH = 0.1,					-- if strength is less than this, the unit will pause training until it's been reinforced
	TRAINING_MAX_DAILY_COUNTRY_EXP = 0.08,			-- Maximum army XP gained per day from training
	AIR_SUPPORT_BASE = 0.25,                        -- CAS bonus factor for air support moddifier for land unit in combat
	LOW_SUPPLY = 0.99,							   -- When the supply status of an unit becomes low.
	BORDER_WAR_ATTRITION_FACTOR = 0.1,			   -- How much of borderwar balance of power makes it into attrition
	BORDER_WAR_VICTORY = 0.8,					   -- At wich border war balance of power is victory declared
	REINFORCE_CHANCE = 0.02,                 	   -- base chance to join combat from back line when empty
	SPEED_REINFORCEMENT_BONUS = 0.01,              -- chance to join combat bonus by each 100% larger than infantry base (up to 200%)
	OVERSEAS_LOSE_EQUIPMENT_FACTOR = 0.75,		   -- percentage of equipment lost disbanded overseas
	NAVAL_TRANSFER_DISBAND_MANPOWER_FACTOR = 0.5,  -- percentage of manpower returned when a naval transfering unit is disbanded
	ENCIRCLED_DISBAND_MANPOWER_FACTOR = 0.2,       -- percentage of manpower returned when an encircled unit is disbanded
	ORG_LOSS_FACTOR_ON_CONQUER = 0.2,              -- percentage of (max) org loss on takign enemy province
	LOW_ORG_FOR_ATTACK = 0.3,                      -- at what org % we start affecting speed when doign hostile moves. scales down ZERO_ORG_MOVEMENT_MODIFIER

	PLANNING_DECAY = 0.01,
	PLAYER_ORDER_PLANNING_DECAY = 0.03,				-- Amount of planning lost due to player manual order
	PLANNING_GAIN = 0.02,
	NAVAL_INVASION_PLANNING_BONUS_GAIN = 0.02,		-- Planning Bonus gain per day for naval invasions
	NAVAL_INVASION_PLANNING_BONUS_MALUS = -1,		-- Malus in percentage for the planning bonus gain for naval invasions
	PLANNING_MAX = 0.3,                           	-- can get more from techs
	CIVILWAR_ORGANIZATION_FACTOR = 0.3,			  	-- Multiplier of org for both sides when civilwar.
	PLAN_CONSIDERED_GOOD = 0.25,					-- Plan evaluations above this value are considered more or less safe
	PLAN_CONSIDERED_BAD = -0.25,					-- Plan evaluations below this value are considered unsafe
	PLAN_MIN_AUTOMATED_EMPTY_POCKET_SIZE = 2,		-- The battle plan system will only automatically attack provinces in pockets that has no resistance and are no bigger than these many provinces
	PLAN_SPREAD_ATTACK_WEIGHT = 12.0,				-- The higher the value, the less it should crowd provinces with multiple attacks.
	PLAN_NEIGHBORING_ENEMY_PROVINCE_FACTOR = 0.7,	-- When calculating the importance of provinces, it takes number of enemy provinces into account, factored by this
	PLAN_PROVINCE_BASE_IMPORTANCE = 2.0,			-- Used when calculating the calue of front and defense area provinces for the battle plan system

	PLAN_PROVINCE_LOW_VP_DEFENSE_THRESHOLD = 2.0,      -- For area defense VP orders, what are the thresholds for "low", "medium" and "high" VP values
	PLAN_PROVINCE_MEDIUM_VP_DEFENSE_THRESHOLD = 8.0,   -- see above
	PLAN_PROVINCE_HIGH_VP_DEFENSE_THRESHOLD = 25.0,    -- see above
	PLAN_PROVINCE_LOW_VP_DEFENSE_IMPORTANCE = 2.0,     -- For area defense VP orders, use this value for relative importance
	PLAN_PROVINCE_MEDIUM_VP_DEFENSE_IMPORTANCE = 5.0,  -- see above
	PLAN_PROVINCE_HIGH_VP_DEFENSE_IMPORTANCE = 10.0,   -- see above
	PLAN_PROVINCE_CAPITAL_DEFENSE_IMPORTANCE = 50.0,   -- For area defense VP orders, boost importance value with this if it's the capital
	MIN_VP_NEEDED_FOR_DEFENSE_ORDER_ASSIGNMENTS = 1.0, -- For area devense VP orders, ignore provinces with VP <= this value

	PLAN_PROVINCE_LOW_VP_IMPORTANCE_FRONT = 2.0,    -- Used when calculating the calue of fronts in the battle plan system
	PLAN_PROVINCE_MEDIUM_VP_IMPORTANCE_FRONT = 2.25, -- Used when calculating the calue of fronts in the battle plan system
	PLAN_PROVINCE_HIGH_VP_IMPORTANCE_FRONT = 2.75,  -- Used when calculating the calue of fronts in the battle plan system

	PLAN_SHARED_FRONT_PROV_IMPORTANCE_FACTOR = 0.8,	-- If fornt orders share end provinces, they should each have a somewhat reduced prio due to it being shared.

	PLAN_PORVINCE_PORT_BASE_IMPORTANCE = 12.0,		-- Added importance for area defense province with a port
	PLAN_PORVINCE_PORT_LEVEL_FACTOR = 1.5,			-- Bonus factor for port level
	PLAN_PORVINCE_AIRFIELD_BASE_IMPORTANCE = 3.0,	-- Added importance for area defense province with air field
	PLAN_PORVINCE_AIRFIELD_POPULATED_FACTOR = 1.5,	-- Bonus factor when an airfield has planes on it
	PLAN_PORVINCE_AIRFIELD_LEVEL_FACTOR = 0.25,		-- Bonus factor for airfield level
	PLAN_PORVINCE_RESISTANCE_BASE_IMPORTANCE = 10.0, -- Used when calculating the calue of defense area provinces for the battle plan system (factored by resistance level)
	PLAN_PROVINCE_VP_PORT_FACTOR = 0.25,

	-- These need to result in province value > 1.0 for it to matter.
	PLAN_AREA_DEFENSE_ENEMY_CONTROLLER_SCORE = 25.0,-- Score applied to provinces in the defense area order controlled by enemies
	PLAN_AREA_DEFENSE_ENEMY_UNIT_FACTOR = -2.0,		-- Factor applied to province score in area defense order per enemy unit in that province
	PLAN_AREA_DEFENSE_FORT_IMPORTANCE = 0.25,		-- Used when calculating the value of defense area provinces for the battle plan system, works as multipliers on the rest
	PLAN_AREA_DEFENSE_COASTAL_FORT_IMPORTANCE = 3.0,-- Used when calculating the value of defense area provinces for the battle plan system
	PLAN_AREA_DEFENSE_COAST_NO_FORT_IMPORTANCE = 1.1,-- Used when calculating the value of defense area provinces for the battle plan system
	PLAN_AREA_DEFENSE_HAS_RAIL_IMPORTANCE = 1.5,	-- Used when calculating the value of defense area provinces for the battle plan system
	PLAN_AREA_DEFENSE_HAS_SUPPLY_NODE = 20.0,		-- Used when calculating the value of defense area provinces for the battle plan system
	PLAN_AREA_DEFENSE_FACILITY = 15.0,               -- Used when calculating the value of defense area provinces for the battle plan system

	PLAN_STICKINESS_FACTOR = 100.0,					-- Factor used in unitcontroller when prioritizing units for locations

	PLAN_PROVINCE_PRIO_DISTRIBUTION_MIN = 0.7,		-- Lowest fraction of divisions that will be distributed based on province priority
	PLAN_PROVINCE_PRIO_DISTRIBUTION_MAX = 1.0,		-- Highest fraction of divisions that will be distributed based on province priority
	PLAN_PROVINCE_PRIO_DISTRIBUTION_DPP_HIGH = 3.0, -- At what divisions per province should we use PLAN_PROVINCE_PRIO_DISTRIBUTION_MIN
	PLAN_PROVINCE_PRIO_DISTRIBUTION_DPP_LOW = 2.0,	-- At what divisions per province should we use PLAN_PROVINCE_PRIO_DISTRIBUTION_MAX

	PLAN_EXECUTE_CAREFUL_LIMIT = 25,                -- When looking for an attack target, this score limit is required in the battle plan to consider province for attack
	PLAN_EXECUTE_BALANCED_LIMIT = 0,                -- When looking for an attack target, this score limit is required in the battle plan to consider province for attack
	PLAN_EXECUTE_RUSH = -200,                       -- When looking for an attack target, this score limit is required in the battle plan to consider province for attack
	PLAN_EXECUTE_CAREFUL_MAX_FORT = 5,				-- If execution mode is set to careful, units will not attack provinces with fort levels greater than or equal to this

	-- order by EExecutionType: careful, balanced, rush, <skip>, rush_weak
	PLAN_EXECUTE_SUPPLY_CHECK = { 1.0, 0.0, 0.0, 1.0, 0.0 }, -- for each execution mode how careful should we be with supply (1.0 means full required supply available, zero is no limit).

	PLAN_MAX_PROGRESS_TO_JOIN = 0.50,				-- If Lower progress than this, probably needs support

	PLAN_COHESION_WEIGHTS = { 1.0, 40.0, 80.0 }, 	-- for each cohesion setting, how keen on relocating from distance should we be? (default 1.0), higher weight = shorter max distance
	PLAN_COHESION_DISTANCE_MAX_WHEN_LEFT_BEHIND = 38,	--Unused and deprecated - will be removed in next major version.

	PLAN_BLITZ_OPTIMISM = 0.2,						-- Additional combat balance value in favor of blitzing side when considering targets (not a combat bonus, just offsets planning)
	MIN_BALANCE_SCORE_TO_PROCEED_ATTACK = 0.2,		--A combat balance score of less than this will prevent auto attacking
	DYNAMIC_MODIFIER_ATTACK_BIAS = 1.0,				--This factors the weighting bias of dynamic attack modifiers

	FLANKED_PROVINCES_COUNT = 3,					-- Attacker has to attack from that many provinces for the attack to be considered as flanking
	EQUIPMENT_REPLACEMENT_RATIO = 0.1,				-- Equipment min ratio after blocking the equipment type
	NUKE_DELAY_HOURS = 2,							-- How many hours does it take for the nuclear drop to happen
	PARADROP_PENALTY = -0.3, 						-- Combat penalty when recently paradropped
	PARADROP_HOURS = 48,							-- time paratroopers suffer penalties in combat
	COMBAT_SUPPLY_LACK_ATTACKER_ATTACK = -0.25,     -- attack combat penalty for attacker if out of supply
	COMBAT_SUPPLY_LACK_ATTACKER_DEFEND = -0.65,     -- defend combat penalty for attacker if out of supply
	COMBAT_SUPPLY_LACK_DEFENDER_ATTACK = -0.35,     -- attack combat penalty for defender if out of supply
	COMBAT_SUPPLY_LACK_DEFENDER_DEFEND = -0.15,     -- defend combat penalty for defender if out of supply
	COMBAT_STACKING_START = 5,						-- at what nr of divisions stacking penalty starts
	COMBAT_STACKING_EXTRA = 3,                      -- extra stacking from directions
	COMBAT_STACKING_PENALTY = -0.02,                -- how much stackign penalty per division
	COMBAT_OVER_WIDTH_PENALTY = -1,					-- over combat width penalty per %.
	COMBAT_OVER_WIDTH_PENALTY_MAX = -0.33,			-- over combat width max (when you cant join no more).
	RETREAT_SPEED_FACTOR = 0.25,                    -- speed bonus when retreating
	WITHDRAWING_SPEED_FACTOR = 0.15,				-- speed bonus when withdrawing
	STRATEGIC_SPEED_INFRA_BASE = 5.0,               -- Base speed of strategic redeployment when not on railways
	STRATEGIC_SPEED_INFRA_MAX = 10.0,               -- Additional speed of strategic redeployment on max-level infrastructure
	STRATEGIC_SPEED_RAIL_BASE = 15.0,               -- Base speed of strategic redeployment when on railways
	STRATEGIC_SPEED_RAIL_MAX = 25.0,                -- Additional speed of strategic redeployment on max-level railways
	STRATEGIC_REDEPLOY_ORG_RATIO = 0.1,				-- Ratio of max org while strategic redeployment
	BATALION_NOT_CHANGED_EXPERIENCE_DROP = 0.0,		-- Division experience drop if unit has same batalion
	BATALION_CHANGED_EXPERIENCE_DROP = 0.5,			-- Division experience drop if unit has different batalion
	ARMOR_VS_AVERAGE = 0.4,			                -- how to weight in highest armor & pen vs the division average
	PEN_VS_AVERAGE = 0.4,

	LAND_EQUIPMENT_BASE_COST = 10,					-- Cost in XP to upgrade a piece of equipment one level is base + ( total levels * ramp )
	LAND_EQUIPMENT_RAMP_COST = 5,
	NAVAL_EQUIPMENT_BASE_COST = 25,
	NAVAL_EQUIPMENT_RAMP_COST = 5,
	AIR_EQUIPMENT_BASE_COST = 25,
	AIR_EQUIPMENT_RAMP_COST = 5,

	FASTER_ORG_REGAIN_LEVEL = 0.25,
	FASTER_ORG_REGAIN_MULT = 1.0,
	SLOWER_ORG_REGAIN_LEVEL = 0.80,
	SLOWER_ORG_REGAIN_MULT = -0.5,

	DISBAND_MANPOWER_LOSS = 0.0,
	MIN_DIVISION_DEPLOYMENT_TRAINING = 0.2,			-- Min level of division training

	FRONTLINE_EXPANSION_FACTOR = 0.6,				-- When attacking along a frontline, how much should units spread out as they advance. 0.0 means head (more or less) directly to the drawn frontline, with no distractions
	FRONT_MIN_PATH_TO_REDEPLOY = 8,					-- If a units path is at least this long to reach its front location, it will strategically redeploy.
	ARMY_INITIATIVE_REINFORCE_FACTOR = 0.25,		-- scales initiative for reinforce chance

	BASE_CAPTURE_EQUIPMENT_RATIO = 0.0,				-- after a successful land combat, ratio of the equipments that are being captured/salvaged from enemy's lost equipment

	ACCLIMATIZATION_IN_COMBAT_SPEED_FACTOR = 3,		-- Acclimatization speed multiplier while being in combat.
	ACCLIMATIZATION_SPEED_GAIN = 0.15,				-- A variable used to balance the overall speed of gaining the acclimatization
	ACCLIMATIZATION_LOSS_SPEED_FACTOR = 2.0,		-- Loosing one acclimatization while being under affect of the opposite climate should cause it to drop down much faster than gaining.


	PROMOTE_LEADER_CP_COST = 40.0,					-- cost of promoting a leader

	FIELD_MARSHAL_ARMY_BONUS_RATIO = 0.5,           -- ratio to apply regular bonuses FM bonuses to armies

	FIELD_MARSHAL_XP_RATIO = 0.3,					-- xp gain ratio for army group leaders

	GARRISON_ORDER_ARMY_CAP_FACTOR = 3.0,			-- armies gets increased cap when they are garrisoned

	COMMANDER_LEVEL_UP_STAT_COUNT = 3, 				-- num stats gained on level up
	COMMANDER_LEVEL_UP_STAT_WEIGHTS = {5, 5, 5, 5}, -- level up stat random base weights attack, defense, planning, logistics

	NAVY_LEADER_LEVEL_UP_STAT_WEIGHTS = {5, 5, 5, 5}, -- level up stat random base weights attack, defense, maneuvering, coordination

	UNIT_LEADER_INITIAL_TRAIT_SLOT = { 				-- trait slot for 0 level leader
		1.0, -- field marshal
		0.0, -- corps commander
		1.0, -- navy general
		0.0, -- operative
	},

	UNIT_LEADER_TRAIT_SLOT_PER_LEVEL = { 			-- num extra traits on each level
		0.5, -- field marshal
		0.5, -- corps commander
		0.5, -- navy general
		0.0, -- operative
	},

	UNIT_LEADER_USE_NONLINEAR_XP_GAIN = true,       -- Whether unit leader XP gain is scaled by 1/<nr_of_traits>

	HOURS_REQ_REJOIN_BORDER_WAR_FOR_INJURED_UNITS = 336, -- minimum hours required for units to rejoin border wars

	NEW_COMMANDER_RANDOM_PERSONALITY_TRAIT_CHANCES = {  -- chances to gain a personality trait for new generals
		0.5, -- 50% for first trait
		0.15  -- 15% for second trait after that
	},

	NEW_COMMANDER_RANDOM_BASIC_TRAIT_CHANCES = {  -- chances to gain a basic trait for new generals
	},

	NEW_COMMANDER_RANDOM_STATUS_TRAIT_CHANCES = {  -- chances to gain a status trait for new generals
	},

	NEW_OPERATIVE_RANDOM_PERSONALITY_TRAIT_CHANCES = {  -- chances to gain a personality trait for new operatives
		0.5, -- 50% for first trait
		0.1  -- 10% for second trait after that
	},

	NEW_OPERATIVE_RANDOM_BASIC_TRAIT_CHANCES = {  -- chances to gain a basic trait for new operatives
		0.25, -- 25% for first trait
		0.05  -- 5% for second trait after that
	},

	NEW_OPERATIVE_RANDOM_STATUS_TRAIT_CHANCES = {  -- chances to gain a status trait for new operatives
	},

	NEW_COMMANDER_RANDOM_SKILL_CHANCES = {  -- chances to give a random stat skill for new operatives
	},

	NEW_NAVY_LEADER_RANDOM_SKILL_CHANCES = { -- chances to give a random stat skill point for a new admiral
	},

	UNIT_LEADER_MODIFIER_COOLDOWN_ON_GROUP_CHANGE = 15,		-- time in days for a unit leader to regain its modifiers
	UNIT_LEADER_ASSIGN_TRAIT_COST = 15.0,					-- cost to assign a new trait to a unit leader
	ATTACHED_WINGS_ORDER_UPDATE_DAYS = 5,					-- Days untill the attached wing will update the order

	BORDER_WAR_WIN_DAYS_AGAINST_EMPTY_OPPONENTS = 14,		-- border wars will be automatically won if no opponent shows up for this duration


	MAX_RELATIVE_COMBAT_DAMAGE_TO_MODIFY_XP = 4.0,			-- you gain more XP if you are doing more damage relative to enemy, this is the max relative amount to gain following RATe
	XP_GAIN_FACTOR_FOR_MAX_RELATIVE_COMBAT_DAMAGE = 4.0,	-- XP factor scaling for max relative combat damage

	XP_DECAY_RATE_PER_HOUR_IN_COMBAT = 0.03,				-- you get reduced XP as combat drags
	MIN_XP_RATE_TO_DECAY = 0.1,								-- minimum XP factor for dragged combats

	XP_GAIN_PER_OVERRUN_UNIT = 35.0,						-- fixed XP gain per overrun unit
	XP_GAIN_FOR_SHATTERING = 35.0,                          -- fixed XP gain per shattered unit

	UNIT_UPKEEP_ATTRITION = 0.00,							--Constant attrition value applied to armies.

	FUEL_PENALTY_START_RATIO = 0.25,				-- ratio of fuel in an army to start getting penalties

	SURPLUS_SUPPLY_RATIO_FOR_ZERO_FUEL_FLOW = 0.5,		-- if a supply chunk has more supply needed than this ratio + 1 compared to its max supply flow, the units inside the chiunk will get no fuel

	ARMY_MAX_FUEL_FLOW_MULT = 2.0,					-- max fuel ratio that an army can get per hour, multiplied by supply situation

	ARMY_FUEL_COST_MULT = 0.5,						-- fuel cost multiplier for all army related stuff
	ARMY_COMBAT_FUEL_MULT =   1.0,					-- fuel consumption ratio in combat (plus ARMY_MOVEMENT_FUEL_MULT if you are also moving. ie offensive combat)
	ARMY_TRAINING_FUEL_MULT = 1.0,					-- fuel consumption ratio while training
	ARMY_MOVEMENT_FUEL_MULT = 1.0,					-- fuel consumption ratio while moving
	ARMY_NAVAL_TRANSFER_FUEL_MULT = 0.0,			-- fuel consumption ratio while naval transferring
	ARMY_STRATEGIC_DEPLOYMENT_FUEL_MULT = 0.0,		-- fuel consumption ratio while doing strategic deployment
	ARMY_IDLE_FUEL_MULT = 0.0,						-- fuel consumption ratio while just existing
	FUEL_EFFICIENCY_RAID_MULTIPLIER = 1.0,			-- convoy raid multiplier for fuel sunk

	FUEL_FLOW_PENALTY_FOR_SUPPLY_CHUNK_EDGE_RATIO = 0.5, -- supply flow that is limited by control of incoming edge provinces will have lesser effect on fuel flow

	OUT_OF_FUEL_EQUIPMENT_MULT = 0.1,				-- ratio of the stats that you get from equipments that uses fuel and you lack it
	OUT_OF_FUEL_SPEED_MULT = 0.4,					-- speed mult that armies get when out of fuel
	OUT_OF_FUEL_TRAINING_XP_GAIN_MULT = 0.0,		-- xp gain mult from training when a unit is out of fuel
	FUEL_CAPACITY_DEFAULT_HOURS = 96,				-- default capacity if not specified

	MAX_ESTIMATED_PLAN_UNITS_NOT_IN_PLACE_FACTOR = -0.6, 	--Scaled by % of units not in place. Used to be a flat -50%
	DAMAGE_SPLIT_ON_FIRST_TARGET = 0.35,			--% of damage dealt to the first target in a combat. The rest will be split amongst subsequent targets. Modifiers can affect this up to a maximum of 0.9. That value must not be exposed as a define.


	NEW_ARMY_LEADER_LEVEL_CHANCES = {				-- chances for new army leaders to start at a given level
		0.95, -- 95% for level one
		0.05  -- 5% for level two
		      -- 0% for level three to ten
	}
},

NDeployment = { --部署
	BASE_DEPLOYMENT_TRAINING = 1,		-- 部署期间每日完成的基础训练量
},
NMilitary = { --军事

	COMBAT_VALUE_ORG_IMPORTANCE = 1,		-- 计算师级作战价值时，总组织度的乘数
	COMBAT_VALUE_STR_IMPORTANCE = 1,		-- 计算师级作战价值时，总实力的乘数

	SOFT_ATTACK_TARGETING_FACTOR = 1.0,		-- 评估优先战斗目标时，对潜在软攻的关心程度
	HARD_ATTACK_TARGETING_FACTOR = 1.2,		-- 评估优先战斗目标时，对潜在硬攻的关心程度

	CASUALTIES_WS_P_PENALTY_DIVISOR = 200,							-- 伤亡对战争分数惩罚的分母
	CASUALTIES_WS_A_PENALTY_DIVISOR = 600,							-- 同上

	PIERCING_THRESHOLDS = {					-- 我方穿甲/敌方装甲需达到此比例，才能对应索引的伤害倍率（数字越高穿甲越高）。若装甲为0，返回1.00
		1.00,
		0.75,
		0.50,
		0.00, -- 设再高也无意义
	},
	PIERCING_THRESHOLD_DAMAGE_VALUES = {	-- 0装甲始终吃满伤。系统至少需2个值，无上限
		1.00,
		0.80,
		0.65,
		0.50,
	},

	DIVISIONAL_COMMANDER_TRAIT_XP_REQUIREMENT = 400.0,	-- 若满足条件且累计经验≥此值，则获得特质
	NUM_DAYS_FOR_OPERATION_ENTRY = 60,					-- 单位需在某一持续命令上停留多少天，才能产生历史记录
	MAX_LEADERS_TO_SHOW = 50,							-- 战场军官列表最多显示的军官数，按野战经验排序
	BASE_FEMALE_DIVISIONAL_COMMANDER_CHANCE = 0,		-- 获得女性师级指挥官的基础概率（游戏本体设为0，因多数文化组无通用女头像）

	DIVISIONAL_COMMANDER_RANK_XP_THRESHOLD = { 		-- 师级指挥官军衔所需经验阈值（对应本地化键）
		0,
		100.0,
		200.0,
		400.0,
		800.0,
	},

	USE_MULTIPLICATIVE_ORG_LOSS_WHEN_MOVING = true, -- 移动时组织度损失修正采用乘法还是加法
	HOURLY_ORG_MOVEMENT_IMPACT = -0.2,		-- 部队移动时每小时减少的组织度
	ZERO_ORG_MOVEMENT_MODIFIER = -0.8,		-- 组织度为0时的速度修正
	INFRA_ORG_IMPACT = 0.5,				-- 基础设施对组织恢复的影响倍数
	ENGAGEMENT_WIDTH_PER_WIDTH = 2.0,	-- 我方每1宽度可接战的敌方宽度

	INFRASTRUCTURE_MOVEMENT_SPEED_IMPACT = -0.05,	-- 低于最大基础设施时每级带来的速度惩罚

	VPS_FOR_HISTORY_ENTRY = 3,					-- 获得师级历史记录所需最低胜利点数
	VPS_FOR_HIGH_HISTORY_ENTRY = 8,				-- 获得高级历史记录所需胜利点数
	ENTRIES_TO_CHECK_FOR_DUPLICATE = 2,			-- 检查重复记录的最大回溯条数
	COST_INCREASE_PER_ACTIVE_MEDAL = 0.25,		-- 每枚活跃勋章增加的成本倍率
	MAX_ENTRY_ELISION_COUNT = 4,				-- 连续同类事件最多合并位置数
	GENERATE_AI_DIV_COMMAND_HISTORY_ENTRIES = true,	-- 是否为 AI 生成师级历史记录（可能导致存档膨胀）
	FIELD_EXPERIENCE_ON_DIVISION_MULT = 0.04,	-- 师级指挥官获得的野战经验倍率
	MAX_FIELD_EXPERIENCE_ON_DIVISION = 8000,	-- 师级指挥官可获最大野战经验
	FIELD_EXPERIENCE_ON_DIVISION_PER_MEDAL_MULT = 0.1,	-- 每枚勋章额外倍率
	HISTORY_OPERATION_RANDOM_MAX = 24,			-- 决定作战是否写入可颁奖记录的随机上限（1/N 概率）
	CASUALTY_COUNT_FOR_HISTORY_ENTRY = 40000,	-- 累计伤亡达此值时写入一条历史记录（仅一次）
	FIELD_OFFICER_PROMOTION_PENALTY = 0.25,		-- 晋升指挥官时损失的师级经验比例（可被修正降低）

	HISTORICAL_ORDER_NAME_EXHAUSTION = false,	-- 历史命名实例是否耗尽名称池（若为否，巴巴罗萨等名称可反复出现）

	WAR_SCORE_LOSSES_RATIO = 0.5,								-- 每 1000 伤亡获得的战争分数
	WAR_SCORE_LOSSES_MULT_IF_CAPITULATED = 0.25, 				-- 已投降时的伤亡分数倍率
	WAR_SCORE_STRATEGIC_BOMBING_FACTOR = 0.02,  				-- 每点战略轰炸建筑伤害获得的战争分数
	WAR_SCORE_STRAT_BOMBING_DECAY_PER_CIVILIAN_FACTORY = 0.10,	-- 每座被轰炸敌国民用工厂每月从轰炸分数中扣除的比例
	WAR_SCORE_AIR_IC_LOSS_FACTOR = 0.08,						-- 每点空军 IC 损失获得的战争分数
	WAR_SCORE_LAND_DAMAGE_FACTOR = 0.1,          				-- 每次对敌陆军实力伤害获得的战争分数
	WAR_SCORE_ATTACKER_AND_WINNER_FACTOR = 1.2,					-- 作为进攻方且获胜时的额外倍率
	WAR_SCORE_LAND_IC_LOSS_FACTOR = 0.08,         				-- 每点陆军 IC 损失获得的战争分数
	WAR_SCORE_PROVINCE_FACTOR = 4.0,							-- 首次占领省份获得的战争分数（乘以省份价值）
	WAR_SCORE_LEND_LEASE_GIVEN_IC_FACTOR = 0.003,  				-- 每 IC 租借给盟友获得的战争分数
	WAR_SCORE_LEND_LEASE_GIVEN_FUEL_FACTOR = 0.003,  			-- 每 100 单位燃料租借给盟友获得的战争分数
	WAR_SCORE_LEND_LEASE_RECEIVED_IC_FACTOR = 0.002,  			-- 每 IC 从盟友收到租借扣除的战争分数
	WAR_SCORE_LEND_LEASE_RECEIVED_FUEL_FACTOR = 0.002, 		-- 每 100 单位燃料从盟友收到租借扣除的战争分数

	CORPS_COMMANDER_DIVISIONS_CAP = 24,			-- 军长指挥师数上限（0 为无限，<0 为禁用）
	DIVISION_SIZE_FOR_XP = 8,                   -- 计算经验时视为“完整师”的最低营数
	CORPS_COMMANDER_ARMIES_CAP = -1,			-- 军长指挥集团军数上限（0 为无限，<0 为禁用）
	FIELD_MARSHAL_DIVISIONS_CAP = 24,			-- 元帅指挥师数上限
	FIELD_MARSHAL_ARMIES_CAP = 5,				-- 元帅指挥集团军数上限

	UNIT_LEADER_GENERATION_CAPITAL_CONTINENT_FACTOR = 100, -- 生成将领时的人力倍数

	RECON_SKILL_IMPACT = 5, -- 侦察优势相当于多少技能点，用于挑选战术

	MAX_DIVISION_BRIGADE_WIDTH = 5,			-- 师级设计器中部队最大宽度
	MAX_DIVISION_BRIGADE_HEIGHT = 5,		-- 师级设计器中部队最大高度
	MIN_DIVISION_BRIGADE_HEIGHT = 4,		-- 师级设计器中部队最小高度
	MAX_DIVISION_SUPPORT_WIDTH = 1,			-- 支援连最大宽度
	MAX_DIVISION_SUPPORT_HEIGHT = 5,		-- 支援连最大高度

	BASE_DIVISION_BRIGADE_GROUP_COST = 20, 	-- 解锁一个旅栏位的基础成本
	BASE_DIVISION_BRIGADE_CHANGE_COST = 5,	-- 更改旅栏位的基础成本
	BASE_DIVISION_SUPPORT_SLOT_COST = 10, 	-- 解锁支援栏位的基础成本

	MAX_ARMY_EXPERIENCE = 500,			-- 国家可存储的陆军经验上限
	MAX_NAVY_EXPERIENCE = 500,			-- 国家可存储的海军经验上限
	MAX_AIR_EXPERIENCE = 500,			-- 国家可存储的空军经验上限

	COMBAT_MINIMUM_TIME = 4,			-- 战斗最短持续时间（小时）
	SPOTTING_QUALITY_DROP_HOURS = 4, 	-- 单位被发现后每 X 小时情报质量下降
	LEADER_GROUP_MAX_SIZE = 1000, -- 军官组最大槽位（原5，已调高）

	MIN_SUPPLY_CONSUMPTION = 0.05,					-- 单位最低补给消耗系数

	LAND_COMBAT_ORG_DICE_SIZE = 4,                 -- 组织度伤害骰数
	LAND_COMBAT_STR_DICE_SIZE = 2,                 -- 实力伤害骰数
	LAND_COMBAT_STR_DAMAGE_MODIFIER = 0.060,       -- 全局实力伤害修正（部分装备战后返还）
	LAND_COMBAT_ORG_DAMAGE_MODIFIER = 0.053,       -- 全局组织度伤害修正
	LAND_AIR_COMBAT_STR_DAMAGE_MODIFIER = 0.032,    -- 空军对陆军实力伤害修正
	LAND_AIR_COMBAT_ORG_DAMAGE_MODIFIER = 0.032,    -- 空军对陆军组织度伤害修正
	LAND_AIR_COMBAT_MAX_PLANES_PER_ENEMY_WIDTH = 3, -- 每敌方宽度最大可参战 CAS/战术机数量
	LAND_COMBAT_STR_ARMOR_ON_SOFT_DICE_SIZE = 2,   -- 装甲碾压软目标时额外实力骰
	LAND_COMBAT_ORG_ARMOR_ON_SOFT_DICE_SIZE = 6,   -- 装甲碾压软目标时额外组织骰
	LAND_COMBAT_STR_ARMOR_DEFLECTION_FACTOR = 0.5, -- 装甲碾压时的实力伤害减免
	LAND_COMBAT_ORG_ARMOR_DEFLECTION_FACTOR = 0.5, -- 装甲碾压时的组织度伤害减免
	LAND_COMBAT_COLLATERAL_FORT_FACTOR = 0.005,		-- 对要塞的额外伤害系数
	LAND_COMBAT_COLLATERAL_INFRA_FACTOR = 0.0022,	-- 对基础设施的额外伤害系数
	LAND_COMBAT_FORT_DAMAGE_CHANCE = 5,				-- 每击对要塞造成伤害的概率（百分制）
	ATTRITION_DAMAGE_ORG = 0.08,					   -- 损耗对组织度的伤害
	ATTRITION_EQUIPMENT_LOSS_CHANCE = 0.1,		   -- 损耗时装备损失概率（随损耗强度及可靠性缩放）
	ATTRITION_EQUIPMENT_PER_TYPE_LOSS_CHANCE = 0.1, -- 同上，按装备类型分别计算
	ATTRITION_WHILE_MOVING_FACTOR = 1,
	RELIABILITY_ORG_REGAIN = -0.3,                 -- 可靠性对组织恢复的影响
	RELIABILITY_ORG_MOVING = -1.0,                 -- 可靠性对移动组织损失的影响
	RELIABILITY_WEATHER = 3.0,                     -- 可靠性对天气影响的放大倍数
	RELIABILTY_RECOVERY = 0.40,                     -- 可靠性影响战后装备返还比例
	BASE_CHANCE_TO_AVOID_HIT = 90,                 -- 有防御时基础闪避概率
	CHANCE_TO_AVOID_HIT_AT_NO_DEF = 60,	           -- 无防御时闪避概率
	COMBAT_MOVEMENT_SPEED = 0.33,	               -- 战斗中基础移动速度倍率
	TACTIC_SWAP_FREQUENCEY = 12,                   -- 每12小时可交换一次战术
	PREFERRED_TACTIC_CHARACTER_SKILL_LEVEL_REQUIRED = 5, -- 元帅/上将需达此等级才能使用偏好战术
	COUNTRY_PREFERRED_TACTIC_WEIGHT_FACTOR = 0.25,  -- 国家偏好战术的额外权重
	ARMY_GENERAL_PREFERRED_TACTIC_WEIGHT_FACTOR = 0.5,   -- 集团军上将偏好战术额外权重
	FIELD_MARSHAL_PREFERRED_TACTIC_WEIGHT_FACTOR = 0.25, -- 元帅偏好战术额外权重
	PREFERRED_TACTIC_COMMAND_POWER_COST = 20,	   -- 切换偏好战术所需指挥点数
	INITIATIVE_PICK_COUNTER_ADVANTAGE_FACTOR  = 0.35, -- 每级指挥官在反制战术选择上的优势
	AMPHIBIOUS_INVADE_MOVEMENT_COST = 24.0,        -- 两栖登陆总移动进度消耗
	LAND_SPEED_MODIFIER = 0.05,                    -- 基础陆地速度修正
	RIVER_CROSSING_PENALTY = -0.3,                 -- 小河流穿越惩罚
	RIVER_CROSSING_PENALTY_LARGE = -0.6,           -- 大河流穿越惩罚
	RIVER_CROSSING_SPEED_PENALTY = -0.25,           -- 小河流速度惩罚
	RIVER_CROSSING_SPEED_PENALTY_LARGE = -0.5,     -- 大河流速度惩罚
	RIVER_SMALL_START_INDEX = 0,                   -- 河流颜色索引-小河流起始
	RIVER_SMALL_STOP_INDEX = 6,
	RIVER_LARGE_STOP_INDEX = 11,
	BASE_FORT_PENALTY = -0.15, 					   -- 每级要塞基础惩罚
	MULTIPLE_COMBATS_PENALTY = -0.5,               -- 多方向受击防御惩罚
	DIG_IN_FACTOR = 0.02,						   -- 每级挖掘加成
	ARMY_LEADER_XP_GAIN_PER_UNIT_IN_COMBAT = 0.1, -- 每参战单位给予将领的经验
	CONSTANT_XP_RATIO_FOR_MULTIPLE_LEADERS_IN_SAME_COMBAT = 0.5, -- 同战多将经验分配比例
	BASE_LEADER_TRAIT_GAIN_XP = 0.45,			   -- 将领特性每小时基础经验
	MAX_NUM_TRAITS = -1,						   -- 特性上限（-1 为无限制）
	ENEMY_AIR_SUPERIORITY_IMPACT = -0.35,          -- 敌方空优对防御的影响
	ENEMY_AIR_SUPERIORITY_DEFENSE = 0.70,	       -- 防空对空优减伤的极限值
	ENEMY_AIR_SUPERIORITY_DEFENSE_STEEPNESS = 112, -- 防空减伤曲线陡峭度
	ENEMY_AIR_SUPERIORITY_SPEED_IMPACT = -0.3,     -- 空优对速度的影响

	ANTI_AIR_TARGETTING_TO_CHANCE = 0.07,			-- 防空命中率平衡系数
	ANTI_AIR_ATTACK_TO_AMOUNT = 0.005,				-- 防空攻击值转随机击落百分比的系数

	ENCIRCLED_PENALTY = -0.3,                      	-- 被包围时的惩罚

	UNIT_EXPERIENCE_PER_COMBAT_HOUR = 0.0001,  -- 每小时战斗经验
	UNIT_EXPERIENCE_SCALE = 1.0,
	UNIT_EXPERIENCE_PER_TRAINING_DAY = 0.0015, -- 每日训练经验
	TRAINING_MAX_LEVEL = 2,                    -- 训练最高等级
	DEPLOY_TRAINING_MAX_LEVEL = 1,             -- 部署后训练最高等级
	TRAINING_EXPERIENCE_SCALE = 62.0,
	TRAINING_ORG = 0.2,
	ARMY_EXP_BASE_LEVEL = 1,
	UNIT_EXP_LEVELS = { 0.1, 0.3, 0.75, 0.9 },	-- 每级所需经验比例
	FIELD_EXPERIENCE_SCALE = 0.0015,
	FIELD_EXPERIENCE_MAX_PER_DAY = 1.2,				-- 每日最大野战经验
	EXPEDITIONARY_FIELD_EXPERIENCE_SCALE = 0.3,		-- 远征军经验倍率
	LEND_LEASE_FIELD_EXPERIENCE_SCALE = 0.0005,		-- 租借装备参战经验倍率
	LEADER_EXPERIENCE_SCALE = 1.0,
	SLOWEST_SPEED = 4,
	REINFORCEMENT_REQUEST_MAX_WAITING_DAYS = 14,   -- 最多等待 X 天后强制发送增援
	REINFORCEMENT_REQUEST_DAYS_FREQUENCY = 7,	   -- 两次增援请求间隔
	EXPERIENCE_COMBAT_FACTOR = 0.25,
	UNIT_DIGIN_CAP = 5,                           -- 最大挖掘深度
	UNIT_DIGIN_SPEED = 1,						   -- 每日挖掘深度
	PARACHUTE_FAILED_EQUIPMENT_DIV = 50.0,		   -- 运输机被击落时装备保留率（极低）
	PARACHUTE_FAILED_MANPOWER_DIV = 100.0,		   -- 运输机被击落时人力保留率（极低）
	PARACHUTE_FAILED_STR_DIV = 10.0,			   -- 运输机被击落时实力保留率（极低）
	PARACHUTE_DISRUPTED_EQUIPMENT_DIV = 1.5,	   -- 运输机受扰后装备保留倍率
	PARACHUTE_DISRUPTED_MANPOWER_DIV = 1.9,	       -- 运输机受扰后人力保留倍率
	PARACHUTE_DISRUPTED_STR_DIV = 2.2,			   -- 运输机受扰后实力保留倍率
	PARACHUTE_PENALTY_RANDOMNESS = 0.1,			   -- 空降惩罚随机系数
	PARACHUTE_DISRUPTED_AA_PENALTY = 1,            -- 当地防空对空降扰乱的放大系数
	PARACHUTE_COMPLETE_ORG = 0.4,				   -- 空降后初始组织度（无论成功/扰乱/失败）
	PARACHUTE_ORG_REGAIN_PENALTY_DURATION = 120,   -- 空降后组织恢复惩罚持续小时数
	PARACHUTE_ORG_REGAIN_PENALTY_MULT = -0.8,	   -- 空降后组织恢复惩罚倍率
	SHIP_MORALE_TO_ORG_REGAIN_BASE = 0.2,			   -- 海军基础士气到组织恢复速度
	BASE_NIGHT_ATTACK_PENALTY = -0.5,
	EXILE_EQUIPMENT = 1.0,						   -- 流亡时保留装备比例
	EXILE_ORG = 0.0,							   -- 流亡时保留组织度
	EXPERIENCE_LOSS_FACTOR = 1.00,                 -- 人力减少时老兵损失比例
	EQUIPMENT_COMBAT_LOSS_FACTOR = 0.70,	 	   -- 战斗装备损失比例（部分战后返还）
	SUPPLY_GRACE = 72,							   -- 部队自带 3 天
}