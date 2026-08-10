NFocus = {
	FOCUS_POINT_DAYS = 7,						-- Each point takes a week
	FOCUS_PROGRESS_PEACE = 1,					-- Progress during peace
	FOCUS_PROGRESS_WAR = 1,					-- Progress during war
	MAX_SAVED_FOCUS_PROGRESS = 10,				-- This much progress can be saved while not having a focus selected
},

NOperatives = {
	AGENCY_CREATION_DAYS = 30,						-- Number of days needed to create an intelligence agency
	AGENCY_UPGRADE_DAYS = 30,						-- Number of days needed to upgrade an intelligence agency
	AGENCY_CREATION_FACTORIES = 5,					-- Number of factories used to create an intelligence agency
	AGENCY_AI_BASE_NUM_FACTORIES = 25.0,				-- Used by AI to pace the upgrades. Formula : if( AGENCY_AI_BASE_NUM_FACTORIES <= num_civ_factories - num_upgrades * AGENCY_AI_PER_UPGRADE_FACTORIES )
	AGENCY_AI_PER_UPGRADE_FACTORIES = 6.0,			-- Used by AI to pace the upgrades. Formula : if( AGENCY_AI_BASE_NUM_FACTORIES <= num_civ_factories - num_upgrades * AGENCY_AI_PER_UPGRADE_FACTORIES )
	AGENCY_UPGRADE_PER_OPERATIVE_SLOT = 5,			-- Number of upgrade needed to unlock an additional operative slot
	MAX_OPERATIVE_SLOT_FROM_AGENCY_UPGRADES = 1,	-- max operative slots gained from upgrades
	AGENCY_OPERATIVE_RECRUITMENT_TIME = 30,			-- Number of days to wait to have operative to recruit when an operative slot first becomes available
	BECOME_SPYMASTER_PP_COST = 50,					-- Number of political power used to become Spy Master
	BECOME_SPYMASTER_MIN_UPGRADES = 3,				-- Number of agency upgrades you need before becoming Spy Master
	BASE_COUNTER_INTELLIGENCE_RATING = 0.0,					-- Base national counter intelligence rating for all countries
	AGENCY_DEFENSE_EFFECT_ON_HOSTILE_ACTION_COST = 0.2,			-- Defense factor that is responsible for multiplying the cost hostile actions against our country by its level and this value
	INTEL_NETWORK_GAIN_RATE_ON_WRONG_CONTROLLER = -10.0,			-- Amount of network strength lost in a state when it does not have the right controller anymore
	INTEL_NETWORK_GAIN_RATE_ON_OUT_OF_RANGE = -1.75,				-- Amount of network strength lost in a state that has the right controller but is out of range of any operative
	INTEL_NETWORK_GAIN_FROM_ADJACENCY_FACTOR = 0.5,				-- Factor multiplied to the sum of the positive difference between a state's strength and its neighbors'. In other words, how strongly neighbors impact the strength gained in a state. Values greater or equal to 1 are discouraged.
	INTEL_NETWORK_GAIN_DECAY_PER_STEP_FACTOR = 0.5,				-- Factor multiplied to the gain of the previous node in the netowrk initially contributed by the agent. In other words, before adjacency, the strength gain in a state would be GainFromOperative * ( INTEL_NETWORK_GAIN_DECAY_PER_STEP_FACTOR ^ NodeDepth ) where NodeDepth is the distance between the state and the operative's location.
	INTEL_NETWORK_STRENGTH_TARGET_OFFSET_PER_OPERATIVE = 15.0,		-- The amount of strength each operative on build intel network mission in a sub network add to the base target network strength
	INTEL_NETWORK_STRENGTH_DECAY_WHEN_ABOVE_TARGET = -2.5,			-- The amount of strength removed each tick from a state that has more strength than the target
	INTEL_NETWORK_BASE_STRENGTH_TARGET_COUNTERINTELLIGENCE_FACTOR = -10.0,	-- BaseStrengthTarget = Factor * CounterIntelligenceRating + Offset
	INTEL_NETWORK_BASE_STRENGTH_TARGET_COUNTERINTELLIGENCE_OFFSET = 90,	-- Offset mentioned above
	INTEL_NETWORK_MIN_VP_TO_TARGET = 15,					-- The minimum value of the highest VP in a state to consider the state as a valid target to start building an intel network
	INTEL_NETWORK_MIN_STRENGTH_TO_TARGET = 101.0,				-- The minimum value of the intel network in a state to consider it a valid target to deploy an operative in
	INTEL_NETWORK_MIN_STRENGTH_TO_LINK_SUBNETWORKS = 0.0,			-- Where the influence of two operative meet, the two nodes on each side have to have strictly more than the given strength before the two operatives have a chance of being considered in the same network
	INTEL_NETWORK_OPERATIVE_GAIN_STACKING_FACTOR = 0.5,			-- When multiple operative are present in the same location, this factor is applied for each operative with a lower gain than the max. So if operatives have the gain [ 3, 1, 2 ] in the same location, it is sorted to [ 1, 2, 3 ] then converted to [ 1*D^2, 2*D^1, 3 ], with D being this define, so if D=0.5 we have [ 0.25, 1, 3 ] and the final gain from operative at this location will be 4.25. Putting this define to 0 is equivalent to considering the maximum value only.
	INTEL_NETWORK_MIN_STRENGTH_FOR_STATE_TO_COUNT_TOWARD_NATIONAL_COVERAGE = 0.0,	-- Amount of strength (0, 100) in a state required for it to count toward the national coverage
	INTEL_NETWORK_NATIONAL_COVERAGE_CONTROLLED_STATES_WEIGHT = 0.2,		-- Weight (expected [0,1]) multiplied by the number of states covered by the network that are controlled by the target over the total number of states the target controls
	INTEL_NETWORK_NATIONAL_COVERAGE_CORE_STATES_WEIGHT = 0.6,			-- Weight (expected [0,1]) multiplied by the number of states covered by the network that are core to the target over the total number of states the target has for core
	INTEL_NETWORK_NATIONAL_COVERAGE_OWNED_WORTH_WEIGHT = 0.2,		-- Weight (expected [0,1]) multiplied by the value of victory points covered by the network over the total value of victory points controlled by the targets
	INTEL_NETWORK_OCCUPIED_TAG_STATES_WEIGHT = 0.5,				-- Weight (expected [0,1]) multiplied to the fraction of number of state covered by the intel network divided by the number of states occupied by the target of the network, per occupied tag
	INTEL_NETWORK_OCCUPIED_TAG_WORTH_WEIGHT = 0.5,				-- Weight (expected [0,1]) multiplied to the fraction of victory points worth of states covered by the intel network divided by the worth of states occupied by the target of the network, per occupied tag
	INTEL_NETWORK_MIN_SUB_NETWORK_SIZE_FOR_DETECTION = 0,			-- minimum number of state of a sub-intel network before an operative on build intel network mission in this network can be detected
	INTEL_NETWORK_MIN_NATIONAL_COVERAGE_FOR_DETECTION = 0.02,		-- [0, 1] minimum national coverage required for an operative on build intel network to have a chance to be discovered
	INTEL_NETWORK_MIN_SUB_NETWORK_NATIONAL_COVERAGE_FOR_DETECTION = 0.01,	-- [0, 1] minimum national coverage of the network the operative on build intel network is in to have a chance to be discovered
	INTEL_NETWORK_MIN_SUB_NETWORK_STRENGTH_FOR_DETECTION = 10.0,		-- [0, 100] minimum network strength of the network the operative on build intel network mission is in to have a chance to be discovered

	INTEL_NETWORK_INTELLIGENCE_AGENCY_DEFENSE_TO_DETECTION_FACTOR = 2.0,	-- multiplied to the intelligence agency defense of the target of the intel network
	INTEL_NETWORK_INTELLIGENCE_AGENCY_DEFENSE_DETECTION_SCALE_FACTOR = 0.0,	-- factor multiplied to the intelligence agency defense of the target of the intel network before being factored to the detection chance
	INTEL_NETWORK_MAX_INTELLIGENCE_AGENCY_DEFENSE_DETECTION_SCALE_FACTOR = 1.0,	-- clamp the value from the multiplication of the above factor (expect a value greater or equal to 1)
	INTEL_NETWORK_NATIONAL_COVERAGE_TO_DETECTION_CHANCE_FACTOR = 1.0,	-- multiplied to the national coverage (a value in range [0, 1]
	INTEL_NETWORK_SUB_NETWORK_STRENGTH_TO_DETECTION_CHANCE_FACTOR = 0.1,	-- multiplied to the network strength (a value in range [0, 100]
	INTEL_NETWORK_SUB_NETWORK_NATIONAL_COVERAGE_TO_DETECTION_CHANCE_FACTOR = 3.0,	-- multiplied to the contribution to the national coverage of the sub network (a value in range [0, 1])
	INTEL_NETWORK_DETECTION_GLOBAL_FACTOR = 0.01,				-- global factor multiplied to the detection chance before it is multiplied a dice roll in the range [0,1000)
	BUILD_INTEL_NETWORK_DAILY_XP_GAIN = 1,
	QUIET_INTEL_NETWORK_DAILY_XP_GAIN = 0,
	OPERATIVE_MISSION_DETECTION_CHANCE_FACTOR = {
		-- Factor multiplied to the detection chance of an agent on mission before the offsets
		0.0, -- NoMission
		1.0, -- BuildIntelNetwork
		1.0, -- QuietIntelNetwork
		1.0, -- CounterIntelligence
		0.0, -- RootOutResistance
		3.0, -- BoostIdeology
		0.1, -- ControlTrade
		0.1, -- DiplomaticPressure
		3.0, -- Propaganda
	},

	-- used for calculating how many operatives will a spy master gain from its faction members
	-- first number in every now is number of operatives gained
	-- second number is total factory needed (mil and civ) for giving previous ratio
	OPERATIVE_SLOTS_FROM_FACTION_MEMBERS_FOR_SPY_MASTER = {
		0.0, 	0.0, -- 0 operative for [0, 10)
		0.25,  	10.0, -- 0.25 operative for [10, 50)
		0.5, 	50.0, -- 0.5 operative for >= 50
	},

	INTEL_NETWORK_STATE_MODIFIER_STRENGTH_THRESHOLD = 10,			-- Minimum amount of strength required in a state for the intel network related modifiers to start being applied

	INTEL_NETWORK_MIN_DEFAULT_FOR_SHOWING = 25,              -- default min level for networks used to filter operation requirements if not overriden

	OPERATIVE_BASE_INTEL_NETWORK_GAIN = 0.4,				-- Base amount of network strength gain per day provided by an operative
	OPERATIVE_MAX_INTEL_NETWORK_GAIN = -1.0,				-- Max amount of network strength gain per day provided by an operative after modifiers have been applied (negative value means no max)
	COUNTER_INTELLIGENCE_FOREIGN_AGENT_FACTOR = 0.0,			-- Multiplier to the counter intelligence provided by foreign (ally) operatives
	COUNTER_INTELLIGENCE_STACKING_FACTOR = 0.5,				-- Multiplier applied to each operative after the first one. So if we have the following counter intelligence rating values [ 0.1, 0.3, 0.2 ], the factor is applied twice for the lowest value and once for the 2nd lowest one as such : [ 0.3, 0.2 * D, 0.1 * D * D ] and then the result is summed up to give the final rating value
	COUNTER_INTELLIGENCE_TO_DEFENSE_LOG_FACTOR = 0.0,			-- Defense = LogFactor * log( 1 + CounterIntelligence ) + CounterIntelligence / Divisor
	COUNTER_INTELLIGENCE_TO_DEFENSE_DIVISOR = 1.0,				-- see above
	COUNTER_INTELLIGENCE_DAILY_XP_GAIN = 0.112,
	BOOST_IDEOLOGY_NATIONAL_COVERAGE_FACTOR = 1.0,				-- used to compute the drift factor as follow: BASE * SUB_NETWORK_NC * BOOST_IDEOLOGY_DEFENSE_FACTOR
	BOOST_IDEOLOGY_MAX_DRIFT_BY_OPERATIVE = 0.25,				-- the maximum drift an operative can cause, a negative value means no maximum
	BOOST_IDEOLOGY_DRIFT_STACKING_FACTOR = 0.5,				-- multiplied to the drift of an operative for each operative after the first one, with the greatest drift. So if we have the following drift values [ 0.1, 0.3, 0.2 ], the factor is applied twice for the lowest value and once for the 2nd lowest one as such : [ 0.3, 0.2 * D, 0.1 * D * D ] and then the result is summed up to give the final drift value.
	BOOST_IDEOLOGY_DEFENSE_FACTOR = 0.2,					-- multiplied to the target's defense to get the amount of drift to remove from each operative's drift
	BOOST_IDEOLOGY_DAILY_XP_GAIN = 0.274,
	OPERATIVE_BASE_INTEL_AGENCY_DEFENSE = 1.0,				-- Base amount of intel agency defense contributed by an operative on counter_intelligence mission
	OPERATIVE_BASE_BOOST_IDEOLOGY = 0.1,					-- Base amount of daily ideology drift provoked by an operative
	OPERATIVE_BASE_PROPAGANDA_POWER = 0.0005,					-- Base amount of daily war support and stability change when an operative is assigned to propaganda
	PROPAGANDA_SUB_NETWORK_STRENGTH_FACTOR = 1.0,				-- Multiplied to the network strength before being multiplied to the Stability/WarSupport drift caused by an operative
	PROPAGANDA_DEFENSE_FACTOR = 0.01,					-- Multiplied to the target's defense before being subtracted from the Stability/WarSupport drift caused by an operative
	PROPAGANDA_OPERATIVE_STACKING_FACTOR = 0.5,				-- Multiplied to the Stability/WarSupport drift values of each operative after the one with the greatest values. The process is done separatly for Stability and WarSupport
	PROPAGANDA_COUNTRY_STACKING_FACTOR = 0.5,				-- Multiplied to the Stability/WarSupport drift values of each country after the one with the greatest values. The process is done separatly for Stability and WarSupport
	PROPAGANDA_DAILY_XP_GAIN = 0.350,
	OPERATIVE_BASE_ROOT_OUT_RESISTANCE_EFFICIENCY = 1.0,			-- The base efficiency of an operative at the RootOutResistance mission (this is a percentage, 1.0 == 100%)
	ROOT_OUT_RESISTANCE_STACKING_FACTOR = 0.5,				-- Multiplied to each operative efficiency after the first one
	ROOT_OUT_RESISTANCE_RANGE_STEP_FACTOR = 0.5,				-- Multiplied to the summed up efficiency from all operative operating in a same state to determine the efficiency in neighboring states
	ROOT_OUT_RESISTANCE_DAILY_XP_GAIN = 0.068,
	OPERATIVE_BASE_CONTROL_TRADE_DRIFT = 0.5,				-- The base daily drift in trade influence caused by an operative
	CONTROL_TRADE_STACKING_FACTOR = 0.5,					-- Multiplied to the drift of each operative after the first one
	CONTROL_TRADE_MAX_INFLUENCE = 50.0,					-- The maximum amount of trade influence that can be gained through the control trade mission
	CONTROL_TRADE_INFLUENCE_DAILY_DECAY = 0.1,				-- The amount of trade influence lost when no operative are assigned to the mission
	CONTROL_TRADE_DAILY_XP_GAIN = 0.137,
	OPERATIVE_BASE_DIPLOMATIC_PRESSURE_AI_ACCEPTANCE_SCORE_DRIFT = 0.4,	-- The daily change in the amount of opinion requiered to join a faction
	OPERATIVE_BASE_DIPLOMATIC_PRESSURE_TENSION_REQUIREMENTS_DRIFT = 0.001,	-- The daily change in world tension requiered to join a faction
	DIPLOMATIC_PRESSURE_MAX_AI_ACCEPTANCE_SCORE_INCREASE = 20.0,	-- the maximum amount of ai acceptance score from diplomatic pressure
	DIPLOMATIC_PRESSURE_MAX_TENSION_REQUIREMENTS_DECREASE = 0.20,	-- amount of tension (tensions is in range [0,1]) that can be removed from the requirements imposed by the modifier join_faction_tension_limit
	DIPLOMATIC_PRESSURE_OPERATIVE_STACKING_FACTOR = 0.5,		-- The diminishing return factor to apply to operative working for the same faction after the first one. Operatives operating for a same faction are ranked by their efficiency and their opinion and tension drift are individually applyied a stacking factor like so: DRIFT * STACKING_FACTOR^RANK where RANK is a value from 0 to the number of operative -1 where the opperative with the highest drift value has rank 0
	DIPLOMATIC_PRESSURE_AI_ACCEPTANCE_SCORE_DECAY = 0.4,			-- daily decay when the mission is not active
	DIPLOMATIC_PRESSURE_TENSION_REQUIREMENTS_DECAY = 0.001,			--
	DIPLOMATIC_PRESSURE_DAILY_XP_GAIN = 0.137,
	MIN_NATIONAL_COVERAGE_FOR_BOOST_IDEOLOGY = 0.01,			-- Minimum network coverage required to start the mission (the code ensures that a network exists at all)
	MIN_NATIONAL_COVERAGE_FOR_PROPAGANDA = 0.01,			-- Minimum network coverage required to start the mission (the code ensures that a network exists at all)
	OPERATIVE_MIN_DAYS_HARMED = 30,						-- Minimum number of days an operative can be harmed. Applied after modifiers. Can be zero.
	OPERATIVE_MAX_DAYS_HARMED = 120,						-- Maximum number of days an operative can be harmed. Applied after modifiers. Is ignored if negative
	OPERATIVE_MIN_DAYS_FORCED_INTO_HIDING = 7,				-- Minimum number of days an operative can be forced into hiding. Applied after modifiers. Can be zero.
	OPERATIVE_MAX_DAYS_FORCED_INTO_HIDING = 120,				-- Maximum number of days an operative can be forced into hiding. Applied after modifiers. Is ignored if negative
	OPERATIVE_MAX_DAYS_TO_AUTO_RESUME_MISSION = 30,				-- Maximum number of days an operative has to be disabled before its mission is not automatically resumed once he is available again
	MAX_RECRUITED_OPERATIVES = 10,

	CRYPTO_BASE_CRYPTO_LEVEL = 12000,						-- base crypto strength for a country
	CRYPTO_CRYPTO_LEVEL_PER_CRYPTO_UPGRADE = 4250,			-- crypto strength per crypto upgrade

	CRYPTO_CRYPTO_ACTIVE_BONUS_DURATION = 30,				-- number of days the active decryption bonuses will be applied before enemy resets their intelligence
	CYRPTO_ACTIVE_BONUS_ACTIVATION_PROGRESS_RATIO = 0.5,	-- once bonus is activated, decryption progress will be reduced to this ratio

	OPERATION_AI_MINIMUM_SCORE = 10.0,						-- Once an operation's AI weight falls below the minimum score it will be scrapped if it is being prepared
	OPERATION_COMPLETION_XP = 18,

	OPERATIVE_CAPTURE_DURATION_IN_DAYS = 9*30,

	-- operation cost & time are increased by default this ratios for each
	-- instance of operation that were already executed against same target.
	-- can be overridden using time_multiplier & cost_multiplier in operation.
	DEFAULT_OPERATION_COST_MULTIPLIER = 0.15,
	DEFAULT_OPERATION_TIME_MULTIPLIER = 0.0,

	-- The following defines are multiplied to the number of operatives operating in the target country the activity level is computed for
	BUILD_INTEL_NETWORK_MISSION_ACTIVITY_INDICATOR_FACTOR = 10,
	BOOST_IDEOLOGY_NETWORK_MISSION_ACTIVITY_INDICATOR_FACTOR = 10,
	PROPAGANDA_NETWORK_MISSION_ACTIVITY_INDICATOR_FACTOR = 10,
	CONTROL_TRADE_NETWORK_MISSION_ACTIVITY_INDICATOR_FACTOR = 1,
	DIPLOMATIC_PRESSURE_NETWORK_MISSION_ACTIVITY_INDICATOR_FACTOR = 1,

	-- multiplied to the sum of the network coverage [0,1] all countries have over the target
	INTEL_NETWORK_COVERAGE_ACTIVITY_FACTOR = 100,

	-- multiplied to the strength [0,100] of the strongest network over that country
	INTEL_NETWORK_STRENGTH_DANGER_FACTOR = 1,

	-- Activity level PID values
	ACTIVITY_LEVEL_PROPORTIONAL_FACTOR = 0.01,
	ACTIVITY_LEVEL_INTEGRAL_FACTOR = 0.001,
	ACTIVITY_LEVEL_DERIVATIVE_FACTOR = 0,

	-- Danger level PID values
	DANGER_LEVEL_PROPORTIONAL_FACTOR = 0.01,
	DANGER_LEVEL_INTEGRAL_FACTOR = 0.001,
	DANGER_LEVEL_DERIVATIVE_FACTOR = 0,

	NUM_DAYS_BEFORE_REMOVING_PREPARED_OPERATIONS = 60, -- num days before removing prepared operations

	ON_CAPTURE_COUNTERINTELLIGENCE_OPERATIVE_XP_GAIN = 100,					-- Xp gain when an enemy operative is captured in the country the operative is assigned to counter intelligence to. Apply to a single randomly selected operative
	ON_CAPTURE_COUNTERINTELLIGENCE_OPERATIVE_WEIGHT_OWN_COUNTRY_FOR_XP = 2,			-- An integer on how likely an operative operating in his own country is to get selected for the xp reward on enemy operative capture
	ON_CAPTURE_COUNTERINTELLIGENCE_OPERATIVE_WEIGHT_DIFFERENT_COUNTRY_FOR_XP = 1,		-- same for an operative assigned to counter intelligence in a different country than his own


    -- risk and outcome texts. each number array should match its labels in size, but its ok to have different amount of risk levels than outcomes
	RISK_LEVELS = { 0.1, 0.2, 0.3 },       -- each risk level comes with a label to display for operations if it goes abve that number. If below the first it will isntead show the good outcomes
	RISK_LEVELS_LABELS = { "RISK_LOW", "RISK_MID", "RISK_HIGH" },
	OUTCOME_LEVELS = { 0.0, 0.2, 0.3 },    -- outcome levels are shown if risk is below its first entry instead
	OUTCOME_LEVELS_LABELS = { "OUTCOME_BASE", "OUTCOME_GOOD", "OUTCOME_VGOOD" },

	TECH_STEAL_EQUIPMENT_FACTOR = 4,
	TECH_STEAL_YEAR_FACTOR = 4,
},

NFocus = { --国策
	FOCUS_POINT_DAYS = 7,						-- 每点国策点数耗时 7 天（一周）
	FOCUS_PROGRESS_PEACE = 1,					-- 和平时期的国策进度倍率
	FOCUS_PROGRESS_WAR = 1,					-- 战争时期的国策进度倍率
	MAX_SAVED_FOCUS_PROGRESS = 10,				-- 当未选择国策时，最多可保留 10 点进度
},

NOperatives = { --情报系统
	AGENCY_CREATION_DAYS = 30,						-- 建立情报机构所需天数
	AGENCY_UPGRADE_DAYS = 30,						-- 升级情报机构所需天数
	AGENCY_CREATION_FACTORIES = 5,					-- 建立情报机构占用的民用工厂数量
	AGENCY_AI_BASE_NUM_FACTORIES = 25.0,				-- AI 用以判断升级节奏的基准工厂数；公式：if( AGENCY_AI_BASE_NUM_FACTORIES <= 民用工厂总数 - 升级次数 * AGENCY_AI_PER_UPGRADE_FACTORIES )
	AGENCY_AI_PER_UPGRADE_FACTORIES = 6.0,			-- 每次升级额外占用的工厂数（用于 AI 计算）
	AGENCY_UPGRADE_PER_OPERATIVE_SLOT = 5,			-- 每升级 5 次情报机构可解锁 1 个额外特工槽位
	MAX_OPERATIVE_SLOT_FROM_AGENCY_UPGRADES = 1,	-- 通过情报机构升级最多可获得的特工槽位数
	AGENCY_OPERATIVE_RECRUITMENT_TIME = 30,			-- 新特工槽位首次开放后，需等待 30 天才能招募特工
	BECOME_SPYMASTER_PP_COST = 50,					-- 成为间谍大师所需政治点数
	BECOME_SPYMASTER_MIN_UPGRADES = 3,				-- 成为间谍大师前情报机构至少需完成的升级次数
	BASE_COUNTER_INTELLIGENCE_RATING = 0.0,					-- 所有国家的基础反间谍能力值
	AGENCY_DEFENSE_EFFECT_ON_HOSTILE_ACTION_COST = 0.2,			-- 情报机构防御等级对敌对行动成本的乘数（敌方成本 = 防御等级 * 该值）
	INTEL_NETWORK_GAIN_RATE_ON_WRONG_CONTROLLER = -10.0,			-- 当某省份不再由正确控制者拥有时，每日网络强度损失
	INTEL_NETWORK_GAIN_RATE_ON_OUT_OF_RANGE = -1.75,				-- 当某省份由正确控制者拥有但超出任何特工范围时，每日网络强度损失
	INTEL_NETWORK_GAIN_FROM_ADJACENCY_FACTOR = 0.5,				-- 相邻省份对网络强度增长的邻接影响系数（≥1 的值不推荐）
	INTEL_NETWORK_GAIN_DECAY_PER_STEP_FACTOR = 0.5,				-- 网络强度随距离衰减的系数（增益 = 特工原始增益 * 该值^节点深度）
	INTEL_NETWORK_STRENGTH_TARGET_OFFSET_PER_OPERATIVE = 15.0,		-- 每派遣 1 名特工执行“建立情报网络”任务，为该子网基础目标强度额外增加 15
	INTEL_NETWORK_STRENGTH_DECAY_WHEN_ABOVE_TARGET = -2.5,			-- 当某省份网络强度超过目标值时，每日衰减量
	INTEL_NETWORK_BASE_STRENGTH_TARGET_COUNTERINTELLIGENCE_FACTOR = -10.0,	-- 基础目标强度 = 该系数 * 反间谍能力 + 偏移值
	INTEL_NETWORK_BASE_STRENGTH_TARGET_COUNTERINTELLIGENCE_OFFSET = 90,	-- 上述偏移值
	INTEL_NETWORK_MIN_VP_TO_TARGET = 15,					-- 省份内最高胜利点需 ≥15 才会被视为可建立情报网络的目标
	INTEL_NETWORK_MIN_STRENGTH_TO_TARGET = 101.0,				-- 省份网络强度需 ≥101 才会被视为可部署特工的目标
	INTEL_NETWORK_MIN_STRENGTH_TO_LINK_SUBNETWORKS = 0.0,			-- 两个子网合并前，其交界节点强度需严格大于该值
	INTEL_NETWORK_OPERATIVE_GAIN_STACKING_FACTOR = 0.5,			-- 同一位置多特工增益叠加系数（排序后按 最大, 次大*D, 第三大*D²… 求和）
	INTEL_NETWORK_MIN_STRENGTH_FOR_STATE_TO_COUNT_TOWARD_NATIONAL_COVERAGE = 0.0,	-- 省份网络强度需 ≥该值才会计入全国覆盖率
	INTEL_NETWORK_NATIONAL_COVERAGE_CONTROLLED_STATES_WEIGHT = 0.2,		-- 全国覆盖率中，已控制省份占比的权重
	INTEL_NETWORK_NATIONAL_COVERAGE_CORE_STATES_WEIGHT = 0.6,			-- 全国覆盖率中，核心省份占比的权重
	INTEL_NETWORK_NATIONAL_COVERAGE_OWNED_WORTH_WEIGHT = 0.2,		-- 全国覆盖率中，已占领胜利点价值占比的权重
	INTEL_NETWORK_OCCUPIED_TAG_STATES_WEIGHT = 0.5,				-- 占领标签下，覆盖省份数占比的权重
	INTEL_NETWORK_OCCUPIED_TAG_WORTH_WEIGHT = 0.5,				-- 占领标签下，覆盖胜利点价值占比的权重
	INTEL_NETWORK_MIN_SUB_NETWORK_SIZE_FOR_DETECTION = 0,			-- 子网至少包含该数值的省份，其中执行“建立情报网络”的特工才有可能被发现
	INTEL_NETWORK_MIN_NATIONAL_COVERAGE_FOR_DETECTION = 0.02,		-- [0,1] 全国覆盖率需 ≥该值，特工才有机会被发现
	INTEL_NETWORK_MIN_SUB_NETWORK_NATIONAL_COVERAGE_FOR_DETECTION = 0.01,	-- [0,1] 子网全国覆盖率需 ≥该值，特工才有机会被发现
	INTEL_NETWORK_MIN_SUB_NETWORK_STRENGTH_FOR_DETECTION = 10.0,		-- [0,100] 子网强度需 ≥该值，特工才有机会被发现

	INTEL_NETWORK_INTELLIGENCE_AGENCY_DEFENSE_TO_DETECTION_FACTOR = 2.0,	-- 目标情报机构防御值对发现几率的乘数
	INTEL_NETWORK_INTELLIGENCE_AGENCY_DEFENSE_DETECTION_SCALE_FACTOR = 0.0,	-- 将情报机构防御值乘以该系数后再参与发现几率计算
	INTEL_NETWORK_MAX_INTELLIGENCE_AGENCY_DEFENSE_DETECTION_SCALE_FACTOR = 1.0,	-- 上述乘积的上限（≥1）
	INTEL_NETWORK_NATIONAL_COVERAGE_TO_DETECTION_CHANCE_FACTOR = 1.0,	-- 全国覆盖率对发现几率的乘数
	INTEL_NETWORK_SUB_NETWORK_STRENGTH_TO_DETECTION_CHANCE_FACTOR = 0.1,	-- 子网强度对发现几率的乘数
	INTEL_NETWORK_SUB_NETWORK_NATIONAL_COVERAGE_TO_DETECTION_CHANCE_FACTOR = 3.0,	-- 子网全国覆盖率对发现几率的乘数
	INTEL_NETWORK_DETECTION_GLOBAL_FACTOR = 0.01,				-- 全局发现几率系数（在 0-1000 的随机判定前乘以该值）
	BUILD_INTEL_NETWORK_DAILY_XP_GAIN = 1,						-- 执行“建立情报网络”任务每日获得的特工经验
	QUIET_INTEL_NETWORK_DAILY_XP_GAIN = 0,						-- 执行“静默情报网络”任务每日获得的特工经验
	OPERATIVE_MISSION_DETECTION_CHANCE_FACTOR = {
		-- 各任务对特工被发现几率的乘数（在偏移之前）
		0.0, -- 无任务
		1.0, -- 建立情报网络
		1.0, -- 静默情报网络
		1.0, -- 反间谍
		0.0, -- 根除抵抗
		3.0, -- 意识形态宣传
		0.1, -- 控制贸易
		0.1, -- 外交施压
		3.0, -- 宣传战
	},

	-- 以下列表用于计算间谍大师从其阵营成员处获得的额外特工槽位数
	-- 每行第一个数字为获得的特工数，第二个数字为所需总工厂数（军用+民用）
	OPERATIVE_SLOTS_FROM_FACTION_MEMBERS_FOR_SPY_MASTER = {
		0.0, 	0.0, -- 工厂总数 [0, 10) 时获得 0 名特工
		0.25,  	10.0, -- 工厂总数 [10, 50) 时获得 0.25 名特工
		0.5, 	50.0, -- 工厂总数 ≥50 时获得 0.5 名特工
	},

	INTEL_NETWORK_STATE_MODIFIER_STRENGTH_THRESHOLD = 10,			-- 省份网络强度需 ≥该值，才会开始应用与情报网络相关的修正
	INTEL_NETWORK_MIN_DEFAULT_FOR_SHOWING = 25,              -- 若未另行指定，用于过滤行动需求的默认最小网络等级
	OPERATIVE_BASE_INTEL_NETWORK_GAIN = 0.4,				-- 特工每日提供的基础网络强度增益
	OPERATIVE_MAX_INTEL_NETWORK_GAIN = -1.0,				-- 特工每日网络强度增益的上限（负值表示无上限）
	COUNTER_INTELLIGENCE_FOREIGN_AGENT_FACTOR = 0.0,			-- 外国（盟友）特工对本国反间谍能力的乘数
	COUNTER_INTELLIGENCE_STACKING_FACTOR = 0.5,				-- 多个特工的反间谍能力叠加系数（排序后按 最大, 次大*D, 第三大*D²… 求和）
	COUNTER_INTELLIGENCE_TO_DEFENSE_LOG_FACTOR = 0.0,			-- 防御值 = LogFactor * ln(1 + 反间谍值) + 反间谍值 / Divisor
	COUNTER_INTELLIGENCE_TO_DEFENSE_DIVISOR = 1.0,				-- 见上
	COUNTER_INTELLIGENCE_DAILY_XP_GAIN = 0.112,						-- 执行反间谍任务每日获得的特工经验
	BOOST_IDEOLOGY_NATIONAL_COVERAGE_FACTOR = 1.0,				-- 用于计算意识形态偏移因子：BASE * 子网全国覆盖率 * BOOST_IDEOLOGY_DEFENSE_FACTOR
	BOOST_IDEOLOGY_MAX_DRIFT_BY_OPERATIVE = 0.25,				-- 单个特工可造成的最大每日意识形态偏移（负值表示无上限）
	BOOST_IDEOLOGY_DRIFT_STACKING_FACTOR = 0.5,				-- 多个特工的意识形态偏移叠加系数
	BOOST_IDEOLOGY_DEFENSE_FACTOR = 0.2,					-- 目标防御值乘以该系数后，从每个特工造成的偏移中扣除
	BOOST_IDEOLOGY_DAILY_XP_GAIN = 0.274,						-- 执行意识形态宣传任务每日获得的特工经验
	OPERATIVE_BASE_INTEL_AGENCY_DEFENSE = 1.0,				-- 执行反间谍任务的特工对情报机构防御的基础贡献
	OPERATIVE_BASE_BOOST_IDEOLOGY = 0.1,					-- 特工每日造成的基础意识形态偏移
	OPERATIVE_BASE_PROPAGANDA_POWER = 0.0005,					-- 特工每日对战争支持与稳定度的基础影响
	PROPAGANDA_SUB_NETWORK_STRENGTH_FACTOR = 1.0,				-- 网络强度对宣传战效果的乘数
	PROPAGANDA_DEFENSE_FACTOR = 0.01,					-- 目标防御值对宣传战效果的减成（乘后扣除）
	PROPAGANDA_OPERATIVE_STACKING_FACTOR = 0.5,				-- 多个特工宣传战效果的叠加系数
	PROPAGANDA_COUNTRY_STACKING_FACTOR = 0.5,				-- 多个国家宣传战效果的叠加系数
	PROPAGANDA_DAILY_XP_GAIN = 0.350,						-- 执行宣传战任务每日获得的特工经验
	OPERATIVE_BASE_ROOT_OUT_RESISTANCE_EFFICIENCY = 1.0,			-- 特工执行“根除抵抗”任务的基础效率（百分比，1.0 = 100%）
	ROOT_OUT_RESISTANCE_STACKING_FACTOR = 0.5,				-- 多个特工效率的叠加系数
	ROOT_OUT_RESISTANCE_RANGE_STEP_FACTOR = 0.5,				-- 相邻省份的抵抗根除效率 = 本省份总效率 * 该系数
	ROOT_OUT_RESISTANCE_DAILY_XP_GAIN = 0.068,						-- 执行根除抵抗任务每日获得的特工经验
	OPERATIVE_BASE_CONTROL_TRADE_DRIFT = 0.5,				-- 特工每日对贸易影响力的基础漂移值
	CONTROL_TRADE_STACKING_FACTOR = 0.5,					-- 多个特工贸易影响力的叠加系数
	CONTROL_TRADE_MAX_INFLUENCE = 50.0,					-- 通过控制贸易任务可获得的最大贸易影响力
	CONTROL_TRADE_INFLUENCE_DAILY_DECAY = 0.1,				-- 无特工执行任务时每日损失的贸易影响力
	CONTROL_TRADE_DAILY_XP_GAIN = 0.137,						-- 执行控制贸易任务每日获得的特工经验
	OPERATIVE_BASE_DIPLOMATIC_PRESSURE_AI_ACCEPTANCE_SCORE_DRIFT = 0.4,	-- 特工每日对 AI 加入阵营所需好感度的改变量
	OPERATIVE_BASE_DIPLOMATIC_PRESSURE_TENSION_REQUIREMENTS_DRIFT = 0.001,	-- 特工每日对 AI 加入阵营所需世界紧张度的改变量
	DIPLOMATIC_PRESSURE_MAX_AI_ACCEPTANCE_SCORE_INCREASE = 20.0,	-- 外交施压对 AI 接受度评分的最大增幅
	DIPLOMATIC_PRESSURE_MAX_TENSION_REQUIREMENTS_DECREASE = 0.20,	-- 外交施压可降低的最大世界紧张度需求（范围 [0,1]）
	DIPLOMATIC_PRESSURE_OPERATIVE_STACKING_FACTOR = 0.5,		-- 多个特工外交施压的叠加系数（按效率排序后逐级乘系数）
	DIPLOMATIC_PRESSURE_AI_ACCEPTANCE_SCORE_DECAY = 0.4,			-- 不执行任务时每日好感度增幅的衰减
	DIPLOMATIC_PRESSURE_TENSION_REQUIREMENTS_DECAY = 0.001,			-- 不执行任务时每日紧张度降幅的衰减
	DIPLOMATIC_PRESSURE_DAILY_XP_GAIN = 0.137,						-- 执行外交施压任务每日获得的特工经验
	MIN_NATIONAL_COVERAGE_FOR_BOOST_IDEOLOGY = 0.01,			-- 启动意识形态宣传任务的最低全国覆盖率
	MIN_NATIONAL_COVERAGE_FOR_PROPAGANDA = 0.01,			-- 启动宣传战任务的最低全国覆盖率
	OPERATIVE_MIN_DAYS_HARMED = 30,						-- 特工受伤状态的最短持续天数（经修正后）
	OPERATIVE_MAX_DAYS_HARMED = 120,						-- 特工受伤状态的最长持续天数（负值忽略）
	OPERATIVE_MIN_DAYS_FORCED_INTO_HIDING = 7,				-- 特工被迫隐藏的最短天数（经修正后）
	OPERATIVE_MAX_DAYS_FORCED_INTO_HIDING = 120,				-- 特工被迫隐藏的最长天数（负值忽略）
	OPERATIVE_MAX_DAYS_TO_AUTO_RESUME_MISSION = 30,				-- 特工因受伤或隐藏而停止任务后，若超过该天数未恢复，则任务不会自动继续
	MAX_RECRUITED_OPERATIVES = 10,						-- 可招募的特工上限

	CRYPTO_BASE_CRYPTO_LEVEL = 12000,						-- 国家基础密码强度
	CRYPTO_CRYPTO_LEVEL_PER_CRYPTO_UPGRADE = 4250,			-- 每次密码升级增加的密码强度

	CRYPTO_CRYPTO_ACTIVE_BONUS_DURATION = 30,				-- 主动破译奖励持续天数，之后敌方将重置情报
	CYRPTO_ACTIVE_BONUS_ACTIVATION_PROGRESS_RATIO = 0.5,	-- 激活破译奖励后，破译进度将降至该比例

	OPERATION_AI_MINIMUM_SCORE = 10.0,						-- 若某项行动的 AI 权重低于该值，则准备中的行动将被废弃
	OPERATION_COMPLETION_XP = 18,						-- 成功完成行动后所有参与特工获得的经验

	OPERATIVE_CAPTURE_DURATION_IN_DAYS = 9*30,					-- 特工被俘后的持续天数（9 个月）

	-- 以下系数将分别作用于已针对同一目标执行过的行动
	-- 可通过 operation 中的 time_multiplier & cost_multiplier 覆盖
	DEFAULT_OPERATION_COST_MULTIPLIER = 0.15,						-- 默认每次重复行动的成本递增系数
	DEFAULT_OPERATION_TIME_MULTIPLIER = 0.0,						-- 默认每次重复行动的时间递增系数

	-- 以下系数乘以在目标国执行对应任务的特工数量，用于计算活动水平
	BUILD_INTEL_NETWORK_MISSION_ACTIVITY_INDICATOR_FACTOR = 10,
	BOOST_IDEOLOGY_NETWORK_MISSION_ACTIVITY_INDICATOR_FACTOR = 10,
	PROPAGANDA_NETWORK_MISSION_ACTIVITY_INDICATOR_FACTOR = 10,
	CONTROL_TRADE_NETWORK_MISSION_ACTIVITY_INDICATOR_FACTOR = 1,
	DIPLOMATIC_PRESSURE_NETWORK_MISSION_ACTIVITY_INDICATOR_FACTOR = 1,

	-- 以下系数乘以所有国家对该目标的网络覆盖率之和 [0,1]
	INTEL_NETWORK_COVERAGE_ACTIVITY_FACTOR = 100,

	-- 以下系数乘以该国最强网络的强度 [0,100]
	INTEL_NETWORK_STRENGTH_DANGER_FACTOR = 1,

	-- 活动水平 PID 参数
	ACTIVITY_LEVEL_PROPORTIONAL_FACTOR = 0.01,
	ACTIVITY_LEVEL_INTEGRAL_FACTOR = 0.001,
	ACTIVITY_LEVEL_DERIVATIVE_FACTOR = 0,

	-- 危险水平 PID 参数
	DANGER_LEVEL_PROPORTIONAL_FACTOR = 0.01,
	DANGER_LEVEL_INTEGRAL_FACTOR = 0.001,
	DANGER_LEVEL_DERIVATIVE_FACTOR = 0,

	NUM_DAYS_BEFORE_REMOVING_PREPARED_OPERATIONS = 60, -- 准备中的行动若超过该天数未启动将被移除

	ON_CAPTURE_COUNTERINTELLIGENCE_OPERATIVE_XP_GAIN = 100,					-- 在本国抓获敌方特工时，随机一名执行反间谍任务的特工获得 100 经验
	ON_CAPTURE_COUNTERINTELLIGENCE_OPERATIVE_WEIGHT_OWN_COUNTRY_FOR_XP = 2,			-- 在本国执行反间谍的特工被选中的权重
	ON_CAPTURE_COUNTERINTELLIGENCE_OPERATIVE_WEIGHT_DIFFERENT_COUNTRY_FOR_XP = 1,		-- 在其他国家执行反间谍的特工被选中的权重

	-- 风险与结果文本。各数字数组应与对应标签数组长度一致
	RISK_LEVELS = { 0.1, 0.2, 0.3 },       -- 风险等级阈值，低于第一个则显示良好结果
	RISK_LEVELS_LABELS = { "RISK_LOW", "RISK_MID", "RISK_HIGH" },
	OUTCOME_LEVELS = { 0.0, 0.2, 0.3 },    -- 当风险低于第一个条目时，显示的结果等级
	OUTCOME_LEVELS_LABELS = { "OUTCOME_BASE", "OUTCOME_GOOD", "OUTCOME_VGOOD" },

	TECH_STEAL_EQUIPMENT_FACTOR = 4,						-- 窃取科技时的装备因子
	TECH_STEAL_YEAR_FACTOR = 4,						-- 窃取科技时的年份因子
},