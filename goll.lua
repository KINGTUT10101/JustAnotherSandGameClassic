Goll = Particle:extend ()


function Goll:new (x, y)
	local rng = math.random ()
	Goll.super.new (self, x, y, 129/255, 92/255, 49/255, 1)
	self.type = "goll"
	self.layer = 18
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