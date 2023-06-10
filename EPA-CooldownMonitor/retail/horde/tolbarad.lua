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
	print("|cFFFFFF00[" .. L["Cooldown Monitor"] .. "]|r " .. GetSpellLink(88346) .. L[" has finished its cooldown."])
      		if EPAConfig.ReadySound == "true" then
			PlaySoundFile("Interface\\AddOns\\EasyPortalAdvert\\sound\\portalready.mp3")
		end
      throttle = 0
      duration = false
      self:SetScript("OnUpdate", nil) -- no need to check anymore
   end
end

local function OnEvent(self)
   _, duration = GetSpellCooldown(88346)
-- print("OnEvent: "..duration)
   if duration > 2 then 
      self:SetScript("OnUpdate", OnUpdate)
   end
end

local tolbaradhorde = CreateFrame("Frame")
tolbaradhorde:RegisterEvent("SPELL_UPDATE_COOLDOWN")
tolbaradhorde:SetScript("OnEvent", OnEvent)