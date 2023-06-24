Water = Particle:extend ()


function Water:new (x, y)
	local rng = math.random ()
	Water.super.new (self, x, y, 28/255, 66/255, 255/255, 1)
	self.type = "water"
	self.layer = 5
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


function Water:doAction ()
	if self.turnOver == false then
		if self:applyGravity (true) == false then
			self:applyLiquid ()
		else
			self:applyGravity ()
			self:applyGravity ()
		end
		
		self.turnOver = true
	end
end