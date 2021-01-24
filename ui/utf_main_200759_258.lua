local cfg = 
{
    type = "HFLNode",
    name = "node_root",
    position = {
        x = 0,
        y = 0
    },
    {
        name = "ctrAwards",
        itemName = "controllers/关卡多个奖励",
        type = "HFLUITree",
        path = "utf_main_200759_256",
        controller = "dynamicAwards_controller200759",
        animIn = true,
        bounds = {
            left = -83.15,
            top = -67.9,
            right = 100.85,
            bottom = 118.6
        },
        position = {
            x = 136.2,
            y = -105.4
        },
        offset = {
            x = 0,
            y = 0
        }
    },
    {
        name = "spGet",
        itemName = "image_main_200759_154.png",
        type = "HFLSprite",
        frame = "image_main_200759_154.png",
        position = {
            x = 213.5,
            y = -37.5
        }
    },
    {
        itemName = "image_main_200759_202.png",
        type = "HFLSprite",
        frame = "image_main_200759_202.png",
        position = {
            x = 124,
            y = -85.5
        }
    }
}
return cfg
