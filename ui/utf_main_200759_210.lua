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
            height = 54
        },
        align = HFLLabelAlignLeft,
        color = {
            255,
            255,
            255
        },
        text = "宝石合集",
        text_source = {
            set = "activity_chess",
            key = "chess_52"
        },
        itemName = "24255.255.25510254activity_chesschess_52",
        position = {
            x = 459.15,
            y = -41.25
        }
    },
    {
        type = "HFLLabel",
        font_size = 24,
        label_size = {
            width = 102,
            height = 54
        },
        align = HFLLabelAlignLeft,
        color = {
            255,
            255,
            255
        },
        text = "奖励合集",
        text_source = {
            set = "activity_chess",
            key = "chess_51"
        },
        itemName = "24255.255.25510254activity_chesschess_51",
        position = {
            x = 280.15,
            y = -41.25
        }
    },
    {
        type = "HFLLabel",
        font_size = 24,
        label_size = {
            width = 102,
            height = 54
        },
        align = HFLLabelAlignLeft,
        color = {
            255,
            255,
            255
        },
        text = "全局介绍",
        text_source = {
            set = "activity_chess",
            key = "chess_50"
        },
        itemName = "24255.255.25510254activity_chesschess_50",
        position = {
            x = 100.15,
            y = -33.25
        }
    },
    {
        itemName = "image_main_200759_128.png",
        type = "HFLSprite",
        frame = "image_main_200759_128.png",
        position = {
            x = 588.5,
            y = -63
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
            x = 459.5,
            y = -37.5
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
            x = 281.5,
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
            x = 103.5,
            y = -34
        }
    }
}
return cfg
