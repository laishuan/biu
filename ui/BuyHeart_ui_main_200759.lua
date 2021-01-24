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
        itemName = "controllers/Store/补心条目",
        type = "HFLUITree",
        path = "utf_main_200759_307",
        controller = "StoreExchangeItem_controller200759",
        bounds = {
            left = 0,
            top = 0,
            right = 244.9,
            bottom = 229.15
        },
        position = {
            x = 9.450000000000045,
            y = -182.39999999999998
        },
        offset = {
            x = 122.45,
            y = 114.55
        }
    },
    {
        type = "HFLLabel",
        font_size = 30,
        label_size = {
            width = 804,
            height = 71.5
        },
        align = HFLLabelAlignCenter,
        color = {
            255,
            255,
            255
        },
        text = "确定补充能量\\\r继续闯关吗？",
        text_source = {
            set = "activity_chess",
            key = "chess_10"
        },
        itemName = "30255.255.25580471.5activity_chesschess_10",
        position = {
            x = 10.399999999999977,
            y = 248.55
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
        itemName = "image_main_200759_164.png",
        type = "HFLSprite",
        frame = "image_main_200759_164.png",
        position = {
            x = 7.5,
            y = 60.5
        },
        scale = {
            x = 0.2925262451171875,
            y = 0.2909698486328125
        }
    }
}
return cfg
