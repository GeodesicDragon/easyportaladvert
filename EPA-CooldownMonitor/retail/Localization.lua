-- To update a translation please use the localization utility at:
-- http://wow.curseforge.com/addons/easy-portal-adver/localization/
-- Once done, please contact GeodesicDragon to inform him of the changes you have made.

local AddonName, a = ...
a.Localize = setmetatable({}, {__index = function(_, key) return key end})
local L = a.Localize

-- Example:
L["English text goes here."] = "Translated text goes here."

if GetLocale() == "ptBR" then -- Brazilian Portuguese
L["Cooldown Monitor"] = "Monitor de Cooldown"
L[" has finished its cooldown."] = "terminou o cooldown."
elseif GetLocale() == "frFR" then -- French
L["Cooldown Monitor"] = "Moniteur Cooldown" -- Needs review
L[" has finished its cooldown."] = " a terminé son temps de recharge." -- Needs review
elseif GetLocale() == "deDE" then -- German
L["Cooldown Monitor"] = "Aufladezeit-Monitor" -- Needs review
L[" has finished its cooldown."] = " hat seine Abklingzeit beendet." -- Needs review
elseif GetLocale() == "itIT" then -- Italian
-- L["Cooldown Monitor"] = ""
-- L[" has finished its cooldown."] = ""
elseif GetLocale() == "koKR" then -- Korean
-- L["Cooldown Monitor"] = ""
-- L[" has finished its cooldown."] = ""
elseif GetLocale() == "esMX" then -- Latin American Spanish
-- L["Cooldown Monitor"] = ""
-- L[" has finished its cooldown."] = ""
elseif GetLocale() == "ruRU" then -- Russian
-- L["Cooldown Monitor"] = ""
-- L[" has finished its cooldown."] = ""
elseif GetLocale() == "zhCN" then -- Simplified Chinese
-- L["Cooldown Monitor"] = ""
-- L[" has finished its cooldown."] = ""
elseif GetLocale() == "esES" then -- Spanish
-- L["Cooldown Monitor"] = ""
-- L[" has finished its cooldown."] = ""
elseif GetLocale() == "zhTW" then -- Traditional Chinese
-- L["Cooldown Monitor"] = ""
-- L[" has finished its cooldown."] = ""
end