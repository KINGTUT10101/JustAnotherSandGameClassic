Steel = Particle:extend ()


function Steel:new (x, y)
	Steel.super.new (self, x, y, 102/255, 104/255, 107/255, 1)
	self.type = "steel"
	self.layer = 20
end


function Steel:doAction ()
	
end