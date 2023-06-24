Dead = Particle:extend ()


function Dead:new (x, y)
	Dead.super.new (self, x, y, 0.15, 0.15, 0.15, 1)
	self.type = "dead"
	self.layer = 20
	self.protected = false
	self.turnOver = true
end


function Dead:doAction ()
	if self.turnOver == false then
		local liveCount = self:countAdjacent ("live", true)
		
		if liveCount == 3 then
			coords [self.x][self.y] = Live (self.x, self.y)
		end
		
		self.turnOver = true
	else
		self.turnOver = false
	end
end