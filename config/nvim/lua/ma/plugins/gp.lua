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
                    disable = false, 
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
                {
                name = "ChatGPT4 - Custom Agent Prompt",
                chat = true,
                command = false,
                -- string with model name or table with model name and parameters
                model = { model = "gpt-4-1106-preview", temperature = 1.1, top_p = 1 },
                -- system prompt (use this to specify the persona/role of the AI)
                system_prompt = "You are a general AI assistant.\n\n"
                    .. "The user provided the additional info about how they would like you to respond:\n\n"
                    .. "- If you're unsure don't guess and say you don't know instead.\n"
                    .. "- Ask question if you need clarification to provide better answer.\n"
                    .. "- Think deeply and carefully from first principles step by step.\n"
                    .. "- Zoom out first to see the big picture and then zoom in to details.\n"
                    .. "- Use Socratic method to improve your thinking and coding skills.\n"
                    .. "- Don't elide any code from your output if the answer requires coding.\n"
                    .. "- Take a deep breath; You've got this!\n",
                },
                {
                name = "CodeGPT4 - Custom Agent Prompt",
                chat = false,
                command = true,
                -- string with model name or table with model name and parameters
                model = { model = "gpt-4-1106-preview", temperature = 0.8, top_p = 1 },
                -- system prompt (use this to specify the persona/role of the AI)
                system_prompt = "You are an AI working as a code editor.\n\n"
                    .. "Please AVOID COMMENTARY OUTSIDE OF THE SNIPPET RESPONSE.\n"
                    .. "START AND END YOUR ANSWER WITH:\n\n```",
                },
                {
                name = "Claude3Haiku - Custom Agent Prompt",
                chat = true,
                command = true,
                provider = "anthropic",
                model = { model = "claude-3-haiku-20240307" },
                system_prompt = "You are a general AI assistant.\n\n"
                    .. "The user provided the additional info about how they would like you to respond:\n\n"
                    .. "- If you're unsure don't guess and say you don't know instead.\n"
                    .. "- Ask question if you need clarification to provide better answer.\n"
                    .. "- Think deeply and carefully from first principles step by step.\n"
                    .. "- Zoom out first to see the big picture and then zoom in to details.\n"
                    .. "- Use Socratic method to improve your thinking and coding skills.\n"
                    .. "- Don't elide any code from your output if the answer requires coding.\n"
                    .. "- Take a deep breath; You've got this!\n",
                },
                {
                name = "claude-3-5-sonnet - Custom Agent Prompt",
                chat = true,
                command = true,
                provider = "anthropic",
                model = { model = "claude-3-5-sonnet-20241022" },
                system_prompt = "You are a general AI assistant.\n\n"
                    .. "The user provided the additional info about how they would like you to respond:\n\n"
                    .. "- If you're unsure don't guess and say you don't know instead.\n"
                    .. "- Ask question if you need clarification to provide better answer.\n"
                    .. "- Think deeply and carefully from first principles step by step.\n"
                    .. "- Zoom out first to see the big picture and then zoom in to details.\n"
                    .. "- Use Socratic method to improve your thinking and coding skills.\n"
                    .. "- Don't elide any code from your output if the answer requires coding.\n"
                    .. "- Take a deep breath; You've got this!\n",
                },
            }
        }
        require("gp").setup(conf)
        -- local function keymapOptions(desc)
        --     return {
        --         noremap = true,
        --         silent = true,
        --         nowait = true,
        --         desc = "GPT prompt " .. desc,
        --     }
        -- end
        -- Agent hotkeys
        -- vim.keymap.set({"n", "i"}, "<leader>ax", "<cmd>GpContext<cr>", keymapOptions("Toggle Context"))


        -- Setup shortcuts here (see Usage > Shortcuts in the Documentation/Readme)
        require("which-key").add({
        -- VISUAL mode mappings
        -- s, x, v modes are handled the same way by which_key
        {
            mode = { "v" },
            nowait = true,
            remap = false,
            { "<C-g><C-v>", ":<C-u>'<,'>GpChatNew vsplit<cr>", desc = "ChatNew vsplit", icon = "󰗋" },
            { "<C-g><C-x>", ":<C-u>'<,'>GpChatNew split<cr>", desc = "ChatNew split", icon = "󰗋" },
            { "<C-g>a", ":<C-u>'<,'>GpAppend<cr>", desc = "Visual Append (after)", icon = "󰗋" },
            { "<C-g>b", ":<C-u>'<,'>GpPrepend<cr>", desc = "Visual Prepend (before)", icon = "󰗋" },
            { "<C-g>c", ":<C-u>'<,'>GpChatNew<cr>", desc = "Visual Chat New", icon = "󰗋" },
            { "<C-g>g", group = "generate into new ..", icon = "󰗋" },
            { "<C-g>ge", ":<C-u>'<,'>GpEnew<cr>", desc = "Visual GpEnew", icon = "󰗋" },
            { "<C-g>gn", ":<C-u>'<,'>GpNew<cr>", desc = "Visual GpNew", icon = "󰗋" },
            { "<C-g>gp", ":<C-u>'<,'>GpPopup<cr>", desc = "Visual Popup", icon = "󰗋" },
            { "<C-g>gv", ":<C-u>'<,'>GpVnew<cr>", desc = "Visual GpVnew", icon = "󰗋" },
            { "<C-g>i", ":<C-u>'<,'>GpImplement<cr>", desc = "Implement selection", icon = "󰗋" },
            { "<C-g>n", "<cmd>GpNextAgent<cr>", desc = "Next Agent", icon = "󰗋" },
            { "<C-g>p", ":<C-u>'<,'>GpChatPaste<cr>", desc = "Visual Chat Paste", icon = "󰗋" },
            { "<C-g>r", ":<C-u>'<,'>GpRewrite<cr>", desc = "Visual Rewrite", icon = "󰗋" },
            { "<C-g>s", "<cmd>GpStop<cr>", desc = "GpStop", icon = "󰗋" },
            { "<C-g>t", ":<C-u>'<,'>GpChatToggle<cr>", desc = "Visual Toggle Chat", icon = "󰗋" },
            { "<C-g>x", ":<C-u>'<,'>GpContext<cr>", desc = "Visual GpContext", icon = "󰗋" },
        },

        -- NORMAL mode mappings
        {
            mode = { "n" },
            nowait = true,
            remap = false,
            { "<C-g><C-v>", "<cmd>GpChatNew vsplit<cr>", desc = "New Chat vsplit" },
            { "<C-g><C-x>", "<cmd>GpChatNew split<cr>", desc = "New Chat split" },
            { "<C-g>a", "<cmd>GpAppend<cr>", desc = "Append (after)" },
            { "<C-g>b", "<cmd>GpPrepend<cr>", desc = "Prepend (before)" },
            { "<C-g>c", "<cmd>GpChatNew<cr>", desc = "New Chat" },
            { "<C-g>f", "<cmd>GpChatFinder<cr>", desc = "Chat Finder" },
            { "<C-g>g", group = "generate into new .." },
            { "<C-g>ge", "<cmd>GpEnew<cr>", desc = "GpEnew" },
            { "<C-g>gn", "<cmd>GpNew<cr>", desc = "GpNew" },
            { "<C-g>gp", "<cmd>GpPopup<cr>", desc = "Popup" },
            { "<C-g>gv", "<cmd>GpVnew<cr>", desc = "GpVnew" },
            { "<C-g>n", "<cmd>GpNextAgent<cr>", desc = "Next Agent" },
            { "<C-g>r", "<cmd>GpRewrite<cr>", desc = "Inline Rewrite" },
            { "<C-g>s", "<cmd>GpStop<cr>", desc = "GpStop" },
            { "<C-g>t", "<cmd>GpChatToggle<cr>", desc = "Toggle Chat" },
            { "<C-g>x", "<cmd>GpContext<cr>", desc = "Toggle GpContext" },
        },

        -- INSERT mode mappings
        {
            mode = { "i" },
            nowait = true,
            remap = false,
            { "<C-g><C-v>", "<cmd>GpChatNew vsplit<cr>", desc = "New Chat vsplit" },
            { "<C-g><C-x>", "<cmd>GpChatNew split<cr>", desc = "New Chat split" },
            { "<C-g>a", "<cmd>GpAppend<cr>", desc = "Append (after)" },
            { "<C-g>b", "<cmd>GpPrepend<cr>", desc = "Prepend (before)" },
            { "<C-g>c", "<cmd>GpChatNew<cr>", desc = "New Chat" },
            { "<C-g>f", "<cmd>GpChatFinder<cr>", desc = "Chat Finder" },
            { "<C-g>g", group = "generate into new .." },
            { "<C-g>ge", "<cmd>GpEnew<cr>", desc = "GpEnew" },
            { "<C-g>gn", "<cmd>GpNew<cr>", desc = "GpNew" },
            { "<C-g>gp", "<cmd>GpPopup<cr>", desc = "Popup" },
            { "<C-g>gv", "<cmd>GpVnew<cr>", desc = "GpVnew" },
            { "<C-g>n", "<cmd>GpNextAgent<cr>", desc = "Next Agent" },
            { "<C-g>r", "<cmd>GpRewrite<cr>", desc = "Inline Rewrite" },
            { "<C-g>s", "<cmd>GpStop<cr>", desc = "GpStop" },
            { "<C-g>t", "<cmd>GpChatToggle<cr>", desc = "Toggle Chat" },
            { "<C-g>x", "<cmd>GpContext<cr>", desc = "Toggle GpContext" },
        },
    })
    end,
}
