Fish = Particle:extend ()


function Fish:new (x, y)
	Fish.super.new (self, x, y, 1, 101/255, 0, 1)
	self.type = "fish"
	self.layer = 5
	self.health = 40
end


-- Flies can fly and they require air to survive.
function Fish:doAction ()
	if self.turnOver == false then
		local rng = math.random ()
		
		if self:applyGravity (true) == true then
			self:applyGravity ()
		else
			-- Movement in water
			if rng <= 0.1 and self:checkUp () == "water" then
				local replacement = coords [self.x][self.y-1]
				coords [self.x][self.y] = replacement
				replacement.y = replacement.y+1
				self.y = self.y-1
				coords [self.x][self.y] = self
			elseif rng <= 0.2 and self:checkDown () == "water" then
				local replacement = coords [self.x][self.y+1]
				coords [self.x][self.y] = replacement
				replacement.y = replacement.y-1
				self.y = self.y+1
				coords [self.x][self.y] = self
			elseif rng <= 0.3 and self:checkLeft () == "water" then
				local replacement = coords [self.x-1][self.y]
				coords [self.x][self.y] = replacement
				replacement.x = replacement.x+1
				self.x = self.x-1
				coords [self.x][self.y] = self
			elseif rng <= 0.4 and self:checkRight () == "water" then
				local replacement = coords [self.x+1][self.y]
				coords [self.x][self.y] = replacement
				replacement.x = replacement.x-1
				self.x = self.x+1
				coords [self.x][self.y] = self
			-- Controls movement if the fish can't find any water to breath. It's meant to emulate flopping fish out of water.
			elseif self:checkAdjacent ("water", false) == false then
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
		end
		
		-- If there's no air nearby, the fly takes damage
		if self:checkAdjacent ("water", false) == false then
			self.health = self.health-1
		end
		
		if self.health <= 0 then
			coords [self.x][self.y] = Corpse (self.x, self.y)
		end
		
		self.turnOver = true
	end
end