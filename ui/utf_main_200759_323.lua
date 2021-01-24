local cfg = 
{
    type = "HFLFlashAnim",
    itemName = "游戏格子",
    name = "node_root",
    position = {
        x = 0,
        y = 0
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
                                name = "stateColor",
                                itemName = "movieclip/大格子",
                                type = "HFLUITree",
                                path = "utf_main_200759_326",
                                loop = "single frame",
                                firstFrame = 0,
                                animIn = true,
                                bounds = {
                                    left = 0,
                                    top = 0,
                                    right = 326,
                                    bottom = 139
                                },
                                position = {
                                    x = 163,
                                    y = -69.5
                                },
                                offset = {
                                    x = 163,
                                    y = 69.5
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
                                name = "stateColor",
                                itemName = "movieclip/中格子",
                                type = "HFLUITree",
                                path = "utf_main_200759_325",
                                loop = "single frame",
                                firstFrame = 0,
                                animIn = true,
                                bounds = {
                                    left = 31.75,
                                    top = 7,
                                    right = 296.75,
                                    bottom = 132
                                },
                                position = {
                                    x = 163,
                                    y = -69.5
                                },
                                offset = {
                                    x = 163,
                                    y = 69.5
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
                                name = "stateColor",
                                itemName = "movieclip/小格子",
                                type = "HFLUITree",
                                path = "utf_main_200759_327",
                                loop = "single frame",
                                firstFrame = 0,
                                animIn = true,
                                bounds = {
                                    left = 62.45,
                                    top = 12.65,
                                    right = 268.45,
                                    bottom = 123.65
                                },
                                position = {
                                    x = 163,
                                    y = -69.5
                                },
                                offset = {
                                    x = 163,
                                    y = 69.5
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
