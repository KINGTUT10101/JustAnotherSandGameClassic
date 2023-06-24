Slime = Particle:extend ()


function Slime:new (x, y)
	local rng = math.random ()
	Slime.super.new (self, x, y, 0, 218/255, 65/255, 1)
	self.type = "slime"
	self.layer = 10
	-- Adds variation to the slimes' colors
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


-- Slime replaces nearby tiles with itself
function Slime:doAction ()
	if self.turnOver == false then
		local rng = math.random ()
		
		self:applyGravity ()
		
		if rng <= 0.1 then
			if self:checkUp () ~= nil and self:checkUp () ~= "slime" and coords [self.x][self.y-1]["invincible"] == false then
				coords [self.x][self.y-1] = Slime (self.x, self.y-1)
			end
		elseif rng <= 0.2 then
			if self:checkDown () ~= nil and self:checkDown () ~= "slime" and coords [self.x][self.y+1]["invincible"] == false then
				coords [self.x][self.y+1] = Slime (self.x, self.y+1)
			end
		elseif rng <= 0.3 then
			if self:checkLeft () ~= nil and self:checkLeft () ~= "slime" and coords [self.x-1][self.y]["invincible"] == false then
				coords [self.x-1][self.y] = Slime (self.x-1, self.y)
			end
		elseif rng <= 0.4 then
			if self:checkRight () ~= nil and self:checkRight () ~= "slime" and coords [self.x+1][self.y]["invincible"] == false then
				coords [self.x+1][self.y] = Slime (self.x+1, self.y)
			end
		elseif rng <= 0.55 and self:applyGravity (true) == false then
			self:applyLiquid ()
		end
		
		self.turnOver = true
	end
end