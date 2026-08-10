# TNO Admin_Title（行政区划）系统运作原理

> 最后更新：2026-07-28　基于 TNO 本体源码

---

## 一、系统概览

Admin_Title 系统是 TNO 用来描述每个 HOI4 state 的**行政区划层级**的系统。每个州上存储若干 token 变量，游戏内通过 scripted localisation 的多层后缀拼接，在州视图文本框和专用地图模式中展示该州属于什么行政区划。

### 概念层级

| 层级 | 变量名 | 含义 | Token 示例 |
|------|--------|------|------------|
| 1 | `AdminTitle` | 一级行政区划类型 | `token:Admin_Title_ASR`（行政督察区） |
| 2 | `AssocRegion` | 主关联地理区域 | `token:Assoc_Region_Gansu_Province`（甘肃省） |
| 3 | `AssocRegion2` | 次关联地理区域 | `token:Assoc_Region_Northwest_China`（西北地区） |
| 4 | `SubAdminTitle` | 下级行政区划类型 | `token:Admin_Title_County`（县） |
| 5 | `SubDivisions` | 下辖具体分区数量（int） | `4` → 文本框列出 4 个下属县名 |

### 州上存储的变量一览

**核心变量（所有国家通用）：**

| 变量 | 类型 | 用途 |
|------|------|------|
| `AdminTitle` | token | 该州的行政区划类型 |
| `AssocRegion` | token | 主关联区域（省份/大区） |
| `AssocRegion2` | token | 次关联区域（宏观大区） |
| `SubAdminTitle` | token | 下级区划类型 |
| `SubDivisions` | int | 下辖区划数量，控制文本框显示多少条目 |

**中国专用的间接索引变量**（存储在 state history 中，启动时由 `admin_title_asia_effects.txt` 读取并转换为上述核心变量）：

| 变量 | 类型 | 用途 |
|------|------|------|
| `china_state_ref` | int | 该州对应哪个中国省份（0~57） |
| `china_region_ref` | int | 该省属于哪个宏观大区（0~7） |
| `china_city_ref` | int | 标记该州是否为直辖市（有值即为是） |

**其他国家专用的间接索引变量**（类似原理）：

| 变量 | 国家 | 用途 |
|------|------|------|
| `is_portuguese_state` | IBR（伊比利亚） | 标记该州为葡萄牙侧 |
| `is_spanish_state` | IBR | 标记该州为西班牙侧 |
| `is_moroccan_state` | MOR（摩洛哥） | 标记该州为摩洛哥本土 |

---

## 二、核心文件清单

```
tno模组文件夹/
├── common/
│   ├── ideas/admin_title_ideas.txt
│   │     └─ 注册用的隐藏 idea，每个 token 对应一个 idea
│   │        其 on_add 向全局数组注册该 token 的 EndoExo 属性
│   │
│   ├── scripted_effects/
│   │   ├── admin_title_scripted_effects.txt
│   │   │     ├─ TNO_admin_titles        — 总入口，顺序调用各洲初始化
│   │   │     ├─ TNO_admin_title_initialization — add_ideas 注册所有 token
│   │   │     ├─ TNO_adjust_admin_title  — 修改州的 AdminTitle
│   │   │     ├─ TNO_adjust_assoc_region — 修改州的 AssocRegion
│   │   │     ├─ TNO_adjust_assoc_region_2 — 修改州的 AssocRegion2
│   │   │     ├─ TNO_adjust_sub_admin_title — 修改州的 SubAdminTitle
│   │   │     ├─ TNO_clear_admin_title   — 清除州的 AdminTitle
│   │   │     ├─ TNO_clear_assoc_region  — 清除州的 AssocRegion
│   │   │     ├─ TNO_clear_assoc_region_2 — 清除州的 AssocRegion2
│   │   │     ├─ TNO_clear_sub_admin_title — 清除州的 SubAdminTitle
│   │   │     ├─ TNO_admin_title_exo_button_effects — 外名按钮的批量覆盖
│   │   │     └─ TNO_admin_title_default_button_effects — 恢复默认按钮
│   │   │
│   │   ├── admin_title_state_control_effects.txt
│   │   │     └─ 按 token 命名的 effect，处理控制权变更时的交互
│   │   │        命名规则：TNO_admin_title_state_control_effect_[TOKEN_NAME]
│   │   │        例如：TNO_admin_title_state_control_effect_Admin_Title_Province
│   │   │
│   │   ├── admin_title_asia_effects.txt
│   │   │     └─ TNO_admin_title_asia — 亚洲各国州的 title 初始分配
│   │   ├── admin_title_europe_effects.txt
│   │   │     └─ TNO_admin_title_europe — 欧洲各国州的 title 初始分配
│   │   ├── admin_title_americas_effects.txt
│   │   │     └─ TNO_admin_title_americas — 美洲各国州的 title 初始分配
│   │   └── admin_title_africa_effects.txt
│   │         └─ TNO_admin_title_africa — 非洲各国州的 title 初始分配
│   │
│   ├── scripted_guis/TNO_admin_title.txt
│   │     ├─ TNO_AdminTitle_GUI          — 州视图内嵌的 GUI（左键/右键点击按钮）
│   │     └─ TNO_AdminTitle_MapmodeControlGUI — 地图模式控制面板（4 个配置按钮）
│   │
│   ├── scripted_localisation/
│   │   └── admin_title_scripted_localisation.txt
│   │         └─ defined_text 集合，负责最终显示名称的多层拼接
│   │            （包含 GUI、Textbox、MapMode 三套独立的 defined_text 链）
│   │
│   ├── map_modes/TNO_admin_title_map_mode.txt
│   │     └─ scripted_map_modes: tno_admin_title_map_mode
│   │         按 selected_state 的类型给其他州着色
│   │
│   └── on_actions/
│       ├── TNO_on_startup_actions.txt
│       │     └─ ZZZ → TNO_admin_titles = yes（初始化入口）
│       └── TNO_on_state_control_changed_actions.txt
│             └─ 动态调用 admin_title_state_control_effects.txt 中的对应 effect
│
├── localisation/english/admin_title_l_english.yml
│     ├─ 文本框模板字符串
│     ├─ 所有 Admin Title token 的本地化（含各种语言后缀）
│     └─ 所有 Assoc Region token 的本地化
│
└── interface/
    ├── TNO_admin_title.gui              — 实际 GUI 布局
    └── admin_title.gfx                  — 图形资源
```

---

## 三、完整工作流程

### 3.1 启动初始化

```
on_startup
  └─ ZZZ → TNO_admin_titles = yes
       │
       ├─ TNO_admin_title_initialization = yes
       │     └─ 向所有国家 add_ideas 全部 Admin Title / Assoc Region 的隐藏 idea
       │         每个 idea 的 on_add 做两件事：
       │         1. remove_ideas（自己）→ 不显示在国策界面
       │         2. add_to_array 向全局数组注册其 EndoExo 分类标签
       │
       ├─ TNO_admin_title_europe = yes      → 欧洲各国州的变量赋值
       ├─ TNO_admin_title_americas = yes    → 美洲各国州的变量赋值
       ├─ TNO_admin_title_asia = yes        → 亚洲各国州的变量赋值
       └─ TNO_admin_title_africa = yes      → 非洲各国州的变量赋值
```

初始化完成后的 **收尾步骤**（同在 `TNO_admin_titles` 内）：

```hoi4
every_country = {
    capital_scope = {
        if = {
            limit = { OR = { has_variable = AdminTitle / AssocRegion / SubAdminTitle } }
            PREV = { set_variable = { TNO_admin_title_map_mode_selected_state = capital } }
        }
        else = { set_variable = { PREV.TNO_admin_title_map_mode_selected_state = 1 } }
    }
    set_variable = { TNO_admin_title_map_mode_config = 1 }
    force_update_map_mode = { mapmode = tno_admin_title_map_mode }
}
```

> 每个国家选择一个默认州作为地图模式的"参考州"；如果首都州没有 Admin Title 变量，用 state 1 作为后备。

### 3.2 Idea 注册机制详解

`admin_title_ideas.txt` 中的 idea 是系统工作的**基础**。每个 admin title token 都有一个对应的隐藏 idea：

```hoi4
# 简单 title——无需在控制权变更时做任何事
Admin_Title_Reichsgau = {
    on_add = {
        remove_ideas = Admin_Title_Reichsgau
        set_temp_variable = { i = token:Admin_Title_Reichsgau }
    }
}

# 复杂 title——标记 EndoExo 属性和控制权变更交互
Admin_Title_State = {
    on_add = {
        remove_ideas = Admin_Title_State
        set_temp_variable = { i = token:Admin_Title_State }
        add_to_array = { global.has_spanish_endonym = i }    # 西语国家可用内名版
        add_to_array = { global.has_portuguese_endonym = i }  # 葡语国家
        add_to_array = { global.has_arabic_endonym = i }      # 阿拉伯语国家
        add_to_array = { global.has_burmese_endonym = i }     # 缅甸
        add_to_array = { global.has_indian_endonym = i }      # 印度
    }
}

# 有控制权变更交互的 title
Admin_Title_Concession = {
    on_add = {
        remove_ideas = Admin_Title_Concession
        set_temp_variable = { i = token:Admin_Title_Concession }
        add_to_array = { global.has_title_interaction = i }   # 控制权变更时触发
    }
}
```

**为什么用 idea 的 on_add？** HOI4 的 idea system 提供了一个可靠的"定义时执行一次"的钩子。`add_ideas` 后 idea 立即触发 `on_add`，向全局数组注册完就 `remove_ideas` 自删，不会留下痕迹。

### 3.3 全局数组分类体系

所有 idea 注册后，以下全局数组可供后续 `is_in_array` 查询：

| 数组 | 含义 |
|------|------|
| `global.has_title_interaction` | 该 token 在控制权变更时需要触发交互 effect |
| `global.is_admin_region` | 该 AssocRegion 是"行政区域"（如直辖市）而非普通"区域" |
| `global.has_short_name` | 该 token 支持缩写版（`_Short` 后缀本地化键） |

**语言标记（Default 类——无 endonym flag 时的默认行为）：**

| 数组 | 控制者条件 |
|------|-----------|
| `global.has_russian_default` | controller in `global.russian_names` |
| `global.has_japanese_default` | controller in `global.japanese_names` |
| `global.has_italian_default` | controller in `global.italian_names` |
| `global.has_spanish_default` | controller in `global.spanish_names` |
| `global.has_german_default` | controller in `global.german_names` |
| `global.has_french_default` | controller in `global.french_names` |

**语言标记（Endonym 类——`TNO_endonym_mode` flag 开启时）：**

| 数组 | 控制者条件 |
|------|-----------|
| `global.has_italian_endonym` | controller in `global.italian_names` |
| `global.has_arabic_endonym` | controller in `global.arabic_names` |
| `global.has_turkish_endonym` | controller = TUR 或其傀儡 |
| `global.has_chinese_endonym` | controller = CHI 或 chinese_warlords |
| `global.has_french_endonym` | controller in `global.french_names` |
| `global.has_spanish_endonym` | controller in `global.spanish_names` |
| `global.has_portuguese_endonym` | controller in `global.portuguese_names` |
| `global.has_swedish_endonym` | is_controlled_by = SWE |
| `global.has_burmese_endonym` | is_controlled_by = BUR |
| `global.has_thai_endonym` | is_controlled_by = THA |
| `global.has_greek_endonym` | is_controlled_by = GRE |
| `global.has_finnish_endonym` | is_controlled_by = FIN |
| `global.has_dutch_endonym` | controller in `global.dutch_names` |
| `global.has_indian_endonym` | controller in `global.indian_names` |
| `global.has_romanian_endonym` | is_controlled_by = ROM |
| `global.has_hungarian_endonym` | is_controlled_by = HUN |
| `global.has_bulgarian_endonym` | is_controlled_by = BUL |
| `global.has_serbian_endonym` | is_controlled_by = SER / GMS / MNT |

### 3.4 四洲分配详解

四大洲的 effect 文件各自采用不同的分配模式。最常见的三种写法：

| 写法 | 适用场景 |
|------|---------|
| `TAG.every_owned_state + limit` | 国家所有符合条件的州统一分配 |
| `every_state + limit = { state = X ... }` | 跨国家的区域分配（如 AssocRegion 通常不限控制者） |
| `set_variable = { `*state_id*`.var = token }` | 单州的特殊覆盖 |

#### 3.4.1 欧洲（`TNO_admin_title_europe`）

| 国家 | 模式 | 细节 |
|------|------|------|
| **ALB**（阿尔巴尼亚） | `every_owned_state` → SubAdminTitle = Province | 全国统一 SubAdmin |
| **FIN**（芬兰） | `every_owned_state` + 排除首都 → AdminTitle = Province；排除首都 → SubAdminTitle = Municipality | 首都（state 111）单设为 City |
| **FRS**（法兰西国） | `every_owned_state` → AdminTitle = Department | 全国统一 |
| **GER**（德国） | **最复杂**——分多层：先对特定 state 设 Military_Territory / Urban_District / District，再按 AssocRegion（RG_*）排除后设默认 Reichsgau，SubAdminTitle 也按 check_variable 分类 | 见下详述 |
| **GRE**（希腊） | `every_owned_state` 排除 Cyprus 四州 → AdminTitle = Department；Cyprus 州设 AssocRegion = Cyprus_Dept，SubAdminTitle = Prefecture | |
| **IBR**（伊比利亚） | 按 `is_portuguese_state` / `is_spanish_state` 分流 → Province / Municipality / County；SubAdminTitle = Province + 部分州设 SubDivisions（2~4） | |
| **西班牙子区域** | 17 个 AssocRegion（Galicia_Iberia / Asturias / Leon / Old_Castile / Basque_Country / Navarre / Aragon / Catalonia / Valencia / Balearic_Islands / Murcia / New_Castile / Andalusia / Extremadura 等），部分有 AssocRegion2 | |
| **IRE / ULS**（爱尔兰 / 阿尔斯特） | `every_owned_state` → AdminTitle = County | 简单统一 |
| **ITA**（意大利） | 分三类 state 列表 → AdminTitle = Province / Municipality / Governorate；三个宏观 AssocRegion：North_Italy / Central_Italy / South_Italy；SubAdminTitle = Province（排除特定州后） | |
| **MCW**（莫斯科总督辖区） | 部分州 AdminTitle = District_Area，9 个 AssocRegion（Tula / Penza / Kursk / Moscow / Volgograd / Saratov / Saint_Petersburg / Voronezh / Yaroslavl），SubAdminTitle = District_Area | |
| **OST**（奥斯特兰总督辖区） | Estonia / Latvia / Lithuania / Belarus 四个 AssocRegion；部分州 AdminTitle = District_Area，SubAdminTitle = District_Area | |
| **SWE**（瑞典） | `every_owned_state` 排除首都 → AdminTitle = County；排除首都+特殊州 → SubAdminTitle = Municipality | 首都（state 141）= City |
| **UKR**（乌克兰总督辖区） | 6 个 AssocRegion（Kyiv / Yekaterinoslav / Chernihiv / Zhytomyr / Volyn / Yuzivka）；Kyiv 市 AdminTitle = District_Area；SubAdminTitle = District_Area | |
| **ENG**（英国） | `every_owned_state` → AdminTitle = County / Shrieval_County（特定五个州）+ Crown_Dependency（马恩岛） | |
| **Kaukasus** | 6 个 AssocRegion（Azerbaijan / Caucasus_Mountain / Georgia / Kalmykia / Kuban / Stavropol） | 不限控制器，全局 every_state 分配 |
| **San Marino / Monaco** | 单州 `set_variable = { state_id.var = token }` | 微国家 |

**德国（GER）分配详解：**

德国的分配分 **五步**，顺序至关重要：

```
第1步：特殊军事区域 →
       state 94, 1994, 2099 → AdminTitle = Military_Territory

第2步：城市区域（Urban_District）→
       state 10, 88, 90, 92, 1380, 1382, 1391, 2261 → AdminTitle = Urban_District

第3步：普通区域（District）→
       state 1385, 1388, 1392, 1393, 1394 → AdminTitle = District

第4步：分配 AssocRegion →
       RG_Netherlands  / RG_Wallonia  / RG_Burgundy
       RG_Warsaw      / RG_Radom     / RG_Lublin
       RG_Krakow      / RG_Galicia

第5步：默认兜底 →
       所有未被以上规则覆盖的州 → AdminTitle = Reichsgau

第6步：SubAdminTitle →
       Reichsgau 或 RG_* 区域且非 Urban_District/District → SubAdminTitle = District
```

#### 3.4.2 美洲（`TNO_admin_title_americas`）

| 国家 | AdminTitle | AssocRegion | SubAdminTitle | 备注 |
|------|-----------|-------------|---------------|------|
| **ARG**（阿根廷） | 三类 state 列表 → Department / Judicial_Department / Province | — | — | 另设 Federal_Territory / National_Territory 单州覆盖 |
| **BAH**（巴哈马） | Colony | British_West_Indies + Lucayan_Archipelago（AsR2） | District | AssocRegion 用全局 every_state |
| **BLZ**（伯利兹） | Colony | — | District | |
| **BOL**（玻利维亚） | Department（大部分）/ Province（Santa Cruz 1 州） | Beni_Dept / La_Paz_Dept / Santa_Cruz_Dept | Province | |
| **BRA**（巴西） | State（大部分）/ Federal_Territory（3 州）/ Federal_District（1 州） | — | — | |
| **CAN**（加拿大） | Overseas_Territory（2 州） | Greater_Antilles（1 州） | District / Parishes_Municipalities | |
| **CHL**（智利） | Province / Department / Commune | Far_North / Near_North / Central_Core / CCP_TB / Lakes / Canals（6 个 AssocRegion） | Department / Commune（按 AdminTitle 分流） | |
| **COL**（哥伦比亚） | Department / Special_Commissariat / City / Special_District / Concession | — | — | |
| **CUB**（古巴） | Province（2 州） | Greater_Antilles | Province / Region（按 AdminTitle 分流）+ SubDivisions = 2 | |
| **DOM**（多米尼加） | District（首都）| Cibao / East / South + Greater_Antilles（AsR2） | Province | |
| **FWI**（法属西印度） | Territorial_Council | French_West_Indies + Lesser_Antilles（AsR2） | Commune | |
| **GUY**（圭亚那） | Colony | British_West_Indies | District | |
| **HAI**（海地） | Department / District（首都） | Greater_Antilles | District / Commune / Department | SubDivisions = 2 |
| **MEX**（墨西哥） | State（大部分）/ Territory（3 州）/ Federal_District（首都） | — | — | |
| **PAR**（巴拉圭） | Department（4 州） | Chaco / Paranena | Department（非 Chaco 核心州）| SubDivisions = 2~3 |
| **PRU**（秘鲁） | Department / Province（1 特例） | — | — | |
| **SUR**（苏里南） | Constituent_Country | Netherlands_Antilles + Lesser_Antilles（AsR2） | District | |
| **URG**（乌拉圭） | — | Interior / Montevideo | Department | 无 AdminTitle，只有 AssocRegion+SubAdmin |
| **USA**（美国） | State（本土 48 州 + 阿拉斯加+夏威夷）/ Civil_Administration / Unc_Territory（14 州+领地）/ Inc_Territory / Concession / Federal_District | Greater_Antilles / Lesser_Antilles（海外领土） | County（主力）/ COG / Parish / Borough / Municipality / District / Districts_Unorganized_Atolls | |
| **VEN**（委内瑞拉） | State / Territory | — | — | |
| **SKN / SVI**（背风/向风群岛） | Colony | British_West_Indies + Lesser_Antilles（AsR2） | Parish / Parishes_Dependencies / District | |
| **加勒比单州岛屿** | Barbados / Jamaica / Trinidad 均为单州直接 set_variable | British_West_Indies / French_West_Indies 等 | Parish / County | |

#### 3.4.3 亚洲（`TNO_admin_title_asia`）

##### 3.4.3.1 中国

中国用 **两轮 `for_each_scope_loop` 遍历 `global.greater_china_states` + 一轮 SubAdminTitle 循环**：

```
第一轮 — AdminTitle:
  china_state_ref = 15 或 36     → SAR（特别行政区）
  has_variable = china_city_ref   → Municipality（直辖市）
  其他                            → ASR（Administrative Supervision District，行政督察区）

第二轮 — AssocRegion + AssocRegion2:
  china_state_ref = 0~57          → 对应省份 AssocRegion（如 41 = Gansu_Province）
  china_region_ref = 0~7          → 对应宏观大区 AssocRegion2
    0 = East_China      1 = North_China
    2 = Southwest_China  3 = South_Central_China
    4 = South_China      5 = Northwest_China
    6 = Northeast_China  7 = Frontier

第三轮 — SubAdminTitle:
  Tibet_Area                     → Dzong
  Mongolia_Area                  → Leagues_Banners
  Qinghai / Chahar / Suiyuan     → Counties_Leagues_Banners
  直辖市类                        → District
  默认                           → County
```

> 中国的分配依赖 state history 文件中预定义的 `china_state_ref` 和 `china_region_ref` 整数变量。子模组只需修改这些变量即可改变州的归属。

##### 3.4.3.2 日本

日本分配分 **两阶段**（先分配 AssocRegion，再根据 AssocRegion 分配 AdminTitle）：

```
第1阶段 — AdminTitle（按 state ID 直接分类）:
  state 630, 631            → Urban_Prefecture（府）
  state 282                  → Metropolis（都）
  台湾 7 州                  → Prefecture_Shu（州）+ Prefecture_Cho（庁）
  14 个岛屿/领土/条约港      → Territory
  state 768, 769             → Treaty_Port

第2阶段 — AssocRegion（14 个区域）:
  Kanto   / Tohoku   / Hokkaido      / Koshin
  Hokuriku / Tokai   / Kinki         / Sanyo
  Sanin   / Shikoku  / Kyushu        / Okinawa
  Nanyo（南洋厅）  / Taiwan_Jap  / Korea  / Sakhalin
  New_Guinea  / Ogasawara_Subprefecture

第3阶段 — AdminTitle 兜底（按 AssocRegion 倒推）:
  Hokkaido / Korea                    → Circuit（道）
  日本本土所有非 Urban/Metropolis 的州 → Prefecture（県）

SubAdminTitle:
  12 个特定离岛州 → Subprefecture（支庁）
```

##### 3.4.3.3 印度

三个印度国家各自分配：

| 国家 | AdminTitle | SubAdminTitle |
|------|-----------|---------------|
| **AZH**（自由印度） | Division（大部分）/ Admin_Region（3 州） | District（Division 下）/ Division（Admin_Region 下） |
| **IND**（印度共和国） | Division（大部分）/ Union_Territory（5 州）/ State（1 州） | District |
| **PAK**（巴基斯坦） | Division | District |
| **KLT**（卡尔提斯坦） | Division | District |

**AssocRegion** 用全局 `every_state` 分配，不限控制器。每个邦都有 State/PMA/AR/UT 等多个变体（如 `Assoc_Region_Punjab_State` / `Punjab_PMA` / `Punjab_AR`），控制权变更时在 `admin_title_state_control_effects.txt` 中互相转换。

##### 3.4.3.4 土耳其

```
AdminTitle:
  TUR 的 6 个指定州 → Province
  state 1993          → Special_Zone
  state 1779          → Province

AssocRegion（7 个大区）:
  Aegean / Black_Sea / Central_Anatolia / East_Anatolia
  Marmara / Mediterranean / Southeast_Anatolia

SubAdminTitle:
  AssocRegion 下非 Province 州 → Province
  AssocRegion 下是 Province 州  → District
```

##### 3.4.3.5 其他亚洲国家

| 国家 | AdminTitle | AssocRegion | SubAdminTitle |
|------|-----------|-------------|---------------|
| **BUR**（缅甸） | State（9 州）/ Division（7 州） | — | — |
| **KAZ**（哈萨克斯坦） | Region | — | — |
| **THA**（泰国） | Province | — | — |
| **IRQ**（伊拉克） | Banner | — | — |

#### 3.4.4 非洲（`TNO_admin_title_africa`）

非洲文件较小，主要涉及三个国家：

| 国家 | AdminTitle | 备注 |
|------|-----------|------|
| **EGY**（埃及） | Governorate | 全国统一 |
| **IBR**（伊比利亚非洲殖民地） | Colonial_Province（7 州）/ Colony（3 州） | 西班牙+葡萄牙殖民地 |
| **MOR**（摩洛哥） | State（大部分，按 `is_moroccan_state` flag）/ Municipality（1 州） | |
| **TUN**（突尼斯） | Governorate（1 州） | SubAdminTitle = Governorate（其余州） |

---

### 3.5 关键 Lookup 变量速查

#### 3.5.1 中国 `china_state_ref` → 省份

| ref | AssocRegion | ref | AssocRegion | ref | AssocRegion |
|:---:|---|:---:|---|:---:|---|
| 0 | Nanjing Municipality | 20 | Yunnan Province | 40 | Longxi Province |
| 1 | Shanghai Municipality | 21 | Xikang Province | 41 | Gansu Province |
| 2 | Jiangsu Province | 22 | Tibet Area | 42 | Qinghai Province |
| 3 | Huaihai Province | 23 | Wuhan Municipality | 43 | Xinjiang Province |
| 4 | Zhejiang Province | 24 | Jiangxi Province | 44 | Mukden Municipality |
| 5 | Ouhai Province | 25 | Ganjiang Province | 45 | Changchun Municipality |
| 6 | Anhui Province | 26 | Hubei Province | 46 | Harbin Municipality |
| 7 | Beijing Municipality | 27 | Hunan Province | 47 | Dalian Municipality |
| 8 | Tianjin Municipality | 28 | Hengnan Province | 48 | Liaoning Province |
| 9 | Qingdao Municipality | 29 | Henan Province | 49 | Jilin Province |
| 10 | Zhili Province | 30 | Zhongyuan Province | 50 | Heilongjiang Province |
| 11 | Hebei Province | 31 | Xiamen Municipality | 51 | Jinghai Province |
| 12 | Taiyue Province | 32 | PRD SAR | 52 | Beihai Province |
| 13 | Shandong Province | 33 | Fujian Province | 53 | Kuye SAR |
| 14 | Shanxi Province | 34 | Xingquan Province | 54 | Chahar Province |
| 15 | Chongqing SAR | 35 | Guangdong Province | 55 | Suiyuan Province |
| 16 | Chuandong Province | 36 | Qiongya SAR | 56 | Rehe Province |
| 17 | Chuanxi Province | 37 | Taiwan SAR | 57 | Mongolia Area |
| 18 | Guizhou Province | 38 | Shaanxi Province | | |
| 19 | Guangxi Province | 39 | Hanzhong Province | | |

#### 3.5.2 中国 `china_region_ref` → 宏观大区

| ref | AssocRegion2 | 包含省份范围 |
|:---:|---|---|
| 0 | East China | Jiangsu, Shanghai, Zhejiang, Anhui 等 |
| 1 | North China | Beijing, Tianjin, Hebei, Shandong, Shanxi 等 |
| 2 | Southwest China | Sichuan, Chongqing, Yunnan, Guizhou 等 |
| 3 | South Central China | Hubei, Hunan, Jiangxi, Henan 等 |
| 4 | South China | Guangdong, Guangxi, Fujian, Taiwan, Hainan 等 |
| 5 | Northwest China | Shaanxi, Gansu, Qinghai, Xinjiang 等 |
| 6 | Northeast China | Liaoning, Jilin, Heilongjiang 等 |
| 7 | Frontier | Mongolia Area 等 |

#### 3.5.3 日本 `AssocRegion` 速查

| AssocRegion | 覆盖区域 |
|---|---|
| Kanto | 东京都 + 周边 7 州 |
| Tohoku | 东北 6 州 |
| Hokkaido | state 536 |
| Koshin | 甲信 2 州 |
| Hokuriku | 北陆 4 州 |
| Tokai | 东海 4 州 |
| Kinki | 近畿 6 州（含大阪府、京都府） |
| Sanyo | 山阳 3 州 |
| Sanin | 山阴 2 州 |
| Shikoku | 四国 4 州 |
| Kyushu | 九州 7 州 |
| Okinawa | state 526 |
| Nanyo | 南洋群岛（密克罗尼西亚诸岛） |
| Taiwan_Jap | 台湾 7 州 |
| Korea | 朝鲜半岛 13 州 |
| Sakhalin | state 537 |
| New_Guinea | 新几内亚 5 州 |
| Ogasawara_Subprefecture | state 645, 648 |

#### 3.5.4 印度 `AssocRegion` 速查

印度各邦的 AssocRegion 使用 `_State` / `_PMA` / `_AR` / `_UT` 后缀区分政治状态：

| 后缀 | 含义 | 使用国家 |
|------|------|---------|
| `_State` | 普通邦 | IND |
| `_PMA` | Provincial Military Administration（省军事管理局） | AZH |
| `_AR` | Autonomous Region（自治区） | AZH |
| `_UT` | Union Territory（中央直辖区） | IND |

**IND（印度共和国）的邦：**
Punjab_State / Himachal_Pradesh_UT / Jammu_Kashmir_State / Sindh_State / Rajasthan_State / Uttar_Pradesh_State / Madhya_Pradesh_State / Gujarat_State / Maharashtra_State / Mysore_State / Madras_State / Andhra_Pradesh_State / Orissa_State / Bihar_State（另有 Bihar_UT）/ Bengal_State（另有 Bengal_UT）/ Assam_State（另有 Assam_UT）/ Balochistan_State / Gandhara_State / Haryana_State

**AZH（自由印度）的邦：**
Bihar_AR / Bengal_AR / Assam_AR / Orissa_PMA / Gandhara_AR / Balochistan_AR 等

**PAK（巴基斯坦）的省：**
NWFP / Jammu_Kashmir_Province / Punjab_Province / Sindh_Province / Balochistan_Province

#### 3.5.5 土耳其 `AssocRegion` 速查

| AssocRegion | 覆盖 state 数 |
|---|---|
| Aegean | 4 |
| Black_Sea | 6 |
| Central_Anatolia | 4 |
| East_Anatolia | 5 |
| Marmara | 5 |
| Mediterranean | 4 |
| Southeast_Anatolia | 12（最大，涵盖库尔德地区+叙利亚北部） |

| china_state_ref | AssocRegion（省份） | china_region_ref | AssocRegion2（大区） |
|:---:|---|:---:|---|
| 0 | Nanjing Municipality | 0 | East China |
| 1 | Shanghai Municipality | 1 | North China |
| 2 | Jiangsu Province | 2 | Southwest China |
| 3 | Huaihai Province | 3 | South Central China |
| 4 | Zhejiang Province | 4 | South China |
| 5 | Ouhai Province | 5 | Northwest China |
| 6 | Anhui Province | 6 | Northeast China |
| 7 | Beijing Municipality | 7 | Frontier |
| 8 | Tianjin Municipality | | |
| 9 | Qingdao Municipality | | |
| 10 | Zhili Province | | |
| 11 | Hebei Province | | |
| 12 | Taiyue Province | | |
| 13 | Shandong Province | | |
| 14 | Shanxi Province | | |
| 15 | Chongqing SAR | | |
| 16 | Chuandong Province | | |
| 17 | Chuanxi Province | | |
| 18 | Guizhou Province | | |
| 19 | Guangxi Province | | |
| 20 | Yunnan Province | | |
| 21 | Xikang Province | | |
| 22 | Tibet Area | | |
| 23 | Wuhan Municipality | | |
| 24 | Jiangxi Province | | |
| 25 | Ganjiang Province | | |
| 26 | Hubei Province | | |
| 27 | Hunan Province | | |
| 28 | Hengnan Province | | |
| 29 | Henan Province | | |
| 30 | Zhongyuan Province | | |
| 31 | Xiamen Municipality | | |
| 32 | PRD SAR | | |
| 33 | Fujian Province | | |
| 34 | Xingquan Province | | |
| 35 | Guangdong Province | | |
| 36 | Qiongya SAR | | |
| 37 | Taiwan SAR | | |
| 38 | Shaanxi Province | | |
| 39 | Hanzhong Province | | |
| 40 | Longxi Province | | |
| 41 | Gansu Province | | |
| 42 | Qinghai Province | | |
| 43 | Xinjiang Province | | |
| 44 | Mukden Municipality | | |
| 45 | Changchun Municipality | | |
| 46 | Harbin Municipality | | |
| 47 | Dalian Municipality | | |
| 48 | Liaoning Province | | |
| 49 | Jilin Province | | |
| 50 | Heilongjiang Province | | |
| 51 | Jinghai Province | | |
| 52 | Beihai Province | | |
| 53 | Kuye SAR | | |
| 54 | Chahar Province | | |
| 55 | Suiyuan Province | | |
| 56 | Rehe Province | | |
| 57 | Mongolia Area | | |

---

## 四、显示机制：三层后缀拼接

当玩家查看一个州时，GUI 通过 `AdminTitle_Textbox_Get_AdminTitle` 等 defined_text 生成最终文本：

```
[?AdminTitle.GetTokenKey] [AdminTitle_Get_AdminTitle_Condition] [AdminTitle_Get_AdminTitle_EndoExo]
       │                            │                                    │
       ▼                            ▼                                    ▼
  基础 token 键              条件后缀                               EndoExo 后缀
  Admin_Title_Province        _pun / _kas / _pak ...               _spa / _chi / _arb ...
  = "Province"            （印度各邦 Division 词                （语言变体）
                            在不同语言中有不同拼写）
```

**最终 localisation key 由三部分拼接而成：**

```
Admin_Title_Province  +  ""       +  "_spa"   =  "Admin_Title_Province_spa"  =  "Provincia"
Admin_Title_Division  +  "_pun"   +  "_ind"   =  "Admin_Title_Division_pun_ind"
                                             =  "Divīzan"（旁遮普语+印度通用拼写）
```

### 三层的作用

**第一层（GetTokenKey）**：无条件的 token 名 → localisation key 基础部分。如 `Admin_Title_Province` → `"Province"`

**第二层（Condition）**：基于额外条件（如日期、state flag）添加后缀。最复杂的用法在印度——`Admin_Title_Division` 在不同邦有不同拼写：
- 旁遮普邦 → `_pun` → `Divīzan`
- 古吉拉特邦 → `_guj` → `Vibhāg`
- 泰米尔纳德邦 → `_tam` → `Vibhāgāla`
- **默认** → `"Division"`（无后缀）

**第三层（EndoExo）**：基于语言模式添加后缀。三种模式：
- **Default**（无特殊 flag）→ 根据控制国的默认语言加后缀
- **Endonym**（`TNO_endonym_mode`）→ 加本地语言后缀
- **Exonym**（`TNO_exonym_mode`）→ 加英语外名后缀

### 显示优先级（GUI 层面）

```hoi4
defined_text = {
    name = AdminTitle_GUI_GetName
    # 优先级 1：有 AdminTitle → 显示行政区划名称
    text = { trigger = { has_variable = AdminTitle }
        localisation_key = "[AdminTitle_GUI_Get_AdminTitle]" }

    # 优先级 2：有 AssocRegion（admin region 类）→ 显示区域名称
    text = { trigger = { has_variable = AssocRegion; is_admin_region }
        localisation_key = "[AdminTitle_GUI_Get_AssocRegion]" }

    # 优先级 3：只有 SubAdminTitle → 显示次级区划名称
    text = { trigger = { has_variable = SubAdminTitle; NOT = { AdminTitle; AssocRegion+admin_region } }
        localisation_key = "[AdminTitle_GUI_Get_SubAdminTitle]" }
}
```

---

## 五、州控制权变更机制

`TNO_on_state_control_changed_actions.txt` 中，当州的控制者变更时：

1. `FROM`（旧 owner）→ `event_target:admin_title_old_owner`
2. `ROOT`（新 owner）→ `event_target:admin_title_new_owner`
3. 读取该州当前的 `AdminTitle` / `AssocRegion` / `AssocRegion2` / `SubAdminTitle`
4. 检查该 token 是否在 `global.has_title_interaction` 数组中
5. 用 **meta_effect** 动态调用对应的 effect：

```hoi4
set_temp_variable = { current_title = AdminTitle }
meta_effect = {
    text = { TNO_admin_title_state_control_effect_[CURRENT_TITLE] = yes }
    CURRENT_TITLE = "[?current_title.GetTokenKey]"
}
```

> 这会动态调用 `admin_title_state_control_effects.txt` 中名为 `TNO_admin_title_state_control_effect_Admin_Title_Province` 等的 effect，每个 effect 内部用 `event_target:admin_title_old_owner.tag` 和 `event_target:admin_title_new_owner.tag` 比对决定如何处理。

### 中国特殊处理

所有中国七大区的 effect（`Assoc_Region_East_China` 等）都执行同样的逻辑：

```hoi4
if = {   # 日本占领（回退）
    limit = {
        has_variable = china_state_ref
        event_target:admin_title_new_owner = { tag = JAP / in_faction_with = JAP }
    }
    greater_china_admin_japan = yes
}
else_if = {   # 中国收复（恢复）
    limit = {
        has_variable = china_state_ref
        event_target:admin_title_new_owner = { tag = CHI / chinese_warlords }
    }
    greater_china_admin_reset = yes
}
```

---

## 六、地图模式

### 四种配置模式

| config 值 | 模式 | 比较内容 |
|:---:|---|---|
| 1 | Admin Title | 两个州的 `AdminTitle` token 是否相同 |
| 2 | Primary Assoc Region | 两个州的 `AssocRegion` token 是否相同 |
| 3 | Secondary Assoc Region | 两个州的 `AssocRegion2` token 是否相同 |
| 4 | Sub Admin Title | 两个州的 `SubAdminTitle` token 是否相同 |

### 交互

- **左键点击州** → 设为参考州（全局比较）
- **右键点击州** → 设为参考州 + 限定同一国家（`TNO_admin_title_map_mode_same_country_only` flag）
- 地图模式控制面板提供 4 个按钮切换 config

### 颜色规则

| 颜色 | R | G | B | 含义 |
|---|---|---|---|---|
| 亮灰 | 0.9 | 0.9 | 0.9 | 当前选中的参考州 |
| 青色 | 0.401 | 0.897 | 0.875 | 类型匹配 |
| 深青 | 0.331 | 0.741 | 0.722 | 共享类型（如 SubAdminTitle 匹配 AdminTitle） |
| 灰色 | 0.5 | 0.5 | 0.5 | 不匹配 |

---

## 七、Effect API 速查表

### 修改类

| Effect | 前提变量 | 作用 |
|--------|----------|------|
| `TNO_adjust_admin_title = yes` | `admin_title_temp`（temp variable） | 修改当前 scope 州的 AdminTitle |
| `TNO_adjust_assoc_region = yes` | `assoc_region_temp` | 修改 AssocRegion |
| `TNO_adjust_assoc_region_2 = yes` | `assoc_region_2_temp` | 修改 AssocRegion2 |
| `TNO_adjust_sub_admin_title = yes` | `sub_admin_title_temp` | 修改 SubAdminTitle |

### 清除类

| Effect | 作用 |
|--------|------|
| `TNO_clear_admin_title = yes` | 移除当前 scope 州的 AdminTitle |
| `TNO_clear_assoc_region = yes` | 移除 AssocRegion |
| `TNO_clear_assoc_region_2 = yes` | 移除 AssocRegion2 |
| `TNO_clear_sub_admin_title = yes` | 移除 SubAdminTitle |

### 工具提示

所有 adjust/clear effect 都自带 `custom_effect_tooltip`，且写入日志：
```
[GetDateText]: [Root.GetName]: TNO_adjust_assoc_region;
    Old Title: [?AssocRegion.GetTokenKey],
    New Title: [?assoc_region_temp.GetTokenKey],
    State [THIS.GetID]
```

---

## 八、子模组修改指南

### 核心原则

**子模组修改应直接替换文件，不需要关心兼容性。** 以下所有场景均假定子模组拥有自己的文件路径，HOI4 引擎会以子模组文件覆盖本体同名文件。

### 场景 A：修改州的省级归属（中国，最常见）

**只需修改 state history 文件中的 `china_state_ref` / `china_region_ref` 变量。**
TNO 本体的 `admin_title_asia_effects.txt` 在启动时读取这些变量自动分配。

例如，将州 2388（永顺）从贵州改为湖南：

```hoi4
# fsbr/history/states/2388-Yongshun.txt （覆盖 TNO 本体同名文件）
state = {
    id = 2388
    name = "STATE_2388"
    history = {
        owner = GUZ
        add_core_of = GUZ
        # ... 其余内容（buildings, manpower 等）与本体完全一致 ...
        set_variable = { china_state_ref = 27 }   # 18 (Guizhou) → 27 (Hunan)
        set_variable = { china_region_ref = 3 }   #  2 (Southwest) → 3 (South Central)
    }
    # ... 其余内容不变 ...
}
```

> 覆盖后，`admin_title_asia_effects.txt` 启动时读取到 `china_state_ref = 27`，匹配 `Assoc_Region_Hunan_Province`；读取到 `china_region_ref = 3`，匹配 `Assoc_Region_South_Central_China`。无需额外 effect 或事件。

### 场景 B：修改非中国国家的州分配

对于非中国国家（如日本、德国、印度、美国等），州上没有像 `china_state_ref` 这样的"间接索引"变量——AdminTitle 和 AssocRegion 的分配是**直接在对应洲的效果文件中按 state ID 硬编码**的。

因此，修改方法有两种：

**方法 1（推荐）：直接替换对应洲的效果文件。**

```hoi4
# fsbr/common/scripted_effects/admin_title_asia_effects.txt （覆盖 TNO 本体）
# 复制本体全部内容，修改其中需要改动的部分
```

**方法 2：如果改动量小，用 state history 文件直接 set_variable。**

由于这些变量是 set 到 state scope 上的普通变量，state history 文件中直接赋值会先于 scripted_effect 执行……但随后 `TNO_admin_title_asia` 会**覆盖**它。所以此方法**不可行**，除非你同时阻止对应 effect 的对应分支执行。

**方法 3：用新的 scripted_effect 在启动时覆盖。**

在子模组的 `on_startup` 中调用自定义 effect，用 `TNO_adjust_assoc_region` 等 API 直接修改变量。但这需要确认执行顺序在 TNO 初始化之后。

**结论：对于非中国国家，推荐方法 1（直接替换洲效果文件）。**

### 场景 C：增加新的 Admin Title 类型

1. `admin_title_ideas.txt` → 添加隐藏 idea + `on_add` 注册
2. `admin_title_l_english.yml` → 添加本地化（包含各语言后缀版本）
3. 在对应洲的效果文件中使用 `set_variable = { AdminTitle = token:新token }`

### 场景 D：为已有 Admin Title 添加新的 EndoExo 变体

1. `admin_title_ideas.txt` → 在对应 idea 的 `on_add` 中添加 `add_to_array = { global.has_xxx_endonym = i }`
2. `admin_title_scripted_localisation.txt` → 在 `AdminTitle_Get_AdminTitle_EndoExo` 等 defined_text 中添加新的 trigger 块
3. `admin_title_l_english.yml` → 添加对应语言后缀的 Localisation key

### 场景 E：国家沦陷后的 Admin Title 变更

在 `admin_title_state_control_effects.txt` 中添加新的 effect：
```hoi4
TNO_admin_title_state_control_effect_Admin_Title_XXX = {
    if = {
        limit = {
            event_target:admin_title_old_owner = { tag = OLD_TAG }
            event_target:admin_title_new_owner = { tag = NEW_TAG }
        }
        set_temp_variable = { admin_title_temp = token:Admin_Title_YYY }
        TNO_adjust_admin_title = yes
    }
}
```
同时在 `admin_title_ideas.txt` 中将对应 token 加入 `global.has_title_interaction` 数组。

---

## 九、SubDivisions 系统

`SubDivisions` 是一个 **int 变量**，存储该州下辖子区划的数量（2/3/4）。

对应的 localisation 通过 `AdminTitle_Textbox_Get_SubDivisions` 选择模板：
```
sub_admin_title_text_box_2_subdivisions_tt  → "包含 XX 县和 YY 县"
sub_admin_title_text_box_3_subdivisions_tt  → "包含 XX 县、YY 县和 ZZ 县"
sub_admin_title_text_box_4_subdivisions_tt  → "包含 XX 县、YY 县、ZZ 县和 WW 县"
```

各区划名称通过 per-state localisation key 获取：
```
SubDivision1_[STATE_ID]  → 第一个区划名
SubDivision2_[STATE_ID]  → 第二个区划名
...
```

> SubDivisions 的赋值主要在各国专属的效果文件中进行。已知使用 SubDivisions 的国家/地区：
> - **中国**：`TNO_YUN_scripted_effects.txt` 等国策效果设置
> - **伊比利亚**：`admin_title_europe_effects.txt` 中西班牙各省设 SubDivisions = 2~4
> - **巴拉圭**：`admin_title_americas_effects.txt` 中 Paraena 各省设 SubDivisions = 2~3
> - **海地**：state 1728 设 SubDivisions = 2
> - **古巴**：所有非直辖省设 SubDivisions = 2

---

## 十、附录：所有 Admin Title Token 的 EndoExo 后缀速查

| Token | 默认后缀 | Endonym 后缀 |
|-------|----------|-------------|
| `Admin_Title_State` | — | `_spa`, `_por`, `_arb`, `_bur`, `_ind` |
| `Admin_Title_Province` | `_ger` | `_spa`, `_por`, `_arb`, `_tur`, `_tha`, `_ita`, `_fin` |
| `Admin_Title_Division` | — | `_bur`, `_ind`（+Condition 后缀 `_pun`/`_kas`/`_pak`/…） |
| `Admin_Title_Municipality` | — | `_chi`, `_spa`, `_por`, `_arb`, `_swe`, `_ita`, `_fin` |
| `Admin_Title_Prefecture` | — | `_jap` |
| `Admin_Title_Territory` | — | `_spa`, `_jap` |
| `Admin_Title_Governorate` | — | `_ita`, `_arb` |
| `Admin_Title_ASR` | — | `_chi` |
| `Admin_Title_SAR` | — | `_chi` |
| `Admin_Title_Military_Territory` | — | `_ger`, `_por` |
| `Admin_Title_Admin_Region` | `_Short` | `_ind`, `_Short_ind` |
| `Admin_Title_Unc_Territory` | `_Short` | — |
| `Admin_Title_Inc_Territory` | `_Short` | — |

> `_Short` 不是语言后缀，而是通过 `has_short_name` 数组控制的缩写开关——用 `AdminTitle_GUI_Get_ShortLong_Title` 这个 defined_text 在 token key 后面拼接 `_Short`，使 localisation key 变为 `Admin_Title_Unc_Territory_Short` → `"Unc. Territory"`。
