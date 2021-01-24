local cfg = 
{
    type = "HFLNode",
    name = "node_root",
    position = {
        x = 0,
        y = 0
    },
    {
        type = "HFLLabel",
        font_size = 30,
        label_size = {
            width = 57.599999999999994,
            height = 37.5
        },
        align = HFLLabelAlignCenter,
        color = {
            255,
            255,
            255
        },
        text = "X99",
        itemName = "30255.255.25557.59999999999999437.5",
        position = {
            x = 131.6,
            y = -35.3
        }
    },
    {
        itemName = "200759_icon_shield.png",
        type = "HFLSprite",
        frame = "200759_icon_shield.png",
        position = {
            x = 44,
            y = -32
        },
        scale = {
            x = 0.5,
            y = 0.4999847412109375
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
            x = 102.5,
            y = -40.5
        }
    }
}
return cfg
