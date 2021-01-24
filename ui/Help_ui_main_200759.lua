local cfg = 
{
    type = "HFLFlashAnim",
    itemName = "Help",
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
                frameCount = 3,
                frames = {
                    {
                        startFrame = 0,
                        duration = 3,
                        isEmpty = false,
                        elements = {
                            {
                                itemName = "controllers/页签部分",
                                type = "HFLUITree",
                                path = "utf_main_200759_210",
                                controller = "Tabs_controller200759",
                                bounds = {
                                    left = 0,
                                    top = 0,
                                    right = 1177,
                                    bottom = 68.25
                                },
                                position = {
                                    x = 638.5,
                                    y = -91
                                },
                                offset = {
                                    x = 588.5,
                                    y = 34
                                }
                            },
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
                            }
                        }
                    }
                }
            },
            {
                layerType = "normal",
                visible = true,
                frameCount = 3,
                frames = {
                    {
                        startFrame = 0,
                        duration = 3,
                        isEmpty = false,
                        elements = {
                            {
                                itemName = "movieclip/btn箭头上_77x78",
                                frame_normal = "image_main_200759_146.png",
                                frame_down = "image_main_200759_146.png",
                                frame_disable = "image_main_200759_146.png",
                                button_scale = 1.1,
                                type = "HFLButton",
                                position = {
                                    x = 1200,
                                    y = -327.5
                                }
                            },
                            {
                                itemName = "movieclip/btn箭头下_78x78",
                                frame_normal = "image_main_200759_147.png",
                                frame_down = "image_main_200759_147.png",
                                frame_disable = "image_main_200759_147.png",
                                button_scale = 1.1,
                                type = "HFLButton",
                                position = {
                                    x = 1200,
                                    y = -492
                                }
                            }
                        }
                    }
                }
            },
            {
                layerType = "normal",
                visible = true,
                frameCount = 3,
                frames = {
                    {
                        startFrame = 0,
                        duration = 1,
                        isEmpty = false,
                        elements = {
                            {
                                itemName = "image_main_200759_200.png",
                                type = "HFLSprite",
                                frame = "image_main_200759_200.png",
                                position = {
                                    x = 217.5,
                                    y = -372
                                }
                            },
                            {
                                type = "HFLLabel",
                                font_size = 25,
                                label_size = {
                                    width = 998,
                                    height = 33
                                },
                                align = HFLLabelAlignCenter,
                                color = {
                                    247,
                                    255,
                                    126
                                },
                                text = "注：领奖时间内，只能兑换奖励",
                                text_source = {
                                    set = "activity_chess",
                                    key = "chess_49"
                                },
                                itemName = "25247.255.12699833activity_chesschess_49",
                                position = {
                                    x = 622.65,
                                    y = -669.05
                                }
                            },
                            {
                                name = "txtDec",
                                type = "HFLLabel",
                                font_size = 25,
                                label_size = {
                                    width = 1029,
                                    height = 145
                                },
                                align = HFLLabelAlignLeft,
                                color = {
                                    255,
                                    255,
                                    255
                                },
                                text = "1.要素过多要素过多要素过多要素过多要素过多要素过多要素过多要素过多要素过多要素过多",
                                text_source = {
                                    set = "activity_chess",
                                    key = "chess_48"
                                },
                                itemName = "25255.255.2551029145activity_chesschess_48",
                                position = {
                                    x = 639.9,
                                    y = -585.55
                                }
                            },
                            {
                                itemName = "image_main_200759_169.png",
                                type = "HFLSprite",
                                frame = "image_main_200759_169.png",
                                position = {
                                    x = 1043.5,
                                    y = -299
                                }
                            },
                            {
                                itemName = "image_main_200759_179.png",
                                type = "HFLSprite",
                                frame = "image_main_200759_179.png",
                                position = {
                                    x = 722,
                                    y = -351
                                }
                            },
                            {
                                itemName = "image_main_200759_174.png",
                                type = "HFLSprite",
                                frame = "image_main_200759_174.png",
                                position = {
                                    x = 610,
                                    y = -306.5
                                }
                            },
                            {
                                itemName = "image_main_200759_176.png",
                                type = "HFLSprite",
                                frame = "image_main_200759_176.png",
                                position = {
                                    x = 477,
                                    y = -266.5
                                }
                            },
                            {
                                itemName = "image_main_200759_173.png",
                                type = "HFLSprite",
                                frame = "image_main_200759_173.png",
                                position = {
                                    x = 861.5,
                                    y = -356
                                }
                            },
                            {
                                itemName = "image_main_200759_173.png",
                                type = "HFLSprite",
                                frame = "image_main_200759_173.png",
                                position = {
                                    x = 330.5,
                                    y = -309
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
                                itemName = "controllers/Arr/所有奖励鱼",
                                type = "HFLUITree",
                                path = "utf_main_200759_211",
                                controller = "Arr_controller200759",
                                bounds = {
                                    left = -3.4,
                                    top = -12.55,
                                    right = 904.85,
                                    bottom = 479.75
                                },
                                position = {
                                    x = 566.4,
                                    y = -409.2
                                },
                                offset = {
                                    x = 452.4,
                                    y = 238.95
                                }
                            }
                        }
                    },
                    {
                        startFrame = 2,
                        duration = 1,
                        isEmpty = false,
                        elements = {
                            {
                                itemName = "controllers/Arr/所有宝石条目",
                                type = "HFLUITree",
                                path = "utf_main_200759_213",
                                controller = "Arr_controller200759",
                                bounds = {
                                    left = -46.95,
                                    top = -0.55,
                                    right = 1057.75,
                                    bottom = 480.5
                                },
                                position = {
                                    x = 625,
                                    y = -409.2
                                },
                                offset = {
                                    x = 505.35,
                                    y = 239.95
                                }
                            }
                        }
                    }
                }
            }
        },
        frameCount = 3,
        layerCount = 3
    }
}
return cfg
