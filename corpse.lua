Corpse = Particle:extend ()


function Corpse:new (x, y)
	local rng = math.random ()
	Corpse.super.new (self, x, y, 143/255, 151/255, 74/255, 1)
	self.type = "corpse"
	self.layer = 10
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