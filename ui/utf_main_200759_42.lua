local cfg = 
{
    type = "HFLFlashAnim",
    itemName = "btn加号_89x89",
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
                                itemName = "image_main_200759_145.png",
                                type = "HFLSprite",
                                frame = "image_main_200759_145.png",
                                position = {
                                    x = 44.5,
                                    y = -44.5
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
                                itemName = "image_main_200759_244.png",
                                type = "HFLSprite",
                                frame = "image_main_200759_244.png",
                                position = {
                                    x = 44.5,
                                    y = -44.5
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
