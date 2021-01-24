local cfg = 
{
    type = "HFLNode",
    position = {
        x = 0,
        y = 0
    },
    {
        name = "txtLvlTip",
        type = "HFLLabel",
        font_size = 45,
        label_size = {
            width = 804,
            height = 57
        },
        align = HFLLabelAlignCenter,
        color = {
            47,
            39,
            99
        },
        text = "铸魂第1阶，成功！",
        text_source = {
            set = "activity_chess",
            key = "chess_30"
        },
        itemName = "4547.39.9980457activity_chesschess_30",
        position = {
            x = 458.95,
            y = -54.9
        }
    },
    {
        itemName = "image_main_200759_135.png",
        type = "HFLSprite",
        frame = "image_main_200759_135.png",
        position = {
            x = 451,
            y = -52.5
        }
    }
}
return cfg
