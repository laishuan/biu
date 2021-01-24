local cfg = 
{
    type = "HFLNode",
    name = "node_root",
    position = {
        x = 0,
        y = 0
    },
    {
        name = "node2",
        itemName = "_UEPT/Bitmap 1",
        type = "HFLNode",
        bounds = {
            left = -13,
            top = -13.1,
            right = 13,
            bottom = 12.9
        },
        position = {
            x = 828,
            y = -370.1
        }
    },
    {
        name = "node1",
        itemName = "_UEPT/Bitmap 1",
        type = "HFLNode",
        bounds = {
            left = -12.95,
            top = -12.95,
            right = 13.05,
            bottom = 13.05
        },
        position = {
            x = 404.95,
            y = -466.95
        }
    },
    {
        type = "HFLNode",
        itemName = "",
        bounds = {
            left = -616.5,
            top = -418.5,
            right = -167.50000000000003,
            bottom = -295.5
        },
        position = {
            x = 1233,
            y = -837
        }
    },
    {
        name = "ctrAward",
        itemName = "controllers/Items/跳台奖励条目",
        type = "HFLUITree",
        path = "utf_main_200759_328",
        controller = "IconNameNum_controller200759",
        bounds = {
            left = -158.8,
            top = -29,
            right = 95.15,
            bottom = 29
        },
        position = {
            x = 127.8,
            y = -135.9
        },
        offset = {
            x = -31.85,
            y = 0
        }
    },
    {
        name = "spPerferct",
        itemName = "200759_perfect_cn.png",
        type = "HFLSprite",
        frame = "200759_perfect_cn.png",
        is_multi_language = true,
        position = {
            x = 295.45,
            y = -53
        }
    },
    {
        name = "ctrJumper",
        itemName = "controllers/小白人",
        type = "HFLUITree",
        path = "utf_main_200759_330",
        controller = "jumper_controller200759",
        bounds = {
            left = -35.9,
            top = 0.05,
            right = 179.15,
            bottom = 182.7
        },
        position = {
            x = 404.95,
            y = -466.95
        },
        offset = {
            x = 79.5,
            y = 178.5
        }
    },
    {
        name = "spBoss",
        itemName = "psds/跳跳游戏/movieClips/图层 1",
        type = "HFLUITree",
        path = "utf_main_200759_111",
        bounds = {
            left = 0,
            top = 0,
            right = 203,
            bottom = 327
        },
        position = {
            x = 828,
            y = -371
        },
        offset = {
            x = 38.6,
            y = 305.75
        }
    },
    {
        name = "ctrGrid1",
        itemName = "controllers/游戏格子",
        type = "HFLUITree",
        path = "utf_main_200759_323",
        controller = "gridJump_controller200759",
        loop = "loop",
        firstFrame = 0,
        animIn = true,
        bounds = {
            left = 0,
            top = 0,
            right = 326,
            bottom = 139
        },
        position = {
            x = 404.95,
            y = -466.95
        },
        offset = {
            x = 163.35,
            y = 42.8
        }
    }
}
return cfg
