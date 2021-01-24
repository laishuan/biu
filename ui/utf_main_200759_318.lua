local cfg = 
{
    type = "HFLFlashAnim",
    itemName = "方块背景",
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
                                name = "btnOpen",
                                itemName = "movieclip/白方块_115x177",
                                frame_normal = "image_main_200759_196.png",
                                frame_down = "image_main_200759_196.png",
                                frame_disable = "image_main_200759_196.png",
                                button_scale = 1.1,
                                type = "HFLButton",
                                position = {
                                    x = 88.5,
                                    y = -57.5
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
                                name = "btnOpen",
                                itemName = "movieclip/黑方块_114x176",
                                frame_normal = "image_main_200759_205.png",
                                frame_down = "image_main_200759_205.png",
                                frame_disable = "image_main_200759_205.png",
                                button_scale = 1.1,
                                type = "HFLButton",
                                position = {
                                    x = 88,
                                    y = -57
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
