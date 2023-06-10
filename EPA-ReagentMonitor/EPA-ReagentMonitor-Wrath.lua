-- LOCALISATION

local AddonName, AddonTable = ...
local L = AddonTable.Localize
local AddonTitle = select(2, GetAddOnInfo(AddonName))
local PlainAddonTitle = AddonTitle:gsub("|c........", ""):gsub("|r", "")

-- MOVEABLE FRAME

local EPARMFrame = CreateFrame("Frame", "EPAReagentMonitorFrame", UIParent)
EPARMFrame:SetSize(176, 48) -- WxH
EPARMFrame:SetPoint("CENTER")
EPARMFrame:SetClampedToScreen(true)
EPARMFrame:EnableMouse(true)
EPARMFrame:SetMovable(true)
EPARMFrame:RegisterForDrag("LeftButton")
EPARMFrame:SetScript("OnDragStart", function(self) self:StartMoving() end)
EPARMFrame:SetScript("OnDragStop", function(self) self:StopMovingOrSizing() end)
EPARMFrame:SetUserPlaced(true)
local bg = EPARMFrame:CreateTexture()
bg:SetAllPoints(EPARMFrame)
--bg:SetColorTexture(0, 0, 0, 1)

local LightFeatherIcon = EPARMFrame:CreateTexture(nil, "ARTWORK")
LightFeatherIcon:SetPoint("TOPLEFT", 16, -16)
LightFeatherIcon:SetSize(20,20)
LightFeatherIcon:SetTexture("Interface\\AddOns\\EPA-ReagentMonitor\\Textures\\LightFeather.tga")

local LightFeatherText = EPARMFrame:CreateFontString(nil, nil, "GameFontHighlight")
LightFeatherText:SetPoint("LEFT", LightFeatherIcon, "RIGHT", 8, 0)
LightFeatherText:SetFont("Fonts\\FRIZQT__.ttf", 14)

local RuneOfTeleportationIcon = EPARMFrame:CreateTexture(nil, "ARTWORK")
--RuneOfTeleportationIcon:SetPoint("TOPLEFT", LightFeatherIcon, "BOTTOMLEFT", 0, -16)
RuneOfTeleportationIcon:SetPoint("LEFT", LightFeatherText, "RIGHT", 16, 0)
RuneOfTeleportationIcon:SetSize(20,20)
RuneOfTeleportationIcon:SetTexture("Interface\\AddOns\\EPA-ReagentMonitor\\Textures\\RuneOfTeleportation.tga")

local RuneOfTeleportationText = EPARMFrame:CreateFontString(nil, nil, "GameFontHighlight")
RuneOfTeleportationText:SetPoint("LEFT", RuneOfTeleportationIcon, "RIGHT", 8, 0)
RuneOfTeleportationText:SetFont("Fonts\\FRIZQT__.ttf", 14)

local RuneOfPortalsIcon = EPARMFrame:CreateTexture(nil, "ARTWORK")
--RuneOfPortalsIcon:SetPoint("TOPLEFT", RuneOfTeleportationIcon, "BOTTOMLEFT", 0, -16)
RuneOfPortalsIcon:SetPoint("LEFT", RuneOfTeleportationText, "RIGHT", 16, 0)
RuneOfPortalsIcon:SetSize(20,20)
RuneOfPortalsIcon:SetTexture("Interface\\AddOns\\EPA-ReagentMonitor\\Textures\\RuneOfPortals.tga")

local RuneOfPortalsText = EPARMFrame:CreateFontString(nil, nil, "GameFontHighlight")
RuneOfPortalsText:SetPoint("LEFT", RuneOfPortalsIcon, "RIGHT", 8, 0)
RuneOfPortalsText:SetFont("Fonts\\FRIZQT__.ttf", 14)

EPARMFrame:RegisterEvent("BAG_UPDATE")
EPARMFrame:RegisterEvent("BAG_UPDATE_COOLDOWN")
EPARMFrame:RegisterEvent("BAG_UPDATE_DELAYED")
EPARMFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
EPARMFrame:RegisterEvent("UNIT_INVENTORY_CHANGED")

-- FRAME EVENT SCRIPT

local function EPARMEventHandler(self, event, arg1)

	if event == "BAG_UPDATE" or event == "BAG_UPDATE_COOLDOWN" or event == "BAG_UPDATE_DELAYED" or event == "PLAYER_ENTERING_WORLD" or event == "UNIT_INVENTORY_CHANGED" then
		local LightFeatherCount = GetItemCount(17056)
		local RuneOfTeleportationCount = GetItemCount(17031)
		local RuneOfPortalsCount = GetItemCount(17032)

		LightFeatherText:SetText(LightFeatherCount)
		RuneOfTeleportationText:SetText(RuneOfTeleportationCount)
		RuneOfPortalsText:SetText(RuneOfPortalsCount)
	end

end

EPARMFrame:SetScript("OnEvent", EPARMEventHandler)