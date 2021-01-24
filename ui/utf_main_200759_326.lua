local cfg = 
{
    type = "HFLFlashAnim",
    itemName = "大格子",
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
                                itemName = "image_main_200759_132.png",
                                type = "HFLSprite",
                                frame = "image_main_200759_132.png",
                                position = {
                                    x = 163.35,
                                    y = -42.8
                                },
                                anchor = {
                                    x = 0.5010736196319018,
                                    y = 0.6920863309352518
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
                                itemName = "image_main_200759_139.png",
                                type = "HFLSprite",
                                frame = "image_main_200759_139.png",
                                position = {
                                    x = 163.35,
                                    y = -42.8
                                },
                                anchor = {
                                    x = 0.5026153846153846,
                                    y = 0.6920863309352518
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
