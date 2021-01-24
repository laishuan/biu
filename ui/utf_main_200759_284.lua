local cfg = 
{
    type = "HFLNode",
    position = {
        x = 0,
        y = 0
    },
    {
        name = "item",
        itemName = "controllers/进度条多个奖励",
        type = "HFLUITree",
        path = "utf_main_200759_304",
        controller = "dynamicAwards_controller200759",
        animIn = true,
        bounds = {
            left = 0,
            top = -42.9,
            right = 140.5,
            bottom = 42.9
        },
        position = {
            x = 92.7,
            y = -77.9
        },
        offset = {
            x = 0,
            y = 0
        }
    },
    {
        itemName = "image_main_200759_134.png",
        type = "HFLSprite",
        frame = "image_main_200759_134.png",
        position = {
            x = 155.5,
            y = -85.5
        },
        scale = {
            x = -1,
            y = 1
        }
    }
}
return cfg
