ExpanderAll = Particle:extend ()


function ExpanderAll:new (x, y)
	ExpanderAll.super.new (self, x, y, 0.5, 0, 0.5, 1)
	self.type = "expanderAll"
	self.layer = 20
	self.turnOver = true
end


function ExpanderAll:doAction ()
	if self.turnOver == false then
		if self:checkUp () ~= nil and self:checkUp () == "air" then
			placeParticle (self.x*20-20, (self.y-1)*20-20, "expanderAll")
		end
		if self:checkDown () ~= nil and self:checkDown () == "air" then
			placeParticle (self.x*20-20, (self.y+1)*20-20, "expanderAll")
		end
		if self:checkLeft () ~= nil and self:checkLeft () == "air" then
			placeParticle ((self.x-1)*20-20, self.y*20-20, "expanderAll")
		end
		if self:checkRight () ~= nil and self:checkRight () == "air" then
			placeParticle ((self.x+1)*20-20, self.y*20-20, "expanderAll")
		end
		
		self.turnOver = true
	else
		self.turnOver = false
	end
end