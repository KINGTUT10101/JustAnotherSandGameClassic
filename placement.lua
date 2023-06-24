-- Takes x, y coords rounded to the nearest 20th pixel
function placeParticle (x, y, partType)
	if coords [(x+20)/20][(y+20)/20]["protected"] == false then
	if coords [(x+20)/20][(y+20)/20]["type"] ~= partType then
		-- There's probably a better way to do this. I need to do some research...
		if partType == "particle" then
			local particle = Particle ((x+20)/20, (y+20)/20)
		elseif partType == "water" then
			local particle = Water ((x+20)/20, (y+20)/20)
		elseif partType == "acid" then
			local particle = Acid ((x+20)/20, (y+20)/20)
		elseif partType == "wallmite" then
			local particle = Wallmite ((x+20)/20, (y+20)/20)
		elseif partType == "slime" then
			local particle = Slime ((x+20)/20, (y+20)/20)
		elseif partType == "mekanite" then
			local particle = Mekanite ((x+20)/20, (y+20)/20)
		elseif partType == "cloner" then
			local particle = Cloner ((x+20)/20, (y+20)/20)
		elseif partType == "deleter" then
			local particle = Deleter ((x+20)/20, (y+20)/20)
		elseif partType == "steel" then
			local particle = Steel ((x+20)/20, (y+20)/20)
		elseif partType == "gum" then
			local particle = Gum ((x+20)/20, (y+20)/20)
		elseif partType == "velcro" then
			local particle = Velcro ((x+20)/20, (y+20)/20)
		elseif partType == "goll" then
			local particle = Goll ((x+20)/20, (y+20)/20)
		elseif partType == "allakite" then
			local particle = Allakite ((x+20)/20, (y+20)/20)
		elseif partType == "sand" then
			local particle = Sand ((x+20)/20, (y+20)/20)
		elseif partType == "quickSand" then
			local particle = QuickSand ((x+20)/20, (y+20)/20)
		elseif partType == "filter" then
			local particle = Filter ((x+20)/20, (y+20)/20)
		elseif partType == "oil" then
			local particle = Oil ((x+20)/20, (y+20)/20)
		elseif partType == "selectDeleter" then
			local particle = SelectDeleter ((x+20)/20, (y+20)/20)
		elseif partType == "fly" then
			local particle = Fly ((x+20)/20, (y+20)/20)
		elseif partType == "ant" then
			local particle = Ant ((x+20)/20, (y+20)/20)
		elseif partType == "fish" then
			local particle = Fish ((x+20)/20, (y+20)/20)
		elseif partType == "live" then
			local particle = Live ((x+20)/20, (y+20)/20)
		elseif partType == "dead" then
			local particle = Dead ((x+20)/20, (y+20)/20)
		elseif partType == "expanderX" then
			local particle = ExpanderX ((x+20)/20, (y+20)/20)
		elseif partType == "expanderY" then
			local particle = ExpanderY ((x+20)/20, (y+20)/20)
		elseif partType == "expanderAll" then
			local particle = ExpanderAll ((x+20)/20, (y+20)/20)
		elseif partType == "wallmitePowder" then
			local particle = WallmitePowder ((x+20)/20, (y+20)/20)
		elseif partType == "corpse" then
			local particle = Corpse ((x+20)/20, (y+20)/20)
		elseif partType == "glass" then
			local particle = Glass ((x+20)/20, (y+20)/20)
		elseif partType == "barrier" then
			local particle = Barrier ((x+20)/20, (y+20)/20)
		elseif partType == "oxygen" then
			local particle = Oxygen ((x+20)/20, (y+20)/20)
		elseif partType == "helium" then
			local particle = Helium ((x+20)/20, (y+20)/20)
		elseif partType == "steam" then
			local particle = Steam ((x+20)/20, (y+20)/20)
		elseif partType == "antigravPowder" then
			local particle = AntigravPowder ((x+20)/20, (y+20)/20)
		elseif partType == "lightifier" then
			local particle = Lightifier ((x+20)/20, (y+20)/20)
		elseif partType == "densifier" then
			local particle = Densifier ((x+20)/20, (y+20)/20)
		end
		end
	end
end


-- Takes x, y coords rounded to the nearest 20th pixel
function removeParticle (x, y)
	local particle = Air ((x+20)/20, (y+20)/20)
end


-- Sets every tile to air
function resetPlayArea ()
	for i = 1, (winSizeW/20) do
		table.insert (coords, {})
		for j = 1, ((winSizeH-toolBarH)/20) do
			coords [i][j] = Air (i, j)
		end
	end
end