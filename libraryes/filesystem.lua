local files = {}

files["ispath"] = function(path,output)
	if isfolder(path) == true or isfile(path) == true then
		if output == true then
			print("Path found! Path name is "..path)
			return true
		else
			return true
		end
	else
		if output == true then
			print("Could not find this path! Path name is "..path)
			return false
		else
			return false
		end
	end
end

files["del"] = function(path, allfiles)
	if files["ispath"](path) == true then
		if allfiles == true and isfolder(path) == true then
			delfolder(path)
		elseif isfolder(path) == true then
			for _,file in pairs(listfiles(path)) do
				local fname = file:split("\\")
				if isfile(file) then
					writefile(fname[#fname],readfile(file))
					delfile(file)
				elseif isfolder(file) then
					delfolder(file)
				end
			end
			delfolder(path)
		elseif isfile(path) == true then
			delfile(path) 
		end
	end
end

files["listfolders"] = function(path)
	if files["ispath"](path) == true and isfolder(path) == true then
		local folders = {}
		for _,file in pairs(listfiles(path)) do
			if isfolder(file) == true then
				table.insert(folders, file)
			end
		end
		return folders
	end
end

files["listfiles"] = function(path)
	if files["ispath"](path) == true and isfolder(path) == true then
		local files = {}
		for _,file in pairs(listfiles(path)) do
			if isfile(file) == true then
				table.insert(files, file)
			end
		end
		return files
	end
end

files["listall"] = function(path)
	if files["ispath"](path) == true and isfolder(path) == true then
		return listfiles(path)
	end
end

files["listbytype"] = function(path,type)
	if files["ispath"](path) == true and isfolder(path) == true then
		local typeonly = {}
		for _,file in pairs(listfiles(path)) do
			if isfile(file) == true then
				local ftype = file:split(".")
				if ftype[#ftype] == type then
					table.insert(typeonly, file)
				end
			end
		end
		return typeonly
	end
end

files["rename"] = function(path,name)
	if files["ispath"](path) == true and isfile(path) == true then
		if name ~= nil then
			if path:find("/") then
				writefile(path.."/"..name,readfile(path))
			else
				writefile(name,readfile(path))
			end
			delfile(path)
		end
	end
end

files["newfile"] = function(path,name,content)
	if files["ispath"](path) == true then
		writefile(path.."/"..name,tostring(content))
	end
end

files["copyfile"] = function(path)
	if files["ispath"](path) == true then
		local p = path:split("/")
		local nt = p[#p]:split(".")
		local name = nt[#nt - 1] .. " - copy"
		local f = nt[1]..nt[2]
		local pwn = string.gsub(path,f,"")
		print(pwn)
		writefile(pwn..name..nt[#nt], readfile(path))
	end
end

files["editfile"] = function(path,content)
	if files["ispath"](path) == true then
		writefile(path,tostring(content))
	end
end

return files
