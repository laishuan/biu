local cfg = 
{
    type = "HFLNode",
    name = "node_root",
    position = {
        x = 0,
        y = 0
    },
    {
        name = "uit",
        itemName = "movieclip/提示部分 复制 7",
        type = "HFLUITree",
        path = "utf_main_200759_237",
        bounds = {
            left = -16.2,
            top = -28.4,
            right = 236.8,
            bottom = 168.6
        },
        position = {
            x = 142.9,
            y = -93.4
        },
        offset = {
            x = 70.7,
            y = 164.85
        }
    },
    {
        name = "btn",
        itemName = "movieclip/小关闭_71x72",
        frame_normal = "image_main_200759_239.png",
        frame_down = "image_main_200759_239.png",
        frame_disable = "image_main_200759_239.png",
        button_scale = 1.1,
        type = "HFLButton",
        position = {
            x = 144.95,
            y = -92.7
        },
        scale = {
            x = 1.763885498046875,
            y = 2.298431396484375
        },
        opacity = 0
    },
    {
        itemName = "controllers/Store/激活奖励条目",
        type = "HFLUITree",
        path = "utf_main_200759_252",
        controller = "awardsButton_controller200759",
        bounds = {
            left = 0,
            top = 0,
            right = 234,
            bottom = 104
        },
        position = {
            x = 122,
            y = -395
        },
        offset = {
            x = 117,
            y = 52
        }
    },
    {
        itemName = "controllers/Store/激活加减号条目",
        type = "HFLUITree",
        path = "utf_main_200759_253",
        controller = "addAndSub_controller200759",
        bounds = {
            left = 0,
            top = 0,
            right = 244.85,
            bottom = 74.15
        },
        position = {
            x = 122.4,
            y = -254.9
        },
        offset = {
            x = 122.4,
            y = 37.05
        }
    },
    {
        itemName = "image_main_200759_188.png",
        type = "HFLSprite",
        frame = "image_main_200759_188.png",
        position = {
            x = 132,
            y = -87
        }
    }
}
return cfg
