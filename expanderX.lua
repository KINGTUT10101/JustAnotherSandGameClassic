ExpanderX = Particle:extend ()


function ExpanderX:new (x, y)
	ExpanderX.super.new (self, x, y, 0.5, 0, 0.5, 1)
	self.type = "expanderX"
	self.layer = 20
	self.turnOver = true
end


function ExpanderX:doAction ()
	if self.turnOver == false then
		if self:checkLeft () ~= nil and self:checkLeft () == "air" then
			placeParticle ((self.x-1)*20-20, self.y*20-20, "expanderX")
		end
		if self:checkRight () ~= nil and self:checkRight () == "air" then
			placeParticle ((self.x+1)*20-20, self.y*20-20, "expanderX")
		end
		
		self.turnOver = true
	else
		self.turnOver = false
	end
end