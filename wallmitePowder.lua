WallmitePowder = Particle:extend ()


function WallmitePowder:new (x, y)
	local rng = math.random ()
	WallmitePowder.super.new (self, x, y, 112/255, 67/255, 84/255, 1)
	self.type = "wallmitePowder"
	self.layer = 10
	self.invincible = true
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