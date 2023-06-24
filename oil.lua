Oil = Particle:extend ()


function Oil:new (x, y)
	local rng = math.random ()
	Oil.super.new (self, x, y, 56/255, 38/255, 38/255, 1)
	self.type = "oil"
	self.layer = 4
	self.protected = false
	-- Adds variation to the particles' colors
	if rng <= 3/15 then
		self.r = self.r+15/255
		self.g = self.g+15/255
		self.b = self.b+15/255
	end
end


function Oil:doAction ()
	local rng = math.random ()
	if self.turnOver == false then
		if self:applyGravity (true) == false then
			if rng <= 0.5 then
				self:applyLiquid ()
			end
		else
			self:applyGravity ()
		end
		
		self.turnOver = true
	end
end