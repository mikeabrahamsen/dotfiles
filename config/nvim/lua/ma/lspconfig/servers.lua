return {
    pylsp = {
        settings = {
            pylsp = {
                plugins = {
                    pycodestyle = {
                        enabled = false,
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
