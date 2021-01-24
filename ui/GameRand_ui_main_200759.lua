local cfg = 
{
    type = "HFLNode",
    name = "node_root",
    position = {
        x = 640,
        y = 360
    },
    {
        name = "btnGiveup",
        itemName = "buttons/btn关闭x_89x89",
        frame_normal = "image_main_200759_143.png",
        frame_down = "image_main_200759_143.png",
        frame_disable = "image_main_200759_143.png",
        button_scale = 1.1,
        type = "HFLButton",
        position = {
            x = 590.5,
            y = 299.5
        }
    },
    {
        name = "uitSelect",
        itemName = "movieclip/铸魂选择界面",
        type = "HFLUITree",
        path = "utf_main_200759_276",
        bounds = {
            left = 0,
            top = 0,
            right = 1171,
            bottom = 695
        },
        position = {
            x = -16.5,
            y = -3.5
        },
        offset = {
            x = 585.5,
            y = 347.5
        }
    },
    {
        name = "uitGame",
        itemName = "movieclip/游戏部分",
        type = "HFLUITree",
        path = "utf_main_200759_274",
        bounds = {
            left = 0,
            top = 0,
            right = 1211,
            bottom = 744.95
        },
        position = {
            x = 12,
            y = 4.050000000000011
        },
        offset = {
            x = 607,
            y = 342.95
        }
    },
    {
        itemName = "image_main_200759_126.png",
        type = "HFLSprite",
        frame = "image_main_200759_126.png",
        position = {
            x = 20,
            y = 0
        }
    }
}
return cfg
