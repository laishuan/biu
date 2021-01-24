local cfg = 
{
    type = "HFLFlashAnim",
    itemName = "小格子",
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
                                itemName = "image_main_200759_130.png",
                                type = "HFLSprite",
                                frame = "image_main_200759_130.png",
                                position = {
                                    x = 163,
                                    y = -42.7
                                },
                                anchor = {
                                    x = 0.4881067961165048,
                                    y = 0.7292792792792793
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
                                itemName = "image_main_200759_137.png",
                                type = "HFLSprite",
                                frame = "image_main_200759_137.png",
                                position = {
                                    x = 163,
                                    y = -42.7
                                },
                                anchor = {
                                    x = 0.4881067961165048,
                                    y = 0.7292792792792793
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
