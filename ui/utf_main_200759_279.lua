local cfg = 
{
    type = "HFLFlashAnim",
    itemName = "铸魂游戏内关卡",
    position = {
        x = 0,
        y = 0
    },
    timeline = {
        layers = {
            {
                layerType = "normal",
                visible = true,
                frameCount = 4,
                frames = {
                    {
                        startFrame = 0,
                        duration = 4,
                        isEmpty = false,
                        elements = {
                            {
                                name = "txtBtnTitle",
                                type = "HFLLabel",
                                font_size = 30,
                                label_size = {
                                    width = 126,
                                    height = 67
                                },
                                align = HFLLabelAlignCenter,
                                color = {
                                    255,
                                    255,
                                    255
                                },
                                text = "继续铸魂",
                                itemName = "30255.255.25512667",
                                position = {
                                    x = 459.8,
                                    y = -422.2
                                }
                            },
                            {
                                name = "btnRand",
                                itemName = "movieclip/btn黄按钮_104x234",
                                frame_normal = "image_main_200759_150.png",
                                frame_down = "image_main_200759_150.png",
                                frame_disable = "AlertCancel_gray_200759.png",
                                button_scale = 1.1,
                                type = "HFLButton",
                                position = {
                                    x = 459.5,
                                    y = -431
                                },
                                scale = {
                                    x = 0.747802734375,
                                    y = 0.749969482421875
                                }
                            },
                            {
                                itemName = "image_main_200759_119.png",
                                type = "HFLSprite",
                                frame = "image_main_200759_119.png",
                                position = {
                                    x = 460,
                                    y = -337
                                }
                            }
                        }
                    }
                }
            },
            {
                layerType = "normal",
                visible = true,
                frameCount = 4,
                frames = {
                    {
                        startFrame = 0,
                        duration = 1,
                        isEmpty = false,
                        elements = {
                            {
                                name = "ctr1",
                                itemName = "controllers/铸魂游戏内条目",
                                type = "HFLUITree",
                                path = "utf_main_200759_277",
                                controller = "gameRandInItem_controller200759",
                                bounds = {
                                    left = 0,
                                    top = -89.25,
                                    right = 265,
                                    bottom = 288
                                },
                                position = {
                                    x = 243.25,
                                    y = -124.9
                                },
                                offset = {
                                    x = 132.5,
                                    y = 144
                                }
                            },
                            {
                                name = "ctr2",
                                itemName = "controllers/铸魂游戏内条目",
                                type = "HFLUITree",
                                path = "utf_main_200759_277",
                                controller = "gameRandInItem_controller200759",
                                bounds = {
                                    left = 0,
                                    top = -89.25,
                                    right = 265,
                                    bottom = 288
                                },
                                position = {
                                    x = 683.35,
                                    y = -124.9
                                },
                                offset = {
                                    x = 132.5,
                                    y = 144
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
                                name = "ctr1",
                                itemName = "controllers/铸魂游戏内条目",
                                type = "HFLUITree",
                                path = "utf_main_200759_277",
                                controller = "gameRandInItem_controller200759",
                                bounds = {
                                    left = 0,
                                    top = -89.25,
                                    right = 265,
                                    bottom = 288
                                },
                                position = {
                                    x = 459.5,
                                    y = -104
                                },
                                offset = {
                                    x = 132.5,
                                    y = 144
                                }
                            },
                            {
                                name = "ctr3",
                                itemName = "controllers/铸魂游戏内条目",
                                type = "HFLUITree",
                                path = "utf_main_200759_277",
                                controller = "gameRandInItem_controller200759",
                                bounds = {
                                    left = 0,
                                    top = -89.25,
                                    right = 265,
                                    bottom = 288
                                },
                                position = {
                                    x = 703.5,
                                    y = -420
                                },
                                offset = {
                                    x = 132.5,
                                    y = 144
                                }
                            },
                            {
                                name = "ctr2",
                                itemName = "controllers/铸魂游戏内条目",
                                type = "HFLUITree",
                                path = "utf_main_200759_277",
                                controller = "gameRandInItem_controller200759",
                                bounds = {
                                    left = 0,
                                    top = -89.25,
                                    right = 265,
                                    bottom = 288
                                },
                                position = {
                                    x = 215.5,
                                    y = -420
                                },
                                offset = {
                                    x = 132.5,
                                    y = 144
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
                                name = "ctr1",
                                itemName = "controllers/铸魂游戏内条目",
                                type = "HFLUITree",
                                path = "utf_main_200759_277",
                                controller = "gameRandInItem_controller200759",
                                bounds = {
                                    left = 0,
                                    top = -89.25,
                                    right = 265,
                                    bottom = 288
                                },
                                position = {
                                    x = 215.5,
                                    y = -147.8
                                },
                                offset = {
                                    x = 132.5,
                                    y = 144
                                }
                            },
                            {
                                name = "ctr2",
                                itemName = "controllers/铸魂游戏内条目",
                                type = "HFLUITree",
                                path = "utf_main_200759_277",
                                controller = "gameRandInItem_controller200759",
                                bounds = {
                                    left = 0,
                                    top = -89.25,
                                    right = 265,
                                    bottom = 288
                                },
                                position = {
                                    x = 703.5,
                                    y = -147.8
                                },
                                offset = {
                                    x = 132.5,
                                    y = 144
                                }
                            },
                            {
                                name = "ctr3",
                                itemName = "controllers/铸魂游戏内条目",
                                type = "HFLUITree",
                                path = "utf_main_200759_277",
                                controller = "gameRandInItem_controller200759",
                                bounds = {
                                    left = 0,
                                    top = -89.25,
                                    right = 265,
                                    bottom = 288
                                },
                                position = {
                                    x = 703.5,
                                    y = -420
                                },
                                offset = {
                                    x = 132.5,
                                    y = 144
                                }
                            },
                            {
                                name = "ctr4",
                                itemName = "controllers/铸魂游戏内条目",
                                type = "HFLUITree",
                                path = "utf_main_200759_277",
                                controller = "gameRandInItem_controller200759",
                                bounds = {
                                    left = 0,
                                    top = -89.25,
                                    right = 265,
                                    bottom = 288
                                },
                                position = {
                                    x = 215.5,
                                    y = -420
                                },
                                offset = {
                                    x = 132.5,
                                    y = 144
                                }
                            }
                        }
                    },
                    {
                        startFrame = 3,
                        duration = 1,
                        isEmpty = false,
                        elements = {
                            {
                                name = "ctr4",
                                itemName = "controllers/铸魂游戏内条目",
                                type = "HFLUITree",
                                path = "utf_main_200759_277",
                                controller = "gameRandInItem_controller200759",
                                bounds = {
                                    left = 0,
                                    top = -89.25,
                                    right = 265,
                                    bottom = 288
                                },
                                position = {
                                    x = 703.5,
                                    y = -420
                                },
                                offset = {
                                    x = 132.5,
                                    y = 144
                                }
                            },
                            {
                                name = "ctr5",
                                itemName = "controllers/铸魂游戏内条目",
                                type = "HFLUITree",
                                path = "utf_main_200759_277",
                                controller = "gameRandInItem_controller200759",
                                bounds = {
                                    left = 0,
                                    top = -89.25,
                                    right = 265,
                                    bottom = 288
                                },
                                position = {
                                    x = 215.5,
                                    y = -420
                                },
                                offset = {
                                    x = 132.5,
                                    y = 144
                                }
                            },
                            {
                                name = "ctr1",
                                itemName = "controllers/铸魂游戏内条目",
                                type = "HFLUITree",
                                path = "utf_main_200759_277",
                                controller = "gameRandInItem_controller200759",
                                bounds = {
                                    left = 0,
                                    top = -89.25,
                                    right = 265,
                                    bottom = 288
                                },
                                position = {
                                    x = 132.5,
                                    y = -186
                                },
                                offset = {
                                    x = 132.5,
                                    y = 144
                                }
                            },
                            {
                                name = "ctr2",
                                itemName = "controllers/铸魂游戏内条目",
                                type = "HFLUITree",
                                path = "utf_main_200759_277",
                                controller = "gameRandInItem_controller200759",
                                bounds = {
                                    left = 0,
                                    top = -89.25,
                                    right = 265,
                                    bottom = 288
                                },
                                position = {
                                    x = 459.5,
                                    y = -104
                                },
                                offset = {
                                    x = 132.5,
                                    y = 144
                                }
                            },
                            {
                                name = "ctr3",
                                itemName = "controllers/铸魂游戏内条目",
                                type = "HFLUITree",
                                path = "utf_main_200759_277",
                                controller = "gameRandInItem_controller200759",
                                bounds = {
                                    left = 0,
                                    top = -89.25,
                                    right = 265,
                                    bottom = 288
                                },
                                position = {
                                    x = 786.5,
                                    y = -186
                                },
                                offset = {
                                    x = 132.5,
                                    y = 144
                                }
                            }
                        }
                    }
                }
            }
        },
        frameCount = 4,
        layerCount = 2
    }
}
return cfg
