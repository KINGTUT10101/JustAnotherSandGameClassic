Barrier = Particle:extend ()


function Barrier:new (x, y)
	Barrier.super.new (self, x, y, 0, 0, 0, 0)
	self.type = "barrier"
	self.layer = 20
	self.invincible = true
end


function Barrier:doAction ()
	
end


function Air:draw ()

end