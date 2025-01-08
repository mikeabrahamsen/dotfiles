return {
    "robitx/gp.nvim",
    config = function()
        local conf = {
            -- For customization, refer to Install > Configuration in the Documentation/Readme
            -- openai_api_key = os.getenv("OPENAI_API_KEY"),
            chat_user_prefix = "󰭹:",
            chat_assistant_prefix = { "󱚥:", "[{{agent}}]" }, 
            providers = { 
                openai = { 
                    disable = false, 
                    endpoint = "https://api.openai.com/v1/chat/completions", 
                    secret = os.getenv("OPENAI_API_KEY"), 
                }, 
                anthropic = { 
                    disable = true, 
                    endpoint = "https://api.anthropic.com/v1/messages", 
                    secret = os.getenv("ANTHROPIC_API_KEY"), 
                },
            },
            -- default agent names set during startup, if nil last used agent is used 
            default_command_agent = "ChatGPT4o", 
            default_chat_agent = "ChatGPT4o-mini",
            agents = { 
                { 
                    name = "ExampleDisabledAgent", 
                    disable = true, 
                }, 
                { 
                    name = "ChatGPT4o", 
                    chat = true, 
                    command = false, 
                    -- string with model name or table with model name and parameters 
                    model = { model = "gpt-4o", temperature = 1.1, top_p = 1 }, 
                    -- system prompt (use this to specify the persona/role of the AI) 
                    system_prompt = require("gp.defaults").chat_system_prompt, 
                }, 
                { 
                    provider = "openai", 
                    name = "ChatGPT4o-mini", 
                    chat = true, 
                    command = false, 
                    -- string with model name or table with model name and parameters 
                    model = { model = "gpt-4o-mini", temperature = 1.1, top_p = 1 }, 
                    -- system prompt (use this to specify the persona/role of the AI) 
                    system_prompt = require("gp.defaults").chat_system_prompt, 
                }, 
                { 
                    provider = "anthropic", 
                    name = "ChatClaude-3-5-Sonnet", 
                    chat = true, 
                    command = false, 
                    -- string with model name or table with model name and parameters 
                    model = { model = "claude-3-5-sonnet-20240620", temperature = 0.8, top_p = 1 }, 
                    -- system prompt (use this to specify the persona/role of the AI) 
                    system_prompt = require("gp.defaults").chat_system_prompt, 
                },
            }
        }
        require("gp").setup(conf)
        local function keymapOptions(desc)
            return {
                noremap = true,
                silent = true,
                nowait = true,
                desc = "GPT prompt " .. desc,
            }
        end
        -- Agent hotkeys
        vim.keymap.set({"n", "i"}, "<leader>ax", "<cmd>GpContext<cr>", keymapOptions("Toggle Context"))


        -- Setup shortcuts here (see Usage > Shortcuts in the Documentation/Readme)
    end,
}
