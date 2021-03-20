

local DISCORD_WEBHOOK = ""
local DISCORD_NAME = "Kaves"
local STEAM_KEY = ""
local DISCORD_IMAGE = "https://cdn.discordapp.com/attachments/790611931407843379/814633679337947228/psdyisbasisilinmemis.png" 


RegisterServerEvent("kaves_removeweapon:LOG")
AddEventHandler("kaves_removeweapon:LOG", function(weapon)
sendToDiscord("YASAKLI SİLAH KULLANIMI!", "** Oyuncu : ** "..getPlayerInfo(source).."\n** Silah : ** " .. weapon.."\n **Yasaklı Silah Kullanıyor!**", 16711680)
end)

function sendToDiscord(name, message, color)
  local connect = {
        {
            ["color"] = color,
            ["title"] = "**".. name .."**",
            ["description"] = message,
            ["footer"] = {
                ["text"] = "Made by Kaves",
            },
        }
    }
  PerformHttpRequest(DISCORD_WEBHOOK, function(err, text, headers) end, 'POST', json.encode({username = DISCORD_NAME, embeds = connect, avatar_url = DISCORD_IMAGE}), { ['Content-Type'] = 'application/json' })
end

function getPlayerInfo(player)
	local _player = player
	local infoString = GetPlayerName(_player) .. " (" .. _player .. ")"
	if _player > 1000 then
		infoString = GetPlayerName(_player) .. " (" .. tostring(tonumber(_player)-65535) .. ")"
	end
	for k,v in pairs(GetPlayerIdentifiers(_player)) do
		if string.sub(v, 1, string.len("discord:")) == "discord:" then
			infoString = infoString .. "\n<@" .. string.gsub(v,"discord:","") .. ">"
		else
			infoString = infoString .. "\n" .. v
		end
	end
	return infoString
end