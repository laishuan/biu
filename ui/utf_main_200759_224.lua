local cfg = 
{
    type = "HFLNode",
    name = "node_root",
    position = {
        x = 0,
        y = 0
    },
    {
        type = "HFLLabel",
        font_size = 24,
        label_size = {
            width = 102,
            height = 57
        },
        align = HFLLabelAlignLeft,
        color = {
            255,
            255,
            255
        },
        text = "奖励兑换",
        text_source = {
            set = "activity_chess",
            key = "chess_41"
        },
        itemName = "24255.255.25510257activity_chesschess_41",
        position = {
            x = 100.15,
            y = -33.3
        }
    },
    {
        type = "HFLLabel",
        font_size = 24,
        label_size = {
            width = 102,
            height = 57
        },
        align = HFLLabelAlignLeft,
        color = {
            255,
            255,
            255
        },
        text = "棋盘成就",
        text_source = {
            set = "activity_chess",
            key = "chess_42"
        },
        itemName = "24255.255.25510257activity_chesschess_42",
        position = {
            x = 282.15,
            y = -41.3
        }
    },
    {
        itemName = "movieclip/btn-分页通常_51x161",
        frame_normal = "image_main_200759_142.png",
        frame_down = "image_main_200759_142.png",
        frame_disable = "image_main_200759_142.png",
        button_scale = 1.1,
        type = "HFLButton",
        position = {
            x = 282.5,
            y = -37.5
        }
    },
    {
        itemName = "movieclip/btn-分页按下_68x161",
        frame_normal = "image_main_200759_141.png",
        frame_down = "image_main_200759_141.png",
        frame_disable = "image_main_200759_141.png",
        button_scale = 1.1,
        type = "HFLButton",
        position = {
            x = 101.5,
            y = -34
        }
    },
    {
        itemName = "image_main_200759_128.png",
        type = "HFLSprite",
        frame = "image_main_200759_128.png",
        position = {
            x = 588.5,
            y = -65
        }
    }
}
return cfg
