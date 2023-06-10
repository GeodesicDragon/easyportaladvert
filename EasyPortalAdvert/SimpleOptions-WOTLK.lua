-- LOCALISATION

local AddonName, AddonTable = ...
local L = AddonTable.Localize
local AddonTitle = select(2, GetAddOnInfo(AddonName))
local PlainAddonTitle = AddonTitle:gsub("|c........", ""):gsub("|r", "")

-- START OF OPTIONS WINDOW

local EPAIOFrame = CreateFrame("Frame")
EPAIOFrame.name = L["Easy Portal Advert"]

local lblTitle = EPAIOFrame:CreateFontString(nil, nil, "GameFontHighlight")
lblTitle:SetFont("Fonts\\FRIZQT__.TTF", 12)
lblTitle:SetPoint("TOPLEFT", EPAIOFrame, "TOPLEFT", 12, -12)
lblTitle:SetText(L["Easy Portal Advert"] .. " v" .. GetAddOnMetadata("EasyPortalAdvert","Version"))

-- Portal Price Editbox

local lblPortalPriceText = EPAIOFrame:CreateFontString(nil, nil, "GameFontHighlight")
lblPortalPriceText:SetPoint("TOPLEFT", lblTitle, "BOTTOMLEFT", 0, -16)
lblPortalPriceText:SetText(L["Portal Price:"])

local txtPortalPrice = CreateFrame("EditBox", nil, EPAIOFrame, "InputBoxTemplate")
txtPortalPrice:SetPoint("LEFT", lblPortalPriceText, "RIGHT", 16, 0)
txtPortalPrice:SetAutoFocus(false)
txtPortalPrice:SetWidth(32)
txtPortalPrice:SetHeight(16)
txtPortalPrice:SetMaxLetters(3)
txtPortalPrice:Show()

txtPortalPrice:SetScript("OnShow", function(frame)
local text = tonumber(EPAConfig.PortalPrice)
	txtPortalPrice:SetText(text)
end)

txtPortalPrice:SetScript("OnEnter", function(self)
	GameTooltip:SetOwner(self, "ANCHOR_TOP")
	GameTooltip:AddLine("Set to 0 to make portals free.", 1, 1, 1)
	GameTooltip:Show()
end)
txtPortalPrice:SetScript("OnLeave", GameTooltip_Hide)
txtPortalPrice:SetScript("OnHide", function(frame)
	local n = tonumber(txtPortalPrice:GetText())
	EPAConfig.PortalPrice = n
	--createadvert()
end)

-- Trade Channel Editbox

local lblTradeChannelText = EPAIOFrame:CreateFontString(nil, nil, "GameFontHighlight")
lblTradeChannelText:SetPoint("TOPLEFT", lblPortalPriceText, "BOTTOMLEFT", 0, -16)
lblTradeChannelText:SetText(L["Trade Channel:"])

local txtTradeChannel = CreateFrame("EditBox", nil, EPAIOFrame, "InputBoxTemplate")
txtTradeChannel:SetPoint("LEFT", lblTradeChannelText, "RIGHT", 16, 0)
txtTradeChannel:SetAutoFocus(false)
txtTradeChannel:SetWidth(32)
txtTradeChannel:SetHeight(16)
txtTradeChannel:SetMaxLetters(6)
txtTradeChannel:Show()

txtTradeChannel:SetScript("OnShow", function(frame)
local text = tonumber(EPAConfig.TradeChannel)
	txtTradeChannel:SetText(text)
end)

txtTradeChannel:SetScript("OnHide", function(frame)
	local n = tonumber(txtTradeChannel:GetText())
	EPAConfig.TradeChannel = n
end)

local cdmtitle = EPAIOFrame:CreateFontString(nil, nil, "GameFontNormalLarge")
cdmtitle:SetPoint("TOPLEFT", lblTradeChannelText, "BOTTOMLEFT", 0, -16)
cdmtitle:SetText(L["Cooldown Monitor"])

if IsAddOnLoaded("EPA-CooldownMonitor") == false then
	local cdmmissing = EPAIOFrame:CreateFontString(nil, nil, "GameFontHighlight")
	cdmmissing:SetPoint("TOPLEFT", cdmtitle, "BOTTOMLEFT", 0, -16)
	cdmmissing:SetText(L["Cooldown Monitor is missing or not enabled."])
elseif IsAddOnLoaded("EPA-CooldownMonitor") == true then
	local chkReadySound = CreateFrame("CheckButton", nil, EPAIOFrame, "OptionsBaseCheckButtonTemplate")
	chkReadySound:SetPoint("TOPLEFT", cdmtitle, "BOTTOMLEFT", 0, -16)
	
	chkReadySound:SetScript("OnShow", function(frame)
		if EPAConfig.ReadySound == "YES" then
			chkReadySound:SetChecked(true)
		elseif EPAConfig.ReadySound == "NO" then
			chkReadySound:SetChecked(false)
		end
	end)

	chkReadySound:SetScript("OnClick", function(frame)
	local tick = frame:GetChecked()
	
	if tick == false then
		EPAConfig.ReadySound = 'NO'
		DEFAULT_CHAT_FRAME:AddMessage("|cFF00FFFF[" .. L["Easy Portal Advert"] .."]|r " .. L["The cooldown alert sound has been disabled."])
	elseif tick == true then
		EPAConfig.ReadySound = 'YES'
		DEFAULT_CHAT_FRAME:AddMessage("|cFF00FFFF[" .. L["Easy Portal Advert"] .."]|r " .. L["The cooldown alert sound has been enabled."])
	end
end)

	local chkReadySoundText = EPAIOFrame:CreateFontString(nil, nil, "GameFontHighlight")
	chkReadySoundText:SetPoint("LEFT", chkReadySound, "RIGHT", 0, 1)
	chkReadySoundText:SetText("Play a sound when a spell finishes its cooldown")
end

local rmtitle = EPAIOFrame:CreateFontString(nil, nil, "GameFontNormalLarge")
rmtitle:SetPoint("TOPLEFT", cdmtitle, "BOTTOMLEFT", 0, -48)
rmtitle:SetText(L["Reagent Monitor"])

if IsAddOnLoaded("EPA-ReagentMonitor") == false then
	local rmmissing = EPAIOFrame:CreateFontString(nil, nil, "GameFontHighlight")
	rmmissing:SetPoint("TOPLEFT", rmtitle, "BOTTOMLEFT", 0, -16)
	rmmissing:SetText(L["Reagent Monitor is missing or not enabled."])
elseif IsAddOnLoaded("EPA-ReagentMonitor") == true then

-- Font Size

local lblEPAFontSizeText = EPAIOFrame:CreateFontString(nil, nil, "GameFontHighlight")
lblEPAFontSizeText:SetPoint("TOPLEFT", rmtitle, "BOTTOMLEFT", 0, -16)
lblEPAFontSizeText:SetText(L["Font size:"])

--local ddFontSize = CreateFrame("Frame", "GTFontSize", EPAIOFrame, "UIDropDownMenuTemplate")

-- Create the dropdown, and configure its appearance
local ddFBSFontSize = CreateFrame("FRAME", "FBSFontSize", EPAIOFrame, "UIDropDownMenuTemplate")
ddFBSFontSize:SetPoint("LEFT", lblEPAFontSizeText, "RIGHT", 0, 1)
if GetLocale() == "frFR" then
	UIDropDownMenu_SetWidth(ddFBSFontSize, 128)
else
	UIDropDownMenu_SetWidth(ddFBSFontSize, 96)
end
UIDropDownMenu_SetText(ddFBSFontSize, L["Select One"])

-- Create and bind the initialization function to the dropdown menu
UIDropDownMenu_Initialize(ddFBSFontSize, function(self, level, menuList)
local info = UIDropDownMenu_CreateInfo()
	info.func = self.SetValue
	info.text, info.arg1 = "12", 12
	UIDropDownMenu_AddButton(info)
	info.text, info.arg1 = "14", 14
	UIDropDownMenu_AddButton(info)
	info.text, info.arg1 = "16", 16
	UIDropDownMenu_AddButton(info)
	info.text, info.arg1 = "18", 18
	UIDropDownMenu_AddButton(info)
	info.text, info.arg1 = "20", 20
	UIDropDownMenu_AddButton(info)
end)

-- Implement the function to change the font size
function ddFBSFontSize:SetValue(newValue)
	EPAConfig.FontSize = newValue
	DEFAULT_CHAT_FRAME:AddMessage("|cFF00AA00[" .. L["Easy Portal Advert"] .. "]|r " .. L["Font size changed to"] .. " " .. newValue .. ".")
	UpdateFonts()
	-- Update the text; if we merely wanted it to display newValue, we would not need to do this
	UIDropDownMenu_SetText(ddFBSFontSize, EPAConfig.FontSize)
	-- Because this is called from a sub-menu, only that menu level is closed by default.
	-- Close the entire menu with this next call
	CloseDropDownMenus()
end

end

-- Discord Info

local DiscordLogo = EPAIOFrame:CreateTexture(nil, "ARTWORK")
DiscordLogo:SetPoint("TOPLEFT", rmtitle, "BOTTOMLEFT", 0, -52)
DiscordLogo:SetSize(16, 16)
DiscordLogo:SetTexture("Interface\\AddOns\\EasyPortalAdvert\\Textures\\DiscordLogo.tga")

local lblDiscord = EPAIOFrame:CreateFontString(nil, nil, "GameFontHighlight")
lblDiscord:SetPoint("LEFT", DiscordLogo, "RIGHT", 4, 0)
lblDiscord:SetText("|cFFEFC502https://discord.gg/BGKnpza|r")

-- Twitter Info

local TwitterLogo = EPAIOFrame:CreateTexture(nil, "ARTWORK")
TwitterLogo:SetPoint("TOPLEFT", DiscordLogo, "BOTTOMLEFT", 0, -8)
TwitterLogo:SetSize(16, 16)
TwitterLogo:SetTexture("Interface\\AddOns\\EasyPortalAdvert\\Textures\\TwitterLogo.tga")

local lblTwitter = EPAIOFrame:CreateFontString(nil, nil, "GameFontHighlight")
lblTwitter:SetPoint("LEFT", TwitterLogo, "RIGHT", 4, 0)
lblTwitter:SetText("|cFFEFC502@GeodesicDragon|r")

-- END OF CONFIG WINDOW

InterfaceOptions_AddCategory(EPAIOFrame)

function EPAUpdateFonts()
	LightFeatherIcon:SetSize(tonumber(EPAConfig.FontSize), tonumber(EPAConfig.FontSize))
	RuneOfTeleportationIcon:SetSize(tonumber(EPAConfig.FontSize), tonumber(EPAConfig.FontSize))
	RuneOfPortalsIcon:SetSize(tonumber(EPAConfig.FontSize), tonumber(EPAConfig.FontSize))
	LightFeatherText:SetSize(tonumber(EPAConfig.FontSize), tonumber(EPAConfig.FontSize))
	RuneOfTeleportationText:SetSize(tonumber(EPAConfig.FontSize), tonumber(EPAConfig.FontSize))
	RuneOfPortalsText:SetSize(tonumber(EPAConfig.FontSize), tonumber(EPAConfig.FontSize))
end