local cfg = 
{
    type = "HFLNode",
    name = "node_root",
    position = {
        x = 640,
        y = 360
    },
    {
        name = "items",
        itemName = "controllers/content",
        type = "HFLUITree",
        path = "_Dynamic_ui_main_200759",
        controller = "dynamicAwards_controller200759",
        animIn = true,
        bounds = {
            left = 120,
            top = -1,
            right = 399.1,
            bottom = 135.8
        },
        position = {
            x = 0,
            y = 10
        },
        offset = {
            x = 272.75,
            y = 83.2
        }
    },
    {
        name = "btnClose",
        itemName = "按钮/开心收下按钮",
        frame_normal = "AlertOK_200759.png",
        frame_down = "AlertOK_200759.png",
        frame_disable = "AlertOK_200759.png",
        button_scale = 1.1,
        type = "HFLButton",
        position = {
            x = 0,
            y = -251.85000000000002
        },
        anchor = {
            x = 0.5360824742268041,
            y = 0.45
        },
        {
            name = "txtBtnTitle",
            type = "HFLLabel",
            font_size = 30,
            label_size = {
                width = 186,
                height = 40
            },
            align = HFLLabelAlignCenter,
            color = {
                255,
                255,
                255
            },
            text = "开心收下",
            text_source = {
                set = "Common",
                key = "Common_youcai"
            },
            itemName = "3024.2.218640CommonCommon_youcai",
            position = {
                x = 99.4,
                y = 40.7
            }
        }
    },
    {
        name = "txtTitle",
        type = "HFLLabel",
        font_size = 30,
        label_size = {
            width = 923,
            height = 103
        },
        align = HFLLabelAlignCenter,
        color = {
            255,
            255,
            255
        },
        text = "超棒！成功完成填满果酱机，这是为你送上的大奖，快收下吧~",
        text_source = {
            set = "Common",
            key = "Common_obtain"
        },
        itemName = "30255.255.255923103CommonCommon_obtain",
        position = {
            x = 0,
            y = 231.3
        }
    }
}
return cfg
