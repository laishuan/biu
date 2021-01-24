local cfg = 
{
    type = "HFLFlashAnim",
    itemName = "关卡多个奖励",
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
                                name = "item1",
                                itemName = "controllers/Items/关卡奖励条目",
                                type = "HFLUITree",
                                path = "utf_main_200759_257",
                                controller = "IconNameNum_controller200759",
                                bounds = {
                                    left = -83.15,
                                    top = -67.9,
                                    right = 100.85,
                                    bottom = 118.6
                                },
                                position = {
                                    x = 0,
                                    y = 0
                                },
                                offset = {
                                    x = 0,
                                    y = 0
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
                                name = "item1",
                                itemName = "controllers/Items/关卡奖励条目",
                                type = "HFLUITree",
                                path = "utf_main_200759_257",
                                controller = "IconNameNum_controller200759",
                                bounds = {
                                    left = -83.15,
                                    top = -67.9,
                                    right = 100.85,
                                    bottom = 118.6
                                },
                                position = {
                                    x = -63.7,
                                    y = 0
                                },
                                offset = {
                                    x = 0,
                                    y = 0
                                }
                            },
                            {
                                name = "item2",
                                itemName = "controllers/Items/关卡奖励条目",
                                type = "HFLUITree",
                                path = "utf_main_200759_257",
                                controller = "IconNameNum_controller200759",
                                bounds = {
                                    left = -83.15,
                                    top = -67.9,
                                    right = 100.85,
                                    bottom = 118.6
                                },
                                position = {
                                    x = 42.45,
                                    y = 0
                                },
                                offset = {
                                    x = 0,
                                    y = 0
                                }
                            }
                        }
                    },
                    {
                        startFrame = 2,
                        duration = 1,
                        isEmpty = true
                    }
                }
            }
        },
        frameCount = 3,
        layerCount = 1
    }
}
return cfg
