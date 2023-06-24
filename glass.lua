Glass = Particle:extend ()


function Glass:new (x, y)
	Glass.super.new (self, x, y, 1, 1, 1, 0.5)
	self.type = "glass"
	self.layer = 20
end


function Glass:doAction ()
	
end