NCountry = {
	EVENT_PROCESS_OFFSET = 20,						-- Events are checked every X day per country or state (1 is ideal, but CPU heavy)
	BASE_RESEARCH_SLOTS = 2,						-- Base number of research slots per country.
	POPULATION_YEARLY_GROWTH_BASE = 0.015,			-- basic population growth per year, used for monthly manpower gain
	RESISTANCE_STRENGTH_FROM_VP = 0.001,			-- How much strength ticking speed gives each VP score.
	RESISTANCE_STRENGTH_FROM_NEIGHBORS = 0.5, 		-- Multiplies how much resistance can spread from one state to its neighbors, a state will spread whatever is highest of its victorypoints resistance increase or half of any of its neighbors spread, multiplied by this
	RESISTANCE_DECAY_WHEN_NO_GROWTH = 0.005,		-- Resistance will fall by this much each day if there is nothing increasing it ( no VPs and no spread from neighbors )
	REINFORCEMENT_DIVISION_PRIORITY_COUNT = 3, 		-- How many priority stages we have in division template? 0)Reserves, 1)Normal, 2)Elite.
	REINFORCEMENT_DIVISION_PRIORITY_DEFAULT = 1, 	-- Each template by default is 1)Normal
	REINFORCEMENT_THEATER_GROUP_PRIORITY_DEFAULT = 1,-- Each theater group by default is 1)Normal
	REINFORCEMENT_THEATRE_PRIORITY_COUNT = 3,		-- Same as with divisions...
	REINFORCEMENT_THEATRE_PRIORITY_DEFAULT = 1,
	REINFORCEMENT_AIRBASE_PRIORITY_COUNT = 3,
	REINFORCEMENT_AIRBASE_PRIORITY_DEFAULT = 1,
	REINFORCEMENT_DELIVERY_SPEED_MIN = 0.6,			-- The distance from the supply region to capital should affect the speed only a little bit. Main factor for penalty is overcrowded areas, and not the route length.
	REINFORCEMENT_EQUIPMENT_DELIVERY_SPEED = 0.3,	-- Modifier for army equipment reinforcement speed
	REINFORCEMENT_MANPOWER_DELIVERY_SPEED = 10.0,	-- Modifier for army manpower reinforcement delivery speed (travel time)
	REINFORCEMENT_MANPOWER_CHUNK = 0.1,				-- Chunk size of manpower reinforcement delivery, in % of total manpower needed by the template.
	EQUIPMENT_UPGRADE_CHUNK_MAX_SIZE = 10,			-- Maximum chunk size of equipment upgrade distribution per update.
	COUNTRY_SCORE_MULTIPLIER = 1.0,					-- Weight of the country score.
	ARMY_SCORE_MULTIPLIER = 0.15,					-- Based on number of armies.
	NAVY_SCORE_MULTIPLIER = 1.0,					-- Based on number of navies.
	AIR_SCORE_MULTIPLIER = 0.1,						-- Based on number of planes (which is typically a lot).
	INDUSTRY_SCORE_MULTIPLIER = 1.0,				-- Based on number of factories.
	PROVINCE_SCORE_MULTIPLIER = 0.1,				-- Based on number of controlled provinces.
	NUCLEAR_BOMB_DROP_WAR_SUPPORT_EFFECT_MAX_INFRA = 0.2,		-- Reduce enemy national war support on nuking a province, the value scales with infrastructure up to this number
	NUCLEAR_BOMB_DROP_WAR_SUPPORT_EFFECT_MAX_VP = 3,			-- War support will be scaled down if there's less VP than this in the province
	THERMONUCLEAR_BOMB_DROP_WAR_SUPPORT_EFFECT_MAX_INFRA = 0.2,	-- Reduce enemy national war support on nuking a province, the value scales with infrastructure up to this number
	THERMONUCLEAR_BOMB_DROP_WAR_SUPPORT_EFFECT_MAX_VP = 3,		-- War support will be scaled down if there's less VP than this in the province
	WEEKLY_STABILITY_GAIN = 0.0,
	WEEKLY_WAR_SUPPORT_GAIN = 0.0,
	SUPPLY_CONVOY_FACTOR = 0.25,					-- How many convoys each supply needs
	CONVOY_RANGE_FACTOR = 1,                        -- How much range affects convoy need for resource trades and supply
	CONVOY_LENDLEASE_RANGE_FACTOR = 1,				-- How much range affects convoy need for lend lease
	CONVOY_INTERNATIONAL_MARKET_RANGE_FACTOR = 1,	-- How much range affects convoy need for international market
	LOCAL_MANPOWER_ACCESSIBLE_NON_CORE_FACTOR = 0.02,  -- accessible recruitable factor base
	MAX_NON_CORE_MANPOWER_FACTOR = 1.0,				-- max clamp for recruitable local non core manpower factor for states
	DEFAULT_STABILITY = 0.5,						-- Default stability if not scripted otherwise.
	DEFAULT_WAR_SUPPORT = 0.5,						-- Default war support if not scripted otherwise.
	BASE_STABILITY_WAR_FACTOR = -0.2,				-- Default stability war factor
	BASE_STABILITY_PARTY_POPULARITY_FACTOR = 0.15,	-- Default stability rulling party popularity factor
	MIN_COUP_STABILITY_FACTOR = 0.0,				-- Min value of coup factor in stability
	MAX_COUP_STABILITY_FACTOR = 2.0,				-- Max value of coup factor in stability
	MIN_COUP_SUCCESS_STABILITY = 0.8,				-- Max stability when coup will happen
	WAR_SUPPORT_OFFNSIVE_WAR = -0.2,				-- Impact of being in offensive war
	WAR_SUPPORT_DEFENSIVE_WAR = 0.2,				-- Impact of being in defensive war
	WAR_SUPPORT_TENSION_IMPACT = 0.4,				-- Total impact of world tension
	MIN_STABILITY = 0.0,
	MAX_STABILITY = 1.0,
	MIN_WAR_SUPPORT = 0.0,
	MAX_WAR_SUPPORT = 1.0,
	FRONT_PROVINCE_SCORE = 20,    					-- Max province score of a front. Used for the hostile troop alert
	MAJOR_IC_RATIO = 3,                             -- difference in total factories needed to be considered major with respect to other nation
	MAJOR_MIN_FACTORIES = 35,						-- need at least these many factories to become a major
	MAX_INTELLIGENCE_DIFFERENCE = 10.0,				-- (Old Intel) Max difference in intelligence levels between countries
	INTEL_FROM_ALLIANCE_FACTOR = 0.3,				-- Multiplied to the difference between a country intel and the maximum value in the alliance to compute the amount of intel that flows from the alliance to that country. 0 means no alliance contribution, 1 means a country intel's is the same as the max in the alliance.
	MAX_INTELLIGENCE_DATA_DEVIATION = 1.0,          -- (Old Intel) Max deviation in estimating default espionage values ( 0.0 - 1.0 )
	MAX_INTELLIGENCE_MILITARY_DATA_DEVIATION = 1.0, -- (Old Intel) Max deviation in estimating enemy military units amount ( 0.0 - 1.0 )
	MAX_INTELLIGENCE_NAVY_DATA_DEVIATION = 0.3,		-- (Old Intel) Max deviation in estimating enemy ships amount ( 0.0 - 1.0 )
	MAX_INTELLIGENCE_AIR_DATA_DEVIATION = 1.0,		-- (Old Intel) Max deviation in estimating enemy air planes amount ( 0.0 - 1.0 )
	MAX_INTELLIGENCE_CONVOY_DATA_DEVIATION = 0.3,	-- (Old Intel) Max deviation in estimating enemy convoys amount ( 0.0 - 1.0 )
	MAX_INTELLIGENCE_MANPOWER_DATA_DEVIATION = 0.4,	-- (Old Intel) Max deviation in estimating enemy total manpower amount ( 0.0 - 1.0 )
	MAX_INTELLIGENCE_FIELDED_MANPOWER_DATA_DEVIATION = 0.35, -- (Old Intel) Max deviation in estimating enemy fielded manpower amount ( 0.0 - 1.0 )
	MAX_INTELLIGENCE_INDUSTRY_DATA_DEVIATION = 0,4, -- (Old Intel) Max deviation in estimating enemy total industry
	MIN_MANPOWER_RATIO = 0.15,						-- Min manpower ratio to show manpower alert
	ARMY_IMPORTANCE_FACTOR = 5.0,					-- Army factor for AI and calculations
	TERRAIN_IMPORTANCE_FACTOR = 5.0,				-- Terrain base factor for state strategic value
	VICTORY_POINTS_IMPORTANCE_FACTOR = 5.0,			-- State victory points importance factor for AI and calculations
	BUILDING_IMPORTANCE_FACTOR = 3.0,				-- State building importance factor for AI and calculations
	RESOURCE_IMPORTANCE_FACTOR = 1.0,				-- State resource importance factor for AI and calculations
	INTERPOLATED_FRONT_STEPS_SHORT = 2,				-- Performance optimization - The amount of steps for interpolated fronts. Non-AI countries got full interpolated fronts, the rest has optimized version of it.
	MIN_AIR_RESERVE_RATIO = 0.33,					-- Min manpower ratio to show air reserves alert
	POLITICAL_POWER_LOWER_CAP = -500.0,				-- Min amount of political power country should have
	POLITICAL_POWER_UPPER_CAP = 2000.0,				-- Max amount of political power country should have
	RESISTANCE_IMPORTANT_LEVEL = 0.25,				-- Level when resistance becomes dangerous
	RESISTANCE_IMPORTANT_COUNTRY_LEVEL = 0.25,		-- Level when average resistance in a country becomes dangerous
	MIN_MAJOR_COUNTRIES	= 7,						-- MIN_MAJOR_COUNTRIES countries with most factories will be considered as major countries
	ADDITIONAL_MAJOR_COUNTRIES_IC_RATIO = 0.7,		-- Countries will also be considered major when having more factories that the average of top MIN_MAJOR_COUNTRIES countries' factories times ADDITIONAL_MAJOR_COUNTRIES_IC_RATIO
	BASE_TENSION_MAJOR_COUNTRY_INDEX = 1,			-- Which major country should be considered the base country when scaling generated world tension. 0 is the country with the most factories, 1 is the second most-factories country etc. This number has to be lower than MIN_MAJOR_COUNTRIES
	MIN_NAVAL_SUPPLY_EFFICIENCY = 0.1,				-- Min ratio when supplies will be considered delivered from the capital by naval path
	PARADROP_AIR_SUPERIORITY_RATIO = 0.7,			-- Min ratio of air superiority for paradropping
	STATE_VALUE_BASE = 10.0,                        -- Base value of a state (value is used to determine costs in e.g. peace conferences)
	STATE_VALUE_BUILDING_SLOTS_MULT = 4.0,          -- The value of each building slot in a state
	STATE_VALUE_MANPOWER_FACTOR = 0.1,              -- State cost increases with this for every 10k population (so 3.1M becomes 310 and then multiplied by this)
	INVASION_REPORT_EXPERATION_DAYS = 30,			-- Invasion experation days
	MIN_FOCUSES_FOR_CONTINUOUS = 10,				-- Focuses needed to unlock continuous focuses
	AUTONOMOUS_TOTAL_SCORE = 5000,					-- Total score for autonomous scale
	AUTONOMOUS_SPILLOVER = 0.025,					-- Total score that can be saved to reach next level
	CIVIL_WAR_INVOLVEMENT_MIN_TENSION = 0.5,		-- base value of world tension to involve other sides to the civil war
	UNCAPITULATE_LEVEL = 0.1,                       -- if we reclaim this much and our capital we reset capitulate status
	BASE_SURRENDER_LIMIT = 0.8,						-- Base level of occupation required for country surrender
	SURRENDER_LIMIT_MULT_FOR_COUNTRIES_WITH_NO_CORES = 0.7, -- Countries with no owned cores will their surrender level multiplied by this amount
	MIN_SURRENDER_LIMIT = 0.2,						-- Minimum non-forced surrender limit. valid 0-1
	BASE_MOBILIZATION_SPEED = 0.01,					-- Base speed of manpower mobilization  #in 1/1000 of 1 %

	INTERCEPTION_WAR_SUPPORT_SCALE = 0.00001,		-- Scaling of interceptions to war support impact
	INTERCEPTION_BOMBING_WAR_SUPPORT_IMPACT = 0.3,	-- Max impact of interceptions on the war support

	BOMBING_WAR_SUPPORT_PENALTY_SCALE = -0.00015, 			-- Scaling of bomber damage to war support impact, will be added weekly as a war support penalty
	MAX_BOMBING_WEEKLY_WAR_SUPPORT_PENALTY = -0.006,		-- Max penalty that will gained per week from bomber's damage
	BOMBING_WEEKLY_WAR_SUPPORT_PENALTY_DECAY = 0.001,		-- Weekly decay of bomber damage war support penalty
	MAX_BOMBING_WAR_SUPPORT_IMPACT = -0.3,					-- Max total penalty from bomber's damage

	HEROES_BEING_KILLED_WAR_SUPPORT_PENALTY_SCALE = -0.03,			-- Scaling of war heroes manpower lost to war support impact, will be added weekly as a war support penalty
	MAX_HEROES_BEING_KILLED_WEEKLY_WAR_SUPPORT_PENALTY = -0.006,		-- Max penalty that will gained per week from war heroes manpower lost
	HEROES_BEING_KILLED_WEEKLY_WAR_SUPPORT_PENALTY_DECAY = 0.001,	-- Weekly decay of war heroes manpower lost war support penalty
	MAX_HEROES_BEING_KILLED_WAR_SUPPORT_IMPACT = -0.3,				-- Max total penalty from war heroes manpower lost
	WAR_SUPPORT_FROM_CASUALTIES = 0.025,							-- Base value (inverted) for calculating heroes being killed

	CONVOYS_BEING_RAIDED_WAR_SUPPORT_PENALTY_SCALE = -0.05,			-- Scaling of trade convoy raided to war support impact, will be added weekly as a war support penalty
	MAX_CONVOYS_BEING_RAIDED_WEEKLY_WAR_SUPPORT_PENALTY = -0.006,	-- Max penalty that will gained per week from trade convoy raided
	CONVOYS_BEING_RAIDED_WEEKLY_WAR_SUPPORT_PENALTY_DECAY = 0.001,	-- Weekly decay of trade convoy raided war support penalty
	MAX_CONVOYS_BEING_RAIDED_WAR_SUPPORT_IMPACT = -0.5,				-- Max total penalty from trade convoy raided

	FEMALE_UNIT_LEADER_BASE_CHANCE = {
		-- applies as a factor to female unit leader randomization
		-- the values needs to be zero if you don't actually have random portraits
		0.5, -- country leaders
		0.5, -- army leaders
		0.5, -- navy leaders
		0.5, -- air leaders
		0.5, -- operatives
		0.5, -- scientists
	},

	CONVOYS_SUNK_MULTIPLIER_FOR_WAR_SUPPORT = 0.2,	-- once a trade convoy ship sunk, you will get a larger negative impact on your war support
	CONVOYS_BEING_RAIDED_DAILY_WAR_SUPPORT_IMPACT_FROM_OVERSEA_STATES = 0.2,	-- resource transfer convoys convoys from our states being raided will give a daily war support penalty depending on how important that resource is and how inefficent convoys are
	CONVOYS_SUNK_MULTIPLIER_FOR_WAR_SUPPORT_FROM_OVERSEA_STATES = 0.2,			-- once a resource transfer convoys from our states ship sunk, you will get a larger negative impact on your war support
	CONVOYS_BEING_RAIDED_DAILY_WAR_SUPPORT_IMPACT = 0.2,	-- trade convoys being raided will give a daily war support penalty depending on how important that resource is and how inefficent convoys are

	MAX_PROPAGANDA_STABILITY_IMPACT = -0.2,			-- Max total penalty from operative performing the propaganda mission in a country
	MAX_PROPAGANDA_WAR_SUPPORT_IMPACT = -0.2,		-- Max total penalty from operative performing the propaganda mission in a country
	PROPAGANDA_STABILITY_DAILY_DECAY = 0.001,		-- Amount of stability recovered daily from propaganda effort
	PROPAGANDA_WAR_SUPPORT_DAILY_DECAY = 0.001,		-- Amount of war support recovered daily from war support effort

	NUM_DAYS_TO_FULLY_DELETE_STOCKPILED_EQUIPMENT = 90,	 -- time in days to fully delete equipments from stockpile. when you delete an equipment, they go to a temporary hidden pool which still can be seized
	AIR_SUPPLY_CONVERSION_SCALE = 0.01,				-- Conversion scale for planes to air supply
	AIR_SUPPLY_DROP_EXPIRATION_HOURS = 168,			-- Air drop length after being dropped
	STARTING_COMMAND_POWER = 0.0,					-- starting command power for every country
	BASE_MAX_COMMAND_POWER = 80.0,					-- base value for maximum command power
	BASE_COMMAND_POWER_GAIN = 0.4,					-- base value for daily command power gain
	AIR_VOLUNTEER_PLANES_RATIO = 0.2,				-- Ratio for volunteer planes available for sending in relation to sender air force
	AIR_VOLUNTEER_BASES_CAPACITY_LIMIT = 0.1,		-- Ratio for volunteer planes available for sending in relation to receiver air base capacity
	ATTACHE_XP_SHARE = 0.15,						-- Country received xp from attaches
	SPECIAL_FORCES_CAP_BASE = 0.05,					-- Max ammount of special forces battalions is total number of non-special forces battalions multiplied by this and modified by a country modifier
	SPECIAL_FORCES_CAP_MIN = 24,					-- You can have a minimum of this many special forces battalions, regardless of the number of non-special forces battalions you have, this can also be modified by a country modifier
	DAYS_OF_WAR_BEFORE_SURRENDER = 7,				-- Number of days a war has to have existed before anyone can surrender in it

	FUEL_LEASE_CONVOY_RATIO = 0.0005,				-- num convoys needed per fuel land lease

	STARTING_FUEL_RATIO = 0.25,						-- starting fuel ratio compared to max fuel for countries
	BASE_FUEL_GAIN_PER_OIL = 2,						-- base amount of fuel gained hourly per excess oil
	BASE_FUEL_GAIN = 2.0,							-- base amount of fuel gained hourly, independent of excess oil
	BASE_FUEL_CAPACITY = 50000,						-- base amount of fuel capacity

	SCORCHED_EARTH_STATE_COST = 5,					-- pp cost to scorch a state

	COUNTRY_MANPOWER_CAPITULATED_FREE_POOL_FACTOR = 0.1,	-- Factor on amount of normal manpower left for an exiled nation with no territory.
	COUNTRY_MANPOWER_CAPITULATED_CORE_GAIN_FACTOR = 0.001,	-- Factor on amount of normal manpower gained for the exile nation. From owned states that are controlled by an enemy. State manpower reduced by factor 1000 in code.
	COUNTRY_MANPOWER_CAPITULATED_NON_CORE_GAIN_FACTOR = 0.001,	-- Factor on amount of normal manpower gained for the exile nation. From owned states that are controlled by an enemy. State manpower reduced by factor 1000 in code.
	GIE_MAX_LEGITIMACY = 100, 								--Legitimacy max of a GiE
	GIE_CAPITULATE_MAX_STOCKPILE_TRANSFER = 0.1, 			-- 0-1 Transfers ratio of stockpile. from 0 to this define depending on starting legitimacy on capitulation.
	GIE_CAPITULATE_MIN_LEGIT_FOR_TRANSFER = 5, -- 0-100 Minimum starting legitimacy to transfer any equipment at all.
	GIE_CAPITULATION_LEGITIMACY_WARSCORE_FACTOR = 0.5,      -- Multiplies war contribution percent with this factor for part of starting legitimacy. (0.5 would mean a 50 % war contribution gives 25 more legitimacy)
	GIE_CAPITULATION_LEGITIMACY_WARLENGTH_FACTOR = 1.0,     -- Multiplies war length (nr of weeks) with this factor for part of starting legitimacy. (1.0 would mean a war length of 30 weeks gives 30 more legitimacy)
	GIE_WARSCORE_GAIN_LEGITIMACY_FACTOR = 1,		 		--Factor on how much legitimacy is gained from warscore earned by GiE units.
	GIE_HOST_CIC_FROM_LEGITIMACY_MAX = 5, 					--Host will receive from 0 to this value in CIC.
	GIE_HOST_MIC_FROM_LEGITIMACY_MAX = 5,					--Host will receive from 0 to this value in MIC.
	GIE_HOST_DOCKYARDS_FROM_LEGITIMACY_MAX = 0,				--Host will receive from 0 to this value in dockyards.
	GIE_VETERAN_MANPOWER_NON_CORE_GAIN_FACTOR = 0.005,	-- Factor on amount of manpower gained from owned states that are controlled by an enemy. State manpower reduced by factor 1000 in code.
	GIE_VETERAN_MANPOWER_CORE_GAIN_FACTOR = 0.01,	-- Factor on amount of manpower gained from owned states that are controlled by an enemy. State manpower reduced by factor 1000 in code.
	GIE_MANPOWER_TOTAL_MAX_FACTOR = 0.5,	-- Factor on max amount of exile manpower that can be gained from owned states. Approaching this will give diminishing returns. Reduced by factor 100 in code.
	GIE_MANPOWER_RATO_OF_MAX_START_PENALTY = 0.5,	--When this ratio of max manpower has been recruited we start applying the penalty.
	GIE_MANPOWER_GAIN_PENALTY_MAX = 0.95,	--Max penalty on exile manpower growth.
	GIE_EXILE_AIR_RECRUITMENT_LEGITIMACY = 50, 	--Legitimacy required to recruit exile airwings
	GIE_EXILE_AIR_START_EXPERIENCE = 3, 		--Starting experience for exile airwings
	GIE_EXILE_TROOP_RECRUITMENT_LEGITIMACY = 25, 	--Legitimacy required to recruit exile troops
	GIE_EXILE_TROOPS_DEPLOY_TRAINING_MAX_LEVEL = 2, 	--Max XP exile troops can receive from training
	GIE_EXILE_ARMY_LEADER_LEGITIMACY_LEVELS = {  	--Legitimacy levels where a new army leader is received.
		30,
		60,
		90,
	},
	GIE_EXILE_ARMY_LEADER_START_LEVEL = 3,	--Starting level for exile leader
	GIE_ESCAPING_DIVISIONS_TRANSFER_DAYS = 30, -- days to transfer escaping divisions to host nation
	GIE_ESCAPING_DIVISIONS_XP_BOOST = 0.4, -- Escaping divisions gain a boost to experience. Only the toughest motherbadasses will band together and survive to git me one hundred Nazi scalps ... Or die tryin'...
	GIE_DIVISION_ATTACK_BONUS_AGAINST_OCCUPIER = 0.1, -- Attack bonus factor against whoever occupies your core territory.
	GIE_DIVISION_DEFENSE_BONUS_AGAINST_OCCUPIER = 0.1, -- Attack bonus factor against whoever occupies your core territory.
	GIE_DIVISION_ATTACK_BONUS_ON_CORE = 0.1, -- Attack bonus factor when fighting on cores.
	GIE_DIVISION_DEFENSE_BONUS_ON_CORE = 0.1, -- Defense bonus factor when fighting on cores.
	GIE_ESCAPING_DIVISIONS_EQUIPMENT_RATIO = 0.2, -- Base equipment ratio on escaped troops.
	GIE_ESCAPING_DIVISIONS_AMOUNT_RATIO = 0.1, -- Ratio on amount of divisions that escapes. Scales with starting legitimacy
	GIE_LIBERATED_NATION_DAILY_LEGITIMACY_CHANGE = -1.5, --An uncapitulated exile that is fully liberated will have legitimacy changed with this amount daily. Will be automatically reinstated when it reaches 0.
	GIE_EXILE_TRANSFER_ON_LEADER_CAPITULATION_MANPOWER_FACTOR = 0.1, --Factor on exile manpower kept when a faction leader capitulates and the hosted exiles are transfered.
	GIE_CONVOY_ON_CREATION = 10, -- Number of convoy a GiE will get on creation.


	SURRENDER_LIMIT_REDUCTION_PER_COLLABORATION = 0.3, 	--each percent of collaboration will lower surrender limit by this percentage
	SURRENDER_RECIPIENT_SCORE_PER_COLLABORATION = 1.0, 	--countries with collaboration will get bonus while game calculates which country the enemy will capitulate
	COMPLIANCE_PER_COLLABORATION = 1.0,					--each percent of collaboration will be converted to this compliance at capitulation

	WILL_LEAD_TO_WAR_FOCUS_PERSISTENCE = 60, -- taken focuses that has lead to war will still make ai prep for war for this many days after being taken
	WILL_LEAD_TO_WAR_DECISION_PERSISTENCE = 30, -- the decision thats lead to war will sitll make ai prep for war for this many days after being taken/cooldown/timeout

	ARMY_COUNT_DAILY_LERP_FOR_TRAINING_XP = 0.002, -- number of armies that is used in training xp calculates daily lerps to actual number (if real number is lower)
	ARMY_COUNT_DAILY_DECREASE_FOR_TRAINING_XP = 0.1, -- number of armies that is used in training xp calculates daily linearly approaches this number (if real number is lower)
},

NCountry = {
	EVENT_PROCESS_OFFSET = 20,						-- 每个国家或地区每 X 天检查一次事件（1 是理想值，但 CPU 开销较大）
	BASE_RESEARCH_SLOTS = 2,						-- 每个国家的基础科研槽数量
	POPULATION_YEARLY_GROWTH_BASE = 0.015,			-- 每年基础人口增长率，用于每月人力增长
	RESISTANCE_STRENGTH_FROM_VP = 0.001,			-- 每个胜利点（VP）提供的抵抗力量增长速度
	RESISTANCE_STRENGTH_FROM_NEIGHBORS = 0.5, 		-- 抵抗力量从相邻地区传播时的倍率（取最高值或邻居传播值的一半再乘以该系数）
	RESISTANCE_DECAY_WHEN_NO_GROWTH = 0.005,		-- 如果没有任何增长因素（无 VP 或邻居传播），抵抗每日减少的量
	REINFORCEMENT_DIVISION_PRIORITY_COUNT = 3, 		-- 师模板中优先级阶段数量：0）预备役，1）普通，2）精锐
	REINFORCEMENT_DIVISION_PRIORITY_DEFAULT = 1, 	-- 默认每个模板为 1）普通优先级
	REINFORCEMENT_THEATER_GROUP_PRIORITY_DEFAULT = 1,-- 默认每个战区组为 1）普通优先级
	REINFORCEMENT_THEATRE_PRIORITY_COUNT = 3,		-- 与师优先级机制相同
	REINFORCEMENT_THEATRE_PRIORITY_DEFAULT = 1,
	REINFORCEMENT_AIRBASE_PRIORITY_COUNT = 3,
	REINFORCEMENT_AIRBASE_PRIORITY_DEFAULT = 1,
	REINFORCEMENT_DELIVERY_SPEED_MIN = 0.6,			-- 从首都到补给区的距离对速度影响较小，主要惩罚因素是区域拥挤程度而非路线长度
	REINFORCEMENT_EQUIPMENT_DELIVERY_SPEED = 0.3,	-- 陆军装备补给速度的修正系数
	REINFORCEMENT_MANPOWER_DELIVERY_SPEED = 10.0,	-- 陆军人力补给速度的修正系数（运输时间）
	REINFORCEMENT_MANPOWER_CHUNK = 0.1,				-- 每次人力补给的块大小，为模板所需总人力的百分比
	EQUIPMENT_UPGRADE_CHUNK_MAX_SIZE = 10,			-- 每次更新最多分配的装备升级块大小
	COUNTRY_SCORE_MULTIPLIER = 1.0,					-- 国家得分的权重
	ARMY_SCORE_MULTIPLIER = 0.15,					-- 基于军队数量的得分权重
	NAVY_SCORE_MULTIPLIER = 1.0,					-- 基于海军数量的得分权重
	AIR_SCORE_MULTIPLIER = 0.1,						-- 基于飞机数量的得分权重（通常数量很大）
	INDUSTRY_SCORE_MULTIPLIER = 1.0,				-- 基于工厂数量的得分权重
	PROVINCE_SCORE_MULTIPLIER = 0.1,				-- 基于控制省份数量的得分权重
	NUCLEAR_BOMB_DROP_WAR_SUPPORT_EFFECT_MAX_INFRA = 0.2,		-- 核弹轰炸省份时对敌方战争支持的影响最大值，随基础设施等级缩放
	NUCLEAR_BOMB_DROP_WAR_SUPPORT_EFFECT_MAX_VP = 3,			-- 如果该省份 VP 低于此值，战争支持惩罚将按比例减少
	THERMONUCLEAR_BOMB_DROP_WAR_SUPPORT_EFFECT_MAX_INFRA = 0.2,	-- 同上，热核弹版本
	THERMONUCLEAR_BOMB_DROP_WAR_SUPPORT_EFFECT_MAX_VP = 3,		-- 同上，热核弹版本
	WEEKLY_STABILITY_GAIN = 0.0,					-- 每周稳定度自然增长（当前为 0）
	WEEKLY_WAR_SUPPORT_GAIN = 0.0,					-- 每周战争支持自然增长（当前为 0）
	SUPPLY_CONVOY_FACTOR = 0.25,					-- 每单位补给所需的运输船数量
	CONVOY_RANGE_FACTOR = 1,                        -- 距离对资源贸易与补给所需运输船的影响倍数
	CONVOY_LENDLEASE_RANGE_FACTOR = 1,				-- 距离对租借所需运输船的影响倍数
	CONVOY_INTERNATIONAL_MARKET_RANGE_FACTOR = 1,	-- 距离对国际市场贸易所需运输船的影响倍数
	LOCAL_MANPOWER_ACCESSIBLE_NON_CORE_FACTOR = 0.02,  -- 非核心地区可招募人力的基础比例
	MAX_NON_CORE_MANPOWER_FACTOR = 1.0,				-- 非核心地区可招募人力比例的最大上限
	DEFAULT_STABILITY = 0.5,						-- 默认稳定度（如无特殊设定）
	DEFAULT_WAR_SUPPORT = 0.5,						-- 默认战争支持（如无特殊设定）
	BASE_STABILITY_WAR_FACTOR = -0.2,				-- 战争对稳定度的基础影响（负面）
	BASE_STABILITY_PARTY_POPULARITY_FACTOR = 0.15,	-- 执政党支持率对稳定度的基础影响（正面）
	MIN_COUP_STABILITY_FACTOR = 0.0,				-- 政变因子在稳定度中的最小值
	MAX_COUP_STABILITY_FACTOR = 2.0,				-- 政变因子在稳定度中的最大值
	MIN_COUP_SUCCESS_STABILITY = 0.8,				-- 政变发生所需的最低稳定度（即高稳定度时才可能政变）
	WAR_SUPPORT_OFFNSIVE_WAR = -0.2,				-- 参与进攻战争对战争支持的影响
	WAR_SUPPORT_DEFENSIVE_WAR = 0.2,				-- 参与防御战争对战争支持的影响
	WAR_SUPPORT_TENSION_IMPACT = 0.4,				-- 世界紧张度对战争支持的总影响
	MIN_STABILITY = 0.0,
	MAX_STABILITY = 1.0,
	MIN_WAR_SUPPORT = 0.0,
	MAX_WAR_SUPPORT = 1.0,
	FRONT_PROVINCE_SCORE = 20,    					-- 前线省份的最大得分（用于敌对部队警报）
	MAJOR_IC_RATIO = 3,                             -- 成为主要国家所需的工业能力比值（与其他国家相比）
	MAJOR_MIN_FACTORIES = 35,						-- 成为主要国家所需的最低工厂数量
	MAX_INTELLIGENCE_DIFFERENCE = 10.0,				--（旧情报系统）国家间情报等级的最大差距
	INTEL_FROM_ALLIANCE_FACTOR = 0.3,				-- 联盟情报共享系数：0 表示无贡献，1 表示完全共享
	MAX_INTELLIGENCE_DATA_DEVIATION = 1.0,          --（旧情报系统）估算默认间谍值的偏差上限（0.0 - 1.0）
	MAX_INTELLIGENCE_MILITARY_DATA_DEVIATION = 1.0, --（旧情报系统）估算敌方军事单位数量的偏差上限
	MAX_INTELLIGENCE_NAVY_DATA_DEVIATION = 0.3,		--（旧情报系统）估算敌方舰船数量的偏差上限
	MAX_INTELLIGENCE_AIR_DATA_DEVIATION = 1.0,		--（旧情报系统）估算敌方飞机数量的偏差上限
	MAX_INTELLIGENCE_CONVOY_DATA_DEVIATION = 0.3,	--（旧情报系统）估算敌方运输船数量的偏差上限
	MAX_INTELLIGENCE_MANPOWER_DATA_DEVIATION = 0.4,	--（旧情报系统）估算敌方总人力的偏差上限
	MAX_INTELLIGENCE_FIELDED_MANPOWER_DATA_DEVIATION = 0.35, --（旧情报系统）估算敌方现役兵力的偏差上限
	MAX_INTELLIGENCE_INDUSTRY_DATA_DEVIATION = 0.4, --（旧情报系统）估算敌方工业的偏差上限
	MIN_MANPOWER_RATIO = 0.15,						-- 触发人力警报的最低人力比例
	ARMY_IMPORTANCE_FACTOR = 5.0,					-- 陆军在 AI 与计算中的重要性系数
	TERRAIN_IMPORTANCE_FACTOR = 5.0,				-- 地形在战略价值中的基础系数
	VICTORY_POINTS_IMPORTANCE_FACTOR = 5.0,			-- 胜利点在 AI 与计算中的重要性系数
	BUILDING_IMPORTANCE_FACTOR = 3.0,				-- 建筑在 AI 与计算中的重要性系数
	RESOURCE_IMPORTANCE_FACTOR = 1.0,				-- 资源在 AI 与计算中的重要性系数
	INTERPOLATED_FRONT_STEPS_SHORT = 2,				-- 性能优化：插值前线的步数（非 AI 国家使用完整插值）
	MIN_AIR_RESERVE_RATIO = 0.33,					-- 触发空军预备役警报的最低比例
	POLITICAL_POWER_LOWER_CAP = -500.0,				-- 国家政治力量的最低下限
	POLITICAL_POWER_UPPER_CAP = 2000.0,				-- 国家政治力量的最高上限
	RESISTANCE_IMPORTANT_LEVEL = 0.25,				-- 抵抗力量达到此值时被视为危险
	RESISTANCE_IMPORTANT_COUNTRY_LEVEL = 0.25,		-- 国家平均抵抗力量达到此值时被视为危险
	MIN_MAJOR_COUNTRIES	= 7,						-- 至少前 7 个工厂最多的国家被视为主要国家
	ADDITIONAL_MAJOR_COUNTRIES_IC_RATIO = 0.7,		-- 如果某国工厂数高于前 7 国平均的 70%，也可被视为主要国家
	BASE_TENSION_MAJOR_COUNTRY_INDEX = 1,			-- 用于计算生成世界紧张度的基准国家索引（0 为工厂最多，1 为第二多，需小于 MIN_MAJOR_COUNTRIES）
	MIN_NAVAL_SUPPLY_EFFICIENCY = 0.1,				-- 海军补给效率的最低有效比例
	PARADROP_AIR_SUPERIORITY_RATIO = 0.7,			-- 空降所需的最低空优比例
	STATE_VALUE_BASE = 10.0,                        -- 一个州的基础价值（用于和平会议等）
	STATE_VALUE_BUILDING_SLOTS_MULT = 4.0,          -- 每个建筑槽位的价值倍数
	STATE_VALUE_MANPOWER_FACTOR = 0.1,              -- 每 10k 人口增加的价值倍数（如 310 万人口 = 310 * 0.1）
	INVASION_REPORT_EXPERATION_DAYS = 30,			-- 入侵报告的过期天数
	MIN_FOCUSES_FOR_CONTINUOUS = 10,				-- 解锁持续国策所需完成的国策数量
	AUTONOMOUS_TOTAL_SCORE = 5000,					-- 自治度总分数
	AUTONOMOUS_SPILLOVER = 0.025,					-- 可保存至下一级的总分数比例
	CIVIL_WAR_INVOLVEMENT_MIN_TENSION = 0.5,		-- 介入内战所需的基础世界紧张度
	UNCAPITULATE_LEVEL = 0.1,                       -- 如果收复此比例领土及首都，则重置投降状态
	BASE_SURRENDER_LIMIT = 0.8,						-- 投降所需的基础占领比例
	SURRENDER_LIMIT_MULT_FOR_COUNTRIES_WITH_NO_CORES = 0.7, -- 无核心的国家投降比例乘以该系数
	MIN_SURRENDER_LIMIT = 0.2,						-- 最低非强制投降比例（0-1 有效）
	BASE_MOBILIZATION_SPEED = 0.01,					-- 人力动员的基础速度（单位：1/1000 的 1%）

	INTERCEPTION_WAR_SUPPORT_SCALE = 0.00001,		-- 拦截对战争支持影响的缩放系数
	INTERCEPTION_BOMBING_WAR_SUPPORT_IMPACT = 0.3,	-- 拦截轰炸对战争支持的最大影响

	BOMBING_WAR_SUPPORT_PENALTY_SCALE = -0.00015, 			-- 轰炸对战争支持影响的缩放系数（每周累计）
	MAX_BOMBING_WEEKLY_WAR_SUPPORT_PENALTY = -0.006,		-- 每周轰炸对战争支持的最大惩罚
	BOMBING_WEEKLY_WAR_SUPPORT_PENALTY_DECAY = 0.001,		-- 轰炸惩罚的每周衰减
	MAX_BOMBING_WAR_SUPPORT_IMPACT = -0.3,					-- 轰炸对战争支持的总影响上限

	HEROES_BEING_KILLED_WAR_SUPPORT_PENALTY_SCALE = -0.03,			-- 战争英雄阵亡对战争支持的惩罚缩放
	MAX_HEROES_BEING_KILLED_WEEKLY_WAR_SUPPORT_PENALTY = -0.006,		-- 每周英雄阵亡的最大惩罚
	HEROES_BEING_KILLED_WEEKLY_WAR_SUPPORT_PENALTY_DECAY = 0.001,	-- 英雄阵亡惩罚的每周衰减
	MAX_HEROES_BEING_KILLED_WAR_SUPPORT_IMPACT = -0.3,				-- 英雄阵亡对战争支持的总影响上限
	WAR_SUPPORT_FROM_CASUALTIES = 0.025,							-- 计算英雄阵亡影响的基础值（反向）

	CONVOYS_BEING_RAIDED_WAR_SUPPORT_PENALTY_SCALE = -0.05,			-- 运输船被袭击对战争支持的惩罚缩放
	MAX_CONVOYS_BEING_RAIDED_WEEKLY_WAR_SUPPORT_PENALTY = -0.006,	-- 每周运输船被袭击的最大惩罚
	CONVOYS_BEING_RAIDED_WEEKLY_WAR_SUPPORT_PENALTY_DECAY = 0.001,	-- 运输船被袭击惩罚的每周衰减
	MAX_CONVOYS_BEING_RAIDED_WAR_SUPPORT_IMPACT = -0.5,				-- 运输船被袭击对战争支持的总影响上限

	FEMALE_UNIT_LEADER_BASE_CHANCE = {
		-- 女性单位领袖随机生成的概率因子
		-- 如果不使用随机头像，这些值应设为 0
		0.5, -- 国家领袖
		0.5, -- 陆军将领
		0.5, -- 海军将领
		0.5, -- 空军将领
		0.5, -- 特工
		0.5, -- 科学家
	},

	CONVOYS_SUNK_MULTIPLIER_FOR_WAR_SUPPORT = 0.2,	-- 每艘贸易运输船被击沉对战争支持的负面倍数
	CONVOYS_BEING_RAIDED_DAILY_WAR_SUPPORT_IMPACT_FROM_OVERSEA_STATES = 0.2,	-- 来自海外州资源运输船被袭击的每日战争支持惩罚（视资源重要性与运输效率而定）
	CONVOYS_SUNK_MULTIPLIER_FOR_WAR_SUPPORT_FROM_OVERSEA_STATES = 0.2,			-- 来自海外州运输船被击沉的负面倍数
	CONVOYS_BEING_RAIDED_DAILY_WAR_SUPPORT_IMPACT = 0.2,	-- 贸易运输船被袭击的每日战争支持惩罚（视资源重要性与运输效率而定）

	MAX_PROPAGANDA_STABILITY_IMPACT = -0.2,			-- 特工执行宣传任务对稳定度的最大总惩罚
	MAX_PROPAGANDA_WAR_SUPPORT_IMPACT = -0.2,		-- 特工执行宣传任务对战争支持的最大总惩罚
	PROPAGANDA_STABILITY_DAILY_DECAY = 0.001,		-- 宣传对稳定度影响的每日恢复量
	PROPAGANDA_WAR_SUPPORT_DAILY_DECAY = 0.001,		-- 宣传对战争支持影响的每日恢复量

	NUM_DAYS_TO_FULLY_DELETE_STOCKPILED_EQUIPMENT = 90,	 -- 从库存中完全删除装备所需天数（删除后进入隐藏池，仍可被缴获）
	AIR_SUPPLY_CONVERSION_SCALE = 0.01,				-- 飞机转换为空中补给的缩放比例
	AIR_SUPPLY_DROP_EXPIRATION_HOURS = 168,			-- 空投补给的有效小时数（7 天）
	STARTING_COMMAND_POWER = 0.0,					-- 每个国家初始指挥力量
	BASE_MAX_COMMAND_POWER = 80.0,					-- 指挥力量上限的基础值
	BASE_COMMAND_POWER_GAIN = 0.4,					-- 每日指挥力量增长的基础值
	AIR_VOLUNTEER_PLANES_RATIO = 0.2,				-- 志愿空军可派遣比例（相对于本国空军）
	AIR_VOLUNTEER_BASES_CAPACITY_LIMIT = 0.1,		-- 志愿空军受接收方空军基地容量限制的比例
	ATTACHE_XP_SHARE = 0.15,						-- 派遣武官所获得的经验分享比例
	SPECIAL_FORCES_CAP_BASE = 0.05,					-- 特种部队上限 = 非特种部队数量 * 该比例（可被国家修正）
	SPECIAL_FORCES_CAP_MIN = 24,					-- 特种部队最低数量（无论非特种部队数量如何）
	DAYS_OF_WAR_BEFORE_SURRENDER = 7,				-- 战争开始后至少 7 天才可投降

	FUEL_LEASE_CONVOY_RATIO = 0.0005,				-- 每单位燃料租借所需运输船数

	STARTING_FUEL_RATIO = 0.25,						-- 国家初始燃料比例（相对于最大燃料容量）
	BASE_FUEL_GAIN_PER_OIL = 2,						-- 每单位多余石油每小时提供的基础燃料
	BASE_FUEL_GAIN = 2.0,							-- 每小时基础燃料增长（与石油无关）
	BASE_FUEL_CAPACITY = 50000,						-- 基础燃料容量

	SCORCHED_EARTH_STATE_COST = 5,					-- 焦土政策所需政治点数（PP）

	COUNTRY_MANPOWER_CAPITULATED_FREE_POOL_FACTOR = 0.1,	-- 流亡国家在无领土时剩余人力的比例
	COUNTRY_MANPOWER_CAPITULATED_CORE_GAIN_FACTOR = 0.001,	-- 流亡国家从被敌占核心州获得人力的比例（州人力在游戏中除以 1000）
	COUNTRY_MANPOWER_CAPITULATED_NON_CORE_GAIN_FACTOR = 0.001,	-- 同上，非核心州
	GIE_MAX_LEGITIMACY = 100, 								-- 流亡政府合法性的最大上限
	GIE_CAPITULATE_MAX_STOCKPILE_TRANSFER = 0.1, 			-- 投降时从库存转移装备的最大比例（0-1），取决于初始合法性
	GIE_CAPITULATE_MIN_LEGIT_FOR_TRANSFER = 5, -- 最低初始合法性（0-100），低于此值无法转移任何装备
	GIE_CAPITULATION_LEGITIMACY_WARSCORE_FACTOR = 0.5,      -- 战争贡献百分比乘以该系数，作为初始合法性的一部分（如 50% 贡献 = +25 合法性）
	GIE_CAPITULATION_LEGITIMACY_WARLENGTH_FACTOR = 1.0,     -- 战争持续周数乘以该系数，作为初始合法性的一部分（如 30 周 = +30 合法性）
	GIE_WARSCORE_GAIN_LEGITIMACY_FACTOR = 1,		 		-- 流亡单位获得的战争分数转化为合法性的系数
	GIE_HOST_CIC_FROM_LEGITIMACY_MAX = 5, 					-- 东道国最多可从流亡政府获得 5 个民用工厂
	GIE_HOST_MIC_FROM_LEGITIMACY_MAX = 5,					-- 同上，军用工厂
	GIE_HOST_DOCKYARDS_FROM_LEGITIMACY_MAX = 0,				-- 同上，船坞
	GIE_VETERAN_MANPOWER_NON_CORE_GAIN_FACTOR = 0.005,	-- 从被敌占非核心州获得老兵人力的比例（州人力除以 1000）
	GIE_VETERAN_MANPOWER_CORE_GAIN_FACTOR = 0.01,	-- 同上，核心州
	GIE_MANPOWER_TOTAL_MAX_FACTOR = 0.5,	-- 流亡人力从自有州获得的最大比例（上限为 50%，接近上限时收益递减）
	GIE_MANPOWER_RATO_OF_MAX_START_PENALTY = 0.5,	-- 当已招募人力达到最大值的 50% 时开始惩罚
	GIE_MANPOWER_GAIN_PENALTY_MAX = 0.95,	-- 流亡人力增长的最大惩罚（95%）
	GIE_EXILE_AIR_RECRUITMENT_LEGITIMACY = 50, 	-- 招募流亡空军所需的最低合法性
	GIE_EXILE_AIR_START_EXPERIENCE = 3, 		-- 流亡空军的初始经验
	GIE_EXILE_TROOP_RECRUITMENT_LEGITIMACY = 25, 	-- 招募流亡陆军所需的最低合法性
	GIE_EXILE_TROOPS_DEPLOY_TRAINING_MAX_LEVEL = 2, 	-- 流亡部队训练可获得的最高经验等级
	GIE_EXILE_ARMY_LEADER_LEGITIMACY_LEVELS = {  	-- 达到以下合法性等级时获得新的流亡将领
		30,
		60,
		90,
	},
	GIE_EXILE_ARMY_LEADER_START_LEVEL = 3,	-- 流亡将领初始等级
	GIE_ESCAPING_DIVISIONS_TRANSFER_DAYS = 30, -- 逃往东道国的部队转移所需天数
	GIE_ESCAPING_DIVISIONS_XP_BOOST = 0.4, -- 逃亡部队经验加成（只有最顽强的战士才能活下来）
	GIE_DIVISION_ATTACK_BONUS_AGAINST_OCCUPIER = 0.1, -- 对占领者的攻击加成
	GIE_DIVISION_DEFENSE_BONUS_AGAINST_OCCUPIER = 0.1, -- 对占领者的防御加成
	GIE_DIVISION_ATTACK_BONUS_ON_CORE = 0.1, -- 在核心领土上的攻击加成
	GIE_DIVISION_DEFENSE_BONUS_ON_CORE = 0.1, -- 在核心领土上的防御加成
	GIE_ESCAPING_DIVISIONS_EQUIPMENT_RATIO = 0.2, -- 逃亡部队的装备保留比例
	GIE_ESCAPING_DIVISIONS_AMOUNT_RATIO = 0.1, -- 逃亡部队数量的比例（随初始合法性变化）
	GIE_LIBERATED_NATION_DAILY_LEGITIMACY_CHANGE = -1.5, -- 完全解放后流亡政府每日合法性减少（降至 0 时自动复国）
	GIE_EXILE_TRANSFER_ON_LEADER_CAPITULATION_MANPOWER_FACTOR = 0.1, -- 当阵营领袖投降时，流亡人力保留比例
	GIE_CONVOY_ON_CREATION = 10, -- 流亡政府创建时获得的运输船数量

	SURRENDER_LIMIT_REDUCTION_PER_COLLABORATION = 0.3, 	-- 每 1% 合作度降低投降阈值 0.3%
	SURRENDER_RECIPIENT_SCORE_PER_COLLABORATION = 1.0, 	-- 拥有合作度的国家在计算投降归属时获得额外分数
	COMPLIANCE_PER_COLLABORATION = 1.0,					-- 投降时每 1% 合作度转化为 1% 顺从度

	WILL_LEAD_TO_WAR_FOCUS_PERSISTENCE = 60, -- 导致战争的国策在完成后仍使 AI 准备战争 60 天
	WILL_LEAD_TO_WAR_DECISION_PERSISTENCE = 30, -- 导致战争的决议在完成后仍使 AI 准备战争 30 天

	ARMY_COUNT_DAILY_LERP_FOR_TRAINING_XP = 0.002, -- 用于训练经验计算的陆军数量每日线性插值
	ARMY_COUNT_DAILY_DECREASE_FOR_TRAINING_XP = 0.1, -- 陆军数量每日线性减少至该值（若实际数量低于此）
}