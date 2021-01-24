local cfg = 
{
    type = "HFLNode",
    position = {
        x = 0,
        y = 0
    },
    {
        name = "txtCost",
        type = "HFLLabel",
        font_size = 30,
        label_size = {
            width = 134,
            height = 41
        },
        align = HFLLabelAlignCenter,
        color = {
            255,
            255,
            255
        },
        text = "X999激活",
        itemName = "30255.255.25513441",
        position = {
            x = 131.85,
            y = -29.2
        }
    },
    {
        itemName = "image_main_200759_178.png",
        type = "HFLSprite",
        frame = "image_main_200759_178.png",
        position = {
            x = 29,
            y = -29
        }
    },
    {
        name = "btnExchange",
        itemName = "movieclip/btn黄按钮长_65x205",
        frame_normal = "image_main_200759_151.png",
        frame_down = "image_main_200759_151.png",
        frame_disable = "image_main_200759_248.png",
        button_scale = 1.1,
        type = "HFLButton",
        position = {
            x = 112.5,
            y = -34.5
        }
    }
}
return cfg
