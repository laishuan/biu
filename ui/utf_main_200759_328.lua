local cfg = 
{
    type = "HFLNode",
    name = "node_root",
    position = {
        x = 0,
        y = 0
    },
    {
        name = "txtCnt",
        type = "HFLLabel",
        font_size = 30,
        label_size = {
            width = 104,
            height = 43.6
        },
        align = HFLLabelAlignLeft,
        color = {
            51,
            51,
            51
        },
        text = "x1",
        itemName = "3051.51.5110443.6",
        position = {
            x = 34.15,
            y = -2.2
        }
    },
    {
        name = "sp",
        itemName = "image_main_200759_177.png",
        type = "HFLSprite",
        frame = "image_main_200759_177.png",
        position = {
            x = -57.15,
            y = 0
        }
    },
    {
        itemName = "image_main_200759_135.png",
        type = "HFLSprite",
        frame = "image_main_200759_135.png",
        position = {
            x = -31.7,
            y = 2.4
        },
        scale = {
            x = 0.2815399169921875,
            y = 0.504730224609375
        }
    }
}
return cfg
