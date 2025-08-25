function notify(title, text, duration)
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = title,
        Text = text,
        Duration = duration or 5
    })
end

notify("Yo", "Did you know, that if u pour a water on a rock, nothing happens?", 3)

task.wait(1)

loadstring(game:HttpGet("https://raw.githubusercontent.com/Something478/MainScripts/refs/heads/main/LocalHub.lua"))()