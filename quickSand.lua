QuickSand = Particle:extend ()


function QuickSand:new (x, y)
	local rng = math.random ()
	QuickSand.super.new (self, x, y, 230/255, 190/255, 65/255, 1)
	self.type = "quickSand"
	self.layer = 8
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