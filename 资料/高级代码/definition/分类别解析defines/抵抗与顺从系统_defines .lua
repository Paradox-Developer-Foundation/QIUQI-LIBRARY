NResistance = {
	INITIAL_STATE_RESISTANCE = 1.0,							-- initial resistance percentage of a state once it is captured
	INITIAL_STATE_COMPLIANCE = 0.0,							-- initial compliance percentage of a state once it is captured
	COMPLIANCE_FACTOR_ON_STATE_CONTROLLER_CHANGE = -0.5,	-- compliance factor that applies when the state controller changes (in between allies, compliance is zeroed if it is taken by original country)
	RESISTANCE_COOLDOWN_WHEN_DISABLED = -0.25,				-- resistance cooldown when the state is taken back by its original owner (compliance is zeroed in that case)

	RESISTANCE_TARGET_BASE = 35.0,							-- base resistance target percentage

	RESISTANCE_TARGET_MODIFIER_HAS_CLAIM = -5.0,			-- resistance target modifier in % for states we have claim

	RESISTANCE_TARGET_MODIFIER_PER_STABILITY_LOSS = 0.2,	-- resistance target modifier per stability below 100%
	RESISTANCE_TARGET_MODIFIER_PER_COMPLIANCE = -0.5,		-- resistance target modifier per compliance %

	RESISTANCE_TARGET_MODIFIER_IS_AT_PEACE = -10.0,			-- resistance target modifier when we are at peace

	RESISTANCE_TARGET_MODIFIER_STATE_VP = {					-- resistance target modifier pairs for vp. first entry is total vp in state and second entry is amount of target modifier that applies for that threshold
		0,   0.0, -- 0 - 5
		5,   5.0, -- 5 - 20
		20,  10.0, -- 20 - 50
		50,  20.0, -- 50 - ...
	},

	RESISTANCE_TARGET_MODIFIER_OCCUPIED_CAPITULATED = 10.0, -- resistance target modifier when the enemy is capitulated

	RESISTANCE_TARGET_MODIFIER_OCCUPIED_IS_EXILE_MIN = 2.0,   -- min & max resistance target modifier resistance target modifier for exile countries. interpolated using legitimacy
	RESISTANCE_TARGET_MODIFIER_OCCUPIED_IS_EXILE_MAX = 20.0,

	RESISTANCE_TARGET_MODIFIER_POP_LOW = -20.0,			-- how much we reduce the resistance target
	RESISTANCE_TARGET_MODIFIER_POP_VERY_LOW = -50.0,			-- resistance target modifier in % for states we have claim

	RESISTANCE_POP_LOW_CUTOFF = 10000,
	RESISTANCE_POP_VERY_LOW_CUTOFF = 1000,

	RESISTANCE_TARGET_MIN_CAP_FOR_NON_COMPLIANCE = 10, -- min resistance target will be capped to this percentage for non-compliance sources

	RESISTANCE_DECAY_BASE = 0.1, -- base resistance decay
	RESISTANCE_DECAY_MIN = 0.01, -- min resistance decay
	RESISTANCE_DECAY_MAX = 100.0, -- nax resistance decay

	RESISTANCE_DECAY_MODIFIER_HAS_CLAIM = 25.0, -- resistance decay modifier for our claims
	RESISTANCE_DECAY_MODIFIER_FACTORS = {  -- resistance decay modifier when resistance hits a certain percentage
		10, -50, -- below 10% it has a -50% modifier on decay
		20, -25, -- below 20% it has a -25% modifier on decay
	},

	MIN_DAMAGE_TO_GARRISONS_MODIFIER = 0.1, -- modifier that applies to losses from resistance attack to garrisons at most can be reduced to this amount

	RESISTANCE_GROWTH_BASE = 0.2, -- base resistance grow
	RESISTANCE_GROWTH_MIN = 0.01, -- min resistance grow
	RESISTANCE_GROWTH_MAX = 100.0, -- max resistance grow

	COMPLIANCE_GROWTH_BASE = 0.075, -- base compliance grow
	COMPLIANCE_GROWTH_MIN = -100.0, -- min compliance grow
	COMPLIANCE_GROWTH_MAX = 100.0, -- max compliance grow

	COMPLIANCE_GROWTH_IS_AT_PEACE = 10, -- compliance growth buff at peace
	COMPLIANCE_GROWTH_HAS_CLAIM = 5, -- compliance growth buff if state has a claim

	COMPLIANCE_DECAY_AT_MAX_COMPLIANCE = -0.083, -- as compliance increases, it gets a decay rate depending on its value. compliance should stabilize at some value until its growth changes
	COMPLIANCE_DECAY_PER_EXILE_LEGITIMACY = -0.015, -- higher legitimacy will give higher decay to compliance

	RESISTANCE_RATIO_DIFF_TO_SPREAD = 0.5, -- resistance diff between two neighbour states will spread by this ratio ( from highest resistance states to lower ones and it will only spread once to a state)

	RESISTANCE_ACTIVITY_CHANCE_AT_MAX_RESISTANCE = 0.312,
	RESISTANCE_ACTIVITY_MIN_GARRISON_PENETRATE_CHANCE = 0.02,

	RESISTANCE_TARGET_TO_REENABLE_RESISTANCE = 10, -- resistance will be disabled once it reaches zero and will not be reenabled until resistance target reaches above this value
	GARRISON_LOG_MAX_MONTHS = 12,

	NO_COMPLIANCE_GAIN_ENABLE_LIMIT = 0.5, -- at least this ratio of no garrison law should be active in order to no compliance gain to take effect

	GARRISON_MANPOWER_MIN_DELIVERY_SPEED = 0.7,	-- Minimum base delivery speed if the chunk can't be calculated.
	GARRISON_MANPOWER_REINFORCEMENT_SPEED = 2000.0,	-- Modifier for garrison manpower reinforcement.  This value is the maximum to be delivered which is then modified by distance
	GARRISON_EQUIPMENT_DELIVERY_SPEED = 4.0,	-- Modifier for garrison equipment reinforcement speed

	GARRISON_STR_POW_MANPOWER = 2,	--Scales impact of manpower deficiency by raising that deficiency to the number here. Formula: efficiency = 1.0 - manpower_deficiency^GARRISON_STR_POW_MANPOWER
	GARRISON_STR_POW_EQUIPMENT = 3,	--Scales impact of euqipment deficiency by raising that deficiency to the number here. Formula: efficiency = 1.0 - equipment_deficiency^GARRISON_STR_POW_EQUIPMENT

	SUPPRESSION_NEEDED_BY_RESISTANCE_POINT = 0.75, -- Number of suppression point we need for each 1% of resistance
	SUPPRESSION_NEEDED_LOWER_CAP = 10.0,	-- if resistance is lower than this value then we always act as though it is at the define for the purpose of suppresion requirements
	SUPPRESSION_NEEDED_UPPER_CAP = 50.0, -- if resistance is greater than this value then we always act as though it is at the define for the purpose of suppresion requirements

	GARRISON_MANPOWER_LOST_BY_ATTACK = 0.016, 	-- Ratio of manpower lost by garrison at each attack on garrison (this number will be reduced by the hardness of garrison template)
	GARRISON_EQUIPMENT_LOST_BY_ATTACK = 0.02, 	-- Ratio of equipment lost by garrison at each attack on garrison (this number will be reduced by the hardness of garrison template)
	MAXIMUM_GARRISON_HARDNESS_WHEN_ATTACKED = 0.90,   -- Cap to be sure that garrison will suffer lost in attack, even with a almost 100% hardness

	FOREIGN_MANPOWER_MIN_THRESHOLD = 5000,		 -- The minimum number of Manpower that AI will accept to give at once, in order to avoid many weird little transfer.
	MANPOWER_BUFFER_TO_NOT_GIVE_MINOR = 0.3, -- To determine how much AI can give as foreign manpower, we calculate how much manpower we use, and add this buffer. The result is what we want to keep, for minor countries. So higher this number is, lower we will give Manpower.
	MANPOWER_BUFFER_TO_NOT_GIVE_MAJOR = 0.6, -- To determine how much AI can give as foreign manpower, we calculate how much manpower we use, and add this buffer. The result is what we want to keep, for major countries. So higher this number is, lower we will give Manpower.
	MAX_GARRISON_RATIO_WE_AGREE_TO_SUPPORT = 3.0,	-- The part of the manpower needed by the foreign garrison, that AI will agree to support with our manpower. If negative number, AI will not take into consideration the need, and just calculate how much they can give.
	FOREIGN_MANPOWER_AI_COOLDOWN_DAYS = 30,		 -- Number of days after an AI give us manpower before the AI accept to give more.

	INITIAL_HISTORY_RESISTANCE = 0.0,			-- resistance value for initial colony states
	INITIAL_HISTORY_COMPLIANCE = 70.0,			-- compliance value for initial colony states
	INITIAL_GARRISON_STRENGTH = 1,				-- garrison value for initial colony states

	STATE_COMPLIANCE_DECAY_FOR_LOST_STATES = 0.05, -- daily compliance decay for the states you lost control of

},

NResistance = { --抵抗与顺从系统
	INITIAL_STATE_RESISTANCE = 1.0,							-- 地区被占领时的初始抵抗百分比
	INITIAL_STATE_COMPLIANCE = 0.0,							-- 地区被占领时的初始顺从百分比
	COMPLIANCE_FACTOR_ON_STATE_CONTROLLER_CHANGE = -0.5,	-- 当地区控制权发生变更时（盟友之间也不例外），顺从度乘以该系数；若被原国家夺回，则顺从度清零
	RESISTANCE_COOLDOWN_WHEN_DISABLED = -0.25,				-- 当地区被原国家夺回时，抵抗进入冷却状态，该值作为冷却修正；此时顺从度清零

	RESISTANCE_TARGET_BASE = 35.0,							-- 基础抵抗目标百分比

	RESISTANCE_TARGET_MODIFIER_HAS_CLAIM = -5.0,			-- 拥有该地区宣称时，抵抗目标额外减少 5%

	RESISTANCE_TARGET_MODIFIER_PER_STABILITY_LOSS = 0.2,	-- 每低于 100% 一点稳定度，抵抗目标增加 0.2%
	RESISTANCE_TARGET_MODIFIER_PER_COMPLIANCE = -0.5,		-- 每 1% 顺从度，抵抗目标减少 0.5%

	RESISTANCE_TARGET_MODIFIER_IS_AT_PEACE = -10.0,			-- 国家处于和平状态时，抵抗目标额外减少 10%

	RESISTANCE_TARGET_MODIFIER_STATE_VP = {					-- 根据地区胜利点（VP）总量提供的抵抗目标修正值表
		0,   0.0, -- 0 - 5 VP
		5,   5.0, -- 5 - 20 VP
		20,  10.0, -- 20 - 50 VP
		50,  20.0, -- 50 VP 以上
	},

	RESISTANCE_TARGET_MODIFIER_OCCUPIED_CAPITULATED = 10.0, -- 被占领国已投降时，抵抗目标额外增加 10%

	RESISTANCE_TARGET_MODIFIER_OCCUPIED_IS_EXILE_MIN = 2.0,   -- 占领流亡政府领土时，抵抗目标最小修正值
	RESISTANCE_TARGET_MODIFIER_OCCUPIED_IS_EXILE_MAX = 20.0,  -- 占领流亡政府领土时，抵抗目标最大修正值（按流亡政府的合法性插值）

	RESISTANCE_TARGET_MODIFIER_POP_LOW = -20.0,			-- 地区人口低于阈值时，抵抗目标额外减少 20%
	RESISTANCE_TARGET_MODIFIER_POP_VERY_LOW = -50.0,			-- 地区人口极低时，抵抗目标额外减少 50%

	RESISTANCE_POP_LOW_CUTOFF = 10000,							-- 低人口阈值
	RESISTANCE_POP_VERY_LOW_CUTOFF = 1000,						-- 极低人口阈值

	RESISTANCE_TARGET_MIN_CAP_FOR_NON_COMPLIANCE = 10, -- 非顺从度来源的抵抗目标最低可降至 10%

	RESISTANCE_DECAY_BASE = 0.1, -- 基础抵抗衰减率
	RESISTANCE_DECAY_MIN = 0.01, -- 最小抵抗衰减率
	RESISTANCE_DECAY_MAX = 100.0, -- 最大抵抗衰减率

	RESISTANCE_DECAY_MODIFIER_HAS_CLAIM = 25.0, -- 拥有宣称的地区，抵抗衰减率额外增加 25%

	RESISTANCE_DECAY_MODIFIER_FACTORS = {  -- 抵抗水平对应的衰减修正
		10, -50, -- 低于 10% 时，衰减率减少 50%
		20, -25, -- 低于 20% 时，衰减率减少 25%
	},

	MIN_DAMAGE_TO_GARRISONS_MODIFIER = 0.1, -- 抵抗活动时，守备部队受到的损失最多只能被减免到原伤害的 10%

	RESISTANCE_GROWTH_BASE = 0.2, -- 基础抵抗增长率
	RESISTANCE_GROWTH_MIN = 0.01, -- 最小抵抗增长率
	RESISTANCE_GROWTH_MAX = 100.0, -- 最大抵抗增长率

	COMPLIANCE_GROWTH_BASE = 0.075, -- 基础顺从度增长率
	COMPLIANCE_GROWTH_MIN = -100.0, -- 最小顺从度增长率
	COMPLIANCE_GROWTH_MAX = 100.0, -- 最大顺从度增长率

	COMPLIANCE_GROWTH_IS_AT_PEACE = 10, -- 国家处于和平状态时，顺从度增长率额外增加 10
	COMPLIANCE_GROWTH_HAS_CLAIM = 5, -- 拥有宣称的地区，顺从度增长率额外增加 5

	COMPLIANCE_DECAY_AT_MAX_COMPLIANCE = -0.083, -- 顺从度越高，衰减越大，最终使顺从度稳定在某值
	COMPLIANCE_DECAY_PER_EXILE_LEGITIMACY = -0.015, -- 流亡政府合法性越高，顺从度衰减越大（负值）

	RESISTANCE_RATIO_DIFF_TO_SPREAD = 0.5, -- 相邻地区抵抗水平差异的 50% 会从高抵抗地区扩散到低抵抗地区，仅扩散一次

	RESISTANCE_ACTIVITY_CHANCE_AT_MAX_RESISTANCE = 0.312, -- 抵抗达到最大值时，每日触发活动的概率
	RESISTANCE_ACTIVITY_MIN_GARRISON_PENETRATE_CHANCE = 0.02, -- 抵抗活动最低穿透守备的概率

	RESISTANCE_TARGET_TO_REENABLE_RESISTANCE = 10, -- 抵抗被清零后，需抵抗目标回升至 10% 以上才会重新增长
	GARRISON_LOG_MAX_MONTHS = 12, -- 守备日志最多保存 12 个月

	NO_COMPLIANCE_GAIN_ENABLE_LIMIT = 0.5, -- 必须至少 50% 的地区启用“无驻军法律”，才会禁止顺从度增长

	GARRISON_MANPOWER_MIN_DELIVERY_SPEED = 0.7,	-- 若无法计算实际距离，则使用最低基础运输速度
	GARRISON_MANPOWER_REINFORCEMENT_SPEED = 2000.0,	-- 驻军人力补充速度上限，随后根据距离修正
	GARRISON_EQUIPMENT_DELIVERY_SPEED = 4.0,	-- 驻军装备补充速度乘数

	GARRISON_STR_POW_MANPOWER = 2,	-- 人力短缺对守备效率影响公式：效率 = 1.0 - 人力短缺^2
	GARRISON_STR_POW_EQUIPMENT = 3,	-- 装备短缺对守备效率影响公式：效率 = 1.0 - 装备短缺^3

	SUPPRESSION_NEEDED_BY_RESISTANCE_POINT = 0.75, -- 每 1% 抵抗需要 0.75 镇压值
	SUPPRESSION_NEEDED_LOWER_CAP = 10.0,	-- 抵抗低于 10% 时，按 10% 计算镇压需求
	SUPPRESSION_NEEDED_UPPER_CAP = 50.0, -- 抵抗高于 50% 时，按 50% 计算镇压需求

	GARRISON_MANPOWER_LOST_BY_ATTACK = 0.016, 	-- 每次抵抗活动，守备部队人力损失比例（受模板硬度减免）
	GARRISON_EQUIPMENT_LOST_BY_ATTACK = 0.02, 	-- 每次抵抗活动，守备部队装备损失比例（受模板硬度减免）
	MAXIMUM_GARRISON_HARDNESS_WHEN_ATTACKED = 0.90,   -- 守备部队硬度上限，确保即使硬度极高仍会受到损失

	FOREIGN_MANPOWER_MIN_THRESHOLD = 5000,		 -- AI 单次最少提供 5000 人力，避免频繁小额转移
	MANPOWER_BUFFER_TO_NOT_GIVE_MINOR = 0.3, -- 小国 AI 计算自身人力需求后，再增加 30% 缓冲，剩余才考虑支援
	MANPOWER_BUFFER_TO_NOT_GIVE_MAJOR = 0.6, -- 大国 AI 计算自身人力需求后，再增加 60% 缓冲，剩余才考虑支援
	MAX_GARRISON_RATIO_WE_AGREE_TO_SUPPORT = 3.0,	-- AI 最多愿意提供 3 倍于自身需求的驻军人力支援；若为负值，则不考虑需求
	FOREIGN_MANPOWER_AI_COOLDOWN_DAYS = 30,		 -- AI 提供外国驻军人力后，30 天内不再提供

	INITIAL_HISTORY_RESISTANCE = 0.0,			-- 初始殖民地地区的默认抵抗值
	INITIAL_HISTORY_COMPLIANCE = 70.0,			-- 初始殖民地地区的默认顺从值
	INITIAL_GARRISON_STRENGTH = 1,				-- 初始殖民地地区的默认驻军强度

	STATE_COMPLIANCE_DECAY_FOR_LOST_STATES = 0.05, -- 失去控制后，原地区顺从度每日衰减 5%
},