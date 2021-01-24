local cfg = 
{
    type = "HFLNode",
    name = "node_root",
    position = {
        x = 0,
        y = 0
    },
    {
        itemName = "controllers/Store/补心购买部分",
        type = "HFLUITree",
        path = "utf_main_200759_309",
        controller = "awardsButton_controller200759",
        bounds = {
            left = 0,
            top = 0,
            right = 234,
            bottom = 104
        },
        position = {
            x = 117,
            y = -280
        },
        offset = {
            x = 117,
            y = 52
        }
    },
    {
        itemName = "image_main_200759_177.png",
        type = "HFLSprite",
        frame = "image_main_200759_177.png",
        position = {
            x = 112,
            y = -29
        }
    },
    {
        type = "HFLLabel",
        font_size = 30,
        label_size = {
            width = 55.85,
            height = 37.25
        },
        align = HFLLabelAlignLeft,
        color = {
            255,
            255,
            255
        },
        text = "X99",
        itemName = "30255.255.25555.8537.25",
        position = {
            x = 208.7,
            y = -80.15
        },
        scale = {
            x = 1.002105712890625,
            y = 1.020263671875
        }
    }
}
return cfg
