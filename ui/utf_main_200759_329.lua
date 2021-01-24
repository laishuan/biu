local cfg = 
{
    type = "HFLFlashAnim",
    itemName = "进度动画",
    position = {
        x = 0,
        y = 0
    },
    timeline = {
        layers = {
            {
                layerType = "normal",
                visible = true,
                frameCount = 100,
                frames = {
                    {
                        startFrame = 0,
                        duration = 100,
                        isEmpty = false,
                        elements = {
                            {
                                name = "node4",
                                itemName = "_UEPT/Bitmap 1",
                                type = "HFLNode",
                                bounds = {
                                    left = -13,
                                    top = -13,
                                    right = 13,
                                    bottom = 13
                                },
                                position = {
                                    x = 157.05,
                                    y = 0.95
                                },
                                scale = {
                                    x = 0.4653778076171875,
                                    y = 0.4653778076171875
                                }
                            },
                            {
                                name = "node3",
                                itemName = "_UEPT/Bitmap 1",
                                type = "HFLNode",
                                bounds = {
                                    left = -13,
                                    top = -13,
                                    right = 13,
                                    bottom = 13
                                },
                                position = {
                                    x = 125.05,
                                    y = 0.95
                                },
                                scale = {
                                    x = 0.4653778076171875,
                                    y = 0.4653778076171875
                                }
                            },
                            {
                                name = "node2",
                                itemName = "_UEPT/Bitmap 1",
                                type = "HFLNode",
                                bounds = {
                                    left = -13,
                                    top = -13,
                                    right = 13,
                                    bottom = 13
                                },
                                position = {
                                    x = 78.05,
                                    y = 0.95
                                },
                                scale = {
                                    x = 0.4653778076171875,
                                    y = 0.4653778076171875
                                }
                            },
                            {
                                name = "node1",
                                itemName = "_UEPT/Bitmap 1",
                                type = "HFLNode",
                                bounds = {
                                    left = -13,
                                    top = -13,
                                    right = 13,
                                    bottom = 13
                                },
                                position = {
                                    x = 47.05,
                                    y = 0.95
                                },
                                scale = {
                                    x = 0.4653778076171875,
                                    y = 0.4653778076171875
                                }
                            }
                        }
                    }
                }
            },
            {
                layerType = "normal",
                visible = true,
                frameCount = 100,
                frames = {
                    {
                        startFrame = 0,
                        duration = 100,
                        isEmpty = false,
                        elements = {
                            {
                                itemName = "image_main_200759_121.png",
                                type = "HFLSprite",
                                frame = "image_main_200759_121.png",
                                position = {
                                    x = 101.5,
                                    y = -17
                                }
                            }
                        }
                    }
                }
            },
            {
                layerType = "normal",
                visible = true,
                frameCount = 100,
                frames = {
                    {
                        startFrame = 0,
                        duration = 99,
                        tweenType = "motion",
                        bzpGroupArr = {
                            {
                                {
                                    x = 0,
                                    y = 0
                                },
                                {
                                    x = 1.05262024937035,
                                    y = 0
                                },
                                {
                                    x = 0.7665407298109681,
                                    y = 0.636971723173918
                                },
                                {
                                    x = 1,
                                    y = 1
                                }
                            }
                        },
                        isEmpty = false,
                        elements = {
                            {
                                name = "spArrow",
                                itemName = "image_main_200759_156.png",
                                type = "HFLSprite",
                                frame = "image_main_200759_156.png",
                                position = {
                                    x = 7.45,
                                    y = -55.5
                                }
                            }
                        }
                    },
                    {
                        startFrame = 99,
                        duration = 1,
                        tweenType = "motion",
                        isEmpty = false,
                        elements = {
                            {
                                itemName = "image_main_200759_156.png",
                                type = "HFLSprite",
                                frame = "image_main_200759_156.png",
                                position = {
                                    x = 194.95,
                                    y = -55.5
                                }
                            }
                        }
                    }
                }
            }
        },
        frameCount = 100,
        layerCount = 3
    }
}
return cfg
