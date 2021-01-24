local cfg = 
{
    type = "HFLNode",
    position = {
        x = 0,
        y = 0
    },
    {
        name = "hide1",
        itemName = "movieclip/首页隐藏部分",
        type = "HFLUITree",
        path = "utf_main_200759_209",
        bounds = {
            left = 0,
            top = 0,
            right = 339,
            bottom = 116
        },
        position = {
            x = 539.5,
            y = -58
        },
        offset = {
            x = 169.5,
            y = 58
        }
    },
    {
        type = "HFLLabel",
        font_size = 30,
        label_size = {
            width = 162,
            height = 67
        },
        align = HFLLabelAlignCenter,
        color = {
            255,
            255,
            255
        },
        text = "铸棋魂",
        text_source = {
            set = "activity_chess",
            key = "chess_03"
        },
        itemName = "30255.255.25516267activity_chesschess_03",
        position = {
            x = 117.75,
            y = -55.3
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
        text = "去领奖",
        text_source = {
            set = "Common",
            key = "Common_lingjiang"
        },
        itemName = "30255.255.25512267CommonCommon_lingjiang",
        position = {
            x = 946.75,
            y = -55.3
        }
    },
    {
        name = "btnToGameRand",
        itemName = "movieclip/btn黄按钮_104x234",
        frame_normal = "image_main_200759_150.png",
        frame_down = "image_main_200759_150.png",
        frame_disable = "AlertCancel_gray_200759.png",
        button_scale = 1.1,
        type = "HFLButton",
        position = {
            x = 117,
            y = -64
        }
    },
    {
        name = "btnToExchange",
        itemName = "movieclip/btn黄按钮_104x234",
        frame_normal = "image_main_200759_150.png",
        frame_down = "image_main_200759_150.png",
        frame_disable = "AlertCancel_gray_200759.png",
        button_scale = 1.1,
        type = "HFLButton",
        position = {
            x = 946,
            y = -64
        }
    }
}
return cfg
