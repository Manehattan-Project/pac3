if SERVER then		
	AddCSLuaFile("autorun/pac_init.lua")
		
	local function add_files(dir)
		local files, folders = file.Find(dir .. "*", "LUA")
		
		for key, file_name in pairs(files) do
			AddCSLuaFile(dir .. file_name)
		end
		
		for key, folder_name in pairs(folders) do
			add_files(dir .. folder_name .. "/")
		end
	end
	
	add_files("pac3/core/client/")

	include("pac3/core/server/init.lua")
end

if CLIENT then
	include("pac3/core/client/init.lua")
end