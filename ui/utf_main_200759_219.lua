local cfg = 
{
    type = "HFLNode",
    name = "node_root",
    position = {
        x = 0,
        y = 0
    },
    {
        itemName = "controllers/Store/奖励条目",
        type = "HFLUITree",
        path = "utf_main_200759_220",
        controller = "awardsButton_controller200759",
        bounds = {
            left = 0,
            top = 0,
            right = 234,
            bottom = 104
        },
        position = {
            x = 122,
            y = -210.95
        },
        offset = {
            x = 117,
            y = 52
        }
    },
    {
        itemName = "controllers/Store/加减号条目",
        type = "HFLUITree",
        path = "utf_main_200759_221",
        controller = "addAndSub_controller200759",
        bounds = {
            left = 0,
            top = 0,
            right = 244.85,
            bottom = 74.15
        },
        position = {
            x = 122.4,
            y = -70.85
        },
        offset = {
            x = 122.4,
            y = 37.05
        }
    },
    {
        name = "txtHave",
        type = "HFLLabel",
        font_size = 30,
        label_size = {
            width = 302,
            height = 39
        },
        align = HFLLabelAlignCenter,
        color = {
            255,
            255,
            255
        },
        text = "拥有999",
        itemName = "30255.255.25530239",
        position = {
            x = 125.7,
            y = -18.7
        }
    }
}
return cfg
