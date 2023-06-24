Wallmite = Particle:extend ()


function Wallmite:new (x, y)
	Wallmite.super.new (self, x, y, 87/255, 42/255, 59/255, 1)
	self.type = "wallmite"
	self.layer = 20
	self.invincible = true
end


-- Wallmite is just an invincible wall, so it doesn't do anything.
function Wallmite:doAction ()
	
end