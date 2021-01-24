local cfg = 
{
    type = "HFLNode",
    name = "node_root",
    position = {
        x = 0,
        y = 0
    },
    {
        name = "ctrAward",
        itemName = "controllers/Items/奖励部分",
        type = "HFLUITree",
        path = "utf_main_200759_333",
        controller = "IconNameNum_controller200759",
        bounds = {
            left = 0,
            top = 0,
            right = 253,
            bottom = 248.2
        },
        position = {
            x = 137.2,
            y = 8.55
        },
        offset = {
            x = 126.5,
            y = 123.75
        }
    },
    {
        itemName = "controllers/Store/任意奖励条目",
        type = "HFLUITree",
        path = "utf_main_200759_226",
        controller = "awardsButton_controller200759",
        bounds = {
            left = 0,
            top = 0,
            right = 205,
            bottom = 65
        },
        position = {
            x = 102.5,
            y = -214.5
        },
        offset = {
            x = 102.5,
            y = 32.5
        }
    },
    {
        itemName = "controllers/Store/加减号条目兑换",
        type = "HFLUITree",
        path = "utf_main_200759_227",
        controller = "addAndSub_controller200759",
        bounds = {
            left = 0,
            top = 0,
            right = 209.05,
            bottom = 63.05
        },
        position = {
            x = 105.35,
            y = -142.35
        },
        offset = {
            x = 104.5,
            y = 31.5
        }
    }
}
return cfg
