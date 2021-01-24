local cfg = 
{
    type = "HFLNode",
    name = "node_root",
    position = {
        x = 0,
        y = 0
    },
    {
        name = "uit",
        itemName = "movieclip/提示部分 复制",
        type = "HFLUITree",
        path = "utf_main_200759_422",
        bounds = {
            left = -16.2,
            top = 164.75,
            right = 236.8,
            bottom = 362.2
        },
        position = {
            x = -20,
            y = 24.95
        },
        scale = {
            x = 0.7270965576171875,
            y = 0.7270965576171875
        },
        offset = {
            x = 70.6,
            y = 164.75
        }
    },
    {
        name = "btn",
        itemName = "movieclip/小关闭_71x72",
        frame_normal = "image_main_200759_239.png",
        frame_down = "image_main_200759_239.png",
        frame_disable = "image_main_200759_239.png",
        button_scale = 1.1,
        type = "HFLButton",
        position = {
            x = -19.45,
            y = 23.35
        },
        scale = {
            x = 1.4224090576171875,
            y = 1.252777099609375
        },
        opacity = 0
    },
    {
        name = "txtCnt",
        type = "HFLLabel",
        font_size = 30,
        label_size = {
            width = 55.85,
            height = 37.25
        },
        align = HFLLabelAlignLeft,
        color = {
            47,
            39,
            99
        },
        text = "X99",
        itemName = "3047.39.9955.8537.25",
        position = {
            x = 18.3,
            y = -33.75
        }
    },
    {
        name = "sp",
        itemName = "image_main_200759_171.png",
        type = "HFLSprite",
        frame = "image_main_200759_171.png",
        position = {
            x = -17.7,
            y = 21.9
        }
    }
}
return cfg
