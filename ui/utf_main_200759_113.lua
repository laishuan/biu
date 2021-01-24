local cfg = 
{
    type = "HFLFlashAnim",
    itemName = "btn黄按钮_104x234",
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
                                itemName = "image_main_200759_150.png",
                                type = "HFLSprite",
                                frame = "image_main_200759_150.png",
                                position = {
                                    x = 117,
                                    y = -52
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
                                itemName = "AlertCancel_gray_200759.png",
                                type = "HFLSprite",
                                frame = "AlertCancel_gray_200759.png",
                                position = {
                                    x = 117,
                                    y = -52
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
