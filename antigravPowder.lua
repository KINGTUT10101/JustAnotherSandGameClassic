AntigravPowder = Particle:extend ()


function AntigravPowder:new (x, y)
	local rng = math.random ()
	AntigravPowder.super.new (self, x, y, 212/255, 137/255, 229/255, 1)
	self.type = "antigravPowder"
	self.layer = -20
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


function AntigravPowder:doAction ()
	if self.turnOver == false then
		self:applyGravity ()
		self.turnOver = true
	end
end