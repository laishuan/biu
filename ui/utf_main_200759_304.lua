local cfg = 
{
    type = "HFLFlashAnim",
    itemName = "进度条多个奖励",
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
                                itemName = "进度条奖励",
                                type = "HFLUITree",
                                path = "utf_main_200759_305",
                                controller = "IconNameNum_controller200759",
                                bounds = {
                                    left = -56.7,
                                    top = -42.9,
                                    right = 56.75,
                                    bottom = 42.9
                                },
                                position = {
                                    x = 83.75,
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
                                itemName = "进度条奖励",
                                type = "HFLUITree",
                                path = "utf_main_200759_305",
                                controller = "IconNameNum_controller200759",
                                bounds = {
                                    left = -56.7,
                                    top = -42.9,
                                    right = 56.75,
                                    bottom = 42.9
                                },
                                position = {
                                    x = 0,
                                    y = 0
                                },
                                offset = {
                                    x = 0,
                                    y = 0
                                }
                            },
                            {
                                name = "item2",
                                itemName = "进度条奖励",
                                type = "HFLUITree",
                                path = "utf_main_200759_305",
                                controller = "IconNameNum_controller200759",
                                bounds = {
                                    left = -56.7,
                                    top = -42.9,
                                    right = 56.75,
                                    bottom = 42.9
                                },
                                position = {
                                    x = 149.2,
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
