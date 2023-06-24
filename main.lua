-- Loads the libraries. There must be a better way to do this...
Object = require ("classic")
require ("button")
require ("GUI")
require ("particle")
require ("air")
require ("acid")
require ("water")
require ("wallmite")
require ("slime")
require ("mekanite")
require ("cloner")
require ("deleter")
require ("steel")
require ("gum")
require ("velcro")
require ("goll")
require ("allakite")
require ("sand")
require ("quickSand")
require ("filter")
require ("oil")
require ("selectDeleter")
require ("fly")
require ("ant")
require ("fish")
require ("live")
require ("dead")
require ("expanderX")
require ("expanderY")
require ("expanderAll")
require ("wallmitePowder")
require ("corpse")
require ("glass")
require ("barrier")
require ("oxygen")
require ("helium")
require ("steam")
require ("antigravPowder")
require ("lightifier")
require ("densifier")
require ("placement")


-- Seeds the random number generator
math.randomseed(os.time())


-- Sets the image filter to nearest so the images aren't blurry
love.graphics.setDefaultFilter("nearest", "nearest")


-- Fills the playing field with air
for i = 1, (winSizeW/20) do
	table.insert (coords, {})
	for j = 1, ((winSizeH-toolBarH)/20) do
		coords [i][j] = Air (i, j)
	end
end


-- Initializes the variables
local lastUpdate = 0
local test1 = Particle ()
local test2 = Particle (10, 10, 1, 0, 0)
local test3 = Particle (15, 10, 0, 1, 0, 1)
local mouseX = 0
local mouseY = 0
local nearestX = 0
local nearestY = 0
local gamePaused = false
selectedParticle = "particle"


function love.update (dt)
	-- Finds the mouse's position and rounds it to the nearest tile
	mouseX, mouseY = love.mouse.getPosition ()
	nearestX = mouseX-(mouseX%20)
	nearestY = mouseY-(mouseY%20)
	
	-- Executes the nested code every eighth of a second
	lastUpdate = lastUpdate + dt
	if lastUpdate >= 1/8 and gamePaused == false then
		-- Executes each particle's actions
		for i,v in ipairs(coords) do
			for j, v2 in pairs(v) do
				v2:doAction ()
			end
		end
		
		-- Sets the turnOver property back to false for all the particles
		for i,v in ipairs(coords) do
			for j, v2 in pairs(v) do
				if v2 ~= 0 then
					v2.turnOver = false
				end
			end
		end
		
		lastUpdate = 0
	end
	
	-- Places particles while LMB is pressed
	if love.mouse.isDown (1) and mouseY < toolBarAnchor and menuOpen == false then
		placeParticle (nearestX, nearestY, selectedParticle)
	end
	
	-- Removes particles while RMB is pressed
	if love.mouse.isDown (2) and mouseY < toolBarAnchor and menuOpen == false then
		removeParticle (nearestX, nearestY)
	end
	
	-- Copies the particle the cursor is hovering over
	if love.mouse.isDown (3) and mouseY < toolBarAnchor and menuOpen == false then
		local copied = coords [(nearestX+20)/20][(nearestY+20)/20]["type"]
		if copied ~= "air" then -- Ensures that air is never selected
			selectedParticle = copied
		end
	end
end


function love.draw()
	-- Renders the particles
	for i,v in ipairs(coords) do
        for j, v2 in pairs(v) do
			if v2.type ~= "air" then
				v2:draw ()
			end
		end
    end
	
	-- Renders the square cursor
	love.graphics.setColor(1, 1, 1, 1)
	love.graphics.rectangle("line", nearestX, nearestY, 20, 20)
	
	-- Renders the GUI
	drawGUI (true, mouseX, mouseY, nearestX, nearestY)
	
	-- Draws a yellow border if the game is paused
	if gamePaused == true then
		love.graphics.setColor(251/255, 242/255, 54/255, 1)
		love.graphics.rectangle("line", 2, 2, winSizeW-4, winSizeH-4)
	end
	
	-- Shows the coords table when Q is pressed (for debug purposes)
	if love.keyboard.isDown ("q") then
		love.graphics.setColor(0, 0, 0, 1)
		love.graphics.rectangle("fill", 0, 0, winSizeW, winSizeH)
		love.graphics.setColor(1, 1, 1, 1)
		for i = 1, (winSizeW/20) do
			love.graphics.setColor(1, 1, 1, 1)
			love.graphics.print (i .. ": ", i*20-20, 10)
			for j = 1, ((winSizeH-toolBarH)/20) do
				if (nearestX+20)/20 == i and (nearestY+20)/20 == j then
					love.graphics.setColor(1, 0, 0, 1)
				else
					love.graphics.setColor(1, 1, 1, 1)
				end
				love.graphics.print (coords[i][j]["layer"], i*20-20, j*15+10)
			end
		end
	end
end


function love.keypressed (pressedKey)
	-- Quits the game
	if pressedKey == "escape" then
		love.event.quit()
	end
	
	-- Resets the game by deleting everything in the table
	if pressedKey == "r" then
		resetPlayArea () -- In placement.lua
	end
	
	-- Pauses the game
	if pressedKey == "space" then
		gamePaused = not gamePaused
	end
end


function love.mousereleased (x, y, button, istouch, presses)
	-- Updates the GUI items
	GUITap (x, y)
end