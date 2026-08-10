NAir = {
	AIR_WING_FLIGHT_SPEED_MULT = 0.02,					-- Global speed multiplier for airplanes (affects fe.transferring to another base)
	AIR_WING_MAX_STATS_ATTACK = 100,					-- Max stats
	AIR_WING_MAX_STATS_DEFENCE = 100,
	AIR_WING_MAX_STATS_AGILITY = 100,
	AIR_WING_MAX_STATS_SPEED = 800,
	AIR_WING_MAX_STATS_BOMBING = 100,
	AIR_WING_MAX_SIZE = 1000, 							-- Max amount of airplanes in wing
	AIR_WING_AVERAGE_SIZE = 100, 						-- Eyeballed average amount of airplanes in wing. Used when calculating air volunteer.
	AIR_WING_BOMB_DAMAGE_FACTOR = 2,					-- Used to balance the damage done while bombing.
	BIGGEST_AGILITY_FACTOR_DIFF = 4.0,					-- biggest factor difference in agility for doing damage (caps to this)
	BIGGEST_SPEED_FACTOR_DIFF = 3.5,					-- biggest factor difference in speed for doing damage (caps to this)
	TOP_SPEED_DAMAGE_BONUS_FACTOR = 0.025,				-- A factor for scaling the top speed of a plane into damage buff. If an attacking wing has a speed advantage of any form their speed value will be converted into a percentage bonus with this modifier
	COMBAT_DAMAGE_STATS_MULTILPIER = 0.2,
	COMBAT_BETTER_AGILITY_DAMAGE_REDUCTION = 0.45, 		-- How much the better agility (than opponent's) can reduce their damage to us.
	COMBAT_BETTER_SPEED_DAMAGE_INCREASE = 0.65, 		-- How much the better Speed (than opponent's) can reduce increase our damage to them.
														-- Both of these defines are combined with their sister FACTOR_DIFF defines to create defense or offensive buffs
														-- In both cases the maximum bonus or reduction is (BIGGEST_X_FACTOR_DIFF - 1) * COMBAT_BETTER_X_DAMAGE_Y * Damage
	COMBAT_MAX_WINGS_AT_ONCE = 10000, 						-- Max amount of air wings in one combat simulation. The higher value, the quicker countries may loose their wings. It's a gameplay balance value.
	COMBAT_MAX_WINGS_AT_GROUND_ATTACK = 10000,	        	-- we can really pounce a land strike and escalate
	COMBAT_MAX_WINGS_AT_ONCE_PORT_STRIKE = 10000,        -- we can really pounce a naval strike and escalate
	AIR_REGION_SUPERIORITY_PIXEL_SCALE = 0.04,           -- air superiority scale = superiority/(pixels*this)
	COMBAT_MULTIPLANE_CAP = 3.0,						-- How many planes can shoot at each plane on other side ( if there are 100 planes we are atttacking COMBAT_MULTIPLANE_CAP * 100 of our planes can shoot )
	COMBAT_DAMAGE_SCALE = 1,							-- Higher value = more shot down planes
	COMBAT_DAMAGE_SCALE_CARRIER = 5,					-- same as above but used inside naval combat for carrier battles
	DETECT_CHANCE_FROM_OCCUPATION = 0.10, 				-- How much the controlled provinces in area affects the air detection base value.
	DETECT_CHANCE_FROM_RADARS = 0.5, 					-- How much the radars in area affects detection chance.
	DETECT_CHANCE_FROM_AIRCRAFTS_EFFECTIVE_COUNT = 3000, -- Max amount of aircrafts in region to give full detection bonus.
	DETECT_CHANCE_FROM_AIRCRAFTS = 0.8,					-- How much aircrafts in region improves air detection (up to effective count).
	DETECT_CHANCE_FROM_NIGHT = -0.2,					-- How much the night can reduce the air detection. (see static modifiers to check how weather affects it too.)
	DETECT_EFFICIENCY_BASE = 0.1,						-- Base value for detection efficiency (once something detected, efficiency says how many airplanes was detected).
	DETECT_EFFICIENCY_FROM_RADAR = 0.7,					-- How much radars affect the efficiency.
	DETECT_EFFICIENCY_RANDOM_FACTOR = 0.1,				-- How much randomness is in amount of detected aircrafts.
	DAY_NIGHT_COVERAGE_FACTOR = 0.5,					-- The max night coverage in a region that is still considered to be day-time when determining if day/night air missions shall run.
	HOURS_DELAY_AFTER_EACH_COMBAT = 4,					-- How many hours needs the wing to be ready for the next combat. Use for tweaking if combats happens too often. (generally used as double because of roundtrip)
	PORT_STRIKES_DELAY_MULTIPLIER = 2,					-- multplies HOURS_DELAY_AFTER_EACH_COMBAT if port strikes
	CARRIER_HOURS_DELAY_AFTER_EACH_COMBAT = 3,          -- how often carrier planes do battle inside naval combat
	CARRIER_SIZE_STAT_INCREMENT = 10,					-- Each Point of carrier_size state adds capacity for this many planes
	MISSILE_LAUNCHER_CAPACITY = 10,                     -- The number of missiles per slot
	MISSILE_LAUNCHER_SLOTS = 1,                         -- The number of missile slots a missile launcher unit can have
	NAVAL_STRIKE_TARGETTING_TO_AMOUNT = 0.3,			-- Balancing value to convert the naval_strike_targetting equipment stats to chances of how many airplanes managed to do successfull strike.
	NAVAL_STRIKE_DAMAGE_TO_STR = 1.0,					-- Balancing value to convert damage ( naval_strike_attack * hits ) to Strength reduction.
	NAVAL_STRIKE_DAMAGE_TO_ORG = 1.5,					-- Balancing value to convert damage ( naval_strike_attack * hits ) to Organisation reduction.
	NAVAL_STRIKE_CARRIER_MULTIPLIER = 10.0,              -- damage bonus when planes are in naval combat where their carrier is present (and can thus sortie faster and more effectively)
	FIELD_EXPERIENCE_SCALE = 0.0004,
	FIELD_EXPERIENCE_MAX_PER_DAY = 2,					-- Most xp you can gain per day
	CLOSE_AIR_SUPPORT_EXPERIENCE_SCALE = 0.0005,		-- How much the experinence gained by CAS is scaled
	PARADROP_EXPERIENCE_SCALE = 0.03,					-- How much the experinence gained by paradropping is scaled
	BOMBING_DAMAGE_EXPERIENCE_SCALE = 0.0002,           -- How much the experinence gained by bombing is scaled

	EXPERIENCE_SCALE_ATTACK_LOGISTICS_NO_TRUCK_CONSUMERS = 0.0001, -- How much country experinence gained by attacking consumers who aren't motorized
	EXPERIENCE_SCALE_ATTACK_LOGISTICS_NODE_AND_TRAINS = 0.0002,    -- How much country experinence gained by attacking node/trains
	EXPERIENCE_SCALE_ATTACK_LOGISTICS_TRUCKS = 0.0002,             -- How much country experinence gained by attacking trucks

	FIELD_EXPERIENCE_FACTOR = 0.7,						-- Factor all air experience gain from missions by this

	AI_ALLOWED_PLANES_KEPT_IN_RESERVE = 0.10,			--AI allowed planes is reduced by this percentage. Overflow will be distributed to the next valid order. Worst case, this will result in this % of planes no being assigned any order.

	ACCIDENT_CHANCE_BASE = 0.1,							-- Base chance % (0 - 100) for accident to happen. Reduced with higher reliability stat.
	ACCIDENT_CHANCE_CARRIER_MULT = 1.5,					-- The total accident chance is scaled up when it happens on the carrier ship.
	ACCIDENT_CHANCE_BALANCE_MULT = 0.10,				-- Multiplier for balancing how often the air accident really happens. The higher mult, the more often.
	ACCIDENT_CHANCE_RELIABILITY_MULT = 2.0,				-- Multiplier to accident chance per point of missing reliability.
	ACCIDENT_EFFECT_MULT = 0.007,						-- Multiplier for balancing the effect of accidents
	ACE_DEATH_CHANCE_BASE = 0.005,						-- Base chance % for ace pilot die when an airplane is shot down in the Ace wing.
	ACE_DEATH_BY_OTHER_ACE_CHANCE = 1.0,				-- chance to an ace dying by another ace if it was hit by ace in combat
	ACE_DEATH_CHANCE_PLANES_MULT = 0.001,				-- The more airplanes was lost in a single airplanes (more bloody it was) the higher chance of Ace to die.
	AIR_AGILITY_TO_NAVAL_STRIKE_AGILITY = 0.02,         		-- conversion factor to bring agility in line with ship AA
	ACE_EARN_CHANCE_BASE = 0.01,						-- Base chance % for ace pilot creation roll to happen. Happens only when successfully kill airplane/ship or damage the buildings.
	ACE_EARN_CHANCE_PLANES_MULT = 0.005,				-- Ace generation chance per aircraft. Chance is rolled twice because decimal numbers can't be small enough
	AIR_DAMAGE_TO_DIVISION_LOSSES = 1.0,				-- factor for conversion air damage to division losses for details statistics of air wings
	AIR_NAVAL_KAMIKAZE_DAMAGE_MULT = 20.0,				-- Balancing value to increase usual damage to Strength for Kamikaze
	AIR_NAVAL_KAMIKAZE_LOSSES_MULT = 4.0,          			-- Balancing value to increase usual losses if Kamikaze participating in the battle
	BASE_KAMIKAZE_DAMAGE = 2.0,                    				-- Base Kamikaze death rate
	BASE_KAMIKAZE_TARGETING = 2.0,			        		-- Kamikaze can't be a bad target
	BASE_STRATEGIC_BOMBING_HIT_SHIP_CHANCE = 0.01,		-- Chance to hit a ship in port when it is bombed.
	BASE_STRATEGIC_BOMBING_HIT_SHIP_DAMAGE_FACTOR = 50,
	BASE_STRATEGIC_BOMBING_HIT_PLANE_CHANCE = 0.5,		-- Chance to hit a plane in airbase when it is bombed.
	BASE_STRATEGIC_BOMBING_HIT_PLANE_DAMAGE_FACTOR = 0.2,
	AGGRESSION_THRESHOLD = { 0.0, 0.25, 0.5 },			-- Threshold levels for mission aggressivity for air

	ACE_WING_SIZE =	100,								-- size of wing ace bonuses are set up for. if lower more bonus, if higher less bonus
	ACE_WING_SIZE_MAX_BONUS = 2,               	        -- biggest bonus we can get from having a small wing with an ace on
	NO_SEARCH_MISSION_DETECT_FACTOR = -0.5,				-- value of planes not on active search missions for detection
	SUPPLY_NEED_FACTOR = 0.28, 							-- multiplies supply usage
	SUPPLY_PRIO_FACTOR = 100.0,							-- Effect of supply need per unit for target province picking for air supply
	CAPACITY_PENALTY = 2,								-- scales penalty of having overcrowded bases.
	AIR_COMBAT_FINAL_DAMAGE_SCALE = 0.015,               -- % how many max disrupted only planes are alloed to die in a single combat
	AIR_COMBAT_FINAL_DAMAGE_PLANES = 50,                -- scaling/control for when only very few planes exist to stop roundoff issues
	AIR_COMBAT_FINAL_DAMAGE_PLANES_FACTOR = 0.1,
	AA_INDUSTRY_AIR_DAMAGE_FACTOR = -0.12,				-- 5x levels = 60% defense from bombing
	NAVAL_STRIKE_DETECTION_BALANCE_FACTOR = 0.5,		-- Value used to scale the surface_visibility stats to balance the gameplay, so 100% detection chance still won't spam the strikes.
	NAVAL_RECON_DETECTION_BALANCE_FACTOR = 0.5,			-- Value used to scale the surface_visibility stats to balance the gameplay, so 100% detection chance still won't spam spotting.
	LEND_LEASED_EQUIPMENT_EXPERIENCE_GAIN = 0.5,		-- Value used for equipment
	ANTI_AIR_PLANE_DAMAGE_FACTOR = 0.8,					-- Anti Air Gun Damage factor
	ANTI_AIR_PLANE_DAMAGE_CHANCE = 0.1,					-- Anti Air Gun hit chance
	ANTI_AIR_ATTACK_TO_DAMAGE_REDUCTION_FACTOR = 1.0,	-- Balancing value to convert equipment stat anti_air_attack to the damage reduction modifier apply to incoming air attacks against units with AA.
	ANTI_AIR_MAXIMUM_DAMAGE_REDUCTION_FACTOR = 0.75,	-- Maximum damage reduction factor applied to incoming air attacks against units with AA.
	AIR_DEPLOYMENT_DAYS = 2,							-- Days to deploy one air wing
	NAVAL_STRIKE_BASE_STR_TO_PLANES_RATIO = 0.03,		-- Max airbombers to do port strike comparing to strength
	NAVAL_COMBAT_EXTERNAL_PLANES_JOIN_RATIO = 0.05,		-- Max planes that can join a combat comparing to the total strength of the ships
	NAVAL_COMBAT_EXTERNAL_PLANES_JOIN_RATIO_PER_DAY = 0.2, -- max extra plane % that can join every day
	NAVAL_COMBAT_EXTERNAL_PLANES_MIN_CAP = 20,			-- Min cap for planes that can join naval combat

	AIR_MORE_GROUND_CREWS_COST = 20.0,					-- CP cost to maintain more ground crews
	AIR_MORE_GROUND_CREWS_BOOST = 0.1,					-- Efficienct boost for more ground crews

	EFFICIENCY_REGION_CHANGE_PENALTY_FACTOR = 0.9,				-- Penalty applied for changing region
	-- Gain should be changed in increments of 0.024 due to precision.
	EFFICIENCY_REGION_CHANGE_DAILY_GAIN_DEFAULT = 1,	-- Default how much efficiency to regain per day. Gain applied hourly.
	EFFICIENCY_REGION_CHANGE_DAILY_GAIN_CAS = 0.888,				-- How much efficiency to regain per day. Gain applied hourly.
	EFFICIENCY_REGION_CHANGE_DAILY_GAIN_NAVAL_BOMBER = 0.192,		-- How much efficiency to regain per day. Gain applied hourly.
	EFFICIENCY_REGION_CHANGE_DAILY_GAIN_TACTICAL_BOMBER = 0.192,	-- How much efficiency to regain per day. Gain applied hourly.
	EFFICIENCY_REGION_CHANGE_DAILY_GAIN_FIGHTER = 0.888,			-- How much efficiency to regain per day. Gain applied hourly.
	EFFICIENCY_REGION_CHANGE_DAILY_GAIN_STRATEGIC_BOMBER = 0.072,	-- How much efficiency to regain per day. Gain applied hourly.
	EFFICIENCY_REGION_CHANGE_DAILY_GAIN_MARITIME_PATROL_PLANE = 1,

	AIR_WING_XP_MAX = 1000.0, 											--Per plane XP.
	AIR_WING_XP_LEVELS = { 100, 300, 700, 900 }, 						--Experience needed to progress to the next level
	AIR_WING_XP_LOSS_WHEN_KILLED = 300,									--if a plane dies, the game assumes that a pilot with this amount of xp died and recalcs average.
	AIR_WING_XP_TRAINING_MAX = 300.0, 									--Max average XP achieved with training.

	AIR_WING_XP_TRAINING_MISSION_GAIN_DAILY = 7.0, 						--Daily gain when running training exercise mission
	AIR_WING_XP_AIR_VS_AIR_COMBAT_GAIN = 0.8, 							--Wings in combat gain extra XP
	AIR_WING_XP_GROUND_MISSION_COMPLETED_GAIN = 0.28, 					--Bombers bombing, CAS cassing, NBs nbing, kamikazees kamikazeeing, etc.
	AIR_WING_XP_RECON_MISSION_COMPLETED_GAIN = 0.05, 					--recon mission

	AIR_WING_COUNTRY_XP_FROM_TRAINING_FACTOR = 0.003, 					--Factor on country Air XP gained from wing training
	AIR_WING_XP_TRAINING_MISSION_ACCIDENT_FACTOR = 0.2, 				--Training exercises cause more accidents
	AIR_WING_XP_LOSS_REDUCTION_OVER_FRIENDLY_TERRITORY_FACTOR = 0.3, 	--Reduction on XP loss over friendly territory

	DISRUPTION_FACTOR = 4.0,									-- multiplier on disruption damage to scale its effects on planes
	DISRUPTION_FACTOR_CARRIER = 6.0,							-- multiplier on disruption damage to scale its effects on carrier vs carrier planes
	DISRUPTION_SPEED_FACTOR = 1.0,
	DISRUPTION_AGILITY_FACTOR = 0.0,
	DISRUPTION_ATTACK_FACTOR = 0.0,
	DISRUPTION_DETECTION_FACTOR = 1.0,
	ESCORT_FACTOR = 2.0,
	ESCORT_SPEED_FACTOR = 1.0,
	ESCORT_AGILITY_FACTOR = 1.0,
	ESCORT_ATTACK_FACTOR = 1.0,
	DISRUPTION_DEFENCE_DEFENCE_FACTOR = 0.5,
	DISRUPTION_DEFENCE_SPEED_FACTOR = 1.0,
	DISRUPTION_DEFENCE_ATTACK_FACTOR = 0.5,

	CARRIER_PLANES_AMOUNT_FOR_POSITIONING = 50,         -- below this amount of planes on a carrier we no longer get max benefit on enemy positioning

	CAS_NIGHT_ATTACK_FACTOR = 0.1,                      -- CAS damaged get multiplied by this in land combats at night

	AIR_WING_ATTACK_LOGISTICS_NO_TRUCK_DISRUPTION_FACTOR = 0.02, -- If a unit isn't motorized, still disrupt its supply by damage * this
	AIR_WING_ATTACK_LOGISTICS_TRUCK_DAMAGE_FACTOR = 0.27,
	AIR_WING_ATTACK_LOGISTICS_INFRA_DAMAGE_SPILL_FACTOR = 0.0016, -- Portion of truck damage to additionally deal to infrastructure
	AIR_WING_ATTACK_LOGISTICS_TRAIN_DAMAGE_FACTOR = 0.040,
	AIR_WING_ATTACK_LOGISTICS_TRAIN_DAMAGE_DISRUPTION_MITIGATION = 6.0, -- Multiply Train Damage by (Smooth / (Smooth + (Disruption * Mitigation)))
	AIR_WING_ATTACK_LOGISTICS_TRAIN_DAMAGE_DISRUPTION_SMOOTHING = 5.0,
	AIR_WING_ATTACK_LOGISTICS_RAILWAY_DAMAGE_SPILL_FACTOR = 0.006, -- Portion of train damage to additionally deal to railways

	AIR_WING_ATTACK_LOGISTICS_DISRUPTION_MIN_DAMAGE_FACTOR = 0.1, -- Multiply train damage by this factor, scale from 1.0 at 0 disruption to this at AIR_WING_ATTACK_LOGISTICS_MAX_DISRUPTION_DAMAGE_TO_CONSIDER
	AIR_WING_ATTACK_LOGISTICS_MAX_DISRUPTION_DAMAGE_TO_CONSIDER = 15.0, -- see above
	AIR_WING_ATTACK_LOGISTICS_DIRECT_DISRUPTION_DAMAGE_FACTOR = 0.01, -- Disruption damage to supply throughput done by bombing damage, not dependant on killing trains which also causes diruption.

	AIR_WING_ATTACK_LOGISTICS_TRUCK_MAX_FACTOR = 0.3, -- max trucks we can destroy in one instance of a logistics strike

	SECONDARY_DAMAGE_STRAT = 0.2,  -- how much damage gets translated to railway guns for strat bombing
	SECONDARY_DAMAGE_LOGISTICS = 1.0, -- how much damage gets translated to railway guns for logistic strike

	INTERCEPTION_DISTANCE_SCALE = 50, -- At this many pixels of path length, full interception efficiency is applied to air missions. Lerp from 0.
	INTERCEPTION_DAMAGE_SCALE = 0.3, -- Multiply the interception damage with this value. Works as a cap when interception distance is at maximum.

	MIN_PLANE_COUNT_PARADROP = 50,
	MIN_PLANE_COUNT_AIR_SUPPLY = 1,
	BASE_UNIT_WEIGHT_IN_TRANSPORT_PLANES = 45.0,

	MANPOWER_LOSS_RATIO_PLANE_SHOT = 0.10,	-- The loss ratio of manpower for a shot plane.
	
	MISSION_COMMAND_POWER_COSTS = {  -- command power cost per plane to create a mission
		0.0, -- AIR_SUPERIORITY
		0.0, -- CAS
		0.0, -- INTERCEPTION
		0.0, -- STRATEGIC_BOMBER
		0.0, -- NAVAL_BOMBER
		0.0, -- DROP_NUKE
		0.0, -- PARADROP
		0.0, -- NAVAL_KAMIKAZE
        0.0, -- PORT_STRIKE
		0.0, -- ATTACK_LOGISTICS
		0.05, -- AIR_SUPPLY
		0.0, -- TRAINING
		0.0, -- NAVAL_MINES_PLANTING
		0.0, -- NAVAL_MINES_SWEEPING
		0.0, -- RECON
		0.0, -- NAVAL_PATROL
		0,0, -- BARRAGE
		0,0, -- SAM
	},

	MISSION_FUEL_COSTS = {  -- fuel cost per plane for each mission
		1.0, -- AIR_SUPERIORITY
		1.0, -- CAS
		0.2, -- INTERCEPTION
		1.0, -- STRATEGIC_BOMBER
		1.0, -- NAVAL_BOMBER
		1.0, -- DROP_NUKE
		1.0, -- PARADROP
		0.75, -- NAVAL_KAMIKAZE
		1.2, -- PORT_STRIKE
		1.2, -- ATTACK_LOGISTICS
		1.0, -- AIR_SUPPLY
		0.6, -- TRAINING
		1.0, -- NAVAL_MINES_PLANTING
		1.0, -- NAVAL_MINES_SWEEPING
		1.0, -- RECON
		1.0, -- NAVAL_PATROL
		0.0, -- BARRAGE
		0,0, -- NUCLEAR
		0,0, -- SAM
	},
	MAX_FUEL_FLOW_MULT = 1.0, -- max fuel flow ratio for planes, which will be multiplied by supply

	FUEL_COST_MULT = 0.35, -- fuel multiplier for all air missions

	MISSION_EFFICIENCY_MULT_AT_LACK_OF_FUEL = 0.25, 				-- multiplier for mission efficiency when a base lacks fuel

	STRATEGIC_BOMBING_PROV_BUILD_PRIO_SCALE = 1.5,					-- Scale of the selected priority for provincial buildings
	STRATEGIC_BOMBING_STATE_BUILD_PRIO_SCALE = 1.5,					-- Scale of the selected priority for state buildings
	STRATEGIC_BOMBING_INFRA_PRIO_SCALE = 0.7,						-- Scale of the selected priority for infrastructure
	STRATEGIC_BOMBING_RAILWAY_PRIORITY_SCALE = 0.2,					-- The scale of extra priority assigned to railway for strategic bombing
	STRATEGIC_BOMBING_STATE_BUILDING_SCALE = 1.0,					-- The scale of state building priority for strategic bombing
	
	NAVAL_MINES_PLANTING_SPEED_MULT = 0.025,						-- Value used to overall balance of the speed of planting naval mines
	NAVAL_MINES_SWEEPING_SPEED_MULT = 0.025,						-- Value used to overall balance of the speed of sweeping naval mines
	NON_CORE_STRATEGIC_IMPACT = 0.5,                                -- multiplier for strategic impact of non-core bombing
	RECON_LAND_SPOT_CHANCE = 0.02,                     				-- scale factor on spotting lan

	REINFORCEMENT_DISABLING_DURATION_IN_LAND_CARRIER_TRANSFER = 48,	-- The reinforcement disabling duration in hours when transfering from land to carrier and vice versa

	THRUST_WEIGHT_AGILITY_FACTOR = 0.5,								-- For plane designs, additive agility bonus per point of thrust exceeding weight
	MAX_QUICK_WING_SELECTION = 3,									-- Max possible selection for airwing quick deploy

	USE_SINGLE_NAVAL_ARMAMENT_CATEGORY = true,						-- If true, only the armament module category that inflicts the greatest damage to naval targets will contribute naval strike and port strike mission specific stats. Only modules with both naval_strike_attack and naval_strike_targetting are considered. This is used to prevent torpedo_mounting and bomb_locks stats from stacking.

	PORT_STRIKE_DAMAGE_FACTOR = 1.0,								-- How much damage is dealt to ports during a port strike (per plane damage [complex number] * num flying planes * define)
},

NAir = { --空军
	AIR_WING_FLIGHT_SPEED_MULT = 0.02,					-- 飞机全局速度倍率（影响转移至其他基地的速度）
	AIR_WING_MAX_STATS_ATTACK = 100,					-- 飞机属性最大值：攻击力
	AIR_WING_MAX_STATS_DEFENCE = 100,					-- 防御力
	AIR_WING_MAX_STATS_AGILITY = 100,					-- 机动性
	AIR_WING_MAX_STATS_SPEED = 800,						-- 最大速度
	AIR_WING_MAX_STATS_BOMBING = 100,					-- 轰炸能力
	AIR_WING_MAX_SIZE = 1000, 							-- 一个空军联队最多容纳的飞机数量
	AIR_WING_AVERAGE_SIZE = 100, 						-- 估算的联队平均飞机数量，用于志愿空军计算
	AIR_WING_BOMB_DAMAGE_FACTOR = 2,					-- 轰炸伤害的平衡系数
	BIGGEST_AGILITY_FACTOR_DIFF = 4.0,					-- 机动性差异的最大倍数（用于伤害计算）
	BIGGEST_SPEED_FACTOR_DIFF = 3.5,					-- 速度差异的最大倍数（用于伤害计算）
	TOP_SPEED_DAMAGE_BONUS_FACTOR = 0.025,				-- 速度优势转化为伤害加成的系数
	COMBAT_DAMAGE_STATS_MULTILPIER = 0.2,
	COMBAT_BETTER_AGILITY_DAMAGE_REDUCTION = 0.45, 		-- 机动性高于敌方时的伤害减免比例
	COMBAT_BETTER_SPEED_DAMAGE_INCREASE = 0.65, 		-- 速度高于敌方时的伤害加成比例
														-- 以上两个值与对应的最大差异倍数共同决定最终伤害修正
	COMBAT_MAX_WINGS_AT_ONCE = 10000, 					-- 一次空战模拟中最多参与的联队数量，影响战斗节奏
	COMBAT_MAX_WINGS_AT_GROUND_ATTACK = 10000,			-- 地面攻击时可投入的最大联队数
	COMBAT_MAX_WINGS_AT_ONCE_PORT_STRIKE = 10000,		-- 港口攻击时可投入的最大联队数
	AIR_REGION_SUPERIORITY_PIXEL_SCALE = 0.04,			-- 空优比例计算公式：空优值 / (像素数 * 该系数)
	COMBAT_MULTIPLANE_CAP = 3.0,						-- 每架敌机最多可被多少架我方飞机攻击
	COMBAT_DAMAGE_SCALE = 1,							-- 空战伤害倍率，越高则击落越多
	COMBAT_DAMAGE_SCALE_CARRIER = 5,					-- 海战中航母飞机的伤害倍率
	DETECT_CHANCE_FROM_OCCUPATION = 0.10, 				-- 控制区域对空中探测的基础影响
	DETECT_CHANCE_FROM_RADARS = 0.5, 					-- 雷达对探测概率的影响
	DETECT_CHANCE_FROM_AIRCRAFTS_EFFECTIVE_COUNT = 3000, -- 区域内飞机达到此数量时获得最大探测加成
	DETECT_CHANCE_FROM_AIRCRAFTS = 0.8,					-- 区域内飞机对探测概率的加成（上限由有效数量决定）
	DETECT_CHANCE_FROM_NIGHT = -0.2,					-- 夜间对探测概率的惩罚（天气影响参考静态修正）
	DETECT_EFFICIENCY_BASE = 0.1,						-- 探测效率的基础值（探测到后，表示实际探测到的飞机比例）
	DETECT_EFFICIENCY_FROM_RADAR = 0.7,					-- 雷达对探测效率的影响
	DETECT_EFFICIENCY_RANDOM_FACTOR = 0.1,				-- 探测飞机数量的随机波动
	DAY_NIGHT_COVERAGE_FACTOR = 0.5,					-- 夜间覆盖率低于此值时仍视为白天，用于判断是否执行昼间任务
	HOURS_DELAY_AFTER_EACH_COMBAT = 4,					-- 每次空战后需等待多少小时才能再次参战（往返时间，实际为双倍）
	PORT_STRIKES_DELAY_MULTIPLIER = 2,					-- 港口攻击时延迟倍率（乘以 HOURS_DELAY_AFTER_EACH_COMBAT）
	CARRIER_HOURS_DELAY_AFTER_EACH_COMBAT = 3,			-- 航母飞机在海战中的参战间隔
	CARRIER_SIZE_STAT_INCREMENT = 10,					-- 每点航母容量可搭载的飞机数量
	MISSILE_LAUNCHER_CAPACITY = 10,						-- 每格导弹发射器可携带的导弹数量
	MISSILE_LAUNCHER_SLOTS = 1,							-- 导弹发射器单位拥有的导弹槽数量
	NAVAL_STRIKE_TARGETTING_TO_AMOUNT = 0.3,			-- 将海军打击目标属性转换为成功打击飞机数量的平衡值
	NAVAL_STRIKE_DAMAGE_TO_STR = 1.0,					-- 海军打击伤害转换为敌方船只强度损失的倍率
	NAVAL_STRIKE_DAMAGE_TO_ORG = 1.5,					-- 海军打击伤害转换为敌方船只组织度损失的倍率
	NAVAL_STRIKE_CARRIER_MULTIPLIER = 10.0,				-- 航母参与海战时的伤害加成（因起降效率更高）
	FIELD_EXPERIENCE_SCALE = 0.0004,
	FIELD_EXPERIENCE_MAX_PER_DAY = 2,					-- 每日最多可获得的空战经验
	CLOSE_AIR_SUPPORT_EXPERIENCE_SCALE = 0.0005,		-- 近距空中支援经验倍率
	PARADROP_EXPERIENCE_SCALE = 0.03,					-- 空降任务经验倍率
	BOMBING_DAMAGE_EXPERIENCE_SCALE = 0.0002,			-- 轰炸任务经验倍率

	EXPERIENCE_SCALE_ATTACK_LOGISTICS_NO_TRUCK_CONSUMERS = 0.0001, -- 攻击非摩托化单位的补给经验倍率
	EXPERIENCE_SCALE_ATTACK_LOGISTICS_NODE_AND_TRAINS = 0.0002,    -- 攻击补给节点/列车的经验倍率
	EXPERIENCE_SCALE_ATTACK_LOGISTICS_TRUCKS = 0.0002,             -- 攻击卡车的经验倍率

	FIELD_EXPERIENCE_FACTOR = 0.7,						-- 所有任务经验获得的全局倍率

	AI_ALLOWED_PLANES_KEPT_IN_RESERVE = 0.10,			-- AI 保留的预备飞机比例，溢出部分将分配至下一个有效任务

	ACCIDENT_CHANCE_BASE = 0.1,							-- 基础事故概率 %（受可靠性影响）
	ACCIDENT_CHANCE_CARRIER_MULT = 1.5,					-- 航母起降时事故概率倍率
	ACCIDENT_CHANCE_BALANCE_MULT = 0.10,				-- 全局事故频率平衡倍率
	ACCIDENT_CHANCE_RELIABILITY_MULT = 2.0,				-- 每点缺失的可靠性增加的事故概率倍率
	ACCIDENT_EFFECT_MULT = 0.007,						-- 事故影响的平衡倍率
	ACE_DEATH_CHANCE_BASE = 0.005,						-- 王牌飞行员在空战中阵亡的基础概率 %
	ACE_DEATH_BY_OTHER_ACE_CHANCE = 1.0,				-- 被敌方王牌击落的额外阵亡概率
	ACE_DEATH_CHANCE_PLANES_MULT = 0.001,				-- 单次空战中损失飞机越多，王牌阵亡概率越高
	AIR_AGILITY_TO_NAVAL_STRIKE_AGILITY = 0.02,			-- 飞机机动性转换为海军打击机动的系数（用于平衡舰船防空）
	ACE_EARN_CHANCE_BASE = 0.01,						-- 王牌生成的基础概率 %
	ACE_EARN_CHANCE_PLANES_MULT = 0.005,				-- 每架飞机的王牌生成概率（因小数精度限制，会计算两次）
	AIR_DAMAGE_TO_DIVISION_LOSSES = 1.0,				-- 空战伤害转换为部队损失的系数（用于统计）
	AIR_NAVAL_KAMIKAZE_DAMAGE_MULT = 20.0,				-- 神风特攻伤害倍率
	AIR_NAVAL_KAMIKAZE_LOSSES_MULT = 4.0,				-- 神风特攻损失倍率
	BASE_KAMIKAZE_DAMAGE = 2.0,							-- 神风基础死亡率
	BASE_KAMIKAZE_TARGETING = 2.0,						-- 神风命中率修正
	BASE_STRATEGIC_BOMBING_HIT_SHIP_CHANCE = 0.01,		-- 轰炸港口时命中舰船的概率
	BASE_STRATEGIC_BOMBING_HIT_SHIP_DAMAGE_FACTOR = 50, -- 轰炸命中舰船时的伤害倍率
	BASE_STRATEGIC_BOMBING_HIT_PLANE_CHANCE = 0.5,		-- 轰炸机场时命中飞机的概率
	BASE_STRATEGIC_BOMBING_HIT_PLANE_DAMAGE_FACTOR = 0.2, -- 轰炸命中飞机时的伤害倍率
	AGGRESSION_THRESHOLD = { 0.0, 0.25, 0.5 },			-- 任务攻击性的阈值等级（低、中、高）

	ACE_WING_SIZE =	100,								-- 王牌加成基于的联队规模（小于此值时加成更高）
	ACE_WING_SIZE_MAX_BONUS = 2,						-- 小联队王牌加成的上限倍数
	NO_SEARCH_MISSION_DETECT_FACTOR = -0.5,				-- 未执行搜索任务的飞机对探测的惩罚
	SUPPLY_NEED_FACTOR = 0.28, 							-- 补给需求倍率
	SUPPLY_PRIO_FACTOR = 100.0,							-- 补给需求对空运目标省份选择的影响
	CAPACITY_PENALTY = 2,								-- 基地拥挤的惩罚倍率
	AIR_COMBAT_FINAL_DAMAGE_SCALE = 0.015,				-- 空战中最大被击落比例（仅用于“混乱”状态的飞机）
	AIR_COMBAT_FINAL_DAMAGE_PLANES = 50,				-- 当飞机数量极少时，控制伤害计算的最小值
	AIR_COMBAT_FINAL_DAMAGE_PLANES_FACTOR = 0.1,
	AA_INDUSTRY_AIR_DAMAGE_FACTOR = -0.12,				-- 工业防空对轰炸的防御效果（5 级 = 60% 减伤）
	NAVAL_STRIKE_DETECTION_BALANCE_FACTOR = 0.5,		-- 平衡海军打击探测概率的倍率（防止过度触发）
	NAVAL_RECON_DETECTION_BALANCE_FACTOR = 0.5,			-- 平衡海军侦察探测概率的倍率
	LEND_LEASED_EQUIPMENT_EXPERIENCE_GAIN = 0.5,		-- 租借装备获得的经验倍率
	ANTI_AIR_PLANE_DAMAGE_FACTOR = 0.8,					-- 防空炮对飞机的伤害倍率
	ANTI_AIR_PLANE_DAMAGE_CHANCE = 0.1,					-- 防空炮命中概率
	ANTI_AIR_ATTACK_TO_DAMAGE_REDUCTION_FACTOR = 1.0,	-- 防空攻击转换为减伤修正的倍率
	ANTI_AIR_MAXIMUM_DAMAGE_REDUCTION_FACTOR = 0.75,	-- 拥有防空单位的部队最多可减少 75% 的空袭伤害
	AIR_DEPLOYMENT_DAYS = 2,							-- 部署一个空军联队所需天数
	NAVAL_STRIKE_BASE_STR_TO_PLANES_RATIO = 0.03,		-- 港口攻击时可投入的轰炸飞机比例（相对于船只强度）
	NAVAL_COMBAT_EXTERNAL_PLANES_JOIN_RATIO = 0.05,		-- 海战中外部飞机可参战的比例（相对于舰船总强度）
	NAVAL_COMBAT_EXTERNAL_PLANES_JOIN_RATIO_PER_DAY = 0.2, -- 每日新增参战飞机比例上限
	NAVAL_COMBAT_EXTERNAL_PLANES_MIN_CAP = 20,			-- 海战参战飞机数量下限

	AIR_MORE_GROUND_CREWS_COST = 20.0,					-- 维持更多地勤所需的指挥点数（CP）
	AIR_MORE_GROUND_CREWS_BOOST = 0.1,					-- 更多地勤的效率加成

	EFFICIENCY_REGION_CHANGE_PENALTY_FACTOR = 0.9,		-- 更换区域时的效率惩罚倍率
	-- 每次增益应为 0.024 的倍数，以保证精度
	EFFICIENCY_REGION_CHANGE_DAILY_GAIN_DEFAULT = 1,	-- 默认每日恢复的效率（每小时应用）
	EFFICIENCY_REGION_CHANGE_DAILY_GAIN_CAS = 0.888,				-- 近距支援每日效率恢复
	EFFICIENCY_REGION_CHANGE_DAILY_GAIN_NAVAL_BOMBER = 0.192,		-- 海军轰炸机每日效率恢复
	EFFICIENCY_REGION_CHANGE_DAILY_GAIN_TACTICAL_BOMBER = 0.192,	-- 战术轰炸机每日效率恢复
	EFFICIENCY_REGION_CHANGE_DAILY_GAIN_FIGHTER = 0.888,			-- 战斗机每日效率恢复
	EFFICIENCY_REGION_CHANGE_DAILY_GAIN_STRATEGIC_BOMBER = 0.072,	-- 战略轰炸机每日效率恢复
	EFFICIENCY_REGION_CHANGE_DAILY_GAIN_MARITIME_PATROL_PLANE = 1, -- 海上巡逻机每日效率恢复

	AIR_WING_XP_MAX = 1000.0, 							-- 单架飞机最大经验值
	AIR_WING_XP_LEVELS = { 100, 300, 700, 900 }, 			-- 每级所需经验
	AIR_WING_XP_LOSS_WHEN_KILLED = 300,					-- 飞机被击落时视为损失的经验（用于重新计算平均经验）
	AIR_WING_XP_TRAINING_MAX = 300.0, 					-- 训练可获得的最大平均经验

	AIR_WING_XP_TRAINING_MISSION_GAIN_DAILY = 7.0, 		-- 每日训练任务获得的经验
	AIR_WING_XP_AIR_VS_AIR_COMBAT_GAIN = 0.8, 			-- 空战获得的经验
	AIR_WING_XP_GROUND_MISSION_COMPLETED_GAIN = 0.28, 	-- 完成轰炸/支援/布雷等任务获得的经验
	AIR_WING_XP_RECON_MISSION_COMPLETED_GAIN = 0.05, 	-- 侦察任务获得的经验

	AIR_WING_COUNTRY_XP_FROM_TRAINING_FACTOR = 0.003, 	-- 国家空军经验从训练中获得的倍率
	AIR_WING_XP_TRAINING_MISSION_ACCIDENT_FACTOR = 0.2, -- 训练任务事故概率倍率
	AIR_WING_XP_LOSS_REDUCTION_OVER_FRIENDLY_TERRITORY_FACTOR = 0.3, -- 在友方领土上损失经验减少

	DISRUPTION_FACTOR = 4.0,							-- 混乱伤害的倍率（影响飞机）
	DISRUPTION_FACTOR_CARRIER = 6.0,					-- 航母空战中混乱伤害倍率
	DISRUPTION_SPEED_FACTOR = 1.0,
	DISRUPTION_AGILITY_FACTOR = 0.0,
	DISRUPTION_ATTACK_FACTOR = 0.0,
	DISRUPTION_DETECTION_FACTOR = 1.0,
	ESCORT_FACTOR = 2.0,
	ESCORT_SPEED_FACTOR = 1.0,
	ESCORT_AGILITY_FACTOR = 1.0,
	ESCORT_ATTACK_FACTOR = 1.0,
	DISRUPTION_DEFENCE_DEFENCE_FACTOR = 0.5,
	DISRUPTION_DEFENCE_SPEED_FACTOR = 1.0,
	DISRUPTION_DEFENCE_ATTACK_FACTOR = 0.5,

	CARRIER_PLANES_AMOUNT_FOR_POSITIONING = 50,			-- 航母飞机低于此数量时，不再获得最大敌方定位惩罚减免

	CAS_NIGHT_ATTACK_FACTOR = 0.1,						-- 夜间近距支援伤害倍率

	AIR_WING_ATTACK_LOGISTICS_NO_TRUCK_DISRUPTION_FACTOR = 0.02, -- 攻击非摩托化单位的补给混乱倍率
	AIR_WING_ATTACK_LOGISTICS_TRUCK_DAMAGE_FACTOR = 0.27, -- 攻击卡车的伤害倍率
	AIR_WING_ATTACK_LOGISTICS_INFRA_DAMAGE_SPILL_FACTOR = 0.0016, -- 卡车伤害溢出至基础设施的比例
	AIR_WING_ATTACK_LOGISTICS_TRAIN_DAMAGE_FACTOR = 0.040, -- 攻击列车的伤害倍率
	AIR_WING_ATTACK_LOGISTICS_TRAIN_DAMAGE_DISRUPTION_MITIGATION = 6.0, -- 列车伤害受混乱影响的平滑系数
	AIR_WING_ATTACK_LOGISTICS_TRAIN_DAMAGE_DISRUPTION_SMOOTHING = 5.0,
	AIR_WING_ATTACK_LOGISTICS_RAILWAY_DAMAGE_SPILL_FACTOR = 0.006, -- 列车伤害溢出至铁路的比例

	AIR_WING_ATTACK_LOGISTICS_DISRUPTION_MIN_DAMAGE_FACTOR = 0.1, -- 最小混乱伤害倍率（从 1.0 线性降至该值）
	AIR_WING_ATTACK_LOGISTICS_MAX_DISRUPTION_DAMAGE_TO_CONSIDER = 15.0, -- 最大混乱伤害参考值
	AIR_WING_ATTACK_LOGISTICS_DIRECT_DISRUPTION_DAMAGE_FACTOR = 0.01, -- 直接对补给造成的混乱伤害（不依赖击杀列车）

	AIR_WING_ATTACK_LOGISTICS_TRUCK_MAX_FACTOR = 0.3, -- 单次后勤打击可摧毁卡车的最大比例

	SECONDARY_DAMAGE_STRAT = 0.2,  -- 战略轰炸对铁路炮的二次伤害比例
	SECONDARY_DAMAGE_LOGISTICS = 1.0, -- 后勤打击对铁路炮的二次伤害比例

	INTERCEPTION_DISTANCE_SCALE = 50, -- 路径长度达到此像素时，拦截效率为 100%（线性插值）
	INTERCEPTION_DAMAGE_SCALE = 0.3, -- 拦截伤害倍率（最大距离时的上限）

	MIN_PLANE_COUNT_PARADROP = 50, -- 空降所需最少飞机数量
	MIN_PLANE_COUNT_AIR_SUPPLY = 1, -- 空运所需最少飞机数量
	BASE_UNIT_WEIGHT_IN_TRANSPORT_PLANES = 45.0, -- 每架运输机的单位运力（用于空降/空运）

	MANPOWER_LOSS_RATIO_PLANE_SHOT = 0.10, -- 飞机被击落时的人力损失比例
	
	MISSION_COMMAND_POWER_COSTS = {  -- 创建任务时每架飞机消耗的指挥点数
		0.0, -- 空中优势
		0.0, -- 近距支援
		0.0, -- 拦截
		0.0, -- 战略轰炸
		0.0, -- 海军轰炸
		0.0, -- 投核弹
		0.0, -- 空降
		0.0, -- 神风特攻
		0.0, -- 港口打击
		0.0, -- 攻击后勤
		0.05, -- 空中补给
		0.0, -- 训练
		0.0, -- 布雷
		0.0, -- 扫雷
		0.0, -- 侦察
		0.0, -- 海上巡逻
		0.0, -- 弹幕轰炸
		0.0, -- 核打击
		0.0, -- 地对空导弹
	},

	MISSION_FUEL_COSTS = {  -- 每个任务每架飞机的燃料消耗
		1.0, -- 空中优势
		1.0, -- 近距支援
		0.2, -- 拦截
		1.0, -- 战略轰炸
		1.0, -- 海军轰炸
		1.0, -- 投核弹
		1.0, -- 空降
		0.75, -- 神风特攻
		1.2, -- 港口打击
		1.2, -- 攻击后勤
		1.0, -- 空中补给
		0.6, -- 训练
		1.0, -- 布雷
		1.0, -- 扫雷
		1.0, -- 侦察
		1.0, -- 海上巡逻
		0.0, -- 弹幕轰炸
		0.0, -- 核打击
		0.0, -- 地对空导弹
	},
	MAX_FUEL_FLOW_MULT = 1.0, -- 飞机最大燃料流量倍率（受补给影响）

	FUEL_COST_MULT = 0.35, -- 所有任务燃料消耗的全局倍率

	MISSION_EFFICIENCY_MULT_AT_LACK_OF_FUEL = 0.25, -- 基地缺油时的任务效率惩罚倍率

	STRATEGIC_BOMBING_PROV_BUILD_PRIO_SCALE = 1.5, -- 战略轰炸中省份建筑优先级倍率
	STRATEGIC_BOMBING_STATE_BUILD_PRIO_SCALE = 1.5, -- 战略轰炸中州建筑优先级倍率
	STRATEGIC_BOMBING_INFRA_PRIO_SCALE = 0.7, -- 基础设施优先级倍率
	STRATEGIC_BOMBING_RAILWAY_PRIORITY_SCALE = 0.2, -- 铁路优先级倍率
	STRATEGIC_BOMBING_STATE_BUILDING_SCALE = 1.0, -- 州建筑优先级倍率
	
	NAVAL_MINES_PLANTING_SPEED_MULT = 0.025, -- 布雷速度倍率
	NAVAL_MINES_SWEEPING_SPEED_MULT = 0.025, -- 扫雷速度倍率
	NON_CORE_STRATEGIC_IMPACT = 0.5, -- 非核心地区战略轰炸影响倍率
	RECON_LAND_SPOT_CHANCE = 0.02, -- 侦察机发现地面单位概率倍率

	REINFORCEMENT_DISABLING_DURATION_IN_LAND_CARRIER_TRANSFER = 48, -- 飞机在陆地与航母间转移时，增援暂停时间（小时）

	THRUST_WEIGHT_AGILITY_FACTOR = 0.5, -- 飞机设计中，每点推力超出重量时增加的机动性
	MAX_QUICK_WING_SELECTION = 3, -- 快速部署空军联队时的最大可选数量

	USE_SINGLE_NAVAL_ARMAMENT_CATEGORY = true, -- 若启用，仅使用对海军目标伤害最高的武器模块类别（防止鱼雷与炸弹叠加）

	PORT_STRIKE_DAMAGE_FACTOR = 1.0, -- 港口打击对港口造成的伤害倍率（每架飞机伤害 * 数量 * 该系数）
}