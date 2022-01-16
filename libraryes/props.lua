local props = {}
props["gethiddenproperties"] = function(obj)
	local t = {}
	for prop,val in pairs(getproperties(obj)) do
		table.insert(t, prop)
	end
	return t
end

return props
