local EPARMWelcome = CreateFrame("Frame")
EPARMWelcome:RegisterEvent("ADDON_LOADED")

function EPARMEventHandler(self, event, arg1)

	if event == "ADDON_LOADED" and arg1 == "EPA-ReagentMonitor" then
		DEFAULT_CHAT_FRAME:AddMessage("|cFFFFFF00[Reagent Monitor]|r |cFFFF0000[Error]|r This addon is incompatible with the Retail version of WoW.")
	end

end

EPARMWelcome:SetScript("OnEvent", EPARMEventHandler)