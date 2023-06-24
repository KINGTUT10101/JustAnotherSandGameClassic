Filter = Particle:extend ()


function Filter:new (x, y)
	Filter.super.new (self, x, y, 215/255, 200/255, 15/255, 1)
	self.type = "filter"
	self.layer = 5
	self.invincible = true
end


function Filter:doAction ()
	
end