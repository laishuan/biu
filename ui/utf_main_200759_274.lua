local cfg = 
{
    type = "HFLNode",
    position = {
        x = 0,
        y = 0
    },
    {
        name = "uitGameTip",
        itemName = "movieclip/游戏Tips",
        type = "HFLUITree",
        path = "utf_main_200759_275",
        bounds = {
            left = 0,
            top = 0,
            right = 902,
            bottom = 105
        },
        position = {
            x = 760,
            y = -347.5
        },
        offset = {
            x = 451,
            y = 52.5
        }
    },
    {
        name = "txtCnt",
        type = "HFLLabel",
        font_size = 30,
        label_size = {
            width = 35.9,
            height = 37.25
        },
        align = HFLLabelAlignLeft,
        color = {
            47,
            39,
            99
        },
        text = "4F",
        itemName = "3047.39.9935.937.25",
        position = {
            x = 41.3,
            y = -24.6
        }
    },
    {
        name = "txtCnt",
        type = "HFLLabel",
        font_size = 30,
        label_size = {
            width = 35.9,
            height = 37.25
        },
        align = HFLLabelAlignLeft,
        color = {
            47,
            39,
            99
        },
        text = "3F",
        itemName = "3047.39.9935.937.25",
        position = {
            x = 41.3,
            y = -199.6
        }
    },
    {
        name = "txtCnt",
        type = "HFLLabel",
        font_size = 30,
        label_size = {
            width = 35.9,
            height = 37.25
        },
        align = HFLLabelAlignLeft,
        color = {
            47,
            39,
            99
        },
        text = "2F",
        itemName = "3047.39.9935.937.25",
        position = {
            x = 41.3,
            y = -374.6
        }
    },
    {
        name = "txtCnt",
        type = "HFLLabel",
        font_size = 30,
        label_size = {
            width = 35.9,
            height = 37.25
        },
        align = HFLLabelAlignLeft,
        color = {
            47,
            39,
            99
        },
        text = "1F",
        itemName = "3047.39.9935.937.25",
        position = {
            x = 41.3,
            y = -549.6
        }
    },
    {
        name = "ctrAllLvlAwards",
        itemName = "controllers/Arr/所有关卡奖励",
        type = "HFLUITree",
        path = "utf_main_200759_255",
        controller = "Arr_controller200759",
        bounds = {
            left = 0,
            top = 0,
            right = 267,
            bottom = 744.95
        },
        position = {
            x = 133.5,
            y = -342.95
        },
        offset = {
            x = 133.5,
            y = 342.95
        }
    },
    {
        name = "nodeMeargeTo",
        itemName = "_UEPT/Bitmap 1",
        type = "HFLNode",
        bounds = {
            left = -13,
            top = -13,
            right = 13,
            bottom = 13
        },
        position = {
            x = 754,
            y = -138
        }
    },
    {
        name = "stateLvl",
        itemName = "movieclip/铸魂游戏内关卡",
        type = "HFLUITree",
        path = "utf_main_200759_279",
        loop = "single frame",
        firstFrame = 0,
        animIn = true,
        bounds = {
            left = 110.75,
            top = -108.35,
            right = 815.85,
            bottom = 469.9
        },
        position = {
            x = 754.5,
            y = -397
        },
        offset = {
            x = 459.5,
            y = 282
        }
    }
}
return cfg
