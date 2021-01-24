local cfg = 
{
    type = "HFLNode",
    position = {
        x = 0,
        y = 0
    },
    {
        itemName = "controllers/活动时间部分",
        type = "HFLUITree",
        path = "utf_main_200759_206",
        controller = "ActivityTime_controller200759",
        bounds = {
            left = -210.9,
            top = -0.55,
            right = 791.1,
            bottom = 64.45
        },
        position = {
            x = 617.2,
            y = -190.85
        },
        offset = {
            x = 290.1,
            y = 31.9
        }
    },
    {
        itemName = "200759_title_cn.png",
        type = "HFLSprite",
        frame = "200759_title_cn.png",
        is_multi_language = true,
        position = {
            x = 629,
            y = -78.5
        }
    },
    {
        itemName = "image_main_200759_133.png",
        type = "HFLSprite",
        frame = "image_main_200759_133.png",
        position = {
            x = 616.5,
            y = -189.5
        }
    },
    {
        name = "btnClose",
        itemName = "buttons/btn关闭x_89x89",
        frame_normal = "image_main_200759_143.png",
        frame_down = "image_main_200759_143.png",
        frame_disable = "image_main_200759_143.png",
        button_scale = 1.1,
        type = "HFLButton",
        position = {
            x = 1187.5,
            y = -45.5
        }
    },
    {
        name = "btnHelp",
        itemName = "buttons/btn问号_90x90",
        frame_normal = "image_main_200759_149.png",
        frame_down = "image_main_200759_149.png",
        frame_disable = "image_main_200759_149.png",
        button_scale = 1.1,
        type = "HFLButton",
        position = {
            x = 45,
            y = -45
        }
    }
}
return cfg
