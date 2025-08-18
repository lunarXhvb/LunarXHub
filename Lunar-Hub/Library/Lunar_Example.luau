local Library =
    loadstring(game:HttpGet("https://raw.githubusercontent.com/lunarXhvb/Library/refs/heads/main/Library.luaa"))()

if Library:LoadAnimation() then
    Library:StartLoad()
end

local Window =
    Library:Window(
    {
        SubTitle = "v2.0",
        Size = UDim2.new(0, 400, 0, 400),
        TabWidth = 150
    }
)

local speed = 50
local featureEnabled = false
local currentOption = "Option 1"

local Tab = Window:Tab("Main", "rbxassetid://10734898355")

Tab:Button(
    "Jump Boost",
    function()
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = 100
        Library:Notify("Jump boosted!")
    end
)

Tab:Toggle(
    "Speed Hack",
    false,
    "Toggle speed boost",
    function(state)
        featureEnabled = state
        if state then
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = speed
        else
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
        end
    end
)

Tab:Dropdown(
    "Teleport",
    {"Spawn", "Sky", "Underground"},
    "Spawn",
    function(selected)
        currentOption = selected
        local char = game.Players.LocalPlayer.Character
        if selected == "Spawn" then
            char:MoveTo(Vector3.new(0, 10, 0))
        elseif selected == "Sky" then
            char:MoveTo(Vector3.new(0, 100, 0))
        else
            char:MoveTo(Vector3.new(0, -50, 0))
        end
    end
)

Tab:Slider(
    "Speed",
    16,
    200,
    50,
    function(value)
        speed = value
        if featureEnabled then
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
        end
    end
)

Tab:Textbox(
    "Say Message",
    "Hello!",
    function(text)
        game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(text, "All")
    end
)

local MyLabel = Tab:Label("Status: Ready")

Tab:Seperator("Settings")


Tab:Line()


if Library:LoadAnimation() then
    Library:Loaded()
end
Library:Notify("Script loaded!")
