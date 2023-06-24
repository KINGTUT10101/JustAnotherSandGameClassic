Mekanite = Particle:extend ()


function Mekanite:new (x, y)
	local rng = math.random ()
	Mekanite.super.new (self, x, y, 52/255, 0, 92/255, 1)
	self.type = "mekanite"
	self.layer = 10
	self.invincible = true
	self.timer = 0
	-- Adds variation to the particles' colors
	if rng <= 1/15 then
		self.r = self.r+15/255
		self.g = self.g+15/255
		self.b = self.b+15/255
	elseif rng >= 14/15 then
		self.r = self.r-15/255
		self.g = self.g-15/255
		self.b = self.b-15/255
	end
end


-- Mechanites replace nearby tiles with itself. They are not affected by gravity and are more efficient than slime particles.
function Mekanite:doAction ()
	if self.turnOver == false then
		if self:checkUp () ~= nil and coords [self.x][self.y-1]["invincible"] == false then
			coords [self.x][self.y-1] = Mekanite (self.x, self.y-1)
			coords [self.x][self.y-1]["turnOver"] = true
		end
		if self:checkDown () ~= nil and coords [self.x][self.y+1]["invincible"] == false then
			coords [self.x][self.y+1] = Mekanite (self.x, self.y+1)
			coords [self.x][self.y+1]["turnOver"] = true
		end
		if self:checkLeft () ~= nil and coords [self.x-1][self.y]["invincible"] == false then
			coords [self.x-1][self.y] = Mekanite (self.x-1, self.y)
			coords [self.x-1][self.y]["turnOver"] = true
		end
		if self:checkRight () ~= nil and coords [self.x+1][self.y]["invincible"] == false then
			coords [self.x+1][self.y] = Mekanite (self.x+1, self.y)
			coords [self.x+1][self.y]["turnOver"] = true
		end
		
		-- Deletes itself after a certain number of ticks
		self.timer = self.timer+1
		if self.timer >= 35 then
			coords [self.x][self.y] = Air (self.x, self.y)
		end
		
		self.turnOver = true
	end
end