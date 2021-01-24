local cfg = 
{
    type = "HFLNode",
    name = "node_root",
    position = {
        x = 640,
        y = 360
    },
    {
        name = "spGet",
        itemName = "image_main_200759_154.png",
        type = "HFLSprite",
        frame = "image_main_200759_154.png",
        position = {
            x = 260.25,
            y = 316.8
        }
    },
    {
        name = "ctrFishes",
        itemName = "controllers/Items/开宝箱鱼随机展示条目",
        type = "HFLUITree",
        path = "utf_main_200759_315",
        controller = "IconNameNum_controller200759",
        bounds = {
            left = 0,
            top = 0,
            right = 184,
            bottom = 197.45
        },
        position = {
            x = 203,
            y = 233.5
        },
        offset = {
            x = 60,
            y = 55.5
        }
    },
    {
        type = "HFLLabel",
        font_size = 30,
        label_size = {
            width = 623,
            height = 39
        },
        align = HFLLabelAlignRight,
        color = {
            255,
            255,
            255
        },
        text = "棋牌下必有随机小鱼：",
        text_source = {
            set = "activity_chess",
            key = "chess_15"
        },
        itemName = "30255.255.25562339activity_chesschess_15",
        position = {
            x = -163.75,
            y = 232.8
        }
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
            x = 580.5,
            y = 299.5
        }
    },
    {
        name = "txtTitle",
        type = "HFLLabel",
        font_size = 30,
        label_size = {
            width = 804,
            height = 69
        },
        align = HFLLabelAlignCenter,
        color = {
            255,
            255,
            255
        },
        text = "象棋关主任务：找到铸魂珠（1/3）",
        text_source = {
            set = "activity_chess",
            key = "chess_14"
        },
        itemName = "30255.255.25580469activity_chesschess_14",
        position = {
            x = -13.649999999999977,
            y = 313.8
        }
    },
    {
        name = "ctrOpenBox",
        itemName = "controllers/所有方块",
        type = "HFLUITree",
        path = "utf_main_200759_316",
        controller = "OpenBox_controller200759",
        bounds = {
            left = 0,
            top = 24,
            right = 762,
            bottom = 523
        },
        position = {
            x = 10,
            y = -68.5
        },
        offset = {
            x = 381,
            y = 261.5
        }
    }
}
return cfg
