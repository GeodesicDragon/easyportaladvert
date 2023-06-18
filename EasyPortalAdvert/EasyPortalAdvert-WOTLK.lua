-- LOCALISATION

local AddonName, AddonTable = ...
local L = AddonTable.Localize
local AddonTitle = select(2, GetAddOnInfo(AddonName))
local PlainAddonTitle = AddonTitle:gsub("|c........", ""):gsub("|r", "")

local EasyPortalAdvertFrame = CreateFrame("Frame")
EasyPortalAdvertFrame:RegisterEvent("ADDON_LOADED")

function EPAEventHandler(self, event, arg1)
	if event == "ADDON_LOADED" and arg1 == "EasyPortalAdvert" then
		if EasyPortalAdvert == "" or EasyPortalAdvert == nil then
			EasyPortalAdvert = {
				["PortalPrice"] = 'Free',
				["TradeChannel"] = '2',
				["ReadySound"] = 'YES',
				["Advert"] = '',
				["AdvertType"] = 'SET',
				["FontSize"] = '12' -- Used by the Reagent Monitor plugin.
			}
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
		
		if EasyPortalAdvert.PortalPrice == "Free" then EasyPortalAdvert.PortalPrice = '0' end

		createadvert()
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
	SendChatMessage(tostring(EasyPortalAdvert.Advert),"CHANNEL",lang,EasyPortalAdvert.TradeChannel)
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
		if EasyPortalAdvert.ReadySound == "true" then
			EasyPortalAdvert.ReadySound = 'false'
			DEFAULT_CHAT_FRAME:AddMessage("|cFF00FFFF[" .. L["Easy Portal Advert"] .."]|r " .. L["The cooldown alert sound has been disabled."])
		elseif EasyPortalAdvert.ReadySound == "false" then
			EasyPortalAdvert.ReadySound = 'true'
			DEFAULT_CHAT_FRAME:AddMessage("|cFF00FFFF[" .. L["Easy Portal Advert"] .."]|r " .. L["The cooldown alert sound has been enabled."])
		end
	elseif msg == L["create"] then
		createadvert()
	elseif msg == "reset" then
		EasyPortalAdvert = {
			["PortalPrice"] = 'Free',
			["TradeChannel"] = '2',
			["ReadySound"] = 'YES',
			["Advert"] = '',
			["FontSize"] = '12',
			["AdvertType"] = 'SET'
		}
		
		DEFAULT_CHAT_FRAME:AddMessage("|cFF00FFFF[" .. L["Easy Portal Advert"] .."]|r SavedVariables have been reset to default.")
	end
end

function createadvert()

-- I am currently unsure how to localise the advert, as trying to do so results in errors.

local locale = GetLocale()

if EasyPortalAdvert.AdvertType == "FREE" then
	EasyPortalAdvert.Advert = tostring(L["Free portals!"])
elseif EasyPortalAdvert.AdvertType == "PWYW" then
	EasyPortalAdvert.Advert = tostring(L["Pay What You Want portal service available!"])
elseif EasyPortalAdvert.AdvertType == "SET" then
	EasyPortalAdvert.Advert = string.format(L["Portals available for %dg each!"], EasyPortalAdvert.PortalPrice)
end

end