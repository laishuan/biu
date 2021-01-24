local cfg = 
{
    type = "HFLNode",
    position = {
        x = 0,
        y = 0
    },
    {
        name = "txtPowCnt",
        type = "HFLLabel",
        font_size = 30,
        label_size = {
            width = 39,
            height = 39
        },
        align = HFLLabelAlignCenter,
        color = {
            255,
            255,
            255
        },
        text = "99",
        itemName = "30255.255.2553939",
        position = {
            x = 221.4,
            y = -28.3
        }
    },
    {
        type = "HFLLabel",
        font_size = 30,
        label_size = {
            width = 122,
            height = 67
        },
        align = HFLLabelAlignCenter,
        color = {
            255,
            255,
            255
        },
        text = "入棋局",
        text_source = {
            set = "activity_chess",
            key = "chess_04"
        },
        itemName = "30255.255.25512267activity_chesschess_04",
        position = {
            x = 127.75,
            y = -55.3
        }
    },
    {
        itemName = "image_main_200759_162.png",
        type = "HFLSprite",
        frame = "image_main_200759_162.png",
        position = {
            x = 37.5,
            y = -53
        }
    },
    {
        itemName = "image_main_200759_161.png",
        type = "HFLSprite",
        frame = "image_main_200759_161.png",
        position = {
            x = 219.5,
            y = -27.5
        }
    },
    {
        name = "btnBuyPow",
        itemName = "movieclip/btn加号_89x89",
        frame_normal = "image_main_200759_145.png",
        frame_down = "image_main_200759_145.png",
        frame_disable = "image_main_200759_244.png",
        button_scale = 1.1,
        type = "HFLButton",
        position = {
            x = 294.5,
            y = -59.5
        }
    },
    {
        name = "btnToGameJump",
        itemName = "movieclip/btn黄按钮_104x234",
        frame_normal = "image_main_200759_150.png",
        frame_down = "image_main_200759_150.png",
        frame_disable = "AlertCancel_gray_200759.png",
        button_scale = 1.1,
        type = "HFLButton",
        position = {
            x = 127,
            y = -64
        }
    }
}
return cfg
