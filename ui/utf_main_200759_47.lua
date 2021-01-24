local cfg = 
{
    type = "HFLFlashAnim",
    itemName = "btn黄按钮长_65x205",
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
                                itemName = "image_main_200759_151.png",
                                type = "HFLSprite",
                                frame = "image_main_200759_151.png",
                                position = {
                                    x = 102.5,
                                    y = -32.5
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
                                itemName = "image_main_200759_248.png",
                                type = "HFLSprite",
                                frame = "image_main_200759_248.png",
                                position = {
                                    x = 102.5,
                                    y = -32.5
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
