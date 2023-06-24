Live = Particle:extend ()


function Live:new (x, y)
	Live.super.new (self, x, y, 0.65, 0.65, 0.65, 1)
	self.type = "live"
	self.layer = 20
	self.protected = false
	self.turnOver = true
end


function Live:doAction ()
	if self.turnOver == false then	
		local liveCount = self:countAdjacent ("live", true)
		
		if liveCount < 2 then
			coords [self.x][self.y] = Dead (self.x, self.y)
		elseif liveCount > 3 then
			coords [self.x][self.y] = Dead (self.x, self.y)
		end
		
		self.turnOver = true
	else
		self.turnOver = false
	end
end