Allakite = Particle:extend ()


function Allakite:new (x, y)
	local rng = math.random ()
	Allakite.super.new (self, x, y, 172/255, 195/255, 204/255, 1)
	self.type = "allakite"
	self.layer = 3
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