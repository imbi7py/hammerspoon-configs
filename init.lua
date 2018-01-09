local token = require "token"
local hyper = {"shift", "cmd", "alt", "ctrl"}

-- Hyper-V paste block:
hs.hotkey.bind(hyper, "V", function()
    hs.eventtap.keyStrokes(hs.pasteboard.getContents())
end)

-- Hyper-G - type Github token
hs.hotkey.bind(hyper, "G", function()
    token_keystroke("amazon-token")
end)

-- Cmd-E - window hints
hs.hotkey.bind(hyper, "e", function()
    hs.hints.windowHints()
end)

function reload_config(files)
    hs.reload()
end
hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reload_config):start()

-----------------------------------------------
-- Hyper hjkl to switch window focus
-----------------------------------------------

hs.hotkey.bind(hyper, 'k', function()
    hs.window.focusedWindow():focusWindowNorth()
end)

hs.hotkey.bind(hyper, 'j', function()
    hs.window.focusedWindow():focusWindowSouth()
end)

hs.hotkey.bind(hyper, 'l', function()
    hs.window.focusedWindow():focusWindowEast()
end)

hs.hotkey.bind(hyper, 'h', function()
    hs.window.focusedWindow():focusWindowWest()
end)

hs.network.reachability.internet():setCallback(function(self, flags)
    if (flags & hs.network.reachability.flags.reachable) > 0 then
        hs.alert("Internet Connected")
    else
        hs.alert("Internet Disconnected")
    end
end):start()
