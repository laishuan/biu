local cfg = 
{
    type = "HFLNode",
    name = "node_root",
    position = {
        x = 0,
        y = 0
    },
    {
        name = "item2",
        itemName = "copy/controllers/进度条/进度条部分条目",
        type = "HFLUITree",
        path = "utf_main_200759_290",
        controller = "ProgressItem_controller200759",
        bounds = {
            left = 56.5,
            top = 10,
            right = 403.8,
            bottom = 219.65
        },
        position = {
            x = 538.85,
            y = 23.35
        },
        offset = {
            x = 133.55,
            y = 119.7
        }
    },
    {
        name = "item1",
        itemName = "copy/controllers/进度条/进度条部分条目",
        type = "HFLUITree",
        path = "utf_main_200759_290",
        controller = "ProgressItem_controller200759",
        bounds = {
            left = 56.5,
            top = 10,
            right = 403.8,
            bottom = 219.65
        },
        position = {
            x = 306.95,
            y = 23.35
        },
        offset = {
            x = 133.55,
            y = 119.7
        }
    },
    {
        itemName = "copy/movieclip/进度条/心 副本 复制",
        type = "HFLNode",
        bounds = {
            left = -28.6,
            top = -24.15,
            right = 28.4,
            bottom = 23.85
        },
        position = {
            x = 23.3,
            y = -42.7
        }
    },
    {
        name = "txtProgress",
        type = "HFLLabel",
        font_size = 20,
        label_size = {
            width = 307,
            height = 32
        },
        align = HFLLabelAlignCenter,
        color = {
            88,
            56,
            31
        },
        text = "70/100",
        itemName = "2088.56.3130732",
        position = {
            x = 377,
            y = -42.05
        }
    },
    {
        name = "spProgress",
        itemName = "_UEPT/cpoy/进度条/奖励进度条底",
        type = "HFLNode",
        bounds = {
            left = -0.15,
            top = 0,
            right = 647.85,
            bottom = 30
        },
        position = {
            x = 60.1,
            y = -24
        },
        scale = {
            x = 0.9969024658203125,
            y = 1.1666259765625
        }
    },
    {
        itemName = "copy/movieclip/进度条/进度条底儿 复制 2",
        type = "HFLNode",
        bounds = {
            left = -327.5,
            top = -21.5,
            right = 327.5,
            bottom = 21.5
        },
        position = {
            x = 382.95,
            y = -41.5
        }
    }
}
return cfg
