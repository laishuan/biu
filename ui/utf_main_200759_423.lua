local cfg = 
{
    type = "HFLFlashAnim",
    itemName = "开格子多个奖励 复制",
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
                                itemName = "controllers/Items/开宝箱鱼随机展示条目",
                                type = "HFLUITree",
                                path = "utf_main_200759_315",
                                controller = "IconNameNum_controller200759",
                                bounds = {
                                    left = 0,
                                    top = 0,
                                    right = 184,
                                    bottom = 197.45
                                },
                                position = {
                                    x = 5,
                                    y = -15.5
                                },
                                offset = {
                                    x = 60,
                                    y = 55.5
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
                                itemName = "controllers/Items/开宝箱鱼随机展示条目",
                                type = "HFLUITree",
                                path = "utf_main_200759_315",
                                controller = "IconNameNum_controller200759",
                                bounds = {
                                    left = 0,
                                    top = 0,
                                    right = 184,
                                    bottom = 197.45
                                },
                                position = {
                                    x = -35.65,
                                    y = -15.5
                                },
                                scale = {
                                    x = 0.6392059326171875,
                                    y = 0.6392059326171875
                                },
                                offset = {
                                    x = 59.9,
                                    y = 55.45
                                }
                            },
                            {
                                name = "item2",
                                itemName = "controllers/Items/开宝箱鱼随机展示条目",
                                type = "HFLUITree",
                                path = "utf_main_200759_315",
                                controller = "IconNameNum_controller200759",
                                bounds = {
                                    left = 0,
                                    top = 0,
                                    right = 184,
                                    bottom = 197.45
                                },
                                position = {
                                    x = 47.45,
                                    y = -15.5
                                },
                                scale = {
                                    x = 0.6392059326171875,
                                    y = 0.6392059326171875
                                },
                                offset = {
                                    x = 60.1,
                                    y = 55.45
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
