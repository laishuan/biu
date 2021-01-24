local cfg = 
{
    type = "HFLFlashAnim",
    itemName = "GainHeart",
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
                        duration = 1,
                        isEmpty = false,
                        elements = {
                            {
                                name = "uitHide",
                                itemName = "元件 1",
                                type = "HFLUITree",
                                path = "utf_main_200759_400",
                                bounds = {
                                    left = 0,
                                    top = 0,
                                    right = 280,
                                    bottom = 192
                                },
                                position = {
                                    x = 650,
                                    y = -361
                                },
                                offset = {
                                    x = 140,
                                    y = 96
                                }
                            },
                            {
                                name = "ctrAllSmall",
                                itemName = "所有小桃心",
                                type = "HFLUITree",
                                path = "utf_main_200759_399",
                                controller = "Arr_controller200759",
                                bounds = {
                                    left = -99.7,
                                    top = -109.65,
                                    right = 1033.85,
                                    bottom = 491
                                },
                                position = {
                                    x = 646.9,
                                    y = -398.4
                                },
                                offset = {
                                    x = 462,
                                    y = 228.5
                                }
                            },
                            {
                                type = "HFLLabel",
                                font_size = 30,
                                label_size = {
                                    width = 804,
                                    height = 41
                                },
                                align = HFLLabelAlignCenter,
                                color = {
                                    255,
                                    255,
                                    255
                                },
                                text = "点击获取本场能量！",
                                text_source = {
                                    set = "activity_chess",
                                    key = "chess_07"
                                },
                                itemName = "30255.255.25580441activity_chesschess_07",
                                position = {
                                    x = 640.3,
                                    y = -96.2
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
                                name = "txtTitle",
                                type = "HFLLabel",
                                font_size = 30,
                                label_size = {
                                    width = 804,
                                    height = 69
                                },
                                align = HFLLabelAlignCenter,
                                color = {
                                    255,
                                    255,
                                    255
                                },
                                text = "是否花费%s开心宝膨胀？",
                                text_source = {
                                    set = "activity_chess",
                                    key = "chess_08"
                                },
                                itemName = "30255.255.25580469activity_chesschess_08",
                                position = {
                                    x = 667,
                                    y = -96.2
                                }
                            },
                            {
                                itemName = "image_main_200759_155.png",
                                type = "HFLSprite",
                                frame = "image_main_200759_155.png",
                                position = {
                                    x = 833,
                                    y = -596.5
                                }
                            },
                            {
                                name = "txtCost",
                                type = "HFLLabel",
                                font_size = 30,
                                label_size = {
                                    width = 67,
                                    height = 39
                                },
                                align = HFLLabelAlignLeft,
                                color = {
                                    255,
                                    255,
                                    255
                                },
                                text = "X3",
                                itemName = "30255.255.2556739",
                                position = {
                                    x = 937.15,
                                    y = -596.25
                                }
                            },
                            {
                                itemName = "image_main_200759_164.png",
                                type = "HFLSprite",
                                frame = "image_main_200759_164.png",
                                position = {
                                    x = 603,
                                    y = -359
                                },
                                scale = {
                                    x = 0.3580322265625,
                                    y = 0.3597564697265625
                                }
                            },
                            {
                                name = "btnBuy",
                                itemName = "movieclip/btn黄按钮_104x234",
                                frame_normal = "image_main_200759_150.png",
                                frame_down = "image_main_200759_150.png",
                                frame_disable = "image_main_200759_150.png",
                                button_scale = 1.1,
                                type = "HFLButton",
                                position = {
                                    x = 881,
                                    y = -605
                                }
                            },
                            {
                                name = "txtHeartCount",
                                type = "HFLLabel",
                                font_size = 30,
                                label_size = {
                                    width = 72,
                                    height = 39
                                },
                                align = HFLLabelAlignCenter,
                                color = {
                                    255,
                                    255,
                                    255
                                },
                                text = "X999",
                                itemName = "30255.255.2557239",
                                position = {
                                    x = 717.2,
                                    y = -359.75
                                }
                            },
                            {
                                type = "HFLLabel",
                                font_size = 30,
                                label_size = {
                                    width = 122,
                                    height = 67
                                },
                                align = HFLLabelAlignCenter,
                                color = {
                                    255,
                                    255,
                                    255
                                },
                                text = "不膨胀",
                                text_source = {
                                    set = "activity_chess",
                                    key = "chess_09"
                                },
                                itemName = "30255.255.25512267activity_chesschess_09",
                                position = {
                                    x = 436.75,
                                    y = -596.25
                                }
                            },
                            {
                                name = "btnCancel",
                                itemName = "movieclip/btn黄按钮_104x234",
                                frame_normal = "image_main_200759_150.png",
                                frame_down = "image_main_200759_150.png",
                                frame_disable = "image_main_200759_150.png",
                                button_scale = 1.1,
                                type = "HFLButton",
                                position = {
                                    x = 436,
                                    y = -605
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
                                type = "HFLLabel",
                                font_size = 30,
                                label_size = {
                                    width = 274.2,
                                    height = 37.25
                                },
                                align = HFLLabelAlignCenter,
                                color = {
                                    255,
                                    255,
                                    255
                                },
                                text = "点击获取本场能量！",
                                itemName = "30255.255.255274.237.25",
                                position = {
                                    x = 640.3,
                                    y = -96.15
                                }
                            }
                        }
                    }
                }
            }
        },
        frameCount = 3,
        layerCount = 1
    }
}
return cfg
