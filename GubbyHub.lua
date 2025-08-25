function notify(title, text, duration)
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = title,
        Text = text,
        Duration = duration or 5
    })
end

-- /// Usage

notify("Hey :D", "Loading Local Hub.", 3)

task.wait(1)

loadstring(game:HttpGet("https://raw.githubusercontent.com/Something478/MainScripts/refs/heads/main/nLocalHub.lua"))() -- Moved to another Loadstring.