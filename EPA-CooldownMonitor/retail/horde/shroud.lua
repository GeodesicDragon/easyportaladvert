local AddonName, AddonTable = ...
local L = AddonTable.Localize
local AddonTitle = select(2, GetAddOnInfo(AddonName))
local PlainAddonTitle = AddonTitle:gsub("|c........", ""):gsub("|r", "")

local duration
local throttle = 0

local function OnUpdate(self, elapsed)
   throttle = throttle + elapsed
-- print(elapsed, throttle)
   if throttle > duration then -- cooldown has ended
      print("|cFFFFFF00[" .. L["Cooldown Monitor"] .. "]|r " .. ("\124cff1eff00\124Hitem:63353::::::::110:::::\124h[Shroud of Cooperation]\124h\124r") .. L[" has finished its cooldown."])
		if EPAConfig.ReadySound == "true" then
			PlaySoundFile("Interface\\AddOns\\EasyPortalAdvert\\sound\\portalready.mp3")
		end
      throttle = 0
      duration = false
      self:SetScript("OnUpdate", nil) -- no need to check anymore
   end
end

local function OnEvent(self)
   _, duration = GetItemCooldown(63353)
-- print("OnEvent: "..duration)
   if duration > 2 then 
      self:SetScript("OnUpdate", OnUpdate)
   end
end

local hearth = CreateFrame("Frame")
hearth:RegisterEvent("ACTIONBAR_UPDATE_COOLDOWN")
hearth:SetScript("OnEvent", OnEvent)