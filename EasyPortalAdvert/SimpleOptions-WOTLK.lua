-- LOCALISATION

local AddonName, AddonTable = ...
local L = AddonTable.Localize
local AddonTitle = select(2, GetAddOnInfo(AddonName))
local PlainAddonTitle = AddonTitle:gsub("|c........", ""):gsub("|r", "")

-- START OF OPTIONS WINDOW

local EPAIOFrame = CreateFrame("Frame")
EPAIOFrame.name = L["Easy Portal Advert"]

local lblTitle = EPAIOFrame:CreateFontString(nil, nil, "GameFontNormalLarge")
--lblTitle:SetFont("Fonts\\FRIZQT__.TTF", 12)
lblTitle:SetPoint("TOPLEFT", EPAIOFrame, "TOPLEFT", 12, -12)
lblTitle:SetText(L["Easy Portal Advert"] .. " v" .. GetAddOnMetadata("EasyPortalAdvert","Version"))

-- Advert Type

local lblAdvertTypeText = EPAIOFrame:CreateFontString(nil, nil, "GameFontHighlight")
lblAdvertTypeText:SetPoint("TOPLEFT", lblTitle, "BOTTOMLEFT", 0, -16)
lblAdvertTypeText:SetText(L["Advert type:"])

--local ddFontSize = CreateFrame("Frame", "GTFontSize", EPAIOFrame, "UIDropDownMenuTemplate")

-- Create the dropdown, and configure its appearance
local ddAdvertType = CreateFrame("FRAME", "EPAFontSize", EPAIOFrame, "UIDropDownMenuTemplate")
ddAdvertType:SetPoint("LEFT", lblAdvertTypeText, "RIGHT", 0, 1)
UIDropDownMenu_SetWidth(ddAdvertType, 128)
UIDropDownMenu_SetText(ddAdvertType, L["Select One"])

-- Create and bind the initialization function to the dropdown menu
UIDropDownMenu_Initialize(ddAdvertType, function(self, level, menuList)
local info = UIDropDownMenu_CreateInfo()
	info.func = self.SetValue
	info.text, info.arg1 = "Free Portals", "FREE"
	UIDropDownMenu_AddButton(info)
	info.text, info.arg1 = "Set Price", "SET"
	UIDropDownMenu_AddButton(info)
	info.text, info.arg1 = "Pay What You Want", "PWYW"
	UIDropDownMenu_AddButton(info)
end)

-- Implement the function to change the font size
function ddAdvertType:SetValue(newValue)
	EasyPortalAdvert.AdvertType = newValue
	DEFAULT_CHAT_FRAME:AddMessage("|cFF00AA00[" .. L["Easy Portal Advert"] .. "]|r " .. L["Advert type changed to"] .. " " .. newValue .. ".")
	UpdateEPAIcons()
	-- Update the text; if we merely wanted it to display newValue, we would not need to do this
	UIDropDownMenu_SetText(ddAdvertType, EasyPortalAdvert.AdvertType)
	-- Because this is called from a sub-menu, only that menu level is closed by default.
	-- Close the entire menu with this next call
	CloseDropDownMenus()
end

-- Portal Price Editbox

local lblPortalPriceText = EPAIOFrame:CreateFontString(nil, nil, "GameFontHighlight")
lblPortalPriceText:SetPoint("TOPLEFT", lblAdvertTypeText, "BOTTOMLEFT", 0, -16)
lblPortalPriceText:SetText(L["Portal Price:"])

local txtPortalPrice = CreateFrame("EditBox", nil, EPAIOFrame, "InputBoxTemplate")
txtPortalPrice:SetPoint("LEFT", lblPortalPriceText, "RIGHT", 16, 0)
txtPortalPrice:SetAutoFocus(false)
txtPortalPrice:SetWidth(64)
txtPortalPrice:SetHeight(16)
txtPortalPrice:Show()
txtPortalPrice:Enable(true)

txtPortalPrice:SetScript("OnShow", function(frame)
	local text = EasyPortalAdvert.PortalPrice
	txtPortalPrice:SetText(text)
end)

txtPortalPrice:SetScript("OnTextChanged", function(frame)
	local n = txtPortalPrice:GetText()
	if n == nil or n == "" then
		EasyPortalAdvert.PortalPrice = '0'
	elseif n >= "1" then
		EasyPortalAdvert.PortalPrice = n
	end
	createadvert()
end)

-- Trade Channel Editbox

local lblTradeChannelText = EPAIOFrame:CreateFontString(nil, nil, "GameFontHighlight")
lblTradeChannelText:SetPoint("TOPLEFT", lblPortalPriceText, "BOTTOMLEFT", 0, -16)
lblTradeChannelText:SetText(L["Trade Channel:"])

local txtTradeChannel = CreateFrame("EditBox", nil, EPAIOFrame, "InputBoxTemplate")
txtTradeChannel:SetPoint("LEFT", lblTradeChannelText, "RIGHT", 16, 0)
txtTradeChannel:SetAutoFocus(false)
txtTradeChannel:SetWidth(64)
txtTradeChannel:SetHeight(16)
txtTradeChannel:Show()
txtTradeChannel:Enable(true)

txtTradeChannel:SetScript("OnShow", function(frame)
	local text = EasyPortalAdvert.TradeChannel
	txtTradeChannel:SetText(text)
end)

txtTradeChannel:SetScript("OnTextChanged", function(frame)
	local n = txtTradeChannel:GetText()
	
	if n == nil or n == "" then
		EasyPortalAdvert.TradeChannel = '2'
	elseif n >= "1" then
		EasyPortalAdvert.TradeChannel = n
	end
end)

-- Save Settings Button

local btnSaveAll = CreateFrame("Button", nil, EPAIOFrame, "UIPanelButtonTemplate")
btnSaveAll:SetSize(192,32)
btnSaveAll:SetPoint("TOPLEFT", lblTradeChannelText, "BOTTOMLEFT", 0, -16)
btnSaveAll:SetScript("OnClick", function(frame)

local price = txtPortalPrice:GetText()
local trade = txtTradeChannel:GetText()

EasyPortalAdvert.PortalPrice = price
EasyPortalAdvert.TradeChannel = trade

DEFAULT_CHAT_FRAME:AddMessage("|cFF00FFFF[" .. L["Easy Portal Advert"] .."]|r Settings saved.")

end)
btnSaveAll:SetText(L["Save Settings"])

-- Cooldown Monitor Settings

local cdmtitle = EPAIOFrame:CreateFontString(nil, nil, "GameFontNormalLarge")
cdmtitle:SetPoint("TOPLEFT", btnSaveAll, "BOTTOMLEFT", 0, -16)
cdmtitle:SetText(L["Cooldown Monitor"])

if IsAddOnLoaded("EPA-CooldownMonitor") == false then
	local cdmmissing = EPAIOFrame:CreateFontString(nil, nil, "GameFontHighlight")
	cdmmissing:SetPoint("TOPLEFT", cdmtitle, "BOTTOMLEFT", 0, -16)
	cdmmissing:SetText(L["Cooldown Monitor is missing or not enabled."])
elseif IsAddOnLoaded("EPA-CooldownMonitor") == true then
	local chkReadySound = CreateFrame("CheckButton", nil, EPAIOFrame, "OptionsBaseCheckButtonTemplate")
	chkReadySound:SetPoint("TOPLEFT", cdmtitle, "BOTTOMLEFT", 0, -16)
	
	chkReadySound:SetScript("OnShow", function(frame)
		if EasyPortalAdvert.ReadySound == "YES" then
			chkReadySound:SetChecked(true)
		elseif EasyPortalAdvert.ReadySound == "NO" then
			chkReadySound:SetChecked(false)
		end
	end)

	chkReadySound:SetScript("OnClick", function(frame)
	local tick = frame:GetChecked()
	
	if tick == false then
		EasyPortalAdvert.ReadySound = 'NO'
		DEFAULT_CHAT_FRAME:AddMessage("|cFF00FFFF[" .. L["Easy Portal Advert"] .."]|r " .. L["The cooldown alert sound has been disabled."])
	elseif tick == true then
		EasyPortalAdvert.ReadySound = 'YES'
		DEFAULT_CHAT_FRAME:AddMessage("|cFF00FFFF[" .. L["Easy Portal Advert"] .."]|r " .. L["The cooldown alert sound has been enabled."])
	end
end)

	local chkReadySoundText = EPAIOFrame:CreateFontString(nil, nil, "GameFontHighlight")
	chkReadySoundText:SetPoint("LEFT", chkReadySound, "RIGHT", 0, 1)
	chkReadySoundText:SetText("Play a sound when a spell finishes its cooldown")
end

-- Reagent Monitor Settings

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
local ddEPAFontSize = CreateFrame("FRAME", "EPAFontSize", EPAIOFrame, "UIDropDownMenuTemplate")
ddEPAFontSize:SetPoint("LEFT", lblEPAFontSizeText, "RIGHT", 0, 1)
UIDropDownMenu_SetWidth(ddEPAFontSize, 128)
UIDropDownMenu_SetText(ddEPAFontSize, L["Select One"])

-- Create and bind the initialization function to the dropdown menu
UIDropDownMenu_Initialize(ddEPAFontSize, function(self, level, menuList)
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
function ddEPAFontSize:SetValue(newValue)
	EasyPortalAdvert.FontSize = newValue
	DEFAULT_CHAT_FRAME:AddMessage("|cFF00AA00[" .. L["Easy Portal Advert"] .. "]|r " .. L["Font size changed to"] .. " " .. newValue .. ".")
	UpdateEPAIcons()
	-- Update the text; if we merely wanted it to display newValue, we would not need to do this
	UIDropDownMenu_SetText(ddEPAFontSize, EasyPortalAdvert.FontSize)
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