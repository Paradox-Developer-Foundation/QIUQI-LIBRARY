import os
import re

def generate_general_mod():
    print("=== 钢铁雄心4 通用电台模组生成脚本 ===")
    
    # 1. 获取用户自定义参数
    mod_id = input("请输入电台英文ID/路径名 (例如 Germany_music 或 my_favorite_radio): ").strip()
    if not mod_id:
        print("错误：英文ID不能为空！")
        return
        
    mod_title = input("请输入游戏内显示的电台中文名字 (例如 德语术曲 或 个人精选): ").strip()
    if not mod_title:
        mod_title = mod_id  # 默认使用ID
        
    try:
        volume_input = input("请输入默认音量基准 (默认推荐 0.66，如果嫌小可以输入 1.0 或 1.2): ").strip()
        volume = float(volume_input) if volume_input else 0.66
    except ValueError:
        print("音量输入有误，已自动设为默认值 0.66")
        volume = 0.66

    # 2. 扫描当前目录下的所有 ogg 文件
    current_dir = os.getcwd()
    ogg_files = [f for f in os.listdir(current_dir) if f.lower().endswith('.ogg')]
    
    if not ogg_files:
        print("\n❌ 错误：在当前目录下没有找到任何 .ogg 音乐文件！")
        print("请将此脚本放置在存放 .ogg 音乐的文件夹内再运行。")
        os.system("pause")
        return

    print(f"\n成功扫描到 {len(ogg_files)} 首歌曲，正在生成配置文件...")

    # 3. 创建输出文件夹结构
    os.makedirs("music", exist_ok=True)
    os.makedirs("localisation", exist_ok=True)

    # 4. 排序歌曲（仿照首字母规则，这里做简单排序，也可以直接保留原文件名顺序）
    # 为了保证通用性，这里直接按文件名排序
    ogg_files.sort()

    asset_entries = []
    txt_entries = []
    yml_entries = [f'l_simp_chinese:', f' {mod_id}_TITLE:0 "{mod_title}"']

    # 5. 遍历并生成数据
    for index, original_file in enumerate(ogg_files, start=1):
        # 移去后缀作为纯歌曲名
        song_display_name = os.path.splitext(original_file)[0]
        
        # 过滤掉可能导致脚本或者游戏不识别的特殊前缀或符号（如 P7GAB - 等），可选保留干净名称
        # 这里自动去除类似 "P7GAB - " 这样的常见前缀
        clean_name = re.sub(r'^P7GAB\s*-\s*', '', song_display_name).strip()
        
        # 定义游戏内部的代码安全ID
        song_code_id = f"{mod_id}_{index}"
        
        # 新的纯安全文件名，规避中文乱码导致游戏读不出
        new_filename = f"{song_code_id}.ogg"
        
        # 备份并重命名实际文件（可选，为防止破坏原文件，我们在 music 目录下生成一份新文件，或直接提醒用户）
        # 这里采用最稳妥的方式：直接在 music 文件夹内生成规范命名的副本/或者引导用户重命名
        # 为了高效，脚本将自动在 music/ 目录下复制并重命名文件
        try:
            import shutil
            shutil.copy(os.path.join(current_dir, original_file), os.path.join(current_dir, "music", new_filename))
        except Exception as e:
            print(f"复制文件 {original_file} 失败: {e}")

        # 写入 .asset 条目
        asset_entries.append(f'music = {{\n\tname = "{song_code_id}"\n\tfile = "{new_filename}"\n\tvolume = {volume:.2f}\n}}')
        
        # 写入 .txt 条目
        txt_entries.append(f'music = {{\n\tsong = "{song_code_id}"\n\tchance = {{ factor = 1 }}\n}}')
        
        # 写入 .yml 条目
        yml_entries.append(f' {song_code_id}:0 "{clean_name}"')

    # 6. 写入文件（确保全 UTF-8 编码，YML 带 BOM）
    asset_path = os.path.join(current_dir, "music", f"{mod_id}.asset")
    with open(asset_path, "w", encoding="utf-8") as f:
        f.write("\n\n".join(asset_entries))

    txt_path = os.path.join(current_dir, "music", f"{mod_id}.txt")
    with open(txt_path, "w", encoding="utf-8") as f:
        f.write(f'music_station = "{mod_id}"\n\n')
        f.write("\n\n".join(txt_entries))

    yml_path = os.path.join(current_dir, "localisation", f"{mod_id}_l_simp_chinese.yml")
    # P社本地化需要 UTF-8 with BOM 格式
    with open(yml_path, "w", encoding="utf-8-sig") as f:
        f.write("\n".join(yml_entries))

    print("\n=========================================")
    print("🎉 恭喜！通用电台模组配置文件生成完毕！")
    print(f"1. 规范化的音乐副本已放入: music/ 文件夹 (包含 .{mod_id}.asset 和 .txt)")
    print(f"2. 本地化中文翻译已放入: localisation/ 文件夹")
    print("提示：如果需要自定义 UI 按钮封面，可直接批量替换对应的 .gui 文件。")
    print("=========================================")
    os.system("pause")

if __name__ == "__main__":
    generate_general_mod()