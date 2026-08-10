NRaids = {
	BASE_DAYS_TO_PREPARE = 7,						   -- Base number of days required to complete raid preparation phase
	MAX_STATE_TARGETS_TO_EVALUATE_PER_HOUR = 50,	   -- PERFORMANCE (HOURLY TICK) : higher number = faster state target re-evaulation + lower performance
	RAID_TARGET_ITEM_POOL_SIZE = 512,				   -- PERFORMANCE (UI) : number of entries to reserve in the raid target item pool
	RAID_TYPE_ICON_ITEM_POOL_SIZE = 512,			   -- PERFORMANCE (UI) : number of entries to reserve in the raid type icon item pool
    RAID_LOW_RISK_SETTING_DISASTER_MODIFIER = 0,       -- How much the disaster risk is modified when the dial is set to "low"
    RAID_MEDIUM_RISK_SETTING_DISASTER_MODIFIER = 0.1,  -- How much the disaster risk is modified when the dial is set to "medium"
    RAID_HIGH_RISK_SETTING_DISASTER_MODIFIER = 0.25,   -- How much the disaster risk is modified when the dial is set to "high"
    RAID_SUCCESS_MODIFIER_THRESHOLD_BAD = -10.0,       -- If a success chance modifier is below this value, it will be displayed in red
    RAID_SUCCESS_MODIFIER_THRESHOLD_NEUTRAL = 0.0,     -- If a success chance modifier is below this value, it will be displayed in yellow
	MAX_DETECTED_TARGETS_PER_HOUR = 1,                 -- PERFORMANCE (HOURLY TICK) : max number of targets to be detected per hour, NOTE : keep this low because detection is checked against every country!
	RAID_DEFAULT_TARGET_COOLDOWN_DAYS = 365,           -- The default cooldown (in days) for raiding the same target, can be overriden for specific raid types through script
	RAID_UNIT_SPEED_MULTIPLIER = 0.1,                  -- Global speed control
	BASE_NAVAL_COMMANDO_RAID_DISTANCE = 1500,         -- Max distance in kilometers

    RAID_LOW_RISK_SETTING_SUCCESS_MODIFIER = 0.0,       -- How much the success chance is modified when the dial is set to "low"
    RAID_MEDIUM_RISK_SETTING_SUCCESS_MODIFIER = 0.1,    -- How much the success chance is modified when the dial is set to "low"
    RAID_HIGH_RISK_SETTING_SUCCESS_MODIFIER = 0.25,     -- How much the success chance is modified when the dial is set to "low"

	TARGET_DETECTION_INTEL_TRESHOLD = 20.0,             -- How much intel is needed for a target to be detected?

	TARGET_INTEL_PER_CIVILIAN_INTEL_OVER_COUNTRY = 0.5,		-- Intel level over target country is scaled by this value
	TARGET_INTEL_PER_ARMY_INTEL_OVER_COUNTRY = 0.5,			-- Intel level over target country is scaled by this value
	TARGET_INTEL_PER_NAVY_INTEL_OVER_COUNTRY = 0.5,			-- Intel level over target country is scaled by this value
	TARGET_INTEL_PER_AIRFORCE_INTEL_OVER_COUNTRY = 0.5,		-- Intel level over target country is scaled by this value

	TARGET_INTEL_PER_NETWORK_STRENGTH = 0.5,				-- Intel network strength in target state is scaled by this value
	TARGET_INTEL_FROM_CONTROLLED_NEIGHBOUR_STATES = 15.0,	-- Flat bonus for having control over at least one neighbour state
	TARGET_INTEL_PER_AIR_SUPERIORITY = 0.5,					-- Air superiority over target region is scaled by this value
	TARGET_INTEL_FROM_DECRYPTION = 25.0,					-- Flat bonus for having fully decrypted their ciphers
	TARGET_INTEL_PENALTY_PER_ENEMY_COUNTER_INTEL = 5.0,		-- Enemy counter intel is scaled by this value

	RAID_OUTCOME_REPORT_DAYS_TO_LIVE = 30,                  -- How many days after a raid has ended will the raid outcome report be visible on the map before being automatically dismissed

	NUCLEAR_BOMB_PRODUCTION_SCALE = 2555.0,					-- +1 nuclear_production gives 1 nuke per 7 years
	THERMONUCLEAR_BOMB_PRODUCTION_SCALE = 2555.0,			-- +1 nuclear_production gives 1 nuke per 7 years

	NUCLEAR_BOMB_MIN_DAMAGE_PERCENT = 0.1,					-- Minimum damage from nukes as a percentage of current strength/organisation
	NUCLEAR_BOMB_MAX_DAMAGE_PERCENT = 0.9,					-- Minimum damage from nukes as a percentage of current strength/organisation
	THERMONUCLEAR_BOMB_MIN_DAMAGE_PERCENT = 0.6,			-- Minimum damage from nukes as a percentage of current strength/organisation
	THERMONUCLEAR_BOMB_MAX_DAMAGE_PERCENT = 0.9,			-- Minimum damage from nukes as a percentage of current strength/organisation
	NUCLEAR_RAID_CATEGORY_NAME = "nuclear_raids",           -- The raid category to activate when clicking on the "nuclear" mission button for a rocket

	ARMY_TRANSFER_MOVE_SAFELY = true,						-- Whether to move safely when transferring divisions to the raid source
	ARMY_TRANSFER_AVOID_ENEMY = true,						-- Whether to avoid enemy when transferring divisions to the raid source

	MAX_TARGETS_TO_UPDATE_PER_FRAME = 100,					-- PERFORMANCE (FRAME) : max raid targets to evaluate per frame (affects raid map icon refresh rate)
},

NRaids = { --突袭相关定义
	BASE_DAYS_TO_PREPARE = 7,						   -- 突袭准备阶段所需的基础天数
	MAX_STATE_TARGETS_TO_EVALUATE_PER_HOUR = 50,	   -- 性能优化（每小时）：数值越高，目标重新评估越快 + 性能越低
	RAID_TARGET_ITEM_POOL_SIZE = 512,				   -- 性能优化（界面）：突袭目标项池预留条目数
	RAID_TYPE_ICON_ITEM_POOL_SIZE = 512,			   -- 性能优化（界面）：突袭类型图标项池预留条目数
    RAID_LOW_RISK_SETTING_DISASTER_MODIFIER = 0,       -- 当风险旋钮设为“低”时，灾难风险的修正值
    RAID_MEDIUM_RISK_SETTING_DISASTER_MODIFIER = 0.1,  -- 当风险旋钮设为“中”时，灾难风险的修正值
    RAID_HIGH_RISK_SETTING_DISASTER_MODIFIER = 0.25,   -- 当风险旋钮设为“高”时，灾难风险的修正值
    RAID_SUCCESS_MODIFIER_THRESHOLD_BAD = -10.0,       -- 若成功概率修正低于此值，将以红色显示
    RAID_SUCCESS_MODIFIER_THRESHOLD_NEUTRAL = 0.0,     -- 若成功概率修正低于此值，将以黄色显示
	MAX_DETECTED_TARGETS_PER_HOUR = 1,                 -- 性能优化（每小时）：每小时最多可侦测到的目标数，注意：检测需对所有国家检查，请保持较低数值！
	RAID_DEFAULT_TARGET_COOLDOWN_DAYS = 365,           -- 对同一目标再次突袭的默认冷却天数（可通过脚本为特定突袭类型覆盖）
	RAID_UNIT_SPEED_MULTIPLIER = 0.1,                  -- 全局速度控制系数
	BASE_NAVAL_COMMANDO_RAID_DISTANCE = 1500,         -- 海军突击队突袭的最大距离（公里）

    RAID_LOW_RISK_SETTING_SUCCESS_MODIFIER = 0.0,       -- 当风险旋钮设为“低”时，成功概率的修正值
    RAID_MEDIUM_RISK_SETTING_SUCCESS_MODIFIER = 0.1,    -- 当风险旋钮设为“中”时，成功概率的修正值
    RAID_HIGH_RISK_SETTING_SUCCESS_MODIFIER = 0.25,     -- 当风险旋钮设为“高”时，成功概率的修正值

	TARGET_DETECTION_INTEL_TRESHOLD = 20.0,             -- 侦测目标所需的最低情报值

	TARGET_INTEL_PER_CIVILIAN_INTEL_OVER_COUNTRY = 0.5,		-- 对目标国的民用情报等级按此系数缩放
	TARGET_INTEL_PER_ARMY_INTEL_OVER_COUNTRY = 0.5,			-- 对目标国的陆军情报等级按此系数缩放
	TARGET_INTEL_PER_NAVY_INTEL_OVER_COUNTRY = 0.5,			-- 对目标国的海军情报等级按此系数缩放
	TARGET_INTEL_PER_AIRFORCE_INTEL_OVER_COUNTRY = 0.5,		-- 对目标国的空军情报等级按此系数缩放

	TARGET_INTEL_PER_NETWORK_STRENGTH = 0.5,				-- 目标州情报网络强度按此系数缩放
	TARGET_INTEL_FROM_CONTROLLED_NEIGHBOUR_STATES = 15.0,	-- 控制至少一个邻州所获得的固定情报加成
	TARGET_INTEL_PER_AIR_SUPERIORITY = 0.5,					-- 目标区域空中优势按此系数缩放
	TARGET_INTEL_FROM_DECRYPTION = 25.0,					-- 完全破译对方密码所获得的固定情报加成
	TARGET_INTEL_PENALTY_PER_ENEMY_COUNTER_INTEL = 5.0,		-- 敌方反情报值按此系数作为惩罚

	RAID_OUTCOME_REPORT_DAYS_TO_LIVE = 30,                  -- 突袭结束后，突袭结果报告在地图上保留的天数，之后自动清除

	NUCLEAR_BOMB_PRODUCTION_SCALE = 2555.0,					-- 每1点核生产每7年提供1枚核弹
	THERMONUCLEAR_BOMB_PRODUCTION_SCALE = 2555.0,			-- 每1点核生产每7年提供1枚热核弹

	NUCLEAR_BOMB_MIN_DAMAGE_PERCENT = 0.1,					-- 核弹造成的最小伤害（占当前兵力/组织的百分比）
	NUCLEAR_BOMB_MAX_DAMAGE_PERCENT = 0.9,					-- 核弹造成的最大伤害（占当前兵力/组织的百分比）
	THERMONUCLEAR_BOMB_MIN_DAMAGE_PERCENT = 0.6,			-- 热核弹造成的最小伤害（占当前兵力/组织的百分比）
	THERMONUCLEAR_BOMB_MAX_DAMAGE_PERCENT = 0.9,			-- 热核弹造成的最大伤害（占当前兵力/组织的百分比）
	NUCLEAR_RAID_CATEGORY_NAME = "nuclear_raids",           -- 点击火箭“核”任务按钮时激活的突袭类别

	ARMY_TRANSFER_MOVE_SAFELY = true,						-- 向突袭出发地调动师时是否采用安全移动
	ARMY_TRANSFER_AVOID_ENEMY = true,						-- 向突袭出发地调动师时是否避开敌军

	MAX_TARGETS_TO_UPDATE_PER_FRAME = 100,					-- 性能优化（帧）：每帧最多更新的突袭目标数（影响突袭地图图标刷新频率）
},