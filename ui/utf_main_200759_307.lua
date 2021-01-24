local cfg = 
{
    type = "HFLNode",
    name = "node_root",
    position = {
        x = 0,
        y = 0
    },
    {
        itemName = "controllers/Store/补心加减号",
        type = "HFLUITree",
        path = "utf_main_200759_308",
        controller = "addAndSub_controller200759",
        bounds = {
            left = 0,
            top = 0,
            right = 244.9,
            bottom = 74.15
        },
        position = {
            x = 122.45,
            y = -37.05
        },
        offset = {
            x = 122.45,
            y = 37.05
        }
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
            x = 122,
            y = -177.15
        },
        offset = {
            x = 117,
            y = 52
        }
    }
}
return cfg
