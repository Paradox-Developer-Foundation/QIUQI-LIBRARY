## 使用 Python 将 Paradox 脚本文件 (*.txt / *.gui / *.gfx) 解析为 AST

本人并不懂 Python, 语法是边学边写, 如果有什么不对的地方请多多包涵.

## 前言

相比于使用正则表达式, 将脚本文件解析为`AST`有诸多好处, 比如可以更准确地检测和理解代码中的上下文关系, 允许执行写入或修改代码的动作. 此外，解析为AST还可以支持更高层次的语义分析，比如类型检查、数据流分析等.

## 正文

### 准备工作

安装解析库

```
pip install pyradox-txt-parser
```

注意: 在`5.0.1`版本中, 如果值为`0.0`, 输出的时候会变成`0.`, 不清楚作者会不会修

### 前置

在开始之前, 我们需要先知道 HOI4 中绝大部分数据都可以分为三种类型, 分别是

- Node
- Leaf
- LeafValue

我们使用一段 state 文件中的代码做演示

```python
state={
	id=1
	name="STATE_1" # Corsica
	manpower = 322900
	state_category = town
	history={
		owner = FRA
		victory_points = { 3838 1 }
		buildings = {
			infrastructure = 2
			industrial_complex = 1
			air_base = 1
			3838 = {
				naval_base = 3
			}
		}
		add_core_of = COR
		add_core_of = FRA
	}
	provinces={
		3838 9851 11804 
	}
	local_supplies=0.0 
}
```

其中诸如 `state`, `provinces`, `history`, `buildings`, `3838`, `victory_points`这样带`Children`的我们称之为 `Node`(节点)

像`id`,`name`,`manpower`,`state_category`,`owner`这种键值对的我们称之为`Leaf`

比如 `state_category = town`中, `state_category`为键(Key), `town`为值(Value)

而`LeafValue`是不带键的值, 像 `victory_points = { 3838 1 }`中的`3838`, `1`都为`LeafValue`

同理`provinces = { 3838 9851 11804 }`中`3838`, `9851`, `11804`也都为`LeafValue`

### 解析文本获得 AST

```python
import pyradox

# 解析一个字符串
result = pyradox.parse("node = { key = 1 childNode = { childKey = 2 }  leafValues = { 1 2 3 } }")

# 按文件路径解析一个文件内的所有文本
result = pyradox.parse_file("path")
```

获取`result`后, 我们就可以对其操作了

### 操作 AST

```python
result = pyradox.parse("""
state={
	id = 1
	name="STATE_1" # Corsica
	history={
		owner = FRA
		buildings = {
			infrastructure = 2
			3838 = {
				naval_base = 3
			}
		}
		add_core_of = TXT
	}
	provinces={
		3838 9851 11804 
	}
}
    """)

# 获取一个 Node (节点)
stateNode = result["state"]

# 将 id 改为 2
stateNode["id"] = 2

# 将 owner 改为 TXT
historyNode = stateNode["history"]
historyNode["owner"] = "TXT"

# 删除 add_core_of Leaf (叶子), 删除 Node (节点)同理
del historyNode["add_core_of"]

# 新增一个 manpower Leaf
stateNode["manpower"] = 10000

# 新增一个 victory_points LeafValues Node
historyNode.append("victory_points", 1, in_group = True)
historyNode.append("victory_points", 2, in_group = True)
historyNode.append("victory_points", 3, in_group = True)
# 结果: victory_points = { 1 2 3 }

# 在 buildings 节点下为 province 9851 新增海军基地 (即在节点下新增节点)
buildingsNode = historyNode["buildings"]
buildingsNode["9851"] = { "naval_base": 2 }

# 获取 provinces 里的内容
provinces = [v for k, v in stateNode.items() if k == "provinces"]
# provinces = [3838, 9851, 11804]
```

### 将修改后的 AST 保存到文件中

```python
with open('file.txt', 'w', encoding='utf-8') as file:
	file.write(str(result))
```

