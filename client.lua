local QBCore = exports['qb-core']:GetCoreObject()

local isTabletOpen = false

function UpdateActiveOfficersList()
    QBCore.Functions.TriggerCallback('rd-ActiveOfficers:GetOfficers', function(result)
        local html = ""
        for _, officer in pairs(result) do
            local dutyStatus = officer.onDuty and "🟢" or "🔴"
            local radioChannel = officer.radioChannel or "N/A"
            local status = officer.status == "10-06" and "🟡" or ""
            html = html .. string.format([[
                <div class="box">
                    <div class="data">
                        <p>%s %s %s</p>
                        <span>Badge: %s | Rank: %s | %s HZ</span>
                    </div>
                </div>
            ]], dutyStatus, status, officer.name, officer.badgeNumber, officer.rank, radioChannel)
        end
        
        if isTabletOpen then
            SendNUIMessage({ type = "showTablet", html = html }) 
        end
    end)
end

function showTablet()
    exports["rpemotes"]:EmoteCommandStart("tablet2")
    SetNuiFocus(true, true)
    isTabletOpen = true
    UpdateActiveOfficersList() 
end

function hideTablet()
    exports["rpemotes"]:EmoteCommandStart("c")
    SetNuiFocus(false, false)
    SendNUIMessage({ type = "hideTablet" })
    isTabletOpen = false
end

RegisterCommand("activeofficers", function()
    if not isTabletOpen then
        showTablet()
    end
end)

RegisterNUICallback("closeTablet", function(data, cb)
    hideTablet() 
    cb('ok')
end)
RegisterCommand('callsign', function()
    local PlayerData = QBCore.Functions.GetPlayerData()
    if PlayerData.job.name == "police" then
        local dialog = exports['qb-input']:ShowInput({
            header = "Set Callsign",
            submitText = "Submit",
            inputs = {
                {
                    text = "Enter your callsign",
                    name = "callsign",
                    type = "text",
                    isRequired = true,
                }
            }
        })

        if dialog ~= nil then
            local callsign = dialog.callsign
            TriggerServerEvent("rd-ActiveOfficers:SetCallsign", callsign)
        end
    end    
end, false)
RegisterCommand('10-06', function()
    local PlayerData = QBCore.Functions.GetPlayerData()
    if PlayerData.job.name == "police" then
        TriggerServerEvent("rd-ActiveOfficers:SetStatus", "10-06")
    end
end, false)
TriggerEvent('chat:addSuggestion', '/activeofficers', 'View the list of active officers on duty.')
TriggerEvent('chat:addSuggestion', '/callsign', 'Set your police callsign.')
TriggerEvent('chat:addSuggestion', '/10-06', 'Toggle your "10-06" status (break/available).')