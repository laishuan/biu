local cfg = 
{
    type = "HFLNode",
    position = {
        x = 0,
        y = 0
    },
    {
        name = "txtCostCur",
        type = "HFLLabel",
        font_size = 30,
        label_size = {
            width = 73,
            height = 39
        },
        align = HFLLabelAlignLeft,
        color = {
            47,
            39,
            99
        },
        text = "x1",
        itemName = "3047.39.997339",
        position = {
            x = 199.95,
            y = -106.4
        }
    },
    {
        type = "HFLLabel",
        font_size = 24,
        label_size = {
            width = 242,
            height = 71
        },
        align = HFLLabelAlignCenter,
        color = {
            47,
            39,
            99
        },
        text = "再次点击确认铸魂，",
        text_source = {
            set = "activity_chess",
            key = "chess_19"
        },
        itemName = "2447.39.9924271activity_chesschess_19",
        position = {
            x = 157.6,
            y = -42.2
        }
    },
    {
        itemName = "image_main_200759_177.png",
        type = "HFLSprite",
        frame = "image_main_200759_177.png",
        position = {
            x = 131.5,
            y = -96
        }
    },
    {
        itemName = "image_main_200759_134.png",
        type = "HFLSprite",
        frame = "image_main_200759_134.png",
        position = {
            x = 155.5,
            y = -85.5
        }
    }
}
return cfg
