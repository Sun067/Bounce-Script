local UserInputService = game:GetService("UserInputService")

local StarterGui = game:GetService("StarterGui")

local Players = game:GetService("Players")



local player = Players.LocalPlayer

local character = player.Character or player.CharacterAdded:Wait()

local hrp = character:WaitForChild("HumanoidRootPart")

local humanoid = character:WaitForChild("Humanoid")



-- ตั้งค่าแรงพุ่ง (ปรับตามใจชอบ)

local UPWARD_FORCE = 100 

local BOUNCE_KEY = Enum.KeyCode.X



-- ฟังก์ชันสำหรับแสดงการแจ้งเตือนแบบ Badge

local function showNotification()

    StarterGui:SetCore("SendNotification", {

        Title = "ระบบ Trimp", -- หัวข้อ

        Text = "Trimp UP ทำงานแล้วค่ะ", -- ข้อความที่ต้องการ

        Duration = 3, -- แสดงค้างไว้กี่วินาที

        -- Icon สามารถใส่ Asset ID ได้ (ถ้ามี)

    })

end



UserInputService.InputBegan:Connect(function(input, gameProcessed)

    if gameProcessed then return end 



    if input.KeyCode == BOUNCE_KEY then

        -- 1. ทำให้กดรัวๆ กลางอากาศได้

        humanoid:ChangeState(Enum.HumanoidStateType.Jumping)

        

        -- 2. รีเซ็ตแรงแนวตั้งและพุ่งขึ้น (เพื่อให้พุ่งนิ่ง ไม่ทับซ้อนแรงเดิม)

        hrp.AssemblyLinearVelocity = Vector3.new(hrp.AssemblyLinearVelocity.X, UPWARD_FORCE, hrp.AssemblyLinearVelocity.Z)

        

        -- 3. แสดงคำพูดแจ้งเตือนข้างหน้าจอ

        showNotification()

        

        print("Trimp UP Activated!")

    end

end)
