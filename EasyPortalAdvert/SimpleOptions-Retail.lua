-- I based this GUI on the one used in the BadBoy anti-spam addon.
-- Consequently, I owe many thanks to Funkydude; permission was given to use his addon in this way.
-- Get BadBoy Anti-Spam here: https://mods.curse.com/addons/wow/bad-boy

local AddonName, AddonTable = ...
local L = AddonTable.Localize
local AddonTitle = select(2, GetAddOnInfo(AddonName))
local PlainAddonTitle = AddonTitle:gsub("|c........", ""):gsub("|r", "")

function OptionsFrame_OnLoad()
--SlashCmdList["EPAOPTIONS"] = epaoptions_command
	--SLASH_EPAOPTIONS1 = "/epa"
end

function epaoptions_command()
local epaoptions = CreateFrame("Frame", "DRConfig", UIParent)
if IsAddOnLoaded("EPA-CooldownMonitor") == true then
	epaoptions:SetSize(650, 250) -- width, height
elseif IsAddOnLoaded("EPA-CooldownMonitor") == false then
	epaoptions:SetSize(650, 200) -- width, height
end
epaoptions:SetPoint("CENTER")
epaoptions:SetClampedToScreen(true)
epaoptions:EnableMouse(true)
epaoptions:SetMovable(true)
epaoptions:RegisterForDrag("LeftButton")
epaoptions:SetScript("OnDragStart", function(self) self:StartMoving() end)
epaoptions:SetScript("OnDragStop", function(self) self:StopMovingOrSizing() end)
epaoptions:Show()
local bg = epaoptions:CreateTexture()
bg:SetAllPoints(epaoptions)
bg:SetColorTexture(0, 0, 0, 0.9)
local close = CreateFrame("Button", nil, epaoptions, "UIPanelCloseButton")
close:SetPoint("TOPRIGHT", epaoptions, "TOPRIGHT", -5, -5)

local title = epaoptions:CreateFontString(nil, nil, "GameFontNormalLarge")
title:SetPoint("TOPLEFT", 16, -16)
title:SetText(L["Easy Portal Advert"] .." v" .. GetAddOnMetadata("EasyPortalAdvert", "Version"))

-- Portal Price Editbox

local lblPortalPriceText = epaoptions:CreateFontString(nil, nil, "GameFontHighlight")
lblPortalPriceText:SetPoint("TOPLEFT", title, "BOTTOMLEFT", 0, -16)
lblPortalPriceText:SetText("Portal Price:")

local txtPortalPrice = CreateFrame("EditBox", nil, epaoptions, "InputBoxTemplate")
txtPortalPrice:SetPoint("LEFT", lblPortalPriceText, "RIGHT", 16, 0)
txtPortalPrice:SetAutoFocus(false)
txtPortalPrice:SetNumeric(true)
txtPortalPrice:SetWidth(25)
txtPortalPrice:SetHeight(20)
txtPortalPrice:SetMaxLetters(3)
txtPortalPrice:Show()

local n = tonumber(EPAConfig.PortalPrice)
		txtPortalPrice:SetText(n)

txtPortalPrice:SetScript("OnEnter", function(self)
	GameTooltip:SetOwner(self, "ANCHOR_TOP")
	GameTooltip:AddLine("Set to 0 to make portals free.", 1, 1, 1)
	GameTooltip:Show()
end)
txtPortalPrice:SetScript("OnLeave", GameTooltip_Hide)
txtPortalPrice:SetScript("OnHide", function(frame)
	local n = tonumber(frame:GetText())
	EPAConfig.PortalPrice = n
	createadvert()
end)

-- Trade Channel Editbox

local lblTradeChannelText = epaoptions:CreateFontString(nil, nil, "GameFontHighlight")
lblTradeChannelText:SetPoint("TOPLEFT", lblPortalPriceText, "BOTTOMLEFT", 0, -16)
lblTradeChannelText:SetText("Trade Channel:")

local txtTradeChannel = CreateFrame("EditBox", nil, epaoptions, "InputBoxTemplate")
txtTradeChannel:SetPoint("LEFT", lblTradeChannelText, "RIGHT", 16, 0)
txtTradeChannel:SetAutoFocus(false)
txtTradeChannel:SetNumeric(true)
txtTradeChannel:SetWidth(25)
txtTradeChannel:SetHeight(20)
txtTradeChannel:SetMaxLetters(3)
txtTradeChannel:Show()

local n = tonumber(EPAConfig.TradeChannel)
		txtTradeChannel:SetText(n)

txtTradeChannel:SetScript("OnLeave", GameTooltip_Hide)
txtTradeChannel:SetScript("OnHide", function(frame)
	local n = tonumber(frame:GetText())
	EPAConfig.TradeChannel = n
end)

local arguments = epaoptions:CreateFontString(nil, nil, "GameFontHighlight")
arguments:SetPoint("TOPLEFT", lblTradeChannelText, "BOTTOMLEFT", 0, -16)
arguments:SetText("Tip: The /epa command also accepts these parameters: '" .. L["info"] .. ",' '" .. L["sound"] .. ",' '" .. L["help"] .. "' and '" .. L["create"] .. ".'")

local cdmtitle = epaoptions:CreateFontString(nil, nil, "GameFontNormalLarge")
cdmtitle:SetPoint("TOPLEFT", arguments, "BOTTOMLEFT", 0, -16)
cdmtitle:SetText(L["Cooldown Monitor"])

if IsAddOnLoaded("EPA-CooldownMonitor") == false then
	local cdmmissing = epaoptions:CreateFontString(nil, nil, "GameFontHighlight")
	cdmmissing:SetPoint("TOPLEFT", cdmtitle, "BOTTOMLEFT", 0, -16)
	cdmmissing:SetText(L["Cooldown Monitor"] .. " is missing or not enabled.")
elseif IsAddOnLoaded("EPA-CooldownMonitor") == true then

-- Alert Sound Checkbox

local chkReadySound = CreateFrame("CheckButton", nil, epaoptions, "OptionsBaseCheckButtonTemplate")
chkReadySound:SetPoint("TOPLEFT", cdmtitle, "BOTTOMLEFT", 0, -16)

	if EPAConfig.ReadySound == "true" then
		chkReadySound:SetChecked(true)
	elseif EPAConfig.ReadySound == "false" then
		chkReadySound:SetChecked(false)
	end

chkReadySound:SetScript("OnClick", function(frame)
	local tick = frame:GetChecked()
	
	if tick == false then
		EPAConfig.ReadySound = 'false'
		DEFAULT_CHAT_FRAME:AddMessage("|cFF00FFFF[" .. L["Easy Portal Advert"] .."]|r " .. L["The cooldown alert sound has been disabled."])
	elseif tick == true then
		EPAConfig.ReadySound = 'true'
		DEFAULT_CHAT_FRAME:AddMessage("|cFF00FFFF[" .. L["Easy Portal Advert"] .."]|r " .. L["The cooldown alert sound has been enabled."])
	end
end)

local chkReadySoundText = epaoptions:CreateFontString(nil, nil, "GameFontHighlight")
chkReadySoundText:SetPoint("LEFT", chkReadySound, "RIGHT", 0, 1)
chkReadySoundText:SetText("Play a sound when a spell finishes its cooldown")

-- Artifact Checkbox

local chkArtifact = CreateFrame("CheckButton", nil, epaoptions, "OptionsBaseCheckButtonTemplate")
chkArtifact:SetPoint("TOPLEFT", chkReadySound, "BOTTOMLEFT", 0, -16)

	if EPAConfig.ArtifactCD == "ON" then
		chkArtifact:SetChecked(true)
	elseif EPAConfig.ArtifactCD == "OFF" then
		chkArtifact:SetChecked(false)
	end

chkArtifact:SetScript("OnClick", function(frame)
	local tick = frame:GetChecked()
	
	if tick == false then
		EPAConfig.ArtifactCD = 'OFF'
		DEFAULT_CHAT_FRAME:AddMessage("|cFF00FFFF[" .. L["Easy Portal Advert"] .."]|r " .. "Artifact ability cooldowns will no longer be monitored.")
	elseif tick == true then
		EPAConfig.ArtifactCD = 'ON'
		DEFAULT_CHAT_FRAME:AddMessage("|cFF00FFFF[" .. L["Easy Portal Advert"] .."]|r " .. "Artifact ability cooldowns will now be monitored.")
	end
end)

local chkArtifactText = epaoptions:CreateFontString(nil, nil, "GameFontHighlight")
chkArtifactText:SetPoint("LEFT", chkArtifact, "RIGHT", 0, 1)
chkArtifactText:SetText("Monitor cooldown of Artifact abilities")

end

end