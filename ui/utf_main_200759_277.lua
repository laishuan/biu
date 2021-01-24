local cfg = 
{
    type = "HFLNode",
    name = "node_root",
    position = {
        x = 0,
        y = 0
    },
    {
        name = "spX",
        itemName = "image_main_200759_197.png",
        type = "HFLSprite",
        frame = "image_main_200759_197.png",
        position = {
            x = 133,
            y = -215.5
        }
    },
    {
        name = "ctrAward",
        itemName = "controllers/Items/随机游戏奖励条目",
        type = "HFLUITree",
        path = "utf_main_200759_280",
        controller = "IconNameNum_controller200759",
        bounds = {
            left = -82.6,
            top = -65,
            right = 82.6,
            bottom = 65.05
        },
        position = {
            x = 143.6,
            y = -142
        },
        offset = {
            x = 0,
            y = 0
        }
    },
    {
        type = "HFLNode",
        itemName = "movieclip/icon_手_81x102",
        bounds = {
            left = -51,
            top = -40.5,
            right = 51,
            bottom = 40.5
        },
        position = {
            x = 196,
            y = -228.5
        }
    },
    {
        name = "spLight",
        itemName = "image_main_200759_282.png",
        type = "HFLSprite",
        frame = "image_main_200759_282.png",
        position = {
            x = 131.75,
            y = -219.4
        },
        scale = {
            x = 1,
            y = -1
        },
        anchor = {
            x = 0.5,
            y = 0.9438837920489296
        }
    },
    {
        name = "state",
        itemName = "movieclip/所有魂",
        type = "HFLUITree",
        path = "utf_main_200759_278",
        loop = "single frame",
        firstFrame = 0,
        animIn = true,
        bounds = {
            left = 14,
            top = 40,
            right = 167,
            bottom = 213
        },
        position = {
            x = 131.5,
            y = -107
        },
        offset = {
            x = 89.5,
            y = 107
        }
    },
    {
        itemName = "image_main_200759_131.png",
        type = "HFLSprite",
        frame = "image_main_200759_131.png",
        position = {
            x = 132.5,
            y = -225.5
        }
    }
}
return cfg
