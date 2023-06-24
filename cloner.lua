Cloner = Particle:extend ()


function Cloner:new (x, y)
	Cloner.super.new (self, x, y, 0.75, 0.75, 0.75, 1)
	self.type = "cloner"
	self.layer = 20
	self.invincible = true
	self.cloning = "air"
end


function Cloner:doAction ()
	if self.turnOver == false then
		if self.cloning == "air" then -- Checks for nearby particles to clone
			if self:checkUp () ~= nil and self:checkUp () ~= "cloner" and self:checkUp () ~= "air" then
				self.cloning = coords [self.x][self.y-1]["type"]
			elseif self:checkDown () ~= nil and self:checkDown () ~= "cloner" and self:checkDown () ~= "air" then
				self.cloning = coords [self.x][self.y+1]["type"]
			elseif self:checkLeft () ~= nil and self:checkLeft () ~= "cloner" and self:checkLeft () ~= "air" then
				self.cloning = coords [self.x-1][self.y]["type"]
			elseif self:checkRight () ~= nil and self:checkRight () ~= "cloner" and self:checkRight () ~= "air" then
				self.cloning = coords [self.x+1][self.y]["type"]
			end
		else -- Spawns cloned particles
			if self:checkUp () ~= nil and self:checkUp () == "air" then
				placeParticle (self.x*20-20, (self.y-1)*20-20, self.cloning)
			end
			if self:checkDown () ~= nil and self:checkDown () == "air" then
				placeParticle (self.x*20-20, (self.y+1)*20-20, self.cloning)
			end
			if self:checkLeft () ~= nil and self:checkLeft () == "air" then
				placeParticle ((self.x-1)*20-20, self.y*20-20, self.cloning)
			end
			if self:checkRight () ~= nil and self:checkRight () == "air" then
				placeParticle ((self.x+1)*20-20, self.y*20-20, self.cloning)
			end
		end
		
		self.turnOver = true
	end
end