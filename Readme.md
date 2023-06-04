# A Chicken Factory Job for QBCore Framework

-- I would love to thank ooSayeroo for this wonder script I used as a backbone for this script. You may find his script below:

-- Reworked from ooSayeroo's script for the Legion Square Weed Clinic to a Chicken Factory in Paleto Bay (NO MLOs REQUIRED)

## Please note

- Please make sure u use the latest dependencies aswell as core for this in order to work.


## Discord
https://dsc.gg/penguscripts

## Preview
https://youtu.be/JNSSe42hU-4

## Dependencies :

QBCore Framework - https://github.com/qbcore-framework/qb-core

PolyZone - https://github.com/mkafrin/PolyZone

qb-target - https://github.com/BerkieBb/qb-target

qb-input - https://github.com/qbcore-framework/qb-input

qb-menu - https://github.com/qbcore-framework/qb-menu


## Credits : 

ooSayeroo for the script of which I used as a backbone.

## Insert the following into @qb-core/shared/items.lua 

```
QBShared.Items = {
-- Chicken Factory Shop
['chickennugget'] 			    	 = {['name'] = 'chickennugget', 			    	['label'] = 'Chicken Nuggets', 		    	['weight'] = 50, 		['type'] = 'item', 		["image"] = "chickennuggets.png",       	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Yummy Nuggies."},
['cleanchicken'] 			    	 = {['name'] = 'cleanchicken', 			        	['label'] = 'Clean Chicken', 		    	['weight'] = 200, 		['type'] = 'item', 		["image"] = "cleanchicken.png",           	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Sparkling Clean Chicken."},
['groundchicken'] 				     = {['name'] = 'groundchicken', 			        ['label'] = 'Ground Chicken', 		     	['weight'] = 200, 		['type'] = 'item', 		['image'] = 'groundchicken.png',        	['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'I Just Ground Up My Own Chicken!'},
['dirtychicken'] 		 	 	 	 = {['name'] = 'dirtychicken',           			['label'] = 'Dirty Chicken',	 	    	['weight'] = 200, 		['type'] = 'item', 		["image"] = "dirtychicken.png", 		    ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "This Smells HORRIBLE!"},
['breadcrumbs'] 			 	     = {['name'] = 'breadcrumbs', 			  	        ['label'] = 'Breadcrumbs', 			        ['weight'] = 50, 		['type'] = 'item', 		['image'] = 'breadcrumbs.png', 	        	['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'A Great Thing For Chicken Nuggies.'},
['receipt'] 			        	 = {['name'] = 'receipt', 			                ['label'] = 'Receipt', 			            ['weight'] = 50, 		['type'] = 'item', 		['image'] = 'receipt.png', 	                ['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'receipt!'},
['eggs'] 			 	             = {['name'] = 'eggs', 			                	['label'] = 'Eggs', 		            	['weight'] = 10, 		['type'] = 'item', 		['image'] = 'eggs.png', 		            ['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Don't eat them raw!'},
}

```

## Insert EVERYTHING in @chickenfactory/Images into @qb-inventory/HTML/Images


## Insert the following into @qb-core/shared/jobs.lua 
```
QBShared.Jobs = {
    ["chickenfactory"] = {
		label = "Chicken Factory Employee",
		defaultDuty = true,
		grades = {
            ['0'] = {
                name = "Trainee",
                payment = 100
            },
			['1'] = {
                name = "Employee",
                payment = 150
            },
			['2'] = {
                name = "Owner",
                isboss = true,
                payment = 300
            },
        },
	},
}		
```

## Insert the following into @qb-management - Client - cl config.lua
```
['chickenfactory'] = {
        vector3(-67.53, 6254.06, 30.09),
    },
```
