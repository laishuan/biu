local cfg = 
{
    type = "HFLFlashAnim",
    itemName = "中格子",
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
                                itemName = "image_main_200759_131.png",
                                type = "HFLSprite",
                                frame = "image_main_200759_131.png",
                                position = {
                                    x = 162.8,
                                    y = -43.35
                                },
                                anchor = {
                                    x = 0.4945283018867925,
                                    y = 0.7092
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
                                itemName = "image_main_200759_138.png",
                                type = "HFLSprite",
                                frame = "image_main_200759_138.png",
                                position = {
                                    x = 162.8,
                                    y = -43.35
                                },
                                anchor = {
                                    x = 0.4945283018867925,
                                    y = 0.7092
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
