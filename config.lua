print"qb-chickenfactory made by Pengu Scripts"
print"version 1.2"


Config = {}

Config.ChickenFactoryGaragePedLocations = {
    {coords = vector4(-64.47, 6273.08, 31.32, 10.00)},
}

Config.DeliveryWait = 10000
Config.DeliveryPayment = math.random(700, 1000)

Config.DropOffPoint1 = vector3(7.87, 6523.64, 31.88)
Config.DropOffPoint2 = vector3(-26.39, 6461.87, 31.46)
Config.DropOffPoint3 = vector3(3.26, 6446.85, 31.43)
Config.DropOffPoint4 = vector3(2.28, 6424.98, 31.43)
Config.DropOffPoint5 = vector3(-199.33, 6260.74, 31.64)
Config.DropOffPoint6 = vector3(-219.11, 6246.56, 31.49)
Config.DropOffPoint7 = vector3(-247.09, 6240.68, 31.49)
Config.DropOffPoint8 = vector3(-236.89, 6228.66, 31.5)
Config.DropOffPoint9 = vector3(-281.13, 6168.79, 31.5)
Config.DropOffPoint10 = vector3(-304.57, 6198.83, 31.49)

Config.Items = {
label = "chickenfactory",
    slots = 2,
    items = {
        [1] = {
            name = "breadcrumbs",
            price = 1, --CHANGE TO MATCH YOUR ECONOMY
            amount = 50,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "dirtychicken",
            price = 1, --CHANGE TO MATCH YOUR ECONOMY
            amount = 50,
            info = {},
            type = "item",
            slot = 2,
        },
    }
}
