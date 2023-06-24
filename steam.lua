Steam = Particle:extend ()


function Steam:new (x, y)
	local rng = math.random ()
	Steam.super.new (self, x, y, 165/255, 185/255, 229/255, 1)
	self.type = "steam"
	self.layer = -10
	self.protected = false
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


function Steam:doAction ()
	if self.turnOver == false then
		rng = math.random ()
		
		if self:applyGravity (true) == false then
			-- This is a very lazy way to impliment this, but I just want to wrap up this project...
			local originalLayer = self.layer
			self.layer = 1
			self:applyLiquid ()
			self.layer = originalLayer
		else
			self:applyGravity ()
			self:applyGravity ()
		end
		
		if rng < 0.01 then
			coords [self.x][self.y] = Water (self.x, self.y)
		end
		
		self.turnOver = true
	end
end