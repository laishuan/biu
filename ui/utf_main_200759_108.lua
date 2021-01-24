local cfg = 
{
    type = "HFLNode",
    name = "node_root",
    position = {
        x = 0,
        y = 0
    },
    {
        itemName = "controllers/Items/成就奖励条目",
        type = "HFLUITree",
        path = "utf_main_200759_247",
        controller = "IconNameNum_controller200759",
        bounds = {
            left = 0,
            top = 0,
            right = 253,
            bottom = 247.5
        },
        position = {
            x = 191.45,
            y = -127.6
        },
        offset = {
            x = 126.5,
            y = 123.75
        }
    },
    {
        type = "HFLLabel",
        font_size = 30,
        label_size = {
            width = 122,
            height = 39
        },
        align = HFLLabelAlignCenter,
        color = {
            255,
            255,
            255
        },
        text = "领取",
        text_source = {
            set = "Common",
            key = "Common_text122"
        },
        itemName = "30255.255.25512239CommonCommon_text122",
        position = {
            x = 154.1,
            y = -310.3
        }
    },
    {
        itemName = "movieclip/btn黄按钮长_65x205",
        frame_normal = "image_main_200759_151.png",
        frame_down = "image_main_200759_151.png",
        frame_disable = "image_main_200759_248.png",
        button_scale = 1.1,
        type = "HFLButton",
        position = {
            x = 153.5,
            y = -315.5
        }
    },
    {
        type = "HFLLabel",
        font_size = 30,
        label_size = {
            width = 262,
            height = 39
        },
        align = HFLLabelAlignCenter,
        color = {
            255,
            255,
            255
        },
        text = "已完成：1/5",
        itemName = "30255.255.25526239",
        position = {
            x = 143.85,
            y = -90.45
        }
    },
    {
        type = "HFLLabel",
        font_size = 30,
        label_size = {
            width = 332,
            height = 75
        },
        align = HFLLabelAlignCenter,
        color = {
            255,
            255,
            255
        },
        text = "文案文案文案文案文案",
        itemName = "30255.255.25533275",
        position = {
            x = 153.1,
            y = -33.8
        }
    }
}
return cfg
