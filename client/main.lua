local QBCore = exports['qb-core']:GetCoreObject()
isLoggedIn = false
local onDuty = true
PlayerJob = {}

function DrawText3Ds(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

Citizen.CreateThread(function()
    ChickenFactory = AddBlipForCoord(-71.64, 6267.1, 30.22)
    SetBlipSprite (ChickenFactory, 89)
    SetBlipDisplay(ChickenFactory, 4)
    SetBlipScale  (ChickenFactory, 0.5)
    SetBlipAsShortRange(ChickenFactory, true)
    SetBlipColour(ChickenFactory, 1)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName("Chicken Factory")
    EndTextCommandSetBlipName(ChickenFactory)
end) 


RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    QBCore.Functions.GetPlayerData(function(PlayerData)
        PlayerJob = PlayerData.job
        if PlayerData.job.onduty then
            if PlayerData.job.name == "chickenfactory" then
                TriggerServerEvent("QBCore:ToggleDuty")
            end
        end
    end)
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate')
AddEventHandler('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerJob = JobInfo
    onDuty = PlayerJob.onduty
end)

RegisterNetEvent('QBCore:Client:SetDuty')
AddEventHandler('QBCore:Client:SetDuty', function(duty)
	onDuty = duty
end)

RegisterNetEvent("qb-chickenfactory:DutyB")
AddEventHandler("qb-chickenfactory:DutyB", function()
    TriggerServerEvent("QBCore:ToggleDuty")
end)

RegisterNetEvent("qb-chickenfactory:Tray1")
AddEventHandler("qb-chickenfactory:Tray1", function()
    TriggerEvent("inventory:client:SetCurrentStash", "chickentray1")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "chickentray1", {
        maxweight = 10000,
        slots = 6,
    })
end)

RegisterNetEvent("qb-chickenfactory:Tray4")
AddEventHandler("qb-chickenfactory:Tray4", function()
    TriggerEvent("inventory:client:SetCurrentStash", "chickentray4")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "chickentray4", {
        maxweight = 10000,
        slots = 6,
    })
end)

RegisterNetEvent("qb-chickenfactory:Tray3")
AddEventHandler("qb-chickenfactory:Tray3", function()
    TriggerEvent("inventory:client:SetCurrentStash", "chickentray3")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "chickentray3", {
        maxweight = 10000,
        slots = 6,
    })
end)

RegisterNetEvent("qb-chickenfactory:Storage")
AddEventHandler("qb-chickenfactory:Storage", function()
    TriggerEvent("inventory:client:SetCurrentStash", "chickenstorage")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "chickenstorage", {
        maxweight = 250000,
        slots = 40,
    })
end)

RegisterNetEvent("qb-chickenfactory:Storage2")
AddEventHandler("qb-chickenfactory:Storage2", function()
    TriggerEvent("inventory:client:SetCurrentStash", "chickenstorage2")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "chickenstorage2", {
        maxweight = 250000,
        slots = 40,
    })
end)

--Chicken Creations
RegisterNetEvent("qb-chickenfactory:chickennugget")
AddEventHandler("qb-chickenfactory:chickennugget", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('qb-chickenfactory:server:get:ingredientchickennugget', function(HasItems)  
    		if HasItems then
				QBCore.Functions.Progressbar("pickup_sla", "Making a chicken nugget", 4000, false, true, {
					disableMovement = true,
					disableCarMovement = true,
					disableMouse = false,
					disableCombat = true,
				}, {
					animDict = "mp_common",
					anim = "givetake1_a",
					flags = 8,
				}, {}, {}, function() -- Done
					TriggerServerEvent('qb-chickenfactory:server:AddChickenNugget')
                    			TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["chickennugget"], "add")
                   			QBCore.Functions.Notify("You made a chicken nugget", "success")
                    TriggerServerEvent('qb-chickenfactory:server:RemoveBreadCrumbs')
                                TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["breadcrumbs"], "remove")
                    TriggerServerEvent('qb-chickenfactory:server:RemoveGroundChicken')
                                TriggerEvent("inventory:cleint:ItemBox", QBCore.Shared.Items["groundchicken"], "remove")
				end, function()
					QBCore.Functions.Notify("You Stopped", "error")
				end)
			else
   				QBCore.Functions.Notify("You dont have the ingredients to make this masterpiece", "error")
			end
		end)
	else 
		QBCore.Functions.Notify("You must be Clocked into work", "error")
	end  
end)

--Ground Up Chicken
RegisterNetEvent("qb-chickenfactory:Grind")
AddEventHandler("qb-chickenfactory:Grind", function()
    if onDuty then
    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
        if HasItem then
           GrindChicken()
        else
            QBCore.Functions.Notify("You don't have the right stuff..", "error")
        end
      end, 'cleanchicken')
    else
        QBCore.Functions.Notify("You must be Clocked into work", "error")
    end
end)

--Clean Chicken
RegisterNetEvent("qb-chickenfactory:CleanChicken")
AddEventHandler("qb-chickenfactory:CleanChicken", function()
    if onDuty then
    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
        if HasItem then
           CleanChicken()
        else
            QBCore.Functions.Notify("You don't have the right stuff..", "error")
        end
      end, 'dirtychicken')
    else
        QBCore.Functions.Notify("You must be Clocked into work", "error")
    end
end)

-- Functions --
function GrindChicken()
	TriggerServerEvent('qb-chickenfactory:server:RemoveCleanChicken')
	QBCore.Functions.Progressbar("pickup", "Grinding the Clean Chicken..", 4000, false, true, {
	    disableMovement = true,
	    disableCarMovement = true,
	    disableMouse = false,
	    disableCombat = true,
	},{
	    animDict = "amb@prop_human_bbq@male@base",
	    anim = "base",
	    flags = 8,
	    }
	)
	Citizen.Wait(4000)
	TriggerServerEvent('qb-chickenfactory:server:AddGroundChicken')
	TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["groundchicken"], "add")
	QBCore.Functions.Notify("You Ground The Chicken", "success")
	StopAnimTask(PlayerPedId(), "amb@prop_human_bbq@male@base", "base", 1.0)
end

function CleanChicken()
    TriggerServerEvent('qb-chickenfactory:server:RemoveDirtyChicken')
    QBCore.Functions.Progressbar("pickup", "Cleaning the chicken..", 4000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    },{
        animDict = "amb@prop_human_bbq@male@base",
        anim = "base",
        flags = 8,
    }    
)
    Citizen.Wait(4000)
    TriggerServerEvent('qb-chickenfactory:server:AddCleanChicken)
    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["cleanchicken"], "add")
    QBCore.Functions.Notify("You cleaned the chicken", "success")
    StopAnimTask(PlayerPedId(), "amb@prop_human_bbq@male@base", "base", 1.0)
end

RegisterNetEvent("qb-chickenfactory:shop")
AddEventHandler("qb-chickenfactory:shop", function()
    TriggerServerEvent("inventory:server:OpenInventory", "shop", "chickenfactory", Config.Items)
end)

RegisterNetEvent('qb-chickenfactory:use-nugget', function()
    TriggerEvent('animations:client:EmoteCommandStart', {"eat"})
    QBCore.Functions.Progressbar("use-nugget", "Eating Nugget", 3500, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["chickennugget"], "remove")
        QBCore.Functions.Notify("You loved that chicken nugget!", "success")
        TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + 20)
        TriggerServerEvent('hud:server:RelieveStress', math.random(2,4))
    end)
end)

ConsumeNugget = {
    ["chickennugget"] = math.random(35, 45),
}
