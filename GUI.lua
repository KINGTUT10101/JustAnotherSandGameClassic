winSizeW, winSizeH = love.graphics.getDimensions()
toolBarH = 100
toolBarAnchor = winSizeH-(toolBarH+(winSizeH%20)) -- Represents the top of the GUI box
menuOpen = false
local particleMenu = false
local infoMenu = false
local particleIcon = love.graphics.newImage("particleIcon.png")
local settingsIcon = love.graphics.newImage("infoIcon.png")
local partButtonFunc = function () 
	particleMenu = not particleMenu
	infoMenu = false
	menuOpen = particleMenu or infoMenu
end

local mainButtons = {
	Button (winSizeW-180, toolBarAnchor+10, 80, 80, {1, 0.15, 0.15, 1}, "Particles", "Opens the particle selection menu", particleIcon, 1.5,
		function ()
			particleMenu = not particleMenu
			infoMenu = false
			menuOpen = particleMenu or infoMenu
		end),
	Button (winSizeW-90, toolBarAnchor+10, 80, 80, {1, 0.15, 0.15, 1}, "Info", "Opens the info menu", settingsIcon, 1.75,
		function ()
			particleMenu = false
			infoMenu = not infoMenu
			menuOpen = particleMenu or infoMenu
		end)
}
local particleButtons = {
	Button (((winSizeW-595)/2)+10, 60, 55, 55, {1, 0.15, 0.15, 1}, "Particle", "Looks pretty and tastes like sprinkles.", _, 1, function () selectedParticle = "particle" partButtonFunc () end),
	Button (((winSizeW-595)/2)+75, 60, 55, 55, {28/255, 66/255, 255/255, 1}, "Water", "Blue, wet, and refreshing.", _, 1, function () selectedParticle = "water" partButtonFunc () end),
	Button (((winSizeW-595)/2)+140, 60, 55, 55, {190/255, 1, 16/255, 1}, "Acid", "Eats away other materials. Needs exposure to air to function.", _, 1, function () selectedParticle = "acid" partButtonFunc () end),
	Button (((winSizeW-595)/2)+205, 60, 55, 55, {87/255, 42/255, 59/255, 1}, "Wallmite", "The world's strongest material. Unaffected by gravity.", _, 1, function () selectedParticle = "wallmite" partButtonFunc () end),
	Button (((winSizeW-595)/2)+270, 60, 55, 55, {0, 218/255, 65/255, 1}, "Slime", "Consumes almost anything. Seems intelligent...", _, 1, function () selectedParticle = "slime" partButtonFunc () end),
	Button (((winSizeW-595)/2)+335, 60, 55, 55, {52/255, 0, 92/255, 1}, "Mekanite", "Consumes almost everything. Faster than slime and shortly disappears.", _, 1, function () selectedParticle = "mekanite" partButtonFunc () end),
	Button (((winSizeW-595)/2)+400, 60, 55, 55, {0.75, 0.75, 0.75, 1}, "Cloner", "Replicates everything around itself.", _, 1, function () selectedParticle = "cloner" partButtonFunc () end),
	Button (((winSizeW-595)/2)+465, 60, 55, 55, {0.25, 0.25, 0.25, 1}, "Deleter", "Deletes everything around itself.", _, 1, function () selectedParticle = "deleter" partButtonFunc () end),
	Button (((winSizeW-595)/2)+530, 60, 55, 55, {102/255, 104/255, 107/255, 1}, "Steel", "A shiny and durable wall.", _, 1, function () selectedParticle = "steel" partButtonFunc () end),
	Button (((winSizeW-595)/2)+10, 125, 55, 55, {1, 64/255, 140/255, 1}, "Gum", "Sticks to nearby particles, including itself.", _, 1, function () selectedParticle = "gum" partButtonFunc () end),
	Button (((winSizeW-595)/2)+75, 125, 55, 55, {75/255, 49/255, 82/255, 1}, "Velcro", "Only sticks to itself.", _, 1, function () selectedParticle = "velcro" partButtonFunc () end),
	Button (((winSizeW-595)/2)+140, 125, 55, 55, {129/255, 92/255, 49/255, 1}, "Goll", "Very dense and heavy. Will sink through most materials.", _, 1, function () selectedParticle = "goll" partButtonFunc () end),
	Button (((winSizeW-595)/2)+205, 125, 55, 55, {172/255, 195/255, 204/255, 1}, "Allakite", "Lighter than most materials, but denser than air.", _, 1, function () selectedParticle = "allakite" partButtonFunc () end),
	Button (((winSizeW-595)/2)+270, 125, 55, 55, {240/255, 240/255, 97/255, 1}, "Sand", "Rough, course, and irritating.", _, 1, function () selectedParticle = "sand" partButtonFunc () end),
	Button (((winSizeW-595)/2)+335, 125, 55, 55, {230/255, 190/255, 65/255, 1}, "Quick Sand", "Most materials will sink through it.", _, 1, function () selectedParticle = "quickSand" partButtonFunc () end),
	Button (((winSizeW-595)/2)+400, 125, 55, 55, {215/255, 200/255, 15/255, 1}, "Filter", "Most solids will pass through, but liquids will not.", _, 1, function () selectedParticle = "filter" partButtonFunc () end),
	Button (((winSizeW-595)/2)+465, 125, 55, 55, {56/255, 38/255, 38/255, 1}, "Oil", "Floats on water.", _, 1, function () selectedParticle = "oil" partButtonFunc () end),
	Button (((winSizeW-595)/2)+530, 125, 55, 55, {0.35, 0.35, 0.35, 1}, "Select Deleter", "Only deletes certain materials. Works like the cloner.", _, 1, function () selectedParticle = "selectDeleter" partButtonFunc () end),
	Button (((winSizeW-595)/2)+10, 190, 55, 55, {47/255, 49/255, 145/255, 1}, "Fly", "Kinda bug, kinda snack. Requires empty space to survive.", _, 1, function () selectedParticle = "fly" partButtonFunc () end),
	Button (((winSizeW-595)/2)+75, 190, 55, 55, {16/255, 97/255, 115/255, 1}, "Ant", "They love marching one-by-one. Requires empty space to survive.", _, 1, function () selectedParticle = "ant" partButtonFunc () end),
	Button (((winSizeW-595)/2)+140, 190, 55, 55, {1, 101/255, 0, 1}, "Fish", "They always smile back. Requires water to survive.", _, 1, function () selectedParticle = "fish" partButtonFunc () end),
	Button (((winSizeW-595)/2)+205, 190, 55, 55, {0.65, 0.65, 0.65, 1}, "Live", "The broken game of life.", _, 1, function () selectedParticle = "live" partButtonFunc () end),
	Button (((winSizeW-595)/2)+270, 190, 55, 55, {0.15, 0.15, 0.15, 1}, "Dead", "The broken game of life. Place this over the game area first.", _, 1, function () selectedParticle = "dead" partButtonFunc () end),
	Button (((winSizeW-595)/2)+335, 190, 55, 55, {0.5, 0, 0.5, 1}, "Expand X", "Clones itself over the x-axis", _, 1, function () selectedParticle = "expanderX" partButtonFunc () end),
	Button (((winSizeW-595)/2)+400, 190, 55, 55, {0.5, 0, 0.5, 1}, "Expand Y", "Clones itself over the y-axis.", _, 1, function () selectedParticle = "expanderY" partButtonFunc () end),
	Button (((winSizeW-595)/2)+465, 190, 55, 55, {0.5, 0, 0.5, 1}, "Expand All", "Clones itself as long as there's room.", _, 1, function () selectedParticle = "expanderAll" partButtonFunc () end),
	Button (((winSizeW-595)/2)+530, 190, 55, 55, {112/255, 67/255, 84/255, 1}, "Wallmite Powder", "Near-indestructible wallmite in powder form.", _, 1, function () selectedParticle = "wallmitePowder" partButtonFunc () end),
	Button (((winSizeW-595)/2)+10, 255, 55, 55, {143/255, 151/255, 74/255, 1}, "Corpse", "The remains of some dead creature...", _, 1, function () selectedParticle = "corpse" partButtonFunc () end),
	Button (((winSizeW-595)/2)+75, 255, 55, 55, {1, 1, 1, 0.5}, "Glass", "A semitransparent material that is unaffected by gravity.", _, 1, function () selectedParticle = "glass" partButtonFunc () end),
	Button (((winSizeW-595)/2)+140, 255, 55, 55, {0, 0, 0, 0}, "Barrier", "Invisible and invincible.", _, 1, function () selectedParticle = "barrier" partButtonFunc () end),
	Button (((winSizeW-595)/2)+205, 255, 55, 55, {173/255, 229/255, 240/255, 1}, "Oxygen", "Oddly enough, animals in this world don't need it to survive.", _, 1, function () selectedParticle = "oxygen" partButtonFunc () end),
	Button (((winSizeW-595)/2)+270, 255, 55, 55, {228/255, 230/255, 183/255, 1}, "Helium", "Lighter than oxygen.", _, 1, function () selectedParticle = "helium" partButtonFunc () end),
	Button (((winSizeW-595)/2)+335, 255, 55, 55, {165/255, 185/255, 229/255, 1}, "Steam", "Turns into water after a certain period of time.", _, 1, function () selectedParticle = "steam" partButtonFunc () end),
	Button (((winSizeW-595)/2)+400, 255, 55, 55, {212/255, 137/255, 229/255, 1}, "Antigrav Powder", "Affected by gravity in mysterious ways...", _, 1, function () selectedParticle = "antigravPowder" partButtonFunc () end),
	Button (((winSizeW-595)/2)+465, 255, 55, 55, {231/255, 175/255, 126/255, 1}, "Lightifier", "Makes nearby particles lighter. Doesn't work on invincible particles.", _, 1, function () selectedParticle = "lightifier" partButtonFunc () end),
	Button (((winSizeW-595)/2)+530, 255, 55, 55, {176/255, 134/255, 97/255, 1}, "Densifier", "Makes nearby particles denser. Doesn't work on invincible particles.", _, 1, function () selectedParticle = "densifier" partButtonFunc () end)
}
local settingsButtons = {
	
}


-- This updates all the GUI items
function GUITap (x, y)
	for i,v in ipairs(mainButtons) do
		if v:hoverCheck (x, y) == true then
			v.func ()
		end
	end
	
	if particleMenu == true then
		for i,v in ipairs(particleButtons) do
			if v:hoverCheck (x, y) == true then
				v.func ()
			end
		end
	end
end


-- This handles all the GUI stuff on the screen
function drawGUI (toggle, mouseX, mouseY, nearestX, nearestY)
	toggle = toggle or false -- If false, the GUI won't be drawn
	
	if toggle == true then
		-- Renders the background of the GUI panel
		love.graphics.setColor (140/255, 140/255, 140/255, 1)
		love.graphics.rectangle ("fill", 0, toolBarAnchor, winSizeW, toolBarAnchor+toolBarH)
		love.graphics.setColor (1, 1, 1, 1)
		love.graphics.rectangle ("fill", 0, toolBarAnchor-1, winSizeW, 3)
		
		-- Sets the color to white for the text
		love.graphics.setColor(1, 1, 1, 1)
		
		-- Shows the FPS
		love.graphics.print ("FPS: " .. love.timer.getFPS( ), 5, toolBarAnchor+8)
		
		-- Shows the number of particles
		local particleCount = 0
		for i,v in ipairs (coords) do
			for j, v2 in pairs (v) do
				if v2.type ~= "air" then
					particleCount = particleCount+1
				end
			end
		end
		love.graphics.print ("Parts: " .. particleCount, 5, toolBarAnchor+25)
		
		-- Shows the mouse coords
		love.graphics.print ("Raw: " .. mouseX .. ", " .. mouseY, 80, toolBarAnchor+8)
		love.graphics.print ("Near: " .. nearestX .. ", " .. nearestY, 80, toolBarAnchor+25)
		love.graphics.print ("Coords: " .. (nearestX+20)/20 .. ", " .. (nearestY+20)/20, 80, toolBarAnchor+42)
		
		-- Shows the currently selected particle
		love.graphics.print ("Selected: " .. selectedParticle, 80, toolBarAnchor+59)
		
		-- Shows the particle the cursor is hovering over
		if mouseY < toolBarAnchor and menuOpen == false then
			love.graphics.print ("Over: " .. coords [(nearestX+20)/20][(nearestY+20)/20]["type"], 80, toolBarAnchor+76)
		end
		
		-- Renders the main menu buttons
		for i,v in ipairs(mainButtons) do
			v:draw (mouseX, mouseY)
		end
		
		-- Renders the particle selection menu
		if particleMenu == true then
			love.graphics.setColor (140/255, 140/255, 140/255, 1)
			love.graphics.rectangle ("fill", (winSizeW-595)/2, 50, 595, 270)
			love.graphics.setColor (1, 1, 1, 1)
			love.graphics.rectangle ("line", ((winSizeW-595)/2), 50, 595, 270)
			for i,v in ipairs(particleButtons) do
				v:draw (mouseX, mouseY)
			end
		end
		
		-- Renders the info menu
		if infoMenu == true then
			love.graphics.setColor (140/255, 140/255, 140/255, 1)
			love.graphics.rectangle ("fill", 200, 100, winSizeW-400, toolBarAnchor-230)
			love.graphics.setColor (1, 1, 1, 1)
			love.graphics.rectangle ("line", 200, 100, winSizeW-400, toolBarAnchor-230)
			love.graphics.setColor (0, 0, 0, 1)
			love.graphics.printf (
				'"Just Another Sand Game" Made by Kingtut 101\n' ..
				'© 2021'
			, 200, 130, winSizeW-400, "center")
			love.graphics.printf (
				"CONTROLS:\n" ..
				"LMB - Place Particle\n" ..
				"MMB - Copy Particle\n" ..
				"RMB - Delete Particle\n" ..
				"SPACE - Pause\n" ..
				"R - Reset Playfield\n" ..
				"Q - Layer View (Debug)"
			, 200, 190, winSizeW-400, "center")
			love.graphics.printf ("Made with LOVE2D!", 200, 320, winSizeW-400, "center")
		end
	end
end