local cfg = 
{
    type = "HFLNode",
    name = "node_root",
    position = {
        x = 640,
        y = 360
    },
    {
        itemName = "image_main_200759_203.png",
        type = "HFLSprite",
        frame = "image_main_200759_203.png",
        position = {
            x = 311.5,
            y = 133.5
        }
    },
    {
        type = "HFLLabel",
        font_size = 30,
        label_size = {
            width = 391,
            height = 306.3
        },
        align = HFLLabelAlignLeft,
        color = {
            255,
            255,
            255
        },
        text = "1.文案文案文案文案文案文案\r文案文案文案文案文案文案\r文案文案文案文案文案文案\r文案文案文案文案文案文案",
        isTopAlign = true,
        text_source = {
            set = "activity_chess",
            key = "chess_06"
        },
        itemName = "30255.255.255391306.3activity_chesschess_06",
        position = {
            x = 310.5,
            y = -193.95000000000005
        }
    },
    {
        itemName = "image_main_200759_204.png",
        type = "HFLSprite",
        frame = "image_main_200759_204.png",
        position = {
            x = -316.5,
            y = 119
        }
    },
    {
        type = "HFLLabel",
        font_size = 30,
        label_size = {
            width = 391,
            height = 310.1
        },
        align = HFLLabelAlignLeft,
        color = {
            255,
            255,
            255
        },
        text = "1.文案文案文案文案文案文案\r文案文案文案文案文案文案\r文案文案文案文案文案文案\r文案文案文案文案文案文案",
        isTopAlign = true,
        text_source = {
            set = "activity_chess",
            key = "chess_05"
        },
        itemName = "30255.255.255391310.1activity_chesschess_05",
        position = {
            x = -317.5,
            y = -195.85000000000002
        }
    },
    {
        type = "HFLLabel",
        font_size = 30,
        label_size = {
            width = 124,
            height = 69
        },
        align = HFLLabelAlignCenter,
        color = {
            255,
            255,
            255
        },
        text = "知道啦",
        text_source = {
            set = "Common",
            key = "shuangshi_btn3"
        },
        itemName = "30255.255.25512469Commonshuangshi_btn3",
        position = {
            x = 0,
            y = -279.29999999999995
        }
    },
    {
        name = "btnClose",
        itemName = "movieclip/btn黄按钮_104x234",
        frame_normal = "image_main_200759_150.png",
        frame_down = "image_main_200759_150.png",
        frame_disable = "AlertCancel_gray_200759.png",
        button_scale = 1.1,
        type = "HFLButton",
        position = {
            x = -1,
            y = -288
        }
    }
}
return cfg
