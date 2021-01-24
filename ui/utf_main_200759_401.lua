local cfg = 
{
    type = "HFLNode",
    position = {
        x = 0,
        y = 0
    },
    {
        name = "txtUnlocTip",
        type = "HFLLabel",
        font_size = 24,
        label_size = {
            width = 244,
            height = 73
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
            key = "chess_26"
        },
        itemName = "2447.39.9924473activity_chesschess_26",
        position = {
            x = 157.6,
            y = -72.2
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
