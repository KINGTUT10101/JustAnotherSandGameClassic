ExpanderY = Particle:extend ()


function ExpanderY:new (x, y)
	ExpanderY.super.new (self, x, y, 0.5, 0, 0.5, 1)
	self.type = "expanderY"
	self.layer = 20
	self.turnOver = true
end


function ExpanderY:doAction ()
	if self.turnOver == false then
		if self:checkUp () ~= nil and self:checkUp () == "air" then
			placeParticle (self.x*20-20, (self.y-1)*20-20, "expanderY")
		end
		if self:checkDown () ~= nil and self:checkDown () == "air" then
			placeParticle (self.x*20-20, (self.y+1)*20-20, "expanderY")
		end
		
		self.turnOver = true
	else
		self.turnOver = false
	end
end