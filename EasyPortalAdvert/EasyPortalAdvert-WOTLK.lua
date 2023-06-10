-- LOCALISATION

local AddonName, AddonTable = ...
local L = AddonTable.Localize
local AddonTitle = select(2, GetAddOnInfo(AddonName))
local PlainAddonTitle = AddonTitle:gsub("|c........", ""):gsub("|r", "")

local EasyPortalAdvertFrame = CreateFrame("Frame")
EasyPortalAdvertFrame:RegisterEvent("ADDON_LOADED")

function EPAEventHandler(self, event, arg1)
	if event == "ADDON_LOADED" and arg1 == "EasyPortalAdvert" then
		if EPAConfig == nil then
			EPAConfig = {
				["PortalPrice"] = 'Free',
				["TradeChannel"] = '2',
				["ReadySound"] = 'YES',
				["Advert"] = '',
				["ArtifactCD"] = 'ON', -- Not relevant for WOTLK, but easier to just keep it here.
				["FontSize"] = '12' -- Used by the Reagent Monitor plugin.
			}
		end
		
		if EPAConfig.FontSize == nil then EPAConfig.FontSize = '12' end
				
		if EPAConfig.ReadySound == "true" then
			EPAConfig.ReadySound = 'YES'
		elseif EPAConfig.ReadySound == "false" then
			EPAConfig.ReadySound = 'NO'
		end
		
		SlashCmdList["LEAVEPARTY"] = leaveparty_command
			SLASH_LEAVEPARTY1 = "/lp" -- Quickly leave a party.

		SlashCmdList["PORTALADVERT"] = portaladvert_command
			SLASH_PORTALADVERT1 = "/ad" -- Display the advert

		SlashCmdList["EPAHANDLER"] = epahandler
			SLASH_EPAHANDLER1 = "/epa" -- Handles other EPA related commands.

		local localizedClass, englishClass = UnitClass("player")
		local level = UnitLevel("player")
		local englishFaction, localizedFaction = UnitFactionGroup("player")

		if englishClass ~= "MAGE" then
			message("|cFF00FFFF[" .. L["Easy Portal Advert"] .."]|r\n\n" .. L["Only Mages can use this addon."])
		else
			DEFAULT_CHAT_FRAME:AddMessage("|cFF00FFFF[" .. L["Easy Portal Advert"] .."]|r v" .. GetAddOnMetadata("EasyPortalAdvert", "Version") .. L[" loaded successfully."])
		end
		
		if EPAConfig.PortalPrice == "Free" then EPAConfig.PortalPrice = '0' end

		--createadvert()
	end
end

-- EVENT HANDLER

EasyPortalAdvertFrame:SetScript("OnEvent", EPAEventHandler)

function leaveparty_command()
	LeaveParty()
end

function portaladvert_command()

-- This section is the actual advert itself.

local lang = GetDefaultLanguage("player")

if UnitLevel("player") >= 42 then
	SendChatMessage(tostring(EPAConfig.Advert),"CHANNEL",lang,EPAConfig.TradeChannel)
else
	return
end

end

function epahandler(msg)
	local localizedClass, englishClass = UnitClass("player")
	local englishFaction, localizedFaction = UnitFactionGroup("player")
	local level = UnitLevel("player")

	if msg == nil or msg == "" then
		InterfaceOptionsFrame_OpenToCategory(L["Easy Portal Advert"])
		InterfaceOptionsFrame_OpenToCategory(L["Easy Portal Advert"])
		InterfaceOptionsFrame_OpenToCategory(L["Easy Portal Advert"])
	elseif msg == L["sound"] then
		if EPAConfig.ReadySound == "true" then
			EPAConfig.ReadySound = 'false'
			DEFAULT_CHAT_FRAME:AddMessage("|cFF00FFFF[" .. L["Easy Portal Advert"] .."]|r " .. L["The cooldown alert sound has been disabled."])
		elseif EPAConfig.ReadySound == "false" then
			EPAConfig.ReadySound = 'true'
			DEFAULT_CHAT_FRAME:AddMessage("|cFF00FFFF[" .. L["Easy Portal Advert"] .."]|r " .. L["The cooldown alert sound has been enabled."])
		end
	elseif msg == L["create"] then
		--createadvert()
	end
end

