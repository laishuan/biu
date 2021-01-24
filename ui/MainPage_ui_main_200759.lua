local cfg = 
{
    type = "HFLNode",
    name = "node_root",
    position = {
        x = 640,
        y = 360
    },
    {
        name = "uitBot",
        itemName = "movieclip/首页底部部分",
        type = "HFLUITree",
        path = "utf_main_200759_207",
        bounds = {
            left = 0,
            top = 0,
            right = 1063,
            bottom = 116
        },
        position = {
            x = 18.5,
            y = -272
        },
        offset = {
            x = 531.5,
            y = 58
        }
    },
    {
        name = "uitTop",
        itemName = "movieclip/首页顶部部分",
        type = "HFLUITree",
        path = "utf_main_200759_208",
        bounds = {
            left = 0,
            top = 0,
            right = 1232,
            bottom = 227
        },
        position = {
            x = 19,
            y = 231.5
        },
        offset = {
            x = 616,
            y = 113.5
        }
    },
    {
        name = "spBg",
        alignment = {
            top = true,
            left = true,
            bottom = true,
            right = true,
            factor = 1
        },
        itemName = "image_main_200759_127.png",
        type = "HFLSprite",
        frame = "image_main_200759_127.png",
        position = {
            x = 20,
            y = 0
        }
    }
}
return cfg
