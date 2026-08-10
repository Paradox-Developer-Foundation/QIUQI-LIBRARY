# 逆向AI策略（Reversed AI Strategy）简明教程

## 凡例

下文中，将始终将BHR（巴林）作为AI策略的主动者，不特定国家或者QAT（卡塔尔）作为AI策略的被动者（目标）。

## 概念

逆向AI策略其实也只是一种特殊的AI策略，相比普通的AI策略，只是部分启用条件块（不包含allowed，下文会讲）的检测对象发生了反转。

## 代码块写法

### allowed

这部分并未被反转，其条件仍然要求主动者满足。因此，我们或许可以将这类AI策略视为依然是挂在主动者身上，但代码内的写法大幅反转的AI策略。

这里可能出现一个误区。如果认为“因为是逆向AI策略，所以allowed的检测对象应该变成了被动者”，那么往往会因为填了让主动者无法满足的条件而导致AI策略不生效。例如：

```hoi4
BHR_invade = {
	allowed = {
		NOT = { tag = BHR }
	}
	...
	reversed = yes
	...
	ai_strategy = {
		type = invade
		id = BHR
		value = 100
	}
}
```

到这里就已经出现错误了。BHR是主动者，它的tag不可能不是BHR。另外，wiki在此处的示例有严重错误。wiki上的示例是：

```hoi4
BHR_support_neutrals = {
	allowed = {
		NOT = { original_tag = BHR } #错在这里
	}
	enable = {
		has_government = neutrality
	}
	enable_reverse = {
		BHR = { has_government = neutrality }
	}
	reversed = yes
	abort_when_not_enabled = yes
	ai_strategy = {
		type = support
		id = BHR
		value = 100
	}
}
```

可以看到wiki给出的示例的allowed部分正好犯了我们上文所述的错误。**不要将allowed里的条件设为主动者无法满足的条件。**

反过来讲，理论上这里似乎需要写“只有主动者能满足”的条件，像是`tag = BHR`这样的。但是，因为我们在后面的ai_strategy里面会明确指定主动者，所以这里写什么都行，只要主动者能满足，例如`always = yes`。另外，这个条件块也不影响谁会成为被动者。

allowed只在开始游戏及加载存档时检测一次。如果算上debug环境，那么每次修改并保存任意AI策略文件、触发AI策略文件重新加载时也会检测一次。需要注意的是，AI策略在重新加载之后会在所有国家全部失效，过几个小时再重新应用于各国。

### enable

这部分不同于普通AI策略，这里要求被动者满足。游戏程序拿着这个AI策略把世界上存在的国家挨个点一遍，哪些国家满足此条件，哪些国家就是被动者。例如：

```hoi4
enable = {
	has_government = neutral
}
```

写成这样，那么所有中立主义国家都会成为这个AI策略的被动者。所以可以说，**逆向AI策略的被动者可以有多个。**

### enable_reverse

该部分非必需，可以不写。

这部分没有默认的作用域，并不参与“游戏程序把各国挨个点一遍”的过程。通常它被用于检测主动者国家是否满足要求，例如：

```hoi4
enable_reverse = {
	BHR = { has_government = neutrality }
}
```

事实上，既然已经写明了作用域，那这里写什么都可以，就算是`GER = { has_war = yes }`这样的也可以，即使GER既不是主动者也不是被动者。这样，GER的战争就与BHR的AI行为联系在一起了。

那这种关于第三方的条件可不可以写在enable里呢？答案是肯定的，而且只要规定了作用域，大部分情况下就是等效的。但因为enable会被检测多次，这样多消耗性能实在不值。

但有个例外，abort_when_not_enabled不与enable_reverse关联，也就是说，一旦AI策略被应用，即使enable_reverse里的条件不满足且有`abort_when_not_enabled = yes`语句，这个AI策略也不会被移除，而enable则是有用的。这是两者不等效的情况之一。当然，`abort = { }`和`abort_when_not_enabled = yes`一起写的做法在任何AI策略中都是有效的。

每检测一个国家，enable里的代码都会被执行一遍，因此enable会被执行**多次**；而enable_reverse只会执行**一次**。

如果不写明作用域就直接把条件写在enable_reverse下面，那实际使用的作用域大概率是玩家正在操作或者观看的国家。

### reversed

这是逆向AI策略必加的语句，如果不加它，这个AI策略就不是逆向AI策略。写`reversed = yes`即可。

如果写`reversed = no`，这个AI策略真的会保持非逆向，只是画蛇添足。

### ai_strategy

和普通AI策略写法没什么两样，只是写在里面的tag将变成主动者。

完整示例：

```hoi4
BHR_invade = {
	allowed = {
		NOT = { tag = BHR }
	}
	enable = {
		has_war_with = BHR
	}
	enable_reverse = {
		BHR = {
			has_template_majority_unit = marine
		}
	}
	abort = {
		NOT = {
			BHR = {
				has_template_majority_unit = marine
			}
		}
	}
	abort_when_not_enabled = yes
	reversed = yes
	ai_strategy = {
		type = invade
		id = BHR
		value = 100
	}
}
```

如果没有`reversed = yes`，那这个AI策略会让所有与BHR有战争的国家提高登陆BHR的倾向。有了这个语句，这个AI策略就反向了，BHR会提高登陆所有与BHR有战争的国家的倾向。

可以写多个不同的tag，让主动者变成多个吗？可以，比如说写成这样：

```hoi4
	ai_strategy = {
		type = invade
		id = BHR
		value = 1000
	}
	ai_strategy = {
		type = invade
		id = YEM
		value = 1000
	}
	ai_strategy = {
		type = invade
		id = SAU
		value = 1000
	}
	ai_strategy = {
		type = invade
		id = IRQ
		value = 1000
	}
```

这样写，的确会让BHR、YEM、SAU、IRQ统统成为这个策略的主动者。但这里有个bug：所有写在这里的主动者都会受到这里所有的AI策略影响，而且同类数值相加，比如上面的示例会让以上四国对特定国家的invade倾向加到4000。写一个1000、一个-999，会抵消，只有1。如果写的type有invade，有consider_weak，那么所有在这里写了tag的国家都会获得invade和consider_weak倾向。

如果想让主动者获得相同的倾向类型和数值，那可以只写一个正常数值的，其他写0。例如：

```hoi4
	ai_strategy = {
		type = invade
		id = BHR
		value = 1000
	}
	ai_strategy = {
		type = invade
		id = YEM
		value = 0
	}
	ai_strategy = {
		type = invade
		id = SAU
		value = 0
	}
	ai_strategy = {
		type = invade
		id = IRQ
		value = 0
	}
```

这样，这四个国家就都获得了对特定国家的1000点登录倾向了。

总之，可以理解为：**id后面的tag成为主动者，一组type与value决定各类倾向的数值，同类数值会进行加减运算，最后所有主动者获得相同的倾向变化。**下面是个复杂的例子：

```hoi4
	ai_strategy = {
		type = invade
		id = BHR
		value = 1000
	}
	ai_strategy = {
		type = invade
		id = YEM
		value = -450
	}
	ai_strategy = {
		type = antagonize
		id = SAU
		value = 200
	}
	ai_strategy = {
		type = consider_weak
		id = IRQ
		value = 0
	}
```

这段AI策略的最终结果是，让BHR、YEM、SAU、IRQ获得对特定国家的550点登陆倾向、200点敌对倾向、0点认为弱小的倾向。consider_weak那里的数值虽然是0，但已经让IRQ获得成为主动者的资格了。

AI策略不能自指，一个国家不能既是主动者又是被动者。如果单个AI策略存在多个主动者和多个被动者，那么主动者和被动者是同一国的那个组合无效。

## imgui简要介绍

imgui是游戏内置的一套mod制作辅助工具，我们可以用它检测AI策略的生效情况。它只能通过控制台呼出和隐藏。

以下是两个常用控制台命令：

`imgui show <窗口名>`：显示指定窗口。

`imgui hide <窗口名>`：隐藏指定窗口。

imgui的窗口没有关闭按钮，控制台命令则发挥这些按钮的作用。

`ai_strategy`窗口是查看AI策略相关信息的窗口，用`imgui show ai_strategy`的命令打开。

至于其他命令，在控制台输入`imgui`再点Tab可以获得提示，输了第二部分命令，比如说`imgui show`之后，再点Tab可以获得下一部分的提示，最后输入像是`imgui show ai_strategy`这样的命令就可以执行了。

### ai_strategy窗口

窗口左上角是展开/收起整个窗口的按钮。

窗口右下角有个蓝三角，**按住并拖动可以调整窗口大小。**默认大小通常太小，必须调整后使用。

在窗口中，鼠标放在灰色的“(?)”上会有简要提示。

#### 与AI策略直接相关的项目

Active strategies显示了**当前国家启用的AI策略**。逆向AI策略在末尾，其名称格式是`<AI策略名> (reverse <被动者tag>)`。注意只会有一个被动者，哪个tag被优先显示，可能与common\\country_tags里的文件中国家tag被定义的顺序有关。原版中GER是最先被定义的，所以GER大部分时候会被显示在前面。

Strategy values显示了**当前国家各类倾向的数值**。默认隐藏未被改变的倾向类型，启用“Show empty”可以显示这些空类型。下面的那个后面跟Search的输入框则是搜索框，输入文本可以按倾向名字搜索。不能搜索被动者tag。下面若干个栏目则是各类倾向的数值，点击可展开。展开后是一个表格，第一列是“Token”，通常对应AI策略里的id；第二列是“Target”，没有已知对应物，通常都是0；第三列是“Weighted Value”，就是当前与相应被动者对应的倾向总和数值，也是最终数值。

#### 与AI策略关系较远的项目

打头的复选框“Enable AI View”作用是启用游戏各处的AI倾向提示文本，作用相当于控制台命令`aiview`。

“Enable human_ai”作用是启用一个AI管理国家，但人也能操控的模式，作用相当于控制台命令`human_ai`。但要注意，`observe`命令的优先级高于`human_ai`，一旦进入观察者模式，就算启用Human AI模式也无法操控国家了。

下面的一个“输入框”后面跟“Tag”，作用是指示当前查看的tag。**这不是一个真正的输入框**，改里面的东西只会回到原来的文本，要改变所查看的tag必须切换观察或者操控的国家。

Map modes里面是各种指示AI行为的地图模式，选择非None的地图模式，地图上就会出现斜杠阴影标注的区域，以指示相应信息。

Equipment production显示的是AI生产各类装备的行为信息。启用Show equipment with zero factories可以显示AI不想分配工厂来生产的装备。Show strategies with a value of zero和Clear cache具体作用未知。下面有两个表格，它们的结构相似。第一列是Archetype或AI Role，前者是原型，如战间期型、基础型、改进型、先进型中型坦克都是一个“中型坦克”装备原型（见代码，游戏中不会出现）的子代；后者是海军独有的角色（或者按其特征来说，叫定位），有潜艇、屏卫舰、轻巡、布雷舰等等。第二列是Need Equipment，AI需要的装备数量。第三列是Needed Factories，AI需要的工厂数量。第四列是Assigned Factories，实际分配的工厂数量。

Research显示AI研究各项科技的倾向。Ignore后面是三种可以选择忽略并隐藏的科技：Completed，已完成的，但它们被包含在Unavailable里面，单独取消勾选并不会改变显示数量；Unavailable，不可用的，即还不能研究（科技树还没到那里）和已完成的；Doctrines，学说，但因为门前惊雷更新的新版学说系统的出现，它已经没有用了，旧版学说属于科技，因此会在这里出现。Sort by可更改排序方式，对于Name（名称）和ID（科技的内部数字ID，debug模式下将鼠标放在科技项目上，Tech Database ID就是），是递增顺序；对于script weight（科技本身的ai_will_do中的最终倾向数值）和final weight（计算了AI策略等影响之后的最终数值），则是递减顺序。Nr of techs指示当前显示出来的科技数量。下面的表格，第一列token是科技在代码里的名字，其他不再赘述。

Operatives Missions显示情报系统相关信息。Related strategies似乎显示的是全局范围所有与情报系统有关的AI策略，前面的√或×指示AI策略是否启用，后面是AI策略的名称。下面的是不同的情报系统行为（无法正常显示，切换成英文也不行，但能看出是关于同一个AI策略的不同ai_strategy项的），右边是倾向数值。Mission desire显示进行各类间谍行为的倾向，游戏选择中文则行为名称只能显示问号，英文能正常显示。英文中，这些行为从上到下分别为：Unassigned、Build Intel Network、Quiet Intel Network、Counter Intelligence、Root Out Resistance、Boost Ideology、Control Trade、Diplomatic Pressure、Propaganda。再展开，可以看见最小值Min、最大值Max、默认值Default，以及对各tag的当前值。

Training部分指示训练并部署陆军师有关的信息。Live state显示国家当前的生存状态：Surrender level为投降进度，数值后面若有“(halts training)”，则训练已停止；Divisions是该国当前的陆军数量；In active combat可能是指当前正在战斗中的师数量；Imminent-war signals含义未知；Training halted?指示是否停止训练。其他项目含义未知，但可以确定Define和common\\defines目录里定义的基本常数有关。

## 版本

第1版

最后更新时间：2026年7月8日