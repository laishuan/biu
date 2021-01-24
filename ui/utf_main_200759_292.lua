local cfg = 
{
    type = "HFLFlashAnim",
    itemName = "道具礼盒 复制 2",
    position = {
        x = 0,
        y = 0
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
                        duration = 1,
                        isEmpty = false,
                        elements = {
                            {
                                itemName = "image_main_200759_157.png",
                                type = "HFLSprite",
                                frame = "image_main_200759_157.png",
                                position = {
                                    x = 0,
                                    y = 0
                                },
                                scale = {
                                    x = 0.721466064453125,
                                    y = 0.7160186767578125
                                },
                                anchor = {
                                    x = 0,
                                    y = 1
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
                                itemName = "Alert_icon_right_200759.png",
                                type = "HFLSprite",
                                frame = "Alert_icon_right_200759.png",
                                position = {
                                    x = 44.4,
                                    y = -42
                                },
                                scale = {
                                    x = 0.5561065673828125,
                                    y = 0.5561065673828125
                                }
                            },
                            {
                                itemName = "image_main_200759_157.png",
                                type = "HFLSprite",
                                frame = "image_main_200759_157.png",
                                position = {
                                    x = 0,
                                    y = 0
                                },
                                scale = {
                                    x = 0.721466064453125,
                                    y = 0.7160186767578125
                                },
                                anchor = {
                                    x = 0,
                                    y = 1
                                }
                            }
                        }
                    }
                }
            }
        },
        frameCount = 2,
        layerCount = 1
    }
}
return cfg
