NRailwayGun = {
	RAILWAY_GUN_POSSIBLE_RANGES = { 30, 15, 45 },	-- Possible values for railway gun range in pixel.
													-- For optimization reasons, they are listed here and equipment DB must use one of those.
													-- when writing railway gun in equipment, use the index in this array
													-- the first value in array is the default value
	ATTACK_TO_FORTS_MODIFIER_FACTOR = 1.333,		-- Forts modifier is calculated by multiplying railway gun attack value with this and dividing by 100
	ATTACK_TO_ENTRENCHMENT_MODIFIER_FACTOR = 0.8,		-- Entrenchment modifier is calculated by multiplying railway gun attack value with this and dividing by 100
	ATTACK_TO_BOMBARDMENT_MODIFIER_FACTOR = 0.4,	-- Bombardment modifier is calculated by multiplying railway gun attack value with this and dividing by 100
	DAILY_MANPOWER_GAIN_RATIO = 0.05,				-- Railway Guns will be able to gain this ratio of their max manpower daily
	DISBAND_MANPOWER_LOSS = 0.0,					-- The ration of manpower lost on disbanding railway guns
	ENCIRCLED_DISBAND_MANPOWER_FACTOR = 0.2,		-- The percentage of manpower returned when an encircled unit is disbanded
	OUT_OF_SUPPLY_SPEED = -0.8,						-- Max speed reduction from supply for railway guns
	BASE_CAPTURE_CHANCE = 0.2,						-- The base chance of railway guns being captured during an overrrun. Will be further modified by the equipment capture chance of the capturing unit.
	DISTRIBUTION_RAILWAY_GUN_PRESENCE_SCORE = -100,					-- Score for Railway Guns in nearby provs. x3 if on that province. x2 if adjacent. x1 if 2 away.
	DISTRIBUTION_OUR_UNITS_PRESENCE_SCORE = 1,	 					-- Score for our units in province when distributing Railway Guns
	DISTRIBUTION_FRIENDLY_UNITS_PRESENCE_SCORE = 0,					-- Score for friendly units in province when distributing Railway Guns
	DISTRIBUTION_HOSTILE_UNITS_PRESENCE_SCORE = -45,				-- Score for hostile units in province when distributing Railway Guns
	DISTRIBUTION_COMBATS_PRESENCE_SCORE = -30,						-- Score for combats in province when distributing Railway Guns
	DISTRIBUTION_COMBATS_INRANGE_SCORE = 15,						-- Score for combats in range when distributing Railway Guns
	DISTRIBUTION_OUR_UNITS_INRANGE_SCORE = 2.5,						-- Score for our units in range when distributing Railway Guns
	DISTRIBUTION_FRIENDLY_UNITS_INRANGE_SCORE = 1.5,				-- Score for friendly units in range when distributing Railway Guns
	DISTRIBUTION_HOSTILE_UNITS_INRANGE_SCORE = 6,					-- Score for hostile units in range when distributing Railway Guns
	DISTRIBUTION_DISTANCE_SCORE = -0.08,							-- Score for distance to province when distributing Railway Guns
	DISTRIBUTION_PROVINCE_CONTROLLED_BY_ENEMY_SCORE = -3,			-- Score for staying in province controlled by enemy
	DISTRIBUTION_PROVINCES_CONTROLLED_BY_ENEMY_INRANGE_SCORE = 15,	-- Score for provinces controlled by enemy in range when distributing Railway Guns
	DISTRIBUTION_HOLD_POSITION_SCORE = 30,							-- Score for staying in the same province when distributing Railway Guns
	DISTRIBUTION_NO_RAILWAY_SCORE = -500,							-- Score for provinces with no railways (need to be low, but we allow RG to enter port provinces without railways)
	DISTRIBUTION_SUPPLY_DEFICIT_SCORE = -100,						-- Score for provinces without sufficient supply cap
},

NTrade = {
	DISTANCE_TRADE_FACTOR = -0.02,				-- Trade factor is modified by distance times this
	RELATION_TRADE_FACTOR = 1,					-- Trade factor is modified by Opinion value times this
	ALLOW_TRADE_CUT_OFF = 0,					-- If trade factor is less than this, no trade will be allowed
	MONTH_TRADE_FACTOR = 2,						-- Each month a trade gets this much boost to it's trade factor
	MAX_MONTH_TRADE_FACTOR = 50,				-- This is the maximum bonus that can be gained from time
	BASE_TRADE_FACTOR = 150,					-- This is the base trade factor
	PUPPET_MASTER_TRADE_FACTOR = 400,			-- This is priority for puppet master
	PUPPET_TRADE_FACTOR = 0,					-- This is unpriority for puppets
	BASE_LAND_TRADE_RANGE = 1000,
	PARTY_SUPPORT_TRADE_FACTOR = 50,			-- Trade factor bonus at the other side having 100 % party popularity for my party
	ANTI_MONOPOLY_TRADE_FACTOR_THRESHOLD = 0.5,	-- What percentage of resources has to be sold to the buyer for the anti-monopoly factor to take effect
	ANTI_MONOPOLY_TRADE_FACTOR = -100,			-- This is added to the factor value when anti-monopoly threshold is exceeded
	NAVAL_ROUTE_ACCESS_AVOID_COST_MULT = 1,	-- Naval pathfinding should avoid certain regions that you mark. High "cost multiplier" will make it less willingly go through a specific region.
},

NRailwayGun = { --铁路炮
	RAILWAY_GUN_POSSIBLE_RANGES = { 30, 15, 45 },	-- 铁道炮射程的可能数值（以像素为单位）
													-- 出于优化考虑，这些数值在此列出，装备数据库必须使用其中之一
													-- 编写铁道炮装备时，请使用此数组中的索引
													-- 数组中的第一个值为默认值

	ATTACK_TO_FORTS_MODIFIER_FACTOR = 1.333,		-- 对要塞的修正系数 = 铁道炮攻击力 × 此系数 ÷ 100
	ATTACK_TO_ENTRENCHMENT_MODIFIER_FACTOR = 0.8,	-- 对堑壕的修正系数 = 铁道炮攻击力 × 此系数 ÷ 100
	ATTACK_TO_BOMBARDMENT_MODIFIER_FACTOR = 0.4,	-- 对轰炸的修正系数 = 铁道炮攻击力 × 此系数 ÷ 100

	DAILY_MANPOWER_GAIN_RATIO = 0.05,				-- 铁道炮每日可恢复的最大人力比例
	DISBAND_MANPOWER_LOSS = 0.0,					-- 解散铁道炮时损失的人力比例（当前为0，即无损失）
	ENCIRCLED_DISBAND_MANPOWER_FACTOR = 0.2,		-- 被包围单位解散时返回的人力比例（例如被包围的铁道炮）

	OUT_OF_SUPPLY_SPEED = -0.8,						-- 铁道炮因补给不足导致的最大速度惩罚（负数表示减速）

	BASE_CAPTURE_CHANCE = 0.2,						-- 铁道炮在溃退中被俘获的基础概率（最终概率还会受俘获单位装备俘获率影响）

	-- 以下各项为铁道炮自动部署时的评分系统（用于AI或自动分配逻辑）
	DISTRIBUTION_RAILWAY_GUN_PRESENCE_SCORE = -100,  -- 铁道炮已在附近省份的评分（本省×3，相邻×2，隔两省×1）
	DISTRIBUTION_OUR_UNITS_PRESENCE_SCORE = 1,  -- 我方单位在目标省份的评分
	DISTRIBUTION_FRIENDLY_UNITS_PRESENCE_SCORE = 0,  -- 友军单位在目标省份的评分
	DISTRIBUTION_HOSTILE_UNITS_PRESENCE_SCORE = -45,  -- 敌方单位在目标省份的评分（负面）
	DISTRIBUTION_COMBATS_PRESENCE_SCORE = -30,  -- 目标省份正在交战的评分（负面）
	DISTRIBUTION_COMBATS_INRANGE_SCORE = 15,  -- 射程内有战斗的评分（正面）
	DISTRIBUTION_OUR_UNITS_INRANGE_SCORE = 2.5,  -- 射程内有我方单位的评分
	DISTRIBUTION_FRIENDLY_UNITS_INRANGE_SCORE = 1.5,  -- 射程内有友军的评分
	DISTRIBUTION_HOSTILE_UNITS_INRANGE_SCORE = 6,  -- 射程内有敌军的评分
	DISTRIBUTION_DISTANCE_SCORE = -0.08,  -- 距离目标省份越远，评分越低（负面）
	DISTRIBUTION_PROVINCE_CONTROLLED_BY_ENEMY_SCORE = -3,  -- 目标省份被敌方控制时的评分（负面）
	DISTRIBUTION_PROVINCES_CONTROLLED_BY_ENEMY_INRANGE_SCORE = 15,  -- 射程内有被敌占省份的评分（正面）
	DISTRIBUTION_HOLD_POSITION_SCORE = 30,  -- 留在当前省份不动时的评分（鼓励驻守）
	DISTRIBUTION_NO_RAILWAY_SCORE = -500,  -- 无铁路省份的评分（极低，但允许进入无铁路的港口省份）
	DISTRIBUTION_SUPPLY_DEFICIT_SCORE = -100,  -- 补给不足的省份评分（负面）
},
NTrade = { --贸易
	DISTANCE_TRADE_FACTOR = -0.02,	-- 贸易因子受距离影响：距离 × 此系数 = 修正值（负值表示越远越不利）
	RELATION_TRADE_FACTOR = 1,	-- 贸易因子受关系影响：好感度 × 此系数 = 修正值
	ALLOW_TRADE_CUT_OFF = 0,	-- 若贸易因子低于此值，则不允许贸易
	MONTH_TRADE_FACTOR = 2,	-- 每过一个月，贸易因子增加此值（鼓励长期贸易）
	MAX_MONTH_TRADE_FACTOR = 50,	-- 随时间增加的贸易因子上限
	BASE_TRADE_FACTOR = 150,	-- 贸易因子的基础值
	PUPPET_MASTER_TRADE_FACTOR = 400,	-- 宗主国对傀儡国的贸易优先度（极高）
	PUPPET_TRADE_FACTOR = 0,	-- 傀儡国对宗主国的贸易优先度（极低）
	BASE_LAND_TRADE_RANGE = 1000,	-- 陆路贸易的基础最大距离（单位未注明，可能是像素或公里）
	PARTY_SUPPORT_TRADE_FACTOR = 50,	-- 对方执政党为我方意识形态时，贸易因子额外加值（100%支持度时）
	ANTI_MONOPOLY_TRADE_FACTOR_THRESHOLD = 0.5,	-- 若某国购买资源占比超过此阈值，则触发反垄断惩罚
	ANTI_MONOPOLY_TRADE_FACTOR = -100,	-- 触发反垄断时，贸易因子额外减少此值（强烈负面）
	NAVAL_ROUTE_ACCESS_AVOID_COST_MULT = 1,	-- 海上贸易路线规划时会避开标记区域，此倍率越高，越不愿穿越高风险区域
},