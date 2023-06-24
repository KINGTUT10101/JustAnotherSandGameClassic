Sand = Particle:extend ()


function Sand:new (x, y)
	local rng = math.random ()
	Sand.super.new (self, x, y, 240/255, 240/255, 97/255, 1)
	self.type = "sand"
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