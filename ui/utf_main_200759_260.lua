local cfg = 
{
    type = "HFLNode",
    name = "node_root",
    position = {
        x = 0,
        y = 0
    },
    {
        name = "btnTip",
        itemName = "buttons/btn关闭x_89x89",
        frame_normal = "image_main_200759_143.png",
        frame_down = "image_main_200759_143.png",
        frame_disable = "image_main_200759_143.png",
        button_scale = 1.1,
        type = "HFLButton",
        position = {
            x = 372.25,
            y = -151.05
        },
        scale = {
            x = 2.40673828125,
            y = 2.40673828125
        },
        opacity = 0
    },
    {
        name = "uitButton",
        itemName = "movieclip/激活按钮部分",
        type = "HFLUITree",
        path = "utf_main_200759_263",
        bounds = {
            left = 0,
            top = 0,
            right = 215,
            bottom = 67
        },
        position = {
            x = 371.5,
            y = -295.5
        },
        offset = {
            x = 107.5,
            y = 33.5
        }
    },
    {
        name = "spLock",
        itemName = "image_main_200759_117.png",
        type = "HFLSprite",
        frame = "image_main_200759_117.png",
        position = {
            x = 359.4,
            y = -153.3
        }
    },
    {
        name = "txtProgress",
        type = "HFLLabel",
        font_size = 30,
        label_size = {
            width = 36,
            height = 39
        },
        align = HFLLabelAlignCenter,
        color = {
            255,
            255,
            255
        },
        text = "80",
        itemName = "30255.255.2553639",
        position = {
            x = 259.6,
            y = -173.2
        }
    },
    {
        name = "spProgress",
        itemName = "image_main_200759_191.png",
        type = "HFLSprite",
        frame = "image_main_200759_191.png",
        position = {
            x = 260.5,
            y = -195
        },
        anchor = {
            x = 0.5,
            y = 0
        }
    },
    {
        itemName = "image_main_200759_192.png",
        type = "HFLSprite",
        frame = "image_main_200759_192.png",
        position = {
            x = 260.5,
            y = -121.5
        }
    },
    {
        name = "state",
        itemName = "movieclip/original_174x152 复制",
        type = "HFLUITree",
        path = "utf_main_200759_261",
        loop = "loop",
        firstFrame = 0,
        animIn = true,
        bounds = {
            left = 0,
            top = 0,
            right = 153,
            bottom = 174
        },
        position = {
            x = 389.6,
            y = -130.45
        },
        offset = {
            x = 76.25,
            y = 87.1
        }
    }
}
return cfg
