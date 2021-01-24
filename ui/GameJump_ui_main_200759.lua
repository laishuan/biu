local cfg = 
{
    type = "HFLNode",
    name = "node_root",
    position = {
        x = 640,
        y = 360
    },
    {
        name = "uitTip",
        itemName = "movieclip/游戏Tips 复制",
        type = "HFLUITree",
        path = "utf_main_200759_398",
        bounds = {
            left = 0,
            top = 0,
            right = 902,
            bottom = 105
        },
        position = {
            x = 0,
            y = 0
        },
        offset = {
            x = 451,
            y = 52.5
        }
    },
    {
        name = "ctrProgressPart",
        itemName = "controllers/奖励进度",
        type = "HFLUITree",
        path = "utf_main_200759_285",
        controller = "ProgressAndAwards_controller200759",
        bounds = {
            left = -29.5,
            top = -113.85,
            right = 354.3,
            bottom = 515
        },
        position = {
            x = -467.15,
            y = -49.5
        },
        offset = {
            x = 102,
            y = 257.5
        }
    },
    {
        name = "btnHelp",
        itemName = "buttons/btn问号_90x90",
        frame_normal = "image_main_200759_149.png",
        frame_down = "image_main_200759_149.png",
        frame_disable = "image_main_200759_149.png",
        button_scale = 1.1,
        type = "HFLButton",
        position = {
            x = 573,
            y = 300
        }
    },
    {
        name = "btnBuy",
        itemName = "movieclip/btn加号_89x89",
        frame_normal = "image_main_200759_145.png",
        frame_down = "image_main_200759_145.png",
        frame_disable = "image_main_200759_244.png",
        button_scale = 1.1,
        type = "HFLButton",
        position = {
            x = 572.5,
            y = -278.5
        }
    },
    {
        name = "spSelectLocator",
        itemName = "image_main_200759_120.png",
        type = "HFLSprite",
        frame = "image_main_200759_120.png",
        position = {
            x = 489.5,
            y = -314.5
        }
    },
    {
        name = "btnSelect",
        itemName = "movieclip/icon_气泡_131x127",
        frame_normal = "image_main_200759_158.png",
        frame_down = "image_main_200759_158.png",
        frame_disable = "image_main_200759_158.png",
        button_scale = 1.1,
        type = "HFLButton",
        position = {
            x = 430.5,
            y = -279.5
        }
    },
    {
        itemName = "image_main_200759_175.png",
        type = "HFLSprite",
        frame = "image_main_200759_175.png",
        position = {
            x = 430.5,
            y = -278.5
        }
    },
    {
        itemName = "image_main_200759_129.png",
        type = "HFLSprite",
        frame = "image_main_200759_129.png",
        position = {
            x = 489.5,
            y = -278.5
        }
    },
    {
        name = "txtHeart",
        type = "HFLLabel",
        font_size = 30,
        label_size = {
            width = 59,
            height = 39
        },
        align = HFLLabelAlignLeft,
        color = {
            255,
            255,
            255
        },
        text = "X99",
        itemName = "30255.255.2555939",
        position = {
            x = -59.89999999999998,
            y = 296.7
        }
    },
    {
        name = "txtGold",
        type = "HFLLabel",
        font_size = 30,
        label_size = {
            width = 76,
            height = 39
        },
        align = HFLLabelAlignLeft,
        color = {
            255,
            255,
            255
        },
        text = "X200",
        itemName = "30255.255.2557639",
        position = {
            x = -265.4,
            y = 298.7
        }
    },
    {
        name = "txtSilver",
        type = "HFLLabel",
        font_size = 30,
        label_size = {
            width = 76,
            height = 39
        },
        align = HFLLabelAlignLeft,
        color = {
            255,
            255,
            255
        },
        text = "X200",
        itemName = "30255.255.2557639",
        position = {
            x = -445.4,
            y = 298.7
        }
    },
    {
        itemName = "image_main_200759_164.png",
        type = "HFLSprite",
        frame = "image_main_200759_164.png",
        position = {
            x = -117.5,
            y = 294.5
        },
        scale = {
            x = 0.2051849365234375,
            y = 0.2063140869140625
        }
    },
    {
        itemName = "image_main_200759_177.png",
        type = "HFLSprite",
        frame = "image_main_200759_177.png",
        position = {
            x = -532,
            y = 299
        }
    },
    {
        itemName = "image_main_200759_178.png",
        type = "HFLSprite",
        frame = "image_main_200759_178.png",
        position = {
            x = -350,
            y = 299
        }
    },
    {
        itemName = "image_main_200759_122.png",
        type = "HFLSprite",
        frame = "image_main_200759_122.png",
        position = {
            x = -89,
            y = 299.5
        }
    },
    {
        itemName = "image_main_200759_123.png",
        type = "HFLSprite",
        frame = "image_main_200759_123.png",
        position = {
            x = -389.5,
            y = 299.5
        }
    },
    {
        itemName = "image_main_200759_136.png",
        type = "HFLSprite",
        frame = "image_main_200759_136.png",
        position = {
            x = 564,
            y = -4
        }
    },
    {
        name = "ctrGame",
        itemName = "controllers/游戏部分",
        type = "HFLUITree",
        path = "utf_main_200759_320",
        controller = "gamePart_controller200759",
        bounds = {
            left = 0.85,
            top = 0,
            right = 992.4,
            bottom = 563.15
        },
        position = {
            x = -124.39999999999998,
            y = 47.60000000000002
        },
        offset = {
            x = 496.2,
            y = 281.55
        }
    },
    {
        itemName = "image_main_200759_118.png",
        type = "HFLSprite",
        frame = "image_main_200759_118.png",
        position = {
            x = 20,
            y = -240
        }
    },
    {
        itemName = "image_main_200759_125.png",
        type = "HFLSprite",
        frame = "image_main_200759_125.png",
        position = {
            x = 20,
            y = 0
        }
    }
}
return cfg
