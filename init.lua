local token = require "token"

-- Cmd-Alt-G - type Github token  
hs.hotkey.bind({"cmd", "alt"}, "G", function()
    token_keystroke("github-token")
end)
