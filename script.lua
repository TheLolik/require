getgenv().import = function(file)
	local s,e = pcall(function() game:HttpGet("https://raw.githubusercontent.com/TheLolik/require/main/libraryes/"..file..".lua") end)
	if s then
		return loadstring(game:HttpGet("https://raw.githubusercontent.com/TheLolik/require/main/libraryes/"..file..".lua"))()
	elseif not s then
		warn(e)
	end
end
