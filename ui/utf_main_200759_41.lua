local cfg = 
{
    type = "HFLFlashAnim",
    itemName = "btn减号_74x74",
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
                                itemName = "image_main_200759_144.png",
                                type = "HFLSprite",
                                frame = "image_main_200759_144.png",
                                position = {
                                    x = 37,
                                    y = -37
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
                                itemName = "image_main_200759_243.png",
                                type = "HFLSprite",
                                frame = "image_main_200759_243.png",
                                position = {
                                    x = 37,
                                    y = -37
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
