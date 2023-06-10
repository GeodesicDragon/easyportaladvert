local AddonName, AddonTable = ...
local L = AddonTable.Localize
local AddonTitle = select(2, GetAddOnInfo(AddonName))
local PlainAddonTitle = AddonTitle:gsub("|c........", ""):gsub("|r", "")

function portalservice_OnLoad()

if EPAConfig == nil then
	EPAConfig = {
		["PortalPrice"] = 'Free',
		["TradeChannel"] = '2',
		["ReadySound"] = 'true',
		["SoundID"] = '1',
		["Advert"] = '',
		["ArtifactCD"] = 'ON'
	}
end

local varload = CreateFrame("Frame")
varload:RegisterEvent("ADDON_LOADED")
varload:SetScript("OnEvent", function(self, event, arg1)
	
	if event == "ADDON_LOADED" and arg1 == "EasyPortalAdvert" then

		local localizedClass, englishClass = UnitClass("player")
		local level = UnitLevel("player")
		local englishFaction, localizedFaction = UnitFactionGroup("player")

		if englishClass ~= "MAGE" then
			message("|cFF00FFFF[" .. L["Easy Portal Advert"] .."]|r\n\n" .. L["Only Mages can use this addon."])
		else
			DEFAULT_CHAT_FRAME:AddMessage("|cFF00FFFF[" .. L["Easy Portal Advert"] .."]|r v" .. GetAddOnMetadata("EasyPortalAdvert", "Version") .. L[" loaded successfully."])
		end
		
		if EPAConfig.ArtifactCD == "" or EPAConfig.ArtifactCD == nil then
			EPAConfig.ArtifactCD = 'ON'
		end
		
		if EPAConfig.PortalPrice == "Free" then EPAConfig.PortalPrice = '0' end

		plugincheck()
		createadvert()
			
	end

end)

SlashCmdList["LEAVEPARTY"] = leaveparty_command
	SLASH_LEAVEPARTY1 = "/lp" -- Quickly leave a party.

SlashCmdList["PORTALADVERT"] = portaladvert_command
	SLASH_PORTALADVERT1 = "/ad" -- Display the advert

SlashCmdList["EPAHANDLER"] = epahandler
	SLASH_EPAHANDLER1 = "/epa" -- Handles other EPA related commands.

end

function leaveparty_command()
	LeaveParty()
end

function setcdsound(msg, editbox)

local id = tonumber(msg)

if id < 1 or id > 3 then
	DEFAULT_CHAT_FRAME:AddMessage("|cFF00FFFF[" .. L["Easy Portal Advert"] .. "]|r |cFFFF0000[" .. L["Error"] .. "]|r " .. L["Please enter a value between 1 and 3."])
else
	EPAConfig.SoundID = id
	DEFAULT_CHAT_FRAME:AddMessage("|cFF00FFFF[" .. L["Easy Portal Advert"] .. "|r " .. L["Alert sound changed to"] .. " |cFF00FFFFportalready0" .. id .. ".mp3|r.")
end

end

function previewsound(msg, editbox)

local id = tonumber(msg)

if id < 1 or id > 3 then
	DEFAULT_CHAT_FRAME:AddMessage("|cFF00FFFF[" .. L["Easy Portal Advert"] .. "]|r |cFFFF0000[" .. L["Error"] .. "]|r " .. L["Please enter a value between 1 and 3."])
else
	PlaySoundFile("Interface\\AddOns\\EasyPortalAdvert\\sound\\portalready0" .. id .. ".mp3")
end

end

function portaladvert_command()

-- This section is the actual advert itself.

local lang = GetDefaultLanguage("player")

if UnitLevel("player") >= 40 then
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
	epaoptions_command()
elseif msg == L["sound"] then
	if EPAConfig.ReadySound == "true" then
		EPAConfig.ReadySound = 'false'
		DEFAULT_CHAT_FRAME:AddMessage("|cFF00FFFF[" .. L["Easy Portal Advert"] .."]|r " .. L["The cooldown alert sound has been disabled."])
	elseif EPAConfig.ReadySound == "false" then
		EPAConfig.ReadySound = 'true'
		DEFAULT_CHAT_FRAME:AddMessage("|cFF00FFFF[" .. L["Easy Portal Advert"] .."]|r " .. L["The cooldown alert sound has been enabled."])
	end
elseif msg == L["info"] then

local GUI = LibStub("AceGUI-3.0") 
local frame = GUI:Create("Frame") 

frame:SetTitle("Settings") 
frame:SetStatusText("Version " ..GetAddOnMetadata("EasyPortalAdvert", "Version")) 
local txt,sf 
local example_txt = (L["Easy Portal Advert"] .. L[" is currently using the following settings"] .. ":\n\n|cFF00FF00" .. L["Cost of all portals"] .. ":|r " .. EPAConfig.PortalPrice .. "g.\n\n|cFF00FF00" .. L["Trade Channel"] .. ":|r " .. EPAConfig.TradeChannel .. "\n\n" .. L["Your advert"] .. ": |cFF00FFFF" .. tostring(EPAConfig.Advert) .. "|r\n\n"):rep(1) 
	 
frame:SetLayout("Fill") 
	 
txt = GUI:Create("Label") 
txt:SetFullWidth(true) 
txt:SetText(example_txt) 

sf = GUI:Create("ScrollFrame") 
sf:SetLayout("Flow") 
sf:AddChild(txt) 

frame:AddChild(sf)

elseif msg == L["help"] then

local GUI = LibStub("AceGUI-3.0") 
local frame = GUI:Create("Frame") 

frame:SetTitle("EPA Help") 
frame:SetStatusText("Version " ..GetAddOnMetadata("EasyPortalAdvert", "Version")) 
local txt,sf 
local example_txt = ("|cFFFFFF00" .. L["Easy Portal Advert"] .. " - " .. L["Command List"] .. "|r\n\n|cFF00FF00/epa " .. L["info"] .. "|r - " .. L["Displays the current settings being used by the addon"] .. ".\n|cFF00FF00/epa " .. L["sound"] .. "|r - " .. L["Toggles the cooldown alert sound on or off"] .. ".\n|cFF00FF00/epa " .. L["create"] .. "|r - " .. L["Forces the addon to recreate your advert"] .. ".\n\n|cFFFFFF00" .. L["DISPLAYING ADVERTS"] .. "|r\n\n|cFF00FF00/ad|r - " .. L["Displays your advert in Trade chat"] .. ".\n\n|cFFFFFF00" .. L["OTHER COMMANDS"] .. "|r\n\n|cFF00FF00/lp|r - " .. L["Quickly leave your current party"] .. "."):rep(1) 	 
frame:SetLayout("Fill") 
	 
txt = GUI:Create("Label") 
txt:SetFullWidth(true) 
txt:SetText(example_txt) 

sf = GUI:Create("ScrollFrame") 
sf:SetLayout("Flow") 
sf:AddChild(txt) 

frame:AddChild(sf)

elseif msg == L["create"] then
	createadvert()
end
end

function plugincheck()

	cdm = IsAddOnLoaded("EPA-CooldownMonitor")

		if cdm == true then
			DEFAULT_CHAT_FRAME:AddMessage("|cFF00FFFF[" .. L["Easy Portal Advert"] .."]|r " .. L["Cooldown Monitor is enabled"] .. ".")
		else
			DEFAULT_CHAT_FRAME:AddMessage("|cFF00FFFF[" .. L["Easy Portal Advert"] .."]|r " .. L["Cooldown Monitor is disabled"] .. ".")
		end

end

function createadvert()

-- I am currently unsure how to localise the advert, as trying to do so results in errors.

local locale = GetLocale()

if EPAConfig.PortalPrice == 0 then
	if locale == "enUS" or locale == "enGB" then
		EPAConfig.Advert = 'Free portals!'
	elseif locale == "frFR" then
		EPAConfig.Advert = 'Portails gratuits!'
	elseif locale == "deDE" then
		EPAConfig.Advert = 'Gratis-Portale!'
	elseif locale == "ptBR" then
		EPAConfig.Advert = 'Portais Grátis!'
	end
elseif EPAConfig.PortalPrice == "PWYW" then
	if locale == "enUS" or locale == "enGB" then
		EPAConfig.Advert = 'Pay What You Want portal service available!'
	elseif locale == "frFR" then
		EPAConfig.Advert = 'Payez ce que vous voulez service de portail disponible!'
	elseif locale == "deDE" then
		EPAConfig.Advert = 'Bezahlen was Sie Portal-Service zur Verfügung wünschen!'
	elseif locale == "ptBR" then
		EPAConfig.Advert = 'Pague o Valor Desejado por portal modo disponível!'
	end
elseif EPAConfig.PortalPrice ~= "Free" and EPAConfig.PortalPrice ~= "PWYW" then
	if locale == "enUS" or locale == "enGB" then
		EPAConfig.Advert = 'Portals available for ' .. EPAConfig.PortalPrice .. "g."
	elseif locale == "frFR" then
		EPAConfig.Advert = 'Portails disponibles pour ' .. EPAConfig.PortalPrice .. "g."
	elseif locale == "deDE" then
		EPAConfig.Advert = 'Portale zur Verfügung: ' .. EPAConfig.PortalPrice .. "g."
	elseif locale == "ptBR" then
		EPAConfig.Advert = 'Portais disponíveis por ' .. EPAConfig.PortalPrice.. "g."
	end
end

end