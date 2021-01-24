local cfg = 
{
    type = "HFLNode",
    name = "node_root",
    position = {
        x = 640,
        y = 360
    },
    {
        name = "ctrLeft",
        itemName = "兑换条目左边",
        type = "HFLUITree",
        path = "utf_main_200759_310",
        controller = "IconNameNum_controller200759",
        bounds = {
            left = -95.4,
            top = -55.5,
            right = 95.45,
            bottom = 55.5
        },
        position = {
            x = -198.60000000000002,
            y = 28.5
        },
        offset = {
            x = 0,
            y = 0
        }
    },
    {
        name = "ctrRight",
        itemName = "兑换条目右边",
        type = "HFLUITree",
        path = "utf_main_200759_311",
        controller = "IconNameNum_controller200759",
        bounds = {
            left = -76.4,
            top = -29,
            right = 76.4,
            bottom = 29
        },
        position = {
            x = 225.39999999999998,
            y = 29
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
        text = "象棋关主任务：跟我做一个交易吧！",
        text_source = {
            set = "activity_chess",
            key = "chess_13"
        },
        itemName = "30255.255.25580267activity_chesschess_13",
        position = {
            x = 3,
            y = 263.85
        }
    },
    {
        name = "btnCancel",
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
        itemName = "image_main_200759_172.png",
        type = "HFLSprite",
        frame = "image_main_200759_172.png",
        position = {
            x = 9,
            y = 26.5
        }
    },
    {
        type = "HFLLabel",
        font_size = 30,
        label_size = {
            width = 102,
            height = 39
        },
        align = HFLLabelAlignCenter,
        color = {
            255,
            255,
            255
        },
        text = "交换",
        text_source = {
            set = "activity_chess",
            key = "chess_18"
        },
        itemName = "30255.255.25510239activity_chesschess_18",
        position = {
            x = 10.049999999999955,
            y = -236.20000000000005
        }
    },
    {
        name = "ctrBuy",
        itemName = "奖励按钮",
        type = "HFLUITree",
        path = "utf_main_200759_312",
        controller = "awardsButton_controller200759",
        bounds = {
            left = 0,
            top = 0,
            right = 234,
            bottom = 104
        },
        position = {
            x = 9,
            y = -245
        },
        offset = {
            x = 117,
            y = 52
        }
    }
}
return cfg
