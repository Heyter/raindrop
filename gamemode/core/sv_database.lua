-- # Micro-ops
local rain = rain

rain.db = {}

function rain.db.connect(sAddress, sUsername, sPassword, sDatabase, nPort)
	mysql:SetModule(rain.cfg.db.module)
	mysql:Connect(sAddress, sUsername, sPassword, sDatabase, nPort)
end

function rain.db.onconnectionsuccess()
	local queryObj = mysql:Create("players")
		queryObj:Create("id", "INT NOT NULL AUTO_INCREMENT") -- unique player id for this server specifically
		queryObj:Create("steam_id64", "VARCHAR(256) NOT NULL") -- 64bit steam id, I use the 64bit steamid for ease of use
		queryObj:Create("steam_name", "VARCHAR(64) NOT NULL") -- last known steamname
		queryObj:Create("steam_name_history", "MEDIUMTEXT NOT NULL") -- history of steam names
		queryObj:Create("characters", "VARCHAR(64) NOT NULL") -- character ids
		queryObj:Create("last_ip", "VARCHAR(128) NOT NULL") -- last known ip addresses
		queryObj:Create("iphistory", "VARCHAR(512) NOT NULL") -- history of ip addresses
		queryObj:Create("client_data", "VARCHAR(1024) NOT NULL")
		queryObj:PrimaryKey("id")
	queryObj:Execute()

	local queryObj = mysql:Create("characters")
		queryObj:Create("id", "INT NOT NULL AUTO_INCREMENT")
		queryObj:Create("charname", "VARCHAR(48) NOT NULL")
		queryObj:Create("data_character", "MEDIUMTEXT NOT NULL")
		queryObj:Create("data_appearance", "MEDIUMTEXT NOT NULL")
		queryObj:Create("data_adminonly", "MEDIUMTEXT NOT NULL")
		queryObj:Create("data_inventory", "MEDIUMTEXT NOT NULL")
		queryObj:Create("data_factions", "MEDIUMTEXT NOT NULL")
		queryObj:PrimaryKey("id")
	queryObj:Execute()

	local queryObj = mysql:Create("bans")
		queryObj:Create("id", "INT NOT NULL AUTO_INCREMENT") -- banid
		queryObj:Create("steam_id64", "VARCHAR(256) NOT NULL") -- steamid ban
		queryObj:Create("ip", "VARCHAR(64) NOT NULL") -- ip ban
		queryObj:Create("permanent", "TINYINT(1) NOT NULL") -- 0 or 1 indicating wether it is a permaban, expiration date still applies and is automatically set to a year in case of a permaban.
		queryObj:Create("expirationdate", "VARCHAR(256) NOT NULL") -- date the ban ends on
		queryObj:PrimaryKey("id")
	queryObj:Execute()
	
	local queryObj = mysql:Create("factions")
		--important keeping track stuff
		queryObj:Create("id", "INT NOT NULL AUTO_INCREMENT") -- faction id
		queryObj:Create("fact_steamid", "VARCHAR(2048) NOT NULL") -- creator of the faction, has full power over faction
		--rank stuff
		queryObj:Create("fact_name", "VARCHAR(64) NOT NULL") -- list of ranks w/ the string name of them
		queryObj:Create("fact_ranknames", "VARCHAR(2048) NOT NULL") -- list of ranks w/ the string name of them
		queryObj:Create("fact_uniforms", "VARCHAR(2048) NOT NULL") -- list of model uniforms tied to ranks (this would most likely swap body groups in cyberpunk/faction
		--faction meta stuff
		queryObj:Create("fact_desc", "VARCHAR(2048) NOT NULL") -- description of the faction, public on the faction list
		queryObj:Create("fact_resources", "VARCHAR(64) NOT NULL") -- contains the factions resources
		queryObj:Create("fact_inventory", "VARCHAR(256) NOT NULL") -- data such as the pos, angs, and any additional info needed to spawn the item
		--actually setting primarykey and executing
		queryObj:PrimaryKey("id")
	queryObj:Execute()
	
	local queryObj = mysql:Create("volumes")
		queryObj:Create("id", "INT NOT NULL AUTO_INCREMENT") -- volume id, simply the primary key
		queryObj:Create("Min", "VARCHAR(64) NOT NULL") -- string of the item base
		queryObj:Create("Max", "VARCHAR(64) NOT NULL") -- edited data, uses, etc goes here
		queryObj:Create("Type", "VARCHAR(64) NOT NULL") -- volume type
		queryObj:Create("Map", "VARCHAR(64) NOT NULL") -- map name
		queryObj:Create("Radial", "TINYINT(1) NOT NULL") -- 0 or 1 indicating if it's radial or not
		queryObj:PrimaryKey("id")
	queryObj:Execute()

	local nCachedTime = rain.cfg.db.thinktime

	timer.Create("rain.db.think", nCachedTime, 0, function()
		mysql:Think()
		rain:VolumeThink()
	end)
end
