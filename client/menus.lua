local QBCore = exports['qb-core']:GetCoreObject()

isLoggedIn = true
PlayerJob = {}

local onDuty = true

-- target

CreateThread(function()
	exports['qb-target']:AddBoxZone("ChickenFactoryDuty", vector3(-70.16, 6256.38, 35.11), 0.50, 0.30, {
		name = "ChickenFactoryDuty",
		heading = 220.88,
		debugPoly = false,
		minZ=31.0,
		maxZ=31.5,
	}, {
		options = {
		    {  
			event = "qb-chickenfactory:DutyB",
			icon = "far fa-clipboard",
			label = "Clock On/Off",
			job = "chickenfactory",
		    },
		},
		distance = 1.5
	})


	exports['qb-target']:AddBoxZone("chickenfactorycleaner", vector3(-78.54, 6224.97, 30.09), 1.1, 1.55, {
		name="chickenfactorycleaner",
		heading=34,
		debugPoly=false,
		minZ=31.09,
		maxZ=31.60,
	}, {
		options = {
			{
				event = "qb-menu:CleanChicken",
				icon = "fa fa-circle",
				label = "Chicken Cleaning Station",
				job = "chickenfactory",
			},
		},
		distance = 1.5
	})


		exports['qb-target']:AddBoxZone("chickenfactorygrind", vector3(-86.56, 6233.15, 30.87), 2.7, 1.5, {
		name="chickenfactorygrind",
		heading=31,
		debugPoly=false,
		minZ=30.09,
		maxZ=31.15,
		}, {
		    options = {
			{
			    event = "qb-menu:GrindChicken",
			    icon = "fa fa-circle",
			    label = "Grind Chicken",
			    job = "chickenfactory",
			},
		    },
		    distance = 1.5
		})


         exports['qb-target']:AddBoxZone("Order Chicken", vector3(-67.43, 6253.22, 31.13), 1.00, 2.50, {
            name="Order Chicken",
            heading=213,
            debugPoly=false,
            minZ=31.0,
            maxZ=31.5,
        }, {
                options = {
                    {
                        event = "qb-menu:ChickenMenu",
                        icon = "fa fa-circle",
                        label = "Access Register!",
                        job = "chickenfactory",
                    },
                },
                distance = 1.5
            })


        exports['qb-target']:AddBoxZone("chickenfactorydisplay", vector3(-166.71, 6159.73, 30.21), 25.0, 25.0, {
            name="chickenfactorydisplay",
            heading=45,
            debugPoly=false,
            minZ=30.09,
            maxZ=32.65,
        }, {
                options = {
                    {
                        event = "qb-chickenfactory:Storage",
                        icon = "fa fa-circle",
                        label = "Storage",
                        job = "chickenfactory",
                    },
                },
                distance = 1.5
            })


        exports['qb-target']:AddBoxZone("chickencraft", vector3(-103.45, 6208.92, 30.03), 1.6, 12.0, {
            name="chickencraft",
            heading=45,
            debugPoly=false,
            minZ=30.09,
            maxZ=31.1,
        }, {
                options = {
                    {
                        event = "qb-menu:Chicken",
                        icon = "fa fa-circle",
                        label = "Chicken Craft Station",
                        job = "chickenfactory",
                    },
                },
                distance = 1.5
            })


        exports['qb-target']:AddBoxZone("chickenfactory_register_1", vector3(-75.98, 6264.41, 33.02), 2, 2, {
            name="WeedShop_register_1",
            debugPoly=false,
            heading=35.39,
            minZ=30.09,
            maxZ=32.10,
        }, {
                options = {
                    {
                        event = "qb-chickenfactory:bill",
                        parms = "1",
                        icon = "fas fa-credit-card",
                        label = "Charge Customer",
                        job = "chickenfactory",
                    },
                },
                distance = 1.5
            })

end)


-- QB-MENU --

RegisterNetEvent('qb-menu:Chicken', function(data)
    exports['qb-menu']:openMenu({
        {
            
            header = "| Available Products |",
            isMenuHeader = true, -- Set to true to make a nonclickable title
        },
        {
            
            header = "• Chicken Nugget",
            txt = "Ground Chicken, Breadcrumbs",
            params = {
                event = "qb-chickenfactory:chickennugget"
            },
        },
        {
            id = 7,
            header = "Close (ESC)",
            isMenuHeader = true, -- Set to true to make a nonclickable title
        },
    })
end)

RegisterNetEvent('qb-menu:GrindChicken', function(data)
    exports['qb-menu']:openMenu({
        {
            
            header = "| Grind Chicken |",
            isMenuHeader = true, -- Set to true to make a nonclickable title
        },
        {
            
            header = "• Ground Chicken",
            txt = "Clean Chicken",
            params = {
                event = "qb-chickenfactory:Grind"
            }
        },
        {
            id = 7,
            header = "Close (ESC)",
            isMenuHeader = true, -- Set to true to make a nonclickable title
        },
    })
end)


RegisterNetEvent('qb-menu:CleanChicken', function(data)
    exports['qb-menu']:openMenu({
        {
            
            header = "| Clean Chicken |",
            isMenuHeader = true, -- Set to true to make a nonclickable title
        },
        {
            
            header = "• Clean Chicken",
            txt = "Dirty Chicken",
            params = {
                event = "qb-chickenfactory:CleanChicken"
            }
        },
        {
            id = 7,
            header = "Close (ESC)",
            isMenuHeader = true, -- Set to true to make a nonclickable title
        },
    })
end)

RegisterNetEvent('qb-menu:ChickenMenu', function(data)
    exports['qb-menu']:openMenu({
        {
            
            header = "| Products |",
            isMenuHeader = true, -- Set to true to make a nonclickable title
        },
        {
            
            header = "• Order Items",
            txt = "Order More Chicken!",
            params = {
                event = "qb-chickenfactory:shop"
            }
        },
        {
           
            header = "• Open Storage",
            txt = "See what you have in storage",
            params = {
                event = "qb-chickenfactory:Storage2"
            }
        },
        {
           
            header = "• Accept Delivery",
            txt = "Send delivery to personal email",
            params = {
                event = "qb-chickenfactory:deliveries:DeliverEggs"
            }
        },
        {
           
            header = "• File Invoice",
            txt = "Complete to get paid for each Receipt",
            params = {
                event = "qb-chickenfactory:deliveries:ReceivePayment"
            }
        },
        {
            
            header = "Close (ESC)",
            isMenuHeader = true, -- Set to true to make a nonclickable title
        },
    })
end)


-- Till Stuff --
RegisterNetEvent("qb-chickenfactory:bill")
AddEventHandler("qb-chickenfactory:bill", function()
    local bill = exports['qb-input']:ShowInput({
        header = "Create Receipt",
		submitText = "Bill",
        inputs = {
            {
                text = "Server ID(#)",
				name = "citizenid", -- name of the input should be unique otherwise it might override
                type = "text", -- type of the input
                isRequired = true -- Optional [accepted values: true | false] but will submit the form if no value is inputted
            },
            {
                text = "Bill Price ($)", -- text you want to be displayed as a place holder
                name = "billprice", -- name of the input should be unique otherwise it might override
                type = "number", -- type of the input - number will not allow non-number characters in the field so only accepts 0-9
                isRequired = false -- Optional [accepted values: true | false] but will submit the form if no value is inputted
            }
			
        }
    })
    if bill ~= nil then
        if bill.citizenid == nil or bill.billprice == nil then 
            return 
        end
        TriggerServerEvent("qb-chickenfactory:bill:player", bill.citizenid, bill.billprice)
    end
end)
