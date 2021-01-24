local cfg = 
{
    type = "HFLNode",
    name = "node_root",
    position = {
        x = 0,
        y = 0
    },
    {
        name = "item1",
        itemName = "copy/controllers/进度条/进度条部分条目",
        type = "HFLUITree",
        path = "utf_main_200759_290",
        controller = "ProgressItem_controller200759",
        bounds = {
            left = 56.5,
            top = 10,
            right = 403.8,
            bottom = 219.65
        },
        position = {
            x = 23.7,
            y = -397.35
        },
        offset = {
            x = 109.7,
            y = 197.95
        }
    },
    {
        name = "item2",
        itemName = "copy/controllers/进度条/进度条部分条目",
        type = "HFLUITree",
        path = "utf_main_200759_290",
        controller = "ProgressItem_controller200759",
        bounds = {
            left = 56.5,
            top = 10,
            right = 403.8,
            bottom = 219.65
        },
        position = {
            x = 21.2,
            y = -258.4
        },
        offset = {
            x = 107.2,
            y = 199.7
        }
    },
    {
        name = "item3",
        itemName = "copy/controllers/进度条/进度条部分条目 复制",
        type = "HFLUITree",
        path = "utf_main_200759_306",
        controller = "ProgressItem_controller200759",
        bounds = {
            left = 64,
            top = 10,
            right = 403.8,
            bottom = 236.35
        },
        position = {
            x = 57.75,
            y = -83.05
        },
        offset = {
            x = 107.25,
            y = 206.9
        }
    },
    {
        itemName = "image_main_200759_194.png",
        type = "HFLSprite",
        frame = "image_main_200759_194.png",
        position = {
            x = 67.65,
            y = -273.5
        }
    },
    {
        name = "spProgress",
        itemName = "image_main_200759_193.png",
        type = "HFLSprite",
        frame = "image_main_200759_193.png",
        position = {
            x = 67.15,
            y = -502
        },
        anchor = {
            x = 0.5,
            y = 0
        }
    }
}
return cfg
