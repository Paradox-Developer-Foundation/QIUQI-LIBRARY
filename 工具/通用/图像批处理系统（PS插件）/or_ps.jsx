// 配置保存参数
var saveConfig = {
    outputFolder: null,
    format: "PNG"
};

try {
    // 验证文档状态
    if (app.documents.length === 0) throw new Error("请先打开背景文档");
    var bgDoc = app.activeDocument;

    // 选择多个图片
    var files = File.openDialog("选择要处理的图片", "*.jpg;*.png;*.psd", true);
    if (!files || files.length === 0) throw new Error("未选择文件");

    // 选择保存位置
    saveConfig.outputFolder = Folder.selectDialog("选择输出文件夹");
    if (!saveConfig.outputFolder) throw new Error("未选择保存位置");

    // 获取基础名称和起始编号
    var baseName = prompt("请输入文件名前缀（示例：design）:", "design");
    if (!baseName) throw new Error("未输入文件名前缀");

    var startNumber = parseInt(prompt("请输入起始编号（示例：100）:", "100"), 10);
    if (isNaN(startNumber)) throw new Error("起始编号必须为数字");

    // 批量处理循环
    for (var i = 0; i < files.length; i++) {
        try {
            var startState = bgDoc.historyStates[bgDoc.historyStates.length - 1];

            // ========== 原始处理流程 ==========
            var file = files[i];
            var embedDoc = app.open(file);
            embedDoc.activeLayer.copy();
            embedDoc.close(SaveOptions.DONOTSAVECHANGES);

            bgDoc.paste();
            var newLayer = bgDoc.activeLayer;
            newLayer.name = "处理图层_" + (i + 1);

            // =========== 核心尺寸标准化 ============
            var layerBounds = newLayer.bounds;
            var originalWidth = layerBounds[2].value - layerBounds[0].value;
            var originalHeight = layerBounds[3].value - layerBounds[1].value;
            var targetWidth = 197,
                targetHeight = 158;
            var scaleX = (targetWidth / originalWidth) * 100;
            var scaleY = (targetHeight / originalHeight) * 100;
            newLayer.resize(scaleX, scaleY, AnchorPosition.MIDDLECENTER);

            // =========== 应用旋转 ============
            var transformDesc = new ActionDescriptor();
            transformDesc.putEnumerated(charIDToTypeID("FTcs"), charIDToTypeID("QCSt"), charIDToTypeID("Qcsa"));
            var skewDesc = new ActionDescriptor();
            skewDesc.putUnitDouble(charIDToTypeID("Hrzn"), charIDToTypeID("#Ang"), 0.160686);
            skewDesc.putUnitDouble(charIDToTypeID("Vrtc"), charIDToTypeID("#Ang"), 0.000000);
            transformDesc.putObject(charIDToTypeID("Skew"), charIDToTypeID("Pnt "), skewDesc);
            transformDesc.putUnitDouble(charIDToTypeID("Angl"), charIDToTypeID("#Ang"), -3.709503);
            var perspectiveDesc = new ActionDescriptor();
            perspectiveDesc.putUnitDouble(charIDToTypeID("Hrzn"), charIDToTypeID("#Prc"), -0.001572);
            perspectiveDesc.putUnitDouble(charIDToTypeID("Vrtc"), charIDToTypeID("#Prc"), 0.007371);
            transformDesc.putObject(charIDToTypeID("Usng"), charIDToTypeID("Pnt "), perspectiveDesc);
            executeAction(charIDToTypeID("Trnf"), transformDesc, DialogModes.NO);

            // =========== 智能居中系统 ============
            var docCenter = {
                x: bgDoc.width / 2,
                y: bgDoc.height / 2
            };
            var scaledBounds = newLayer.bounds;
            var layerCenter = {
                x: (scaledBounds[0] + scaledBounds[2]) / 2,
                y: (scaledBounds[1] + scaledBounds[3]) / 2
            };
            newLayer.translate(
                UnitValue(docCenter.x - layerCenter.x, "px"),
                UnitValue(docCenter.y - layerCenter.y, "px")
            );

            // =========== 二次变形 ============
            newLayer.selected = true;
            var amDesc = new ActionDescriptor();
            var amRef = new ActionReference();
            amRef.putEnumerated(charIDToTypeID("Lyr "), charIDToTypeID("Ordn"), charIDToTypeID("Trgt"));
            amDesc.putReference(charIDToTypeID("null"), amRef);
            amDesc.putEnumerated(charIDToTypeID("FTcs"), charIDToTypeID("QCSt"), charIDToTypeID("Qcsa"));
            var offsetDesc = new ActionDescriptor();
            offsetDesc.putUnitDouble(charIDToTypeID("Hrzn"), charIDToTypeID("#Pxl"), -0.200082);
            offsetDesc.putUnitDouble(charIDToTypeID("Vrtc"), charIDToTypeID("#Pxl"), -1.071716);
            amDesc.putObject(charIDToTypeID("Ofst"), charIDToTypeID("Ofst"), offsetDesc);
            amDesc.putUnitDouble(charIDToTypeID("Wdth"), charIDToTypeID("#Prc"), 98.948461);
            amDesc.putUnitDouble(charIDToTypeID("Hght"), charIDToTypeID("#Prc"), 96.932884);
            var skewDesc = new ActionDescriptor();
            skewDesc.putUnitDouble(charIDToTypeID("Hrzn"), charIDToTypeID("#Ang"), -0.370263);
            skewDesc.putUnitDouble(charIDToTypeID("Vrtc"), charIDToTypeID("#Ang"), 0.000000);
            amDesc.putObject(charIDToTypeID("Skew"), charIDToTypeID("Pnt "), skewDesc);
            amDesc.putUnitDouble(charIDToTypeID("Angl"), charIDToTypeID("#Ang"), -0.660166);
            var perspDesc = new ActionDescriptor();
            perspDesc.putUnitDouble(charIDToTypeID("Hrzn"), charIDToTypeID("#Prc"), 0.002063);
            perspDesc.putUnitDouble(charIDToTypeID("Vrtc"), charIDToTypeID("#Prc"), 0.004904);
            amDesc.putObject(charIDToTypeID("Usng"), charIDToTypeID("Pnt "), perspDesc);
            amDesc.putEnumerated(charIDToTypeID("Intr"), charIDToTypeID("Intp"), charIDToTypeID("Bcbc"));
            executeAction(charIDToTypeID("Trnf"), amDesc, DialogModes.NO);



            // 应用颜色叠加和图案叠加
            (function() {
                // 颜色叠加设置
                var colorOverlayDesc = new ActionDescriptor();
                colorOverlayDesc.putBoolean(charIDToTypeID("enab"), true);
                colorOverlayDesc.putEnumerated(charIDToTypeID("Md  "), charIDToTypeID("BlnM"), charIDToTypeID("Mltp"));

                var colorDesc = new ActionDescriptor();
                colorDesc.putDouble(charIDToTypeID("Rd  "), 255.0);
                colorDesc.putDouble(charIDToTypeID("Grn "), 156.0);
                colorDesc.putDouble(charIDToTypeID("Bl  "), 0.0);
                colorOverlayDesc.putObject(charIDToTypeID("Clr "), charIDToTypeID("RGBC"), colorDesc);
                colorOverlayDesc.putUnitDouble(charIDToTypeID("Opct"), charIDToTypeID("#Prc"), 21.0);

                // 图案叠加设置
                var patternOverlayDesc = new ActionDescriptor();
                patternOverlayDesc.putBoolean(charIDToTypeID("enab"), true);
                patternOverlayDesc.putEnumerated(charIDToTypeID("Md  "), charIDToTypeID("BlnM"), charIDToTypeID("Mltp"));
                patternOverlayDesc.putUnitDouble(charIDToTypeID("Opct"), charIDToTypeID("#Prc"), 25.0);

                var patternDesc = new ActionDescriptor();
                patternDesc.putString(charIDToTypeID("Idnt"), "93d538b8-3e3f-624e-a197-c0a31a85a788");
                patternOverlayDesc.putObject(charIDToTypeID("Ptrn"), charIDToTypeID("Ptrn"), patternDesc);
                patternOverlayDesc.putUnitDouble(charIDToTypeID("Scl "), charIDToTypeID("#Prc"), 14.0);

                // 组合图层效果
                var mainDesc = new ActionDescriptor();
                var ref = new ActionReference();
                ref.putProperty(charIDToTypeID("Prpr"), charIDToTypeID("Lefx"));
                ref.putEnumerated(charIDToTypeID("Lyr "), charIDToTypeID("Ordn"), charIDToTypeID("Trgt"));

                mainDesc.putReference(charIDToTypeID("null"), ref);

                var effectsDesc = new ActionDescriptor();
                effectsDesc.putObject(charIDToTypeID("SoFi"), charIDToTypeID("SoFi"), colorOverlayDesc);
                effectsDesc.putObject(stringIDToTypeID("patternFill"), stringIDToTypeID("patternFill"), patternOverlayDesc);

                mainDesc.putObject(charIDToTypeID("T   "), charIDToTypeID("Lefx"), effectsDesc);
                executeAction(charIDToTypeID("setd"), mainDesc, DialogModes.NO);
                var desc1 = new ActionDescriptor();
                desc1.putEnumerated(stringIDToTypeID("presetKind"), stringIDToTypeID("presetKindType"), stringIDToTypeID("presetKindDefault"));
                desc1.putInteger(charIDToTypeID("Rd  "), 40);
                desc1.putInteger(charIDToTypeID("Yllw"), 60);
                desc1.putInteger(charIDToTypeID("Grn "), 40);
                desc1.putInteger(charIDToTypeID("Cyn "), 60);
                desc1.putInteger(charIDToTypeID("Bl  "), 20);
                desc1.putInteger(charIDToTypeID("Mgnt"), 80);
                desc1.putBoolean(stringIDToTypeID("useTint"), false);
                var desc2 = new ActionDescriptor();
                desc2.putDouble(charIDToTypeID("Rd  "), 225.000458);
                desc2.putDouble(charIDToTypeID("Grn "), 211.000671);
                desc2.putDouble(charIDToTypeID("Bl  "), 179.001160);
                desc1.putObject(stringIDToTypeID("tintColor"), charIDToTypeID("RGBC"), desc2);
                executeAction(charIDToTypeID("BanW"), desc1, DialogModes.NO);
            })();



            // ========== 保存处理结果 ==========
            var currentNumber = startNumber + i;
            var fileName = baseName + "_" + currentNumber + ".png";
            var outputFile = new File(saveConfig.outputFolder.fsName + "/" + fileName);

            // 使用PNG格式保存
            var saveOptions = new PNGSaveOptions();
            saveOptions.PNG8 = false; // 使用PNG-24格式
            bgDoc.saveAs(outputFile, saveOptions, true);

            // ========== 清理图层 ==========
            bgDoc.activeHistoryState = startState;

        } catch (e) {
            alert("文件处理失败: " + file.name + "\n错误信息: " + e.message);
        }
    }
    alert("批量处理完成！\n已处理文件数：" + files.length + "\n保存格式：" + saveConfig.format);

} catch (e) {
    alert("操作失败: " + e.message);
}