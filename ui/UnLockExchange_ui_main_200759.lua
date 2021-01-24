local cfg = 
{
    type = "HFLNode",
    name = "node_root",
    position = {
        x = 640,
        y = 360
    },
    {
        name = "ctr",
        itemName = "controllers/Store/整个奖励部分",
        type = "HFLUITree",
        path = "utf_main_200759_251",
        controller = "StoreExchangeItem_controller200759",
        bounds = {
            left = 0,
            top = -99.85,
            right = 309,
            bottom = 447
        },
        position = {
            x = 19.399999999999977,
            y = -73.5
        },
        offset = {
            x = 122.4,
            y = 223.5
        }
    },
    {
        type = "HFLLabel",
        font_size = 30,
        label_size = {
            width = 762,
            height = 39
        },
        align = HFLLabelAlignCenter,
        color = {
            255,
            255,
            255
        },
        text = "请选择激活数量",
        text_source = {
            set = "activity_chess",
            key = "chess_34"
        },
        itemName = "30255.255.25576239activity_chesschess_34",
        position = {
            x = 20.25,
            y = 263.7
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
