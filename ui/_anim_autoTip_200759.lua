local cfg = 
{
    type = "HFLFlashAnim",
    itemName = "_anim_autoTip_200759",
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
                        name = "fixnode",
                        startFrame = 0,
                        duration = 2,
                        labelType = "name",
                        isEmpty = false,
                        elements = {
                            {
                                name = "uit",
                                itemName = "movieclip/提示部分 复制 7",
                                type = "HFLUITree",
                                path = "utf_main_200759_237",
                                bounds = {
                                    left = -16.2,
                                    top = -28.4,
                                    right = 236.8,
                                    bottom = 168.6
                                },
                                position = {
                                    x = 62.2,
                                    y = -152.25
                                },
                                offset = {
                                    x = 70.7,
                                    y = 164.85
                                }
                            },
                            {
                                name = "node",
                                type = "HFLNode",
                                itemName = "_EPT/icon/200747_icon_33001.png",
                                bounds = {
                                    left = -44.5,
                                    top = -32,
                                    right = 44.5,
                                    bottom = 32
                                },
                                position = {
                                    x = 63.5,
                                    y = -153
                                }
                            },
                            {
                                name = "btn",
                                itemName = "movieclip/小关闭_71x72",
                                frame_normal = "image_main_200759_239.png",
                                frame_down = "image_main_200759_239.png",
                                frame_disable = "image_main_200759_239.png",
                                button_scale = 1.1,
                                type = "HFLButton",
                                position = {
                                    x = 64.2,
                                    y = -151.5
                                },
                                scale = {
                                    x = 1.763885498046875,
                                    y = 1.55352783203125
                                },
                                opacity = 0
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
