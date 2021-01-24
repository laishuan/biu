local cfg = 
{
    type = "HFLNode",
    name = "node_root",
    position = {
        x = 0,
        y = 0
    },
    {
        name = "txtCostDec",
        type = "HFLLabel",
        font_size = 30,
        label_size = {
            width = 132,
            height = 39
        },
        align = HFLLabelAlignCenter,
        color = {
            255,
            255,
            255
        },
        text = "3套盾牌",
        itemName = "30255.255.25513239",
        position = {
            x = 107.7,
            y = -27.5
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
            y = -32.5
        }
    }
}
return cfg
