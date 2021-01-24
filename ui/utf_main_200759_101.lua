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
            x = 98.25,
            y = -65.1
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
            x = 100.25,
            y = -64.35
        },
        scale = {
            x = 1.763885498046875,
            y = 1.55352783203125
        },
        opacity = 0
    },
    {
        itemName = "controllers/Store/任意奖励条目",
        type = "HFLUITree",
        path = "utf_main_200759_226",
        controller = "awardsButton_controller200759",
        bounds = {
            left = 0,
            top = 0,
            right = 205,
            bottom = 65
        },
        position = {
            x = 102.5,
            y = -214.5
        },
        offset = {
            x = 102.5,
            y = 32.5
        }
    },
    {
        type = "HFLLabel",
        font_size = 30,
        label_size = {
            width = 55.800000000000004,
            height = 37.25
        },
        align = HFLLabelAlignCenter,
        color = {
            255,
            255,
            255
        },
        text = "X99",
        itemName = "30255.255.25555.80000000000000437.25",
        position = {
            x = 195.45,
            y = -96.35
        }
    },
    {
        itemName = "controllers/Store/加减号条目兑换",
        type = "HFLUITree",
        path = "utf_main_200759_227",
        controller = "addAndSub_controller200759",
        bounds = {
            left = 0,
            top = 0,
            right = 209.05,
            bottom = 63.05
        },
        position = {
            x = 105.35,
            y = -142.35
        },
        offset = {
            x = 104.5,
            y = 31.5
        }
    },
    {
        itemName = "image_main_200759_159.png",
        type = "HFLSprite",
        frame = "image_main_200759_159.png",
        position = {
            x = 103,
            y = -55.5
        }
    }
}
return cfg
