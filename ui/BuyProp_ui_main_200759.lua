local cfg = 
{
    type = "HFLNode",
    name = "node_root",
    position = {
        x = 640,
        y = 360
    },
    {
        name = "ctr2",
        itemName = "controllers/Store/商店条目",
        type = "HFLUITree",
        path = "utf_main_200759_219",
        controller = "StoreExchangeItem_controller200759",
        bounds = {
            left = -25.3,
            top = -0.75,
            right = 276.7,
            bottom = 262.95
        },
        position = {
            x = 241.39999999999998,
            y = -165.5
        },
        offset = {
            x = 122.4,
            y = 131.45
        }
    },
    {
        name = "ctr1",
        itemName = "controllers/Store/商店条目",
        type = "HFLUITree",
        path = "utf_main_200759_219",
        controller = "StoreExchangeItem_controller200759",
        bounds = {
            left = -25.3,
            top = -0.75,
            right = 276.7,
            bottom = 262.95
        },
        position = {
            x = -203.60000000000002,
            y = -165.5
        },
        offset = {
            x = 122.4,
            y = 131.45
        }
    },
    {
        type = "HFLLabel",
        font_size = 30,
        label_size = {
            width = 202,
            height = 67
        },
        align = HFLLabelAlignCenter,
        color = {
            255,
            255,
            255
        },
        text = "定位器",
        text_source = {
            set = "activity_chess",
            key = "chess_47"
        },
        itemName = "30255.255.25520267activity_chesschess_47",
        position = {
            x = 242.14999999999998,
            y = 209.3
        }
    },
    {
        itemName = "image_main_200759_175.png",
        type = "HFLSprite",
        frame = "image_main_200759_175.png",
        position = {
            x = 243.5,
            y = 73.5
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
        text = "体力",
        text_source = {
            set = "activity_chess",
            key = "chess_46"
        },
        itemName = "30255.255.25512267activity_chesschess_46",
        position = {
            x = -202.85000000000002,
            y = 209.2
        }
    },
    {
        itemName = "image_main_200759_162.png",
        type = "HFLSprite",
        frame = "image_main_200759_162.png",
        position = {
            x = -196.5,
            y = 70
        }
    },
    {
        name = "btnClose",
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
    }
}
return cfg
