***黑白平行制作 - 灵钢协奏曲组***

## 文件结构

common/
    scripted_localisation/  -你的脚本本地化文件
        TST.txt
    decisions/              -测试案例中的决议，用来显示打印结果
        TST.txt
        categories/         -测试案例中的决议组
            TST.txt
    on_actions/             -测试案例中用来创建数组的地方
      _startup_on_actions.txt
localisation/               -你的本地化文件
    test_l_simp_chinese.yml

大致内容就是游戏开始后会显示一个测试决议，测试决议组描述有内容，还有写效果方面的tt，都是遍历打印数组。这里的数组在on_actions文件夹中创建，内容是开局的所有国家。
