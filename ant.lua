Ant = Particle:extend ()


function Ant:new (x, y)
	Ant.super.new (self, x, y, 16/255, 97/255, 115/255, 1)
	self.type = "ant"
	self.layer = 9
	self.health = 40
end


-- Ants can move along the ground and they require air to survive.
function Ant:doAction ()
	if self.turnOver == false then
		local rng = math.random ()
		
		if self:applyGravity (true) == true then
			self:applyGravity ()
		else		
			if rng <= 0.1 and self:checkUp () == "air" then
				local replacement = coords [self.x][self.y-1]
				coords [self.x][self.y] = replacement
				replacement.y = replacement.y+1
				self.y = self.y-1
				coords [self.x][self.y] = self
				if rng <= 0.04 and self:checkLeft () == "air" then
					local replacement = coords [self.x-1][self.y]
					coords [self.x][self.y] = replacement
					replacement.x = replacement.x+1
					self.x = self.x-1
					coords [self.x][self.y] = self
				elseif rng <= 0.08 and self:checkRight () == "air" then
					local replacement = coords [self.x+1][self.y]
					coords [self.x][self.y] = replacement
					replacement.x = replacement.x-1
					self.x = self.x+1
					coords [self.x][self.y] = self
				end
			elseif rng <= 0.3 and self:checkLeft () == "air" then
				local replacement = coords [self.x-1][self.y]
				coords [self.x][self.y] = replacement
				replacement.x = replacement.x+1
				self.x = self.x-1
				coords [self.x][self.y] = self
			elseif rng <= 0.5 and self:checkRight () == "air" then
				local replacement = coords [self.x+1][self.y]
				coords [self.x][self.y] = replacement
				replacement.x = replacement.x-1
				self.x = self.x+1
				coords [self.x][self.y] = self
			end
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