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
            x = 137.45,
            y = -111.1
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
            x = 132.45,
            y = -256.4
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
            x = 126.2,
            y = -114.2
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
            x = 26.4,
            y = -134.1
        }
    },
    {
        name = "spProgress",
        itemName = "image_main_200759_191.png",
        type = "HFLSprite",
        frame = "image_main_200759_191.png",
        position = {
            x = 27.3,
            y = -155.9
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
            x = 27.3,
            y = -82.4
        }
    },
    {
        name = "state",
        itemName = "movieclip/original111_179x149 复制",
        type = "HFLUITree",
        path = "utf_main_200759_265",
        loop = "loop",
        firstFrame = 0,
        animIn = true,
        bounds = {
            left = 0,
            top = 0,
            right = 149,
            bottom = 181
        },
        position = {
            x = 159.5,
            y = -89.5
        },
        offset = {
            x = 74.5,
            y = 89.5
        }
    }
}
return cfg
