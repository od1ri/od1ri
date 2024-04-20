if game.PlaceId == 142823291 then --проверка
local printvar = true
--Change to true if you want to see names instead of murderer, sheriff, and innocents with esp
local espnames = true
--Change keybinds to your liking
local coinkey = "c" --Coin grabber keybind
local MSkey = "m" --Murderer/Sheriff esp keybind
local playerskey = "q" --All players esp keybind
local espoffkey = "b" --Turn esp off keybind
local flykey = "f" --Fly keybind
local noclipkey = "r" --Noclip keybind
local godmodekey = "g" --Godmode keybind
local xrayonkey = "x" --Xray on keybind
local xrayoffkey = "z" --Xray off keybind
local bringgunkey = "t" --Teleport to gun keybind
local hideshowguikey = "p" --Show/Hide gui keybind
--End of easy customization options

--Gui Buttons and Status--
local MM2 = Instance.new("ScreenGui")
local Main = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local Coin = Instance.new("TextButton")
local MSEsp = Instance.new("TextButton")
local MSESPActive = Instance.new("TextLabel")
local PlayersEsp = Instance.new("TextButton")
local PlayersEspActive = Instance.new("TextLabel")
local EspOff = Instance.new("TextButton")
local EspOffActive = Instance.new("TextLabel")
local Run = Instance.new("TextButton")
local RunActiveGui = Instance.new("TextLabel")
local Fly = Instance.new("TextButton")
local FlyActive = Instance.new("TextLabel")
local Noclip = Instance.new("TextButton")
local NoclipActive = Instance.new("TextLabel")
local GodMode = Instance.new("TextButton")
local GodModeActive = Instance.new("TextLabel")
local GuiXrayOn = Instance.new("TextButton")
local GuiXrayOnActive = Instance.new("TextLabel")
local GuiXrayOff = Instance.new("TextButton")
local GuiXrayOffActive = Instance.new("TextLabel")
local BringGun = Instance.new("TextButton")
local Keybinds = Instance.new("TextButton")
local KeybindsActive = Instance.new("TextLabel")
local Hide = Instance.new("TextButton")
local Show = Instance.new("TextButton")

--Other Variables
local runActive = false
local teamname = "None"
local murderer = "None"
local sheriff = "None"
local player = game:GetService("Players").LocalPlayer

local esp = false
local plresp
local track = false

local NClip = false
local char = game.Players.LocalPlayer.Character
local obj = game.workspace
local mouse=game.Players.LocalPlayer:GetMouse()
local LP = game:GetService("Players").LocalPlayer
local flyvar = false

local showvar = true
local inputcode = game:GetService("UserInputService")
local godmodevar = false
local keyOff = false
local NClip = false

local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local Window = Fluent:CreateWindow({
    Title = "Person Hub" .. Fluent.Version,
    SubTitle = "-- https://itzperson.ru",
    TabWidth = 180,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl
})

local Tabs = {
    Main = Window:AddTab({ Title = "Функции", Icon = "atom" }),
    Settings = Window:AddTab({ Title = "Прочие", Icon = "Settings" })
}

local Options = Fluent.Options

Fluent:Notify({
    Title = "done",
    Content = "exe",
    SubContent = "SubContent",
    Duration = 50
})

Tabs.Main:AddButton({
    Title = "ESP",
    Description = "Видеть роли игроков свозь стены",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Ihaveash0rtnamefordiscord/Releases/main/MurderMystery2HighlightESP"))(' Watermelon ?')
    end
})

Tabs.Main:AddButton({
    Title = "Корблокс",
    Description = "Визуальный корблокс",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/fgasfga/ROBLOX-CLIENT-SIDED-Korblox-And-Headless-Script/main/Main.lua"))()
    end
})

Tabs.Main:AddButton({
    Title = "Admin panel",
    Description = "Админ - панель",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/fatesc/fates-admin/main/main.lua"))()
    end
})

Tabs.Main:AddButton({
    Title = "Noclip",
    Description = "Проходить сквозь стены",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/od1ri/od1ri/main/noclip.lua"))()
    end
})

Tabs.Main:AddButton({
    Title = "ESP 1",
    Description = "То же, что и первое, но видно ники",
    Callback = function()
        function Create(base, team, colors1, colors2, colors3, teamname) --For all esps
	local bb = Instance.new("BillboardGui",player.PlayerGui)
	bb.Adornee = base
	bb.ExtentsOffset = Vector3.new(0,1,0)
	bb.AlwaysOnTop = true
	bb.Size = UDim2.new(0,5,0,5)
	bb.StudsOffset = Vector3.new(0,1,0)
	bb.Name = "tracker"
	local frame = Instance.new("Frame",bb)
	frame.ZIndex = 10
	frame.BackgroundTransparency = 0.3
	frame.Size = UDim2.new(1,0,1,0)
	local txtlbl = Instance.new("TextLabel",bb)
	txtlbl.ZIndex = 10
	txtlbl.Text = teamname
	txtlbl.BackgroundTransparency = 1
	txtlbl.Position = UDim2.new(0,0,0,-35)
	txtlbl.Size = UDim2.new(1,0,10,0)
	txtlbl.Font = "ArialBold"
	txtlbl.FontSize = "Size12"
	txtlbl.TextStrokeTransparency = 0.5
	if team then --For teams, left over from origianl but never removed
		txtlbl.TextColor3 = Color3.new(0,0,255)
		frame.BackgroundColor3 = Color3.new(0,0,255)
	else
		txtlbl.TextColor3 = Color3.new(colors1,colors2,colors3)
		frame.BackgroundColor3 = Color3.new(colors1,colors2,colors3)
	end
end
    end
})

Tabs.Main:AddButton({
    Title = "Найти убийцу",
    Description = "Слить в чат мардера",
    Callback = function()
        function findmurderer() --Find who the murderer is
	local colors1 = 255
	local colors2 = 0
	local colors3 = 0
	for i, v in pairs(game:GetService("Players"):GetChildren()) do
		if v ~= game:GetService("Players").LocalPlayer then
			for i,v in pairs(v.Backpack:GetChildren()) do --Checks backpack for knife
				if v.Name == "Knife" then
					if espnames == true then
						local teamname = v.Parent.Parent.Name
						if v.Parent.Parent.Character.Head ~= nil then
							Create(v.Parent.Parent.Character.Head, false, colors1 ,colors2, colors3, teamname)
						else
							if printvar == true then
								print("Head missing from murderer!")
							end
						end
					elseif espnames == false then
						local teamname = "Murderer"
						if v.Parent.Parent.Character.Head ~= nil then
							Create(v.Parent.Parent.Character.Head, false, colors1 ,colors2, colors3, teamname)
						else
							if printvar == true then
								print("Head missing from murderer!")
							end
						end
					end
					murderer = v.Parent.Parent.Name
					if printvar == true then
						print(murderer.." is Murderer")
					end
				end
			end
			for i,v in pairs(v.Character:GetChildren()) do --Checks workspace player for knife (holding it)
				if v.Name == "Knife" then
					if espnames == true then
						local teamname = v.Parent.Name
						if v.Parent.Head ~= nil then --Tried to failproof to stop printing nil
							Create(v.Parent.Head, false, colors1 ,colors2, colors3, teamname)
						else
							if printvar == true then
								print("Head missing from murderer!")
							end
						end
					elseif espnames == false then
						local teamname = "Murderer"
						if v.Parent.Head ~= nil then
							Create(v.Parent.Head, false, colors1 ,colors2, colors3, teamname)
						else
							if printvar == true then
								print("Head missing from murderer!")
							end
						end
					end
					murderer = v.Parent.Name
					if printvar == true then --Tried to failproof to stop printing nil
						local murderer1 = tostring(v.Parent.Name)
						print(murderer1.." is Murderer")
					end
				end
			end
		end
	end
end
    end
})

Tabs.Main:AddButton({
    Title = "Найти шерифа",
    Description = "Та же учесть, что и выше, но с шерифом",
    Callback = function()
        function findsheriff() --Find who the sheriff is
	local colors1 = 0
	local colors2 = 0
	local colors3 = 255
	for i, v in pairs(game:GetService("Players"):GetChildren()) do
		if v ~= game:GetService("Players").LocalPlayer then
			for i,v in pairs(v.Backpack:GetChildren()) do
				if v.Name == "Revolver" or v.Name == "Gun" then --Lazy to check if its revolver or gun and checks backpack for gun
					if espnames == true then
						local teamname = v.Parent.Parent.Name
						if v.Parent.Parent.Character.Head ~= nil then --Tried to failproof to stop printing nil
							Create(v.Parent.Parent.Character.Head, false, colors1 ,colors2, colors3, teamname)
						else
							if printvar == true then
								print("Head missing from sheriff!")
							end
						end
					elseif espnames == false then
						local teamname = "Sheriff"
						if v.Parent.Parent.Character.Head ~= nil then --Tried to failproof to stop printing nil
							Create(v.Parent.Parent.Character.Head, false, colors1 ,colors2, colors3, teamname)
						else
							if printvar == true then
								print("Head missing from sheriff!")
							end
						end
					end
					sheriff = v.Parent.Parent.Name
					if printvar == true then
						local sheriff1 = tostring(v.Parent.Parent.Name)
						print(sheriff1.." is Sheriff")
					end
				end
			end
			for i,v in pairs(v.Character:GetChildren()) do
				if v.Name == "Revolver" or v.Name == "Gun" then --Lazy to check if its revolver or gun and checks workspace player for gun (holding it)
					if espnames == true then
						local teamname = v.Parent.Name
						if v.Parent.Head ~= nil then --Tried to failproof to stop printing nil
							Create(v.Parent.Head, false, colors1 ,colors2, colors3, teamname)
						else
							if printvar == true then
								print("Head missing from sheriff!")
							end
						end
					elseif espnames == false then
						local teamname = "Sheriff"
						if v.Parent.Head ~= nil then --Tried to failproof to stop printing nil
							Create(v.Parent.Head, false, colors1 ,colors2, colors3, teamname)
						else
							if printvar == true then
								print("Head missing from sheriff!")
							end
						end
					end
					sheriff = v.Parent.Name
					if printvar == true then
						local sheriff1 = tostring(v.Parent.Name)
						print(sheriff1.." is Sheriff")
					end
				end
			end
		end
	end
end
    end
})


Tabs.Main:AddButton({
    Title = "Xray On",
    Description = "Включить просвечивание стен(Осторожно, может лагать!)",
    Callback = function()
        GuiXrayOnActive.Name = "GuiXrayOnActive"
GuiXrayOnActive.Parent = Main
GuiXrayOnActive.BackgroundColor3 = Color3.new(0.188235, 0.188235, 0.188235)
GuiXrayOnActive.BorderColor3 = Color3.new(0, 0.607843, 1)
GuiXrayOnActive.BorderSizePixel = 5
GuiXrayOnActive.Position = UDim2.new(0.755, 0, 1.015, 0)
GuiXrayOnActive.Size = UDim2.new(0.25, 0, 0.08, 0)
GuiXrayOnActive.ZIndex = 4
GuiXrayOnActive.Font = Enum.Font.SciFi
GuiXrayOnActive.FontSize = Enum.FontSize.Size24
GuiXrayOnActive.Text = "Inactive"
GuiXrayOnActive.TextColor3 = Color3.new(1, 0, 1)
GuiXrayOnActive.TextSize = 20
GuiXrayOnActive.TextWrapped = true

GuiXrayOn.Name = "XrayOn"
GuiXrayOn.Parent = Main
GuiXrayOn.BackgroundColor3 = Color3.new(0.188235, 0.188235, 0.188235)
GuiXrayOn.BorderColor3 = Color3.new(0, 0.607843, 1)
GuiXrayOn.BorderSizePixel = 5
GuiXrayOn.Position = UDim2.new(0, 0, 1.015, 0)
GuiXrayOn.Size = UDim2.new(0.75, 0, 0.08, 0)
GuiXrayOn.ZIndex = 4
GuiXrayOn.Font = Enum.Font.SciFi
GuiXrayOn.FontSize = Enum.FontSize.Size24
GuiXrayOn.Text = "Xray On ["..string.upper(xrayonkey).."]"
GuiXrayOn.TextColor3 = Color3.fromRGB(255, 204, 102)
GuiXrayOn.TextSize = 20
GuiXrayOn.TextWrapped = true
GuiXrayOn.MouseButton1Down:connect(function(x, y)
	GuiXrayOnActive.Text = "Active"
	GuiXrayOnActive.TextColor3 = Color3.new(0, 1, 0)
	GuiXrayOffActive.Text = "Inactive"
	GuiXrayOffActive.TextColor3 = Color3.new(1, 0, 1)
	XrayOn(obj)
end)
    end
})

Tabs.Main:AddButton({
    Title = "Xray Off",
    Description = "Выкл. просвечевание",
    Callback = function()
        GuiXrayOffActive.Name = "GuiXrayOffActive"
GuiXrayOffActive.Parent = Main
GuiXrayOffActive.BackgroundColor3 = Color3.new(0.188235, 0.188235, 0.188235)
GuiXrayOffActive.BorderColor3 = Color3.new(0, 0.607843, 1)
GuiXrayOffActive.BorderSizePixel = 5
GuiXrayOffActive.Position = UDim2.new(0.755, 0, 1.115, 0)
GuiXrayOffActive.Size = UDim2.new(0.25, 0, 0.08, 0)
GuiXrayOffActive.ZIndex = 4
GuiXrayOffActive.Font = Enum.Font.SciFi
GuiXrayOffActive.FontSize = Enum.FontSize.Size24
GuiXrayOffActive.Text = "Active"
GuiXrayOffActive.TextColor3 = Color3.new(0, 1, 0)
GuiXrayOffActive.TextSize = 20
GuiXrayOffActive.TextWrapped = true

GuiXrayOff.Name = "XrayOff"
GuiXrayOff.Parent = Main
GuiXrayOff.BackgroundColor3 = Color3.new(0.188235, 0.188235, 0.188235)
GuiXrayOff.BorderColor3 = Color3.new(0, 0.607843, 1)
GuiXrayOff.BorderSizePixel = 5
GuiXrayOff.Position = UDim2.new(0, 0, 1.115, 0)
GuiXrayOff.Size = UDim2.new(0.75, 0, 0.08, 0)
GuiXrayOff.ZIndex = 4
GuiXrayOff.Font = Enum.Font.SciFi
GuiXrayOff.FontSize = Enum.FontSize.Size24
GuiXrayOff.Text = "Xray Off ["..string.upper(xrayoffkey).."]"
GuiXrayOff.TextColor3 = Color3.fromRGB(255, 153, 51)
GuiXrayOff.TextSize = 20
GuiXrayOff.TextWrapped = true
GuiXrayOff.MouseButton1Down:connect(function(x, y)
	GuiXrayOnActive.Text = "Inactive"
	GuiXrayOnActive.TextColor3 = Color3.new(1, 0, 1)
	GuiXrayOffActive.Text = "Active"
	GuiXrayOffActive.TextColor3 = Color3.new(0, 1, 0)
	XrayOff(obj)
end)
    end
})

Tabs.Main:AddButton({
    Title = "Забрать пистолет",
    Description = "Тп к пистолету и обратно",
    Callback = function()
        BringGun.Name = "BringGun"
BringGun.Parent = Main
BringGun.BackgroundColor3 = Color3.new(0.188235, 0.188235, 0.188235)
BringGun.BorderColor3 = Color3.new(0, 0.607843, 1)
BringGun.BorderSizePixel = 5
BringGun.Position = UDim2.new(0, 0, 1.215, 0)
BringGun.Size = UDim2.new(1.005, 0, 0.08, 0)
BringGun.ZIndex = 4
BringGun.Font = Enum.Font.SciFi
BringGun.FontSize = Enum.FontSize.Size24
BringGun.Text = "Teleport Gun ["..string.upper(bringgunkey).."]"
BringGun.TextColor3 = Color3.fromRGB(0, 255, 0)
BringGun.TextSize = 20
BringGun.TextWrapped = true
BringGun.MouseButton1Down:connect(function(x, y)
	if game.Workspace.GunDrop.CFrame ~= nil then
		game.Workspace.GunDrop.CFrame = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame
	else
		if printvar == true then
			print("Gun not currently dropped")
		end
	end
end)
    end
})

Tabs.Main:AddButton({
    Title = "Анимации",
    Description = "Изменить анимацию",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GamingScripter/Animation-Hub/main/Animation%20Gui", true))()
    end
})

Tabs.Main:AddButton({
    Title = "Эмоции",
    Description = "Изменить эмоцию",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/eCpipCTH"))()
    end
})

SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)
SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({})
InterfaceManager:SetFolder("FluentScriptHub")
SaveManager:SetFolder("FluentScriptHub/specific-game")
InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)
Window:SelectTab(1)

Fluent:Notify({
    Title = "Произошла ошибка!",
    Content = "Вы уже активировали данный скрипт.",
    Duration = 80
})

SaveManager:LoadAutoloadConfig()