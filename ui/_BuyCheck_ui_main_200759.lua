local cfg = 
{
    name = "node_root",
    type = "HFLNode",
    position = {
        x = 640,
        y = 360
    },
    {
        name = "spCost",
        itemName = "200759_icon_cash.png",
        type = "HFLSprite",
        frame = "200759_icon_cash.png",
        position = {
            x = -50.049999999999955,
            y = 7.300000000000011
        }
    },
    {
        name = "txtCostCash",
        type = "HFLLabel",
        font_size = 30,
        label_size = {
            width = 96,
            height = 40
        },
        align = HFLLabelAlignLeft,
        color = {
            255,
            255,
            255
        },
        text = "×8",
        itemName = "30255.255.2559640",
        position = {
            x = 49,
            y = 5.75
        }
    },
    {
        name = "btnClose",
        itemName = "所有面版/主板.psd 资源/主板/关闭1",
        frame_normal = "200759_btn_close.png",
        frame_down = "200759_btn_close.png",
        frame_disable = "200759_btn_close.png",
        button_scale = 1.1,
        type = "HFLButton",
        position = {
            x = 600.5,
            y = 306
        }
    },
    {
        name = "btnOK",
        itemName = "按钮/确定按钮",
        frame_normal = "AlertOK_200759.png",
        frame_down = "AlertOK_200759.png",
        frame_disable = "AlertOK_200759.png",
        button_scale = 1.1,
        type = "HFLButton",
        position = {
            x = 0,
            y = -191.85000000000002
        },
        anchor = {
            x = 0.5279187817258884,
            y = 0.4430379746835443
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
                24,
                2,
                2
            },
            text = "确定",
            text_source = {
                set = "Common",
                key = "Common_text124"
            },
            itemName = "3024.2.218640CommonCommon_text124",
            position = {
                x = 99.4,
                y = 39.7
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
        itemName = "30255.255.255923103",
        position = {
            x = 0,
            y = 186.3
        }
    }
}
return cfg
