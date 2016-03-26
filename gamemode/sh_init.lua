MsgC(Color(0,0,255,255),"Loading Raindrop SH...\n")
--MsgC(Color(255,0,0,255),"           ♥♥♥♥♥♥           ♥♥♥♥♥♥           \n")
--MsgC(Color(255,0,0,255),"         ♥♥♥♥♥♥♥♥♥♥       ♥♥♥♥♥♥♥♥♥♥         \n")
--MsgC(Color(255,0,0,255),"       ♥♥♥♥♥♥♥♥♥♥♥♥♥♥   ♥♥♥♥♥♥♥♥♥♥♥♥♥♥       \n")
--MsgC(Color(255,0,0,255),"     ♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥ ♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥     \n")
--MsgC(Color(255,0,0,255),"    ♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥    \n")
--MsgC(Color(255,0,0,255),"   ♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥   \n")
--MsgC(Color(255,0,0,255),"   ♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥   \n")
--MsgC(Color(255,0,0,255),"   ♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥   \n")
--MsgC(Color(255,0,0,255),"    ♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥    \n")
--MsgC(Color(255,0,0,255),"     ♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥     \n")
--MsgC(Color(255,0,0,255),"      ♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥      \n")
--MsgC(Color(255,0,0,255),"       ♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥       \n")
--MsgC(Color(255,0,0,255),"         ♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥         \n")
--MsgC(Color(255,0,0,255),"           ♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥           \n")
--MsgC(Color(255,0,0,255),"             ♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥             \n")
--MsgC(Color(255,0,0,255),"               ♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥               \n")
--MsgC(Color(255,0,0,255),"                 ♥♥♥♥♥♥♥♥♥♥♥                 \n")
--MsgC(Color(255,0,0,255),"                   ♥♥♥♥♥♥♥                   \n")
--MsgC(Color(255,0,0,255),"                     ♥♥♥                     \n")
--MsgC(Color(255,0,0,255),"                      ♥                      \n")

--Setup the gamemode table
rain = GM
rain.Name = "RAINDROP"
rain.Website = "thereeplex.com"
rain.Author = "jooni"
rain.Email = "jooni@thereeplex.com"

-- include raindrop utilities to make loading the rest of the gamemode easier
if (SERVER) then
	AddCSLuaFile("sh_util.lua")
	include("sh_util.lua")
else
	include("sh_util.lua")
end

-- load all prerequisite libraries, these are typically external, written and pure lua and not by myself.
rain.util.loadlibraries()
rain.util.loadraindrop()