local cfg = 
{
    type = "HFLNode",
    name = "node_root",
    position = {
        x = 640,
        y = 360
    },
    {
        name = "ctrAll",
        itemName = "所有三选一",
        type = "HFLUITree",
        path = "utf_main_200759_313",
        controller = "Arr_controller200759",
        bounds = {
            left = 0,
            top = 0,
            right = 1014.7,
            bottom = 332
        },
        position = {
            x = 30.350000000000023,
            y = -131
        },
        offset = {
            x = 507.35,
            y = 166
        }
    },
    {
        type = "HFLLabel",
        font_size = 30,
        label_size = {
            width = 1002,
            height = 39
        },
        align = HFLLabelAlignCenter,
        color = {
            255,
            255,
            255
        },
        text = "您可以选择一档购买哦",
        text_source = {
            set = "activity_chess",
            key = "chess_11"
        },
        itemName = "30255.255.255100239activity_chesschess_11",
        position = {
            x = 30.350000000000023,
            y = 263.8
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
            x = 600.5,
            y = 299.5
        }
    }
}
return cfg
