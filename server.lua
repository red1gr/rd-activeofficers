local QBCore = exports['qb-core']:GetCoreObject()
QBCore.Functions.CreateCallback("rd-ActiveOfficers:GetOfficers", function(source, cb)
    local ActiveOfficers = {}
    for _, v in pairs(QBCore.Functions.GetQBPlayers()) do
        if v.PlayerData.job.name == "police" then
            table.insert(ActiveOfficers, {
                name = v.PlayerData.charinfo.firstname .. " " .. v.PlayerData.charinfo.lastname,
                badgeNumber = v.PlayerData.metadata["callsign"] or "N/A",
                rank = v.PlayerData.job.grade.name,
                gradeLevel = v.PlayerData.job.grade.level,
                onDuty = v.PlayerData.job.onduty,
                radioChannel = GetRadioChannel(v.PlayerData.source),
                status = v.PlayerData.metadata["status"] or "N/A" 
            })
        end
    end
    table.sort(ActiveOfficers, function(a, b)
        return a.gradeLevel > b.gradeLevel
    end)
    cb(ActiveOfficers)
end)
function GetRadioChannel(source)
    return Player(source).state['radioChannel']
end
RegisterServerEvent("rd-ActiveOfficers:SetCallsign")
AddEventHandler("rd-ActiveOfficers:SetCallsign", function(callsign)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player and Player.PlayerData.job.name == "police" then
        Player.Functions.SetMetaData("callsign", callsign)
        TriggerClientEvent('QBCore:Notify', src, "Your callsign has been updated to: " .. callsign, "success")
    end
end)
RegisterServerEvent("rd-ActiveOfficers:SetStatus")
AddEventHandler("rd-ActiveOfficers:SetStatus", function(status)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player and Player.PlayerData.job.name == "police" then
        local currentStatus = Player.PlayerData.metadata["status"]
        if currentStatus == status then
            Player.Functions.SetMetaData("status", "N/A")
            TriggerClientEvent('QBCore:Notify', src, "Your status has been cleared.", "success")
        else
            Player.Functions.SetMetaData("status", status)
            TriggerClientEvent('QBCore:Notify', src, "Your status has been updated to: " .. status, "success")
        end
    end
end)
