return {
    pylsp = {
        settings = {
            pylsp = {
                plugins = {
                    pycodestyle = {
                        enabled = true,
                        ignore = { 'W391', 'E501' },
                        -- maxLineLength = 100
                    },
                    black = {
                        enabled = true
                    },
                }
            }
        }
    },
}
