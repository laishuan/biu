local cfg = 
{
    type = "HFLFlashAnim",
    itemName = "Exchange",
    name = "node_root",
    position = {
        x = 640,
        y = 360
    },
    offset = {
        x = 640,
        y = 360
    },
    timeline = {
        layers = {
            {
                layerType = "normal",
                visible = true,
                frameCount = 2,
                frames = {
                    {
                        startFrame = 0,
                        duration = 2,
                        isEmpty = false,
                        elements = {
                            {
                                name = "btnClose",
                                itemName = "buttons/btn关闭x_89x89",
                                frame_normal = "image_main_200759_143.png",
                                frame_down = "image_main_200759_143.png",
                                frame_disable = "image_main_200759_143.png",
                                button_scale = 1.1,
                                type = "HFLButton",
                                position = {
                                    x = 1210.5,
                                    y = -60.5
                                }
                            },
                            {
                                name = "ctrTabs",
                                itemName = "controllers/页签元件",
                                type = "HFLUITree",
                                path = "utf_main_200759_224",
                                controller = "Tabs_controller200759",
                                bounds = {
                                    left = 0,
                                    top = 0,
                                    right = 1177,
                                    bottom = 69.8
                                },
                                position = {
                                    x = 638.5,
                                    y = -73
                                },
                                offset = {
                                    x = 588.5,
                                    y = 34
                                }
                            }
                        }
                    }
                }
            },
            {
                layerType = "normal",
                visible = true,
                frameCount = 2,
                frames = {
                    {
                        startFrame = 0,
                        duration = 1,
                        isEmpty = false,
                        elements = {
                            {
                                name = "ctrAll",
                                itemName = "controllers/Arr/所有兑换条目",
                                type = "HFLUITree",
                                path = "utf_main_200759_246",
                                controller = "Arr_controller200759",
                                bounds = {
                                    left = 0,
                                    top = -132.4,
                                    right = 1122.6,
                                    bottom = 515
                                },
                                position = {
                                    x = 594.6,
                                    y = -439.5
                                },
                                offset = {
                                    x = 541.6,
                                    y = 257.5
                                }
                            }
                        }
                    },
                    {
                        startFrame = 1,
                        duration = 1,
                        isEmpty = true
                    }
                }
            },
            {
                layerType = "normal",
                visible = true,
                frameCount = 2,
                frames = {
                    {
                        startFrame = 0,
                        duration = 1,
                        isEmpty = false,
                        elements = {
                            {
                                itemName = "200759_icon_gold.png",
                                type = "HFLSprite",
                                frame = "200759_icon_gold.png",
                                position = {
                                    x = 1142.85,
                                    y = -142.85
                                },
                                scale = {
                                    x = 0.96148681640625,
                                    y = 0.96148681640625
                                }
                            },
                            {
                                name = "ctrAllCounts",
                                itemName = "controllers/Arr/所有盾牌数量",
                                type = "HFLUITree",
                                path = "utf_main_200759_225",
                                controller = "Arr_controller200759",
                                bounds = {
                                    left = 0,
                                    top = -1.85,
                                    right = 982.95,
                                    bottom = 39.15
                                },
                                position = {
                                    x = 697.2,
                                    y = -146.1
                                },
                                scale = {
                                    x = 0.96148681640625,
                                    y = 0.96148681640625
                                },
                                offset = {
                                    x = 413.95,
                                    y = 18.65
                                }
                            },
                            {
                                itemName = "image_main_200759_167.png",
                                type = "HFLSprite",
                                frame = "image_main_200759_167.png",
                                position = {
                                    x = 850.1,
                                    y = -146.45
                                },
                                scale = {
                                    x = 0.96148681640625,
                                    y = 0.96148681640625
                                }
                            },
                            {
                                itemName = "movieclip/icon盾牌彩色_61x57",
                                type = "HFLNode",
                                bounds = {
                                    left = -28.550000000000004,
                                    top = -30.55,
                                    right = 23.449999999999996,
                                    bottom = 15.45
                                },
                                position = {
                                    x = 265.5,
                                    y = -145.5
                                },
                                scale = {
                                    x = 0.96148681640625,
                                    y = 0.96148681640625
                                },
                                {
                                    itemName = "200759_icon_shield.png",
                                    type = "HFLSprite",
                                    frame = "200759_icon_shield.png",
                                    position = {
                                        x = -1.5500000000000007,
                                        y = 6.550000000000001
                                    },
                                    scale = {
                                        x = 0.5,
                                        y = 0.4999847412109375
                                    }
                                }
                            },
                            {
                                itemName = "image_main_200759_170.png",
                                type = "HFLSprite",
                                frame = "image_main_200759_170.png",
                                position = {
                                    x = 996.25,
                                    y = -146.45
                                },
                                scale = {
                                    x = 0.96148681640625,
                                    y = 0.96148681640625
                                }
                            },
                            {
                                itemName = "image_main_200759_168.png",
                                type = "HFLSprite",
                                frame = "image_main_200759_168.png",
                                position = {
                                    x = 411.65,
                                    y = -146.45
                                },
                                scale = {
                                    x = 0.96148681640625,
                                    y = 0.96148681640625
                                }
                            },
                            {
                                itemName = "image_main_200759_165.png",
                                type = "HFLSprite",
                                frame = "image_main_200759_165.png",
                                position = {
                                    x = 703.95,
                                    y = -146.45
                                },
                                scale = {
                                    x = 0.96148681640625,
                                    y = 0.96148681640625
                                }
                            },
                            {
                                itemName = "image_main_200759_166.png",
                                type = "HFLSprite",
                                frame = "image_main_200759_166.png",
                                position = {
                                    x = 557.8,
                                    y = -146.45
                                },
                                scale = {
                                    x = 0.96148681640625,
                                    y = 0.96148681640625
                                }
                            },
                            {
                                type = "HFLLabel",
                                font_size = 30,
                                label_size = {
                                    width = 160,
                                    height = 41
                                },
                                align = HFLLabelAlignRight,
                                color = {
                                    47,
                                    39,
                                    99
                                },
                                text = "拥有：",
                                text_source = {
                                    set = "Common",
                                    key = "Common_have"
                                },
                                stroke_size = 2,
                                stroke_color = {
                                    255,
                                    255,
                                    255
                                },
                                itemName = "3047.39.9916041CommonCommon_have",
                                position = {
                                    x = 148.5,
                                    y = -146.15
                                },
                                scale = {
                                    x = 0.96148681640625,
                                    y = 0.96148681640625
                                }
                            },
                            {
                                itemName = "image_main_200759_135.png",
                                type = "HFLSprite",
                                frame = "image_main_200759_135.png",
                                position = {
                                    x = 640.05,
                                    y = -146.45
                                },
                                scale = {
                                    x = 1.2982177734375,
                                    y = 0.48529052734375
                                }
                            }
                        }
                    },
                    {
                        startFrame = 1,
                        duration = 1,
                        isEmpty = false,
                        elements = {
                            {
                                name = "ctrAll",
                                itemName = "controllers/Arr/所有成就",
                                type = "HFLUITree",
                                path = "utf_main_200759_245",
                                controller = "Arr_controller200759",
                                bounds = {
                                    left = -13.85,
                                    top = -0.55,
                                    right = 1110.05,
                                    bottom = 351.05
                                },
                                position = {
                                    x = 645.2,
                                    y = -383.45
                                },
                                offset = {
                                    x = 554.7,
                                    y = 175.5
                                }
                            }
                        }
                    }
                }
            }
        },
        frameCount = 2,
        layerCount = 3
    }
}
return cfg
