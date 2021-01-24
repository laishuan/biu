local cfg = 
{
    type = "HFLFlashAnim",
    itemName = "单个方块条目",
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
                        duration = 2,
                        isEmpty = true
                    },
                    {
                        startFrame = 2,
                        duration = 1,
                        isEmpty = false,
                        elements = {
                            {
                                name = "ctrAwards",
                                itemName = "controllers/开格子多个奖励 复制 2",
                                type = "HFLUITree",
                                path = "utf_main_200759_425",
                                controller = "dynamicAwards_controller200759",
                                animIn = true,
                                bounds = {
                                    left = -44.05,
                                    top = -29.9,
                                    right = 106.6,
                                    bottom = 131.75
                                },
                                position = {
                                    x = 84,
                                    y = -55.5
                                },
                                offset = {
                                    x = 0,
                                    y = 0
                                }
                            },
                            {
                                name = "spX",
                                itemName = "image_main_200759_197.png",
                                type = "HFLSprite",
                                frame = "image_main_200759_197.png",
                                position = {
                                    x = 87,
                                    y = -81.5
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
                                name = "state",
                                itemName = "movieclip/方块背景",
                                type = "HFLUITree",
                                path = "utf_main_200759_318",
                                animIn = true,
                                bounds = {
                                    left = 0,
                                    top = 0,
                                    right = 177,
                                    bottom = 115
                                },
                                position = {
                                    x = 88.5,
                                    y = -81.5
                                },
                                offset = {
                                    x = 88.5,
                                    y = 57.5
                                }
                            }
                        }
                    }
                }
            }
        },
        frameCount = 3,
        layerCount = 2
    }
}
return cfg
