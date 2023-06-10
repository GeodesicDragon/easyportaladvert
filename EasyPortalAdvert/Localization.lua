-- To update a translation please use the localization utility at:
-- http://wow.curseforge.com/addons/easy-portal-adver/localization/
-- Once done, please contact GeodesicDragon to inform him of the changes you have made.
-- TRANSLATORS
-- Brazilian Portugese: Markllan
-- French: GeodesicDragon (using Google)
-- German: GeodesicDragon (using Google)

local AddonName, a = ...
a.Localize = setmetatable({}, {__index = function(_, key) return key end})
local L = a.Localize

-- Example:
L["English text goes here."] = "Translated text goes here."

if GetLocale() == "ptBR" then -- Brazilian Portuguese
L[" has finished its cooldown."] = "terminou o cooldown."
L[" is currently using the following settings"] = "está atualmente usando a seguinte configuração"
L[" loaded successfully."] = "carregado com sucesso."
L["Alert sound changed to"] = "Alerta som também mudou"
L["ALERT SOUND SETTINGS"] = "CONFIGURAÇÕES DE ALERTAS SONOROS"
L["All of your portals are now"] = "Todos os seus portais agora são"
L["All of your portals are now free"] = "Todos os seus portais agora são gratuitos"
L["All of your portals are now set to Pay What You Want"] = "Todos os seus portais estão no modo Pague o Valor Desejado"
L["CHANNEL SETTINGS"] = "Configurações do Canal"
L["Command List"] = "Lista de Comandos"
L["Cooldown Monitor"] = "Monitor de Cooldown"
L["Cooldown Monitor is disabled"] = "Monitor de Cooldown está desativado"
L["Cooldown Monitor is enabled"] = "Monitor de Cooldown está ativado"
L["Cost of all portals"] = "Custo de todos os portais"
L["create"] = "criar"
L["DISPLAYING ADVERTS"] = "MOSTRANDO ANÙNCIOS"
L["Displays the current settings being used by the addon"] = "Mostra as configurações atuais sendo usadas pelo addOn"
L["Displays your advert in Trade chat"] = "Mostra seu anúncio no Chat de Troca"
L["Easy Portal Advert"] = "Easy Portal Advert"
L["Error"] = "Erro"
L["Forces the addon to recreate your advert"] = "Força o addOn recriar o seu anúncio"
L["Free portals!"] = "Portais Grátis!"
L["help"] = "ajuda"
L["info"] = "info"
L["Only Mages can use this addon."] = "Apenas magos podem usar este addOn"
L["OTHER COMMANDS"] = "OUTROS COMANDOS"
L["Pay What You Want portal service available!"] = "Pague o Valor Desejado por portal modo disponível!"
L["Please enter a price"] = "Por favor, entre com um preço"
L["Please enter a value between 1 and 3."] = "Por favor, coloque um valor entre 1 e 3"
L["Please use one of the following arguments:"] = "Por favor, use um dos seguintes argumentos:"
L["Portals available for "] = "Portais disponíveis por "
L["Preview one of the 3 alert sounds"] = "Visualizar um dos 3 alertas sonoros"
L["price"] = "preço"
L["PRICE SETTINGS"] = "CONFIGURAÇÃO DE PREÇOS"
L["Quickly leave your current party"] = "Sair rapidamente do seu grupo atual"
L["Set the price for all of your portals"] = "Selecione o preço de todos os seus portais"
L["sound"] = "som"
L["Tells the addon what channel number to use for Trade chat (usually 2)"] = "Avisa ao addOn qual o número do canal para ser usado como chat de troca (normalmente 2)"
L["Tells the addon which sound to play when a portal finishes its cooldown (unless this feature is disabled)"] = "Avisa ao addOn qual som tocar quando o portal terminar o cooldown (ao menos que esta função esteja desativada)"
L["The cooldown alert sound has been disabled."] = "O som alerta de cooldown foi desativado."
L["The cooldown alert sound has been enabled."] = "O som alerta de cooldown foi ativado."
L["Toggles the cooldown alert sound on or off"] = "Altera o som de alerta do cooldown ativo ou desativado"
L["Trade Channel"] = "Canal de Troca"
L["Trade Channel number changed to"] = "Número do canal de trocas  também mudou"
L["Your advert"] = "Seu anúncio"
L["Your alert sound is"] = "Seu som de alerta é"
elseif GetLocale() == "frFR" then -- French
L["Alert sound changed to"] = "Alerte sonore changé:" -- Needs review
L["ALERT SOUND SETTINGS"] = "SONNE PARAMÈTRES" -- Needs review
L["All of your portals are now"] = "Tous les portails sont maintenant" -- Needs review
L["All of your portals are now free"] = "Tous les portails sont maintenant libres" -- Needs review
L["All of your portals are now set to Pay What You Want"] = "Tous les portails sont maintenant mis à payer ce que vous voulez" -- Needs review
L["CHANNEL SETTINGS"] = "PARAMÈTRES DES CANAUX" -- Needs review
L["Command List"] = "Liste des commandes" -- Needs review
L["Cooldown Monitor"] = "Moniteur Cooldown" -- Needs review
L["Cooldown Monitor is disabled"] = "Moniteur Cooldown est desactivé" -- Needs review
L["Cooldown Monitor is enabled"] = "Moniteur Cooldown est activé" -- Needs review
L["Cost of all portals"] = "Coût de tous les portails" -- Needs review
L["create"] = "créer" -- Needs review
L["DISPLAYING ADVERTS"] = "AFFICHAGE ADVERTS" -- Needs review
L["Displays the current settings being used by the addon"] = "Affiche les paramètres actuels utilisés par l'addon" -- Needs review
L["Displays your advert in Trade chat"] = "Affiche votre annonce dans le chat du commerce" -- Needs review
L["Easy Portal Advert"] = "Portal Facile Annonce" -- Needs review
L["Error"] = "Erreur"
L["Forces the addon to recreate your advert"] = "Force l'addon pour recréer votre annonce" -- Needs review
L["Free portals!"] = "Portails gratuits!" -- Needs review
L[" has finished its cooldown."] = "a terminé son temps de recharge." -- Needs review
L["help"] = "aidez"
L["info"] = "info"
L[" is currently using the following settings"] = "L'addon utilise actuellement les paramètres suivants" -- Needs review
L[" loaded successfully."] = " chargé avec succès."
L["Only Mages can use this addon."] = "Seuls les mages peuvent utiliser cet addon." -- Needs review
L["OTHER COMMANDS"] = "AUTRES COMMANDEMENTS" -- Needs review
L["Pay What You Want portal service available!"] = "Payez ce que vous voulez service de portail disponible!" -- Needs review
L["Please enter a price"] = "S'il vous plaît entrer un prix" -- Needs review
L["Please enter a value between 1 and 3."] = "S'il vous plaît entrer une valeur comprise entre 1 et 3." -- Needs review
L["Please use one of the following arguments:"] = "S'il vous plaît utiliser des l'un arguments suivants:" -- Needs review
L["Portals available for "] = "Portails disponibles pour " -- Needs review
L["Preview one of the 3 alert sounds"] = "Aperçu des trois sons d'alerte" -- Needs review
L["price"] = "prix"
L["PRICE SETTINGS"] = "PRIX DE PARAMÈTRES" -- Needs review
L["Quickly leave your current party"] = "Quitter rapidement votre parti actuel" -- Needs review
L["Set the price for all of your portals"] = "Fixer le prix pour l'ensemble de vos portails"
L["sound"] = "sonner"
L["Tells the addon what channel number to use for Trade chat (usually 2)"] = "Raconte l'addon quel canal numéro à utiliser pour le commerce du bavarder (généralement 2)" -- Needs review
L["Tells the addon which sound to play when a portal finishes its cooldown (unless this feature is disabled)"] = "Raconte l'addon qui sonne à jouer quand un portail termine son cooldown (à moins que cette fonction est désactivée)" -- Needs review
L["The cooldown alert sound has been disabled."] = "L'alerte sonore cooldown a été désactivé." -- Needs review
L["The cooldown alert sound has been enabled."] = "L'alerte sonore cooldown a été activé." -- Needs review
L["Toggles the cooldown alert sound on or off"] = "Active ou désactive le son alerte cooldown" -- Needs review
L["Trade Channel"] = "Canal du commerce" -- Needs review
L["Trade Channel number changed to"] = "Numéro de canal du commerce changé" -- Needs review
L["Your advert"] = "Votre annonce" -- Needs review
L["Your alert sound is"] = "Votre alerte sonore est" -- Needs review
elseif GetLocale() == "deDE" then -- German
L["Alert sound changed to"] = "Alert-Sound geändert" -- Needs review
L["ALERT SOUND SETTINGS"] = "ALERT TONEINSTELLUNGEN" -- Needs review
L["All of your portals are now"] = "Alle Ihre Portale sind jetzt" -- Needs review
L["All of your portals are now free"] = "Alle Ihre Portale sind jetzt frei"
L["All of your portals are now set to Pay What You Want"] = "Alle Ihre Portale sind nun eingestellt zu zahlen was Sie wollen" -- Needs review
L["CHANNEL SETTINGS"] = "KANALEINSTELLUNGEN" -- Needs review
L["Command List"] = "Befehlsliste"
L["Cooldown Monitor"] = "Aufladezeit-Monitor" -- Needs review
L["Cooldown Monitor is disabled"] = "Die Abklingzeit wurde Monitor deaktiviert" -- Needs review
L["Cooldown Monitor is enabled"] = "Die Abklingzeit wurde Monitor aktiviert" -- Needs review
L["Cost of all portals"] = "Kosten aller Portale" -- Needs review
L["create"] = "erstellen"
L["DISPLAYING ADVERTS"] = "ZEIGE ANZEIGEN" -- Needs review
L["Displays the current settings being used by the addon"] = "Zeigt die aktuellen Einstellungen durch das Addon verwendet wird" -- Needs review
L["Displays your advert in Trade chat"] = "Zeigt Ihre Anzeige in den Handelskanal " -- Needs review
L["Easy Portal Advert"] = "Einfache Portal Werbung"
L["Error"] = "Fehler"
L["Forces the addon to recreate your advert"] = "Zwingt das addon Ihre Anzeige zu erstellen" -- Needs review
L["Free portals!"] = "Gratis-Portale!" -- Needs review
L[" has finished its cooldown."] = " hat seine Abklingzeit beendet." -- Needs review
L["help"] = "Hilfe"
L["info"] = "info" -- Needs review
L[" is currently using the following settings"] = " derzeit verwendet die folgenden Einstellungen" -- Needs review
L[" loaded successfully."] = " erfolgreich geladen."
L["Only Mages can use this addon."] = "Nur Mages dieses Addon verwenden." -- Needs review
L["OTHER COMMANDS"] = "ANDERE BEFEHLE" -- Needs review
L["Pay What You Want portal service available!"] = "Bezahlen was Sie Portal-Service zur Verfügung wünschen!" -- Needs review
L["Please enter a price"] = "Bitte geben Sie einen Preis"
L["Please enter a value between 1 and 3."] = "Bitte gib einen Wert zwischen 1 und 3 ein."
L["Please use one of the following arguments:"] = "Bitte nutzen Sie eine der folgenden Argumente:" -- Needs review
L["Portals available for "] = "Portale zur Verfügung: " -- Needs review
L["Preview one of the 3 alert sounds"] = "vorschau 1 der 3 Warntöne" -- Needs review
L["price"] = "preis"
L["PRICE SETTINGS"] = "PREISEINSTELLUNGEN" -- Needs review
L["Quickly leave your current party"] = "Rasch Ihre aktuelle Partei verlassen" -- Needs review
L["Set the price for all of your portals"] = "Setzen Sie den Preis für alle Ihre Portale"
L["sound"] = "klingen"
L["Tells the addon what channel number to use for Trade chat (usually 2)"] = "Teilt dem addon was Kanalnummer zu verwenden für den Handel Chat (in der Regel 2)"
L["Tells the addon which sound to play when a portal finishes its cooldown (unless this feature is disabled)"] = "Erzählt das Addon welche klingt zu spielen, wenn ein Zauber beendet seine Abklingzeit (es sei denn, Behinderte)" -- Needs review
L["The cooldown alert sound has been disabled."] = "Die Abklingzeit Alarmton wurde deaktiviert." -- Needs review
L["The cooldown alert sound has been enabled."] = "Die Abklingzeit Alarmton wurde aktiviert." -- Needs review
L["Toggles the cooldown alert sound on or off"] = "Schaltet die Abklingzeit Warnton ein-oder ausgeschaltet" -- Needs review
L["Trade Channel"] = "Handelskanal " -- Needs review
L["Trade Channel number changed to"] = "Handel Kanalnummer geändert" -- Needs review
L["Your advert"] = "Ihre Anzeige" -- Needs review
L["Your alert sound is"] = "Ihr Alarmton ist" -- Needs review
elseif GetLocale() == "itIT" then -- Italian
-- L["Alert sound changed to"] = ""
-- L["ALERT SOUND SETTINGS"] = ""
-- L["All of your portals are now"] = ""
-- L["All of your portals are now free"] = ""
-- L["All of your portals are now set to Pay What You Want"] = ""
-- L["CHANNEL SETTINGS"] = ""
-- L["Command List"] = ""
-- L["Cooldown Monitor"] = ""
-- L["Cooldown Monitor is disabled"] = ""
-- L["Cooldown Monitor is enabled"] = ""
-- L["Cost of all portals"] = ""
-- L["create"] = ""
-- L["DISPLAYING ADVERTS"] = ""
-- L["Displays the current settings being used by the addon."] = ""
-- L["Displays your advert in Trade chat"] = ""
-- L["Easy Portal Advert"] = ""
-- L["EPA is currently using the following settings"] = ""
-- L["Error"] = ""
-- L["Forces the addon to recreate your advert"] = ""
-- L["Free portals!"] = ""
-- L[" has finished its cooldown."] = ""
-- L["help"] = ""
-- L["info"] = ""
-- L[" loaded successfully."] = ""
-- L["Only Mages can use this addon."] = ""
-- L["OTHER COMMANDS"] = ""
-- L["Pay What You Want portal service available!"] = ""
-- L["Please enter a price"] = ""
-- L["Please enter a value between 1 and 3."] = ""
-- L["Please use one of the following arguments:"] = ""
-- L["Portals available for "] = ""
-- L["Preview one of the 3 alert sounds"] = ""
-- L["price"] = ""
-- L["PRICE SETTINGS"] = ""
-- L["Quickly leave your current party"] = ""
-- L["Set the price for all of your portals"] = ""
-- L["sound"] = ""
-- L["Tells the addon what channel number to use for Trade chat (usually 2)"] = ""
-- L["Tells the addon which sound to play when a portal finishes its cooldown (unless this feature is disabled)"] = ""
-- L["The cooldown alert sound has been disabled."] = ""
-- L["The cooldown alert sound has been enabled."] = ""
-- L["Toggles the cooldown alert sound on or off"] = ""
-- L["Trade Channel"] = ""
-- L["Trade Channel number changed to"] = ""
-- L["Your advert"] = ""
-- L["Your alert sound is"] = ""
elseif GetLocale() == "koKR" then -- Korean
-- L["Alert sound changed to"] = ""
-- L["ALERT SOUND SETTINGS"] = ""
-- L["All of your portals are now"] = ""
-- L["All of your portals are now free"] = ""
-- L["All of your portals are now set to Pay What You Want"] = ""
-- L["CHANNEL SETTINGS"] = ""
-- L["Command List"] = ""
-- L["Cooldown Monitor"] = ""
-- L["Cooldown Monitor is disabled"] = ""
-- L["Cooldown Monitor is enabled"] = ""
-- L["Cost of all portals"] = ""
-- L["create"] = ""
-- L["DISPLAYING ADVERTS"] = ""
-- L["Displays the current settings being used by the addon."] = ""
-- L["Displays your advert in Trade chat"] = ""
-- L["Easy Portal Advert"] = ""
-- L["EPA is currently using the following settings"] = ""
-- L["Error"] = ""
-- L["Forces the addon to recreate your advert"] = ""
-- L["Free portals!"] = ""
-- L[" has finished its cooldown."] = ""
-- L["help"] = ""
-- L["info"] = ""
-- L[" loaded successfully."] = ""
-- L["Only Mages can use this addon."] = ""
-- L["OTHER COMMANDS"] = ""
-- L["Pay What You Want portal service available!"] = ""
-- L["Please enter a price"] = ""
-- L["Please enter a value between 1 and 3."] = ""
-- L["Please use one of the following arguments:"] = ""
-- L["Portals available for "] = ""
-- L["Preview one of the 3 alert sounds"] = ""
-- L["price"] = ""
-- L["PRICE SETTINGS"] = ""
-- L["Quickly leave your current party"] = ""
-- L["Set the price for all of your portals"] = ""
-- L["sound"] = ""
-- L["Tells the addon what channel number to use for Trade chat (usually 2)"] = ""
-- L["Tells the addon which sound to play when a portal finishes its cooldown (unless this feature is disabled)"] = ""
-- L["The cooldown alert sound has been disabled."] = ""
-- L["The cooldown alert sound has been enabled."] = ""
-- L["Toggles the cooldown alert sound on or off"] = ""
-- L["Trade Channel"] = ""
-- L["Trade Channel number changed to"] = ""
-- L["Your advert"] = ""
-- L["Your alert sound is"] = ""
elseif GetLocale() == "esMX" then -- Latin American Spanish
-- L["Alert sound changed to"] = ""
-- L["ALERT SOUND SETTINGS"] = ""
-- L["All of your portals are now"] = ""
-- L["All of your portals are now free"] = ""
-- L["All of your portals are now set to Pay What You Want"] = ""
-- L["CHANNEL SETTINGS"] = ""
-- L["Command List"] = ""
-- L["Cooldown Monitor"] = ""
-- L["Cooldown Monitor is disabled"] = ""
-- L["Cooldown Monitor is enabled"] = ""
-- L["Cost of all portals"] = ""
-- L["create"] = ""
-- L["DISPLAYING ADVERTS"] = ""
-- L["Displays the current settings being used by the addon."] = ""
-- L["Displays your advert in Trade chat"] = ""
-- L["Easy Portal Advert"] = ""
-- L["EPA is currently using the following settings"] = ""
-- L["Error"] = ""
-- L["Forces the addon to recreate your advert"] = ""
-- L["Free portals!"] = ""
-- L[" has finished its cooldown."] = ""
-- L["help"] = ""
-- L["info"] = ""
-- L[" loaded successfully."] = ""
-- L["Only Mages can use this addon."] = ""
-- L["OTHER COMMANDS"] = ""
-- L["Pay What You Want portal service available!"] = ""
-- L["Please enter a price"] = ""
-- L["Please enter a value between 1 and 3."] = ""
-- L["Please use one of the following arguments:"] = ""
-- L["Portals available for "] = ""
-- L["Preview one of the 3 alert sounds"] = ""
-- L["price"] = ""
-- L["PRICE SETTINGS"] = ""
-- L["Quickly leave your current party"] = ""
-- L["Set the price for all of your portals"] = ""
-- L["sound"] = ""
-- L["Tells the addon what channel number to use for Trade chat (usually 2)"] = ""
-- L["Tells the addon which sound to play when a portal finishes its cooldown (unless this feature is disabled)"] = ""
-- L["The cooldown alert sound has been disabled."] = ""
-- L["The cooldown alert sound has been enabled."] = ""
-- L["Toggles the cooldown alert sound on or off"] = ""
-- L["Trade Channel"] = ""
-- L["Trade Channel number changed to"] = ""
-- L["Your advert"] = ""
-- L["Your alert sound is"] = ""
elseif GetLocale() == "ruRU" then -- Russian
-- L["Alert sound changed to"] = ""
-- L["ALERT SOUND SETTINGS"] = ""
-- L["All of your portals are now"] = ""
-- L["All of your portals are now free"] = ""
-- L["All of your portals are now set to Pay What You Want"] = ""
-- L["CHANNEL SETTINGS"] = ""
-- L["Command List"] = ""
-- L["Cooldown Monitor"] = ""
-- L["Cooldown Monitor is disabled"] = ""
-- L["Cooldown Monitor is enabled"] = ""
-- L["Cost of all portals"] = ""
-- L["create"] = ""
-- L["DISPLAYING ADVERTS"] = ""
-- L["Displays the current settings being used by the addon."] = ""
-- L["Displays your advert in Trade chat"] = ""
-- L["Easy Portal Advert"] = ""
-- L["EPA is currently using the following settings"] = ""
-- L["Error"] = ""
-- L["Forces the addon to recreate your advert"] = ""
-- L["Free portals!"] = ""
-- L[" has finished its cooldown."] = ""
-- L["help"] = ""
-- L["info"] = ""
-- L[" loaded successfully."] = ""
-- L["Only Mages can use this addon."] = ""
-- L["OTHER COMMANDS"] = ""
-- L["Pay What You Want portal service available!"] = ""
-- L["Please enter a price"] = ""
-- L["Please enter a value between 1 and 3."] = ""
-- L["Please use one of the following arguments:"] = ""
-- L["Portals available for "] = ""
-- L["Preview one of the 3 alert sounds"] = ""
-- L["price"] = ""
-- L["PRICE SETTINGS"] = ""
-- L["Quickly leave your current party"] = ""
-- L["Set the price for all of your portals"] = ""
-- L["sound"] = ""
-- L["Tells the addon what channel number to use for Trade chat (usually 2)"] = ""
-- L["Tells the addon which sound to play when a portal finishes its cooldown (unless this feature is disabled)"] = ""
-- L["The cooldown alert sound has been disabled."] = ""
-- L["The cooldown alert sound has been enabled."] = ""
-- L["Toggles the cooldown alert sound on or off"] = ""
-- L["Trade Channel"] = ""
-- L["Trade Channel number changed to"] = ""
-- L["Your advert"] = ""
-- L["Your alert sound is"] = ""
elseif GetLocale() == "zhCN" then -- Simplified Chinese
-- L["Alert sound changed to"] = ""
-- L["ALERT SOUND SETTINGS"] = ""
-- L["All of your portals are now"] = ""
-- L["All of your portals are now free"] = ""
-- L["All of your portals are now set to Pay What You Want"] = ""
-- L["CHANNEL SETTINGS"] = ""
-- L["Command List"] = ""
-- L["Cooldown Monitor"] = ""
-- L["Cooldown Monitor is disabled"] = ""
-- L["Cooldown Monitor is enabled"] = ""
-- L["Cost of all portals"] = ""
-- L["create"] = ""
-- L["DISPLAYING ADVERTS"] = ""
-- L["Displays the current settings being used by the addon."] = ""
-- L["Displays your advert in Trade chat"] = ""
-- L["Easy Portal Advert"] = ""
-- L["EPA is currently using the following settings"] = ""
-- L["Error"] = ""
-- L["Forces the addon to recreate your advert"] = ""
-- L["Free portals!"] = ""
-- L[" has finished its cooldown."] = ""
-- L["help"] = ""
-- L["info"] = ""
-- L[" loaded successfully."] = ""
-- L["Only Mages can use this addon."] = ""
-- L["OTHER COMMANDS"] = ""
-- L["Pay What You Want portal service available!"] = ""
-- L["Please enter a price"] = ""
-- L["Please enter a value between 1 and 3."] = ""
-- L["Please use one of the following arguments:"] = ""
-- L["Portals available for "] = ""
-- L["Preview one of the 3 alert sounds"] = ""
-- L["price"] = ""
-- L["PRICE SETTINGS"] = ""
-- L["Quickly leave your current party"] = ""
-- L["Set the price for all of your portals"] = ""
-- L["sound"] = ""
-- L["Tells the addon what channel number to use for Trade chat (usually 2)"] = ""
-- L["Tells the addon which sound to play when a portal finishes its cooldown (unless this feature is disabled)"] = ""
-- L["The cooldown alert sound has been disabled."] = ""
-- L["The cooldown alert sound has been enabled."] = ""
-- L["Toggles the cooldown alert sound on or off"] = ""
-- L["Trade Channel"] = ""
-- L["Trade Channel number changed to"] = ""
-- L["Your advert"] = ""
-- L["Your alert sound is"] = ""
elseif GetLocale() == "esES" then -- Spanish
-- L["Alert sound changed to"] = ""
-- L["ALERT SOUND SETTINGS"] = ""
-- L["All of your portals are now"] = ""
-- L["All of your portals are now free"] = ""
-- L["All of your portals are now set to Pay What You Want"] = ""
-- L["CHANNEL SETTINGS"] = ""
-- L["Command List"] = ""
-- L["Cooldown Monitor"] = ""
-- L["Cooldown Monitor is disabled"] = ""
-- L["Cooldown Monitor is enabled"] = ""
-- L["Cost of all portals"] = ""
-- L["create"] = ""
-- L["DISPLAYING ADVERTS"] = ""
-- L["Displays the current settings being used by the addon."] = ""
-- L["Displays your advert in Trade chat"] = ""
-- L["Easy Portal Advert"] = ""
-- L["EPA is currently using the following settings"] = ""
-- L["Error"] = ""
-- L["Forces the addon to recreate your advert"] = ""
-- L["Free portals!"] = ""
-- L[" has finished its cooldown."] = ""
-- L["help"] = ""
-- L["info"] = ""
-- L[" loaded successfully."] = ""
-- L["Only Mages can use this addon."] = ""
-- L["OTHER COMMANDS"] = ""
-- L["Pay What You Want portal service available!"] = ""
-- L["Please enter a price"] = ""
-- L["Please enter a value between 1 and 3."] = ""
-- L["Please use one of the following arguments:"] = ""
-- L["Portals available for "] = ""
-- L["Preview one of the 3 alert sounds"] = ""
-- L["price"] = ""
-- L["PRICE SETTINGS"] = ""
-- L["Quickly leave your current party"] = ""
-- L["Set the price for all of your portals"] = ""
-- L["sound"] = ""
-- L["Tells the addon what channel number to use for Trade chat (usually 2)"] = ""
-- L["Tells the addon which sound to play when a portal finishes its cooldown (unless this feature is disabled)"] = ""
-- L["The cooldown alert sound has been disabled."] = ""
-- L["The cooldown alert sound has been enabled."] = ""
-- L["Toggles the cooldown alert sound on or off"] = ""
-- L["Trade Channel"] = ""
-- L["Trade Channel number changed to"] = ""
-- L["Your advert"] = ""
-- L["Your alert sound is"] = ""
elseif GetLocale() == "zhTW" then -- Traditional Chinese
-- L["Alert sound changed to"] = ""
-- L["ALERT SOUND SETTINGS"] = ""
-- L["All of your portals are now"] = ""
-- L["All of your portals are now free"] = ""
-- L["All of your portals are now set to Pay What You Want"] = ""
-- L["CHANNEL SETTINGS"] = ""
-- L["Command List"] = ""
-- L["Cooldown Monitor"] = ""
-- L["Cooldown Monitor is disabled"] = ""
-- L["Cooldown Monitor is enabled"] = ""
-- L["Cost of all portals"] = ""
-- L["create"] = ""
-- L["DISPLAYING ADVERTS"] = ""
-- L["Displays the current settings being used by the addon."] = ""
-- L["Displays your advert in Trade chat"] = ""
-- L["Easy Portal Advert"] = ""
-- L["EPA is currently using the following settings"] = ""
-- L["Error"] = ""
-- L["Forces the addon to recreate your advert"] = ""
-- L["Free portals!"] = ""
-- L[" has finished its cooldown."] = ""
-- L["help"] = ""
-- L["info"] = ""
-- L[" loaded successfully."] = ""
-- L["Only Mages can use this addon."] = ""
-- L["OTHER COMMANDS"] = ""
-- L["Pay What You Want portal service available!"] = ""
-- L["Please enter a price"] = ""
-- L["Please enter a value between 1 and 3."] = ""
-- L["Please use one of the following arguments:"] = ""
-- L["Portals available for "] = ""
-- L["Preview one of the 3 alert sounds"] = ""
-- L["price"] = ""
-- L["PRICE SETTINGS"] = ""
-- L["Quickly leave your current party"] = ""
-- L["Set the price for all of your portals"] = ""
-- L["sound"] = ""
-- L["Tells the addon what channel number to use for Trade chat (usually 2)"] = ""
-- L["Tells the addon which sound to play when a portal finishes its cooldown (unless this feature is disabled)"] = ""
-- L["The cooldown alert sound has been disabled."] = ""
-- L["The cooldown alert sound has been enabled."] = ""
-- L["Toggles the cooldown alert sound on or off"] = ""
-- L["Trade Channel"] = ""
-- L["Trade Channel number changed to"] = ""
-- L["Your advert"] = ""
-- L["Your alert sound is"] = ""
end