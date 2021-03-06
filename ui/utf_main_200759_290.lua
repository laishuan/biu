local cfg = 
{
    type = "HFLNode",
    name = "node_root",
    position = {
        x = 0,
        y = 0
    },
    {
        name = "btn",
        itemName = "buttons/btn关闭x_89x89",
        frame_normal = "image_main_200759_143.png",
        frame_down = "image_main_200759_143.png",
        frame_disable = "image_main_200759_143.png",
        button_scale = 1.1,
        type = "HFLButton",
        position = {
            x = 109.25,
            y = -167.05
        },
        scale = {
            x = 1.1839752197265625,
            y = 1.1839752197265625
        },
        opacity = 0
    },
    {
        name = "txtStep",
        type = "HFLLabel",
        font_size = 30,
        label_size = {
            width = 97,
            height = 39
        },
        align = HFLLabelAlignCenter,
        color = {
            255,
            255,
            255
        },
        text = "15\t/20",
        itemName = "30255.255.2559739",
        position = {
            x = 236.1,
            y = -176.05
        }
    },
    {
        name = "uitTip",
        itemName = "气泡提示",
        type = "HFLUITree",
        path = "utf_main_200759_284",
        bounds = {
            left = 0,
            top = 0,
            right = 311,
            bottom = 171
        },
        position = {
            x = 114.55,
            y = -179.4
        },
        offset = {
            x = 21.75,
            y = 169.4
        }
    },
    {
        name = "state",
        itemName = "copy/movieclip/进度条/道具礼盒 复制 2",
        type = "HFLUITree",
        path = "utf_main_200759_292",
        loop = "loop",
        firstFrame = 0,
        animIn = true,
        bounds = {
            left = 0,
            top = 0,
            right = 70.85,
            bottom = 62.05
        },
        position = {
            x = 118.55,
            y = -175.05
        },
        offset = {
            x = 32.5,
            y = 32
        }
    }
}
return cfg
