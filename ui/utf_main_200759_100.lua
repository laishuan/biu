local cfg = 
{
    type = "HFLNode",
    name = "node_root",
    position = {
        x = 0,
        y = 0
    },
    {
        itemName = "controllers/Store/兑换界面奖励按钮",
        type = "HFLUITree",
        path = "utf_main_200759_228",
        controller = "awardsButton_controller200759",
        bounds = {
            left = 0,
            top = 8,
            right = 205,
            bottom = 73
        },
        position = {
            x = 102.5,
            y = -210.5
        },
        offset = {
            x = 102.5,
            y = 36.5
        }
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
            x = 137.1,
            y = 8.3
        },
        offset = {
            x = 126.5,
            y = 124.1
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
