local cfg = 
{
    type = "HFLNode",
    name = "node_root",
    position = {
        x = 640,
        y = 360
    },
    {
        name = "ctrAward",
        itemName = "controllers/Items/随机游戏奖励条目",
        type = "HFLUITree",
        path = "utf_main_200759_280",
        controller = "IconNameNum_controller200759",
        bounds = {
            left = -82.6,
            top = -65,
            right = 82.6,
            bottom = 65.05
        },
        position = {
            x = 18.200000000000045,
            y = 26.75
        },
        offset = {
            x = 0,
            y = 0
        }
    },
    {
        type = "HFLLabel",
        font_size = 30,
        label_size = {
            width = 802,
            height = 67
        },
        align = HFLLabelAlignCenter,
        color = {
            255,
            255,
            255
        },
        text = "确定花费%s开心宝继续铸魂吗？",
        text_source = {
            set = "activity_chess",
            key = "chess_40"
        },
        itemName = "30255.255.25580267activity_chesschess_40",
        position = {
            x = 27.100000000000023,
            y = 263.7
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
            x = 590.5,
            y = 299.5
        }
    },
    {
        itemName = "image_main_200759_155.png",
        type = "HFLSprite",
        frame = "image_main_200759_155.png",
        position = {
            x = -32,
            y = -237.5
        }
    },
    {
        name = "txtCost",
        type = "HFLLabel",
        font_size = 30,
        label_size = {
            width = 84.00000000000001,
            height = 41
        },
        align = HFLLabelAlignLeft,
        color = {
            255,
            255,
            255
        },
        text = "X3",
        itemName = "30255.255.25584.0000000000000141",
        position = {
            x = 83.60000000000002,
            y = -236.20000000000005
        }
    },
    {
        name = "btnBuy",
        itemName = "movieclip/btn黄按钮_104x234",
        frame_normal = "image_main_200759_150.png",
        frame_down = "image_main_200759_150.png",
        frame_disable = "image_main_200759_150.png",
        button_scale = 1.1,
        type = "HFLButton",
        position = {
            x = 19,
            y = -245
        }
    }
}
return cfg
