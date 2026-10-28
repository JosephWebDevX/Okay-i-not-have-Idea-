-- FirstPerson + CameraSway Script
-- Coloque este script em StarterCharacterScripts

local player = game.Players.LocalPlayer
local camera = workspace.CurrentCamera
local userInput = game:GetService("UserInputService")
local runService = game:GetService("RunService")

-- Função de interpolação suave
local function lerp(a, b, t)
	return a + (b - a) * t
end

-- Variável usada no balanço da câmera
local swayAmount = 0

-- Ativa a câmera em primeira pessoa
camera.CameraType = Enum.CameraType.Custom
player.CameraMode = Enum.CameraMode.LockFirstPerson

-- Função de atualização do balanço da câmera
runService:BindToRenderStep("CameraSway", Enum.RenderPriority.Camera.Value + 1, function(dt)
	local deltaX = math.clamp(userInput:GetMouseDelta().X, -8, 8)
	swayAmount = lerp(swayAmount, deltaX, 8 * dt)
	camera.CFrame *= CFrame.Angles(0, 0, math.rad(swayAmount))
end)

-- Opcional: garantir que o mouse não fique travado
userInput.MouseBehavior = Enum.MouseBehavior.LockCenter
