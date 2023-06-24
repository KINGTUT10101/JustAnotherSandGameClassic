Air = Particle:extend ()


function Air:new (x, y)
	Acid.super.new (self, x, y, 0, 0, 0, 0)
	self.type = "air"
	self.layer = 0
	self.protected = false
	self.invincible = true
end


function Air:draw ()

end