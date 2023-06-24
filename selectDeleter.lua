SelectDeleter = Particle:extend ()


function SelectDeleter:new (x, y)
	SelectDeleter.super.new (self, x, y, 0.4, 0.4, 0.4, 1)
	self.type = "selectDeleter"
	self.layer = 20
	self.invincible = true
	self.deleting = "air"
end


function SelectDeleter:doAction ()
	if self.turnOver == false then
		if self.deleting == "air" then -- Checks for nearby particles to delete
			if self:checkUp () ~= nil and self:checkUp () ~= "selectDeleter" and self:checkUp () ~= "air" then
				self.deleting = coords [self.x][self.y-1]["type"]
			elseif self:checkDown () ~= nil and self:checkDown () ~= "selectDeleter" and self:checkDown () ~= "air" then
				self.deleting = coords [self.x][self.y+1]["type"]
			elseif self:checkLeft () ~= nil and self:checkLeft () ~= "selectDeleter" and self:checkLeft () ~= "air" then
				self.deleting = coords [self.x-1][self.y]["type"]
			elseif self:checkRight () ~= nil and self:checkRight () ~= "selectDeleter" and self:checkRight () ~= "air" then
				self.deleting = coords [self.x+1][self.y]["type"]
			end
		else -- Deletes the selected particles
			if self:checkUp () ~= nil and self:checkUp () == self.deleting then
				coords[self.x][self.y-1] = Air (self.x, self.y-1)
			end
			if self:checkDown () ~= nil and self:checkDown () == self.deleting then
				coords[self.x][self.y+1] = Air (self.x, self.y+1)
			end
			if self:checkLeft () ~= nil and self:checkLeft () == self.deleting then
				coords[self.x-1][self.y] = Air (self.x-1, self.y)
			end
			if self:checkRight () ~= nil and self:checkRight () == self.deleting then
				coords[self.x+1][self.y] = Air (self.x+1, self.y)
			end
		end
		
		self.turnOver = true
	end
end