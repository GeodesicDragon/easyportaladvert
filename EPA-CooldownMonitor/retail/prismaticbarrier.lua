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
      print("|cFFFFFF00[" .. L["Cooldown Monitor"] .. "]|r " .. GetSpellLink(235450) .. L[" has finished its cooldown."])
		if EPAConfig.ReadySound == "true" then
			PlaySoundFile("Interface\\AddOns\\EasyPortalAdvert\\sound\\portalready.mp3")
		end
      throttle = 0
      duration = false
      self:SetScript("OnUpdate", nil) -- no need to check anymore
   end
end

local function OnEvent(self)
   _, duration = GetSpellCooldown(235450)
-- print("OnEvent: "..duration)
   if duration > 2 then 
      self:SetScript("OnUpdate", OnUpdate)
   end
end

local dala = CreateFrame("Frame")
dala:RegisterEvent("SPELL_UPDATE_COOLDOWN")
dala:SetScript("OnEvent", OnEvent)