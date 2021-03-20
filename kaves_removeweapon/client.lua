Weapons = {  -- Blacklistte bulunan silahları buraya giriyoruz.Silah kodlarına buradan ulaşabilirsiniz. / https://wiki.rage.mp/index.php?title=Weapons

	"WEAPON_DAGGER",
	"WEAPON_SWITCHBLADE",
	"WEAPON_PISTOL_MK2",
	"WEAPON_STUNGUN",
	"WEAPON_SNSPISTOL_MK2",
	"WEAPON_REVOLVER_MK2",
	"WEAPON_RAYPISTOL",
	"WEAPON_SMG_MK2",
	"WEAPON_ASSAULTSMG",
	"WEAPON_PUMPSHOTGUN_MK2",
	"WEAPON_BULLPUPSHOTGUN",
	"WEAPON_MUSKET",
	"WEAPON_ASSAULTRIFLE_MK2",
	"WEAPON_CARBINERIFLE_MK2",
	"WEAPON_SPECIALCARBINE_MK2",
	"WEAPON_BULLPUPRIFLE",
	"WEAPON_BULLPUPRIFLE_MK2",
	"WEAPON_COMBATMG_MK2",
	"WEAPON_SNIPERRIFLE",
	"WEAPON_HEAVYSNIPER",
	"WEAPON_HEAVYSNIPER_MK2",
	"WEAPON_MARKSMANRIFLE_MK2",
	"WEAPON_RPG",
	"WEAPON_GRENADELAUNCHER",
	"WEAPON_GRENADELAUNCHER_SMOKE",
	"WEAPON_MINIGUN",
	"WEAPON_FIREWORK",
	"WEAPON_HOMINGLAUNCHER",
	"WEAPON_COMPACTLAUNCHER",
	"WEAPON_GRENADE",
	"WEAPON_WEAPON_BZGAS",
	"WEAPON_MOLOTOV",
	"WEAPON_STICKYBOMB",
	"WEAPON_PROXMINE",
	"WEAPON_PIPEBOMB",
	"WEAPON_SMOKEGRENADE",
	"WEAPON_FLARE",
	"WEAPON_PETROLCAN",
	
} -- writen by Kaves#0359


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(500)
        local player = PlayerPedId()
		for k,v in pairs(Weapons) do
			local player = PlayerPedId()
			local weapon = GetHashKey(v)
			if HasPedGotWeapon(player, weapon, false) == 1 then
				RemoveWeaponFromPed(player, weapon)
				TriggerServerEvent("kaves_removeweapon:LOG", v)
			end
		end
    end
end)
