-- Creates a blank table holds the data of all the tiles
-- Note: Up/Down are inverted here because LOVE2D starts its coords from the top-left
coords = {}
for i = 1, (winSizeW/20) do
	table.insert (coords, {})
	for j = 1, ((winSizeH-toolBarH)/20) do
		table.insert (coords[i], 0)
	end
end


-- Saves some info about the table
local rows = #coords
local columns = coords[1]
columns = #columns

-- Prints some debug info to the console
print (winSizeW) -- Screen width
print (winSizeH) -- Screen height
print (rows) -- Coords table rows
print (columns) -- Coords table columns


Particle = Object:extend ()


function Particle:new (x, y, r, g, b, a)
	self.x = x or 5
	self.y = y or 5
	self.r = r or math.random()
	self.g = g or math.random()
	self.b = b or math.random()  
	self.a = a or 1
	self.protected = true -- If false, allows the particle to be overridden by the placement tool
	self.invincible = false -- If false, allows the particle to be detroyed in certain situations
	self.layer = 10 -- Determines how particles interact with each other. -20 is the lowest (helium), 0 is medium (air), and 20 is the highest (wallmite).
	self.type = "particle" -- Used to identify each particle
	self.turnOver = false -- Ensures that doAction only executes once per tick
	coords [self.x][self.y] = self
end


function Particle:checkUp ()
	local check = coords [self.x][self.y-1]
	if check ~= nil then
		check = coords [self.x][self.y-1]["type"]
	end
	
	return check
end


function Particle:checkDown ()
	local check = coords [self.x][self.y+1]
	if check ~= nil then
		check = coords [self.x][self.y+1]["type"]
	end
	
	return check
end


function Particle:checkLeft ()
	local check
	if coords [self.x-1] == nil then
		check = nil
	elseif coords [self.x-1][self.y] == nil then
		check = nil
	else
		check = coords [self.x-1][self.y]["type"]
	end
	
	return check
end


function Particle:checkRight ()
	local check
	if coords [self.x+1] == nil then
		check = nil
	elseif coords [self.x+1][self.y] == nil then
		check = nil
	else
		check = coords [self.x+1][self.y]["type"]
	end
	
	return check
end


function Particle:checkUpLeft ()
	local check
	
	if self.x > 1 and self.y > 1 then
		check = coords [self.x-1][self.y-1]["type"]
	else
		check = nil
	end
	
	return check
end


function Particle:checkUpRight ()
	local check
	
	if self.x < rows and self.y > 1 then
		check = coords [self.x+1][self.y-1]["type"]
	else
		check = nil
	end
	
	return check
end


function Particle:checkDownLeft ()
	local check
	
	if self.x > 1 and self.y < columns then
		check = coords [self.x-1][self.y+1]["type"]
	else
		check = nil
	end
	
	return check
end


function Particle:checkDownRight ()
	local check
	
	if self.x < rows and self.y < columns then
		check = coords [self.x+1][self.y+1]["type"]
	else
		check = nil
	end
	
	return check
end


function Particle:checkAdjacent (type, strict)
	local check
	strict = strict or false -- If true, the func will return true only if ALL adjacent particles match
	
	if strict == true then
		if self:checkUp () == type and self:checkDown () == type
		and self:checkLeft () == type and self:checkRight () == type then
			check = true
		else
			check = false
		end
	else
		if self:checkUp () == type or self:checkDown () == type
		or self:checkLeft () == type or self:checkRight () == type then
			check = true
		else
			check = false
		end
	end
	
	return check
end


function Particle:countAdjacent (type, diagonals)
	local check = 0
	diagonals = diagonals or false
	
	if self:checkUp () == type then
		check = check+1
	end
	if self:checkDown () == type then
		check = check+1
	end
	if self:checkLeft () == type then
		check = check+1
	end
	if self:checkRight () == type then
		check = check+1
	end
	
	if diagonals == true then
		if self:checkUpLeft () == type then
			check = check+1
		end
		if self:checkUpRight () == type then
			check = check+1
		end
		if self:checkDownLeft () == type then
			check = check+1
		end
		if self:checkDownRight () == type then
			check = check+1
		end
	end
	
	return check
end


-- Makes a particle fall by one block
function Particle:applyGravity (test)
	local check
	local below = coords [self.x][self.y+1]
	test = test or false
	
	-- If the particle's layer is higher, it will "sink" through the particle below it
	if self:checkDown () ~= nil and self.layer > below.layer then
		if test == false then
			coords [self.x][self.y] = below
			below.y = below.y-1
			self.y = self.y+1
			coords [self.x][self.y] = self
		end
		check = true
	else
		check = false
	end
	return check
end


-- Makes a particle move randomly from side-to-side
function Particle:applyLiquid (test, rng)
	local check
	test = test or false
	rng = rng or math.random ()
	
	if rng < 0.5 and self:checkLeft () ~= nil then
		local left = coords [self.x-1][self.y]
		if self.layer > left.layer then
			if test == false then
				coords [self.x][self.y] = left
				left.x = left.x+1
				self.x = self.x-1
				coords [self.x][self.y] = self
			end
			check = 1
		end
	elseif rng >= 0.5 and self:checkRight () ~= nil then
		local right = coords [self.x+1][self.y]
		if self.layer > right.layer then
			if test == false then
				coords [self.x][self.y] = right
				right.x = right.x-1
				self.x = self.x+1
				coords [self.x][self.y] = self
			end
			check = 2
		end
	else
		check = 0
	end
	return check
end


-- Default behavior for particles
function Particle:doAction ()
	if self.turnOver == false then
		self:applyGravity ()
		self.turnOver = true
	end
end


function Particle:draw ()
	love.graphics.setColor(self.r, self.g, self.b, self.a)
	love.graphics.rectangle("fill", (self.x-1)*20, (self.y-1)*20, 20, 20)
end


	--[[self.type = "sand"
	self.r = 250
	self.g = 246
	self.b = 175]]--