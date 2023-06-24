Fly = Particle:extend ()


function Fly:new (x, y)
	Fly.super.new (self, x, y, 47/255, 49/255, 145/255, 1)
	self.type = "fly"
	self.layer = 9
	self.health = 40
end


-- Flies can fly and they require air to survive.
function Fly:doAction ()
	if self.turnOver == false then
		local rng = math.random ()
		
		if rng <= 0.2 and self:checkUp () == "air" then
			local replacement = coords [self.x][self.y-1]
			coords [self.x][self.y] = replacement
			replacement.y = replacement.y+1
			self.y = self.y-1
			coords [self.x][self.y] = self
		elseif rng <= 0.4 and self:checkDown () == "air" then
			local replacement = coords [self.x][self.y+1]
			coords [self.x][self.y] = replacement
			replacement.y = replacement.y-1
			self.y = self.y+1
			coords [self.x][self.y] = self
		elseif rng <= 0.6 and self:checkLeft () == "air" then
			local replacement = coords [self.x-1][self.y]
			coords [self.x][self.y] = replacement
			replacement.x = replacement.x+1
			self.x = self.x-1
			coords [self.x][self.y] = self
		elseif rng <= 0.8 and self:checkRight () == "air" then
			local replacement = coords [self.x+1][self.y]
			coords [self.x][self.y] = replacement
			replacement.x = replacement.x-1
			self.x = self.x+1
			coords [self.x][self.y] = self
		end
		
		-- If there's no air nearby, the fly takes damage
		if self:checkAdjacent ("air", false) == false then
			self.health = self.health-1
		end
		
		if self.health <= 0 then
			coords [self.x][self.y] = Corpse (self.x, self.y)
		end
		
		self.turnOver = true
	end
end