Acid = Particle:extend ()


function Acid:new (x, y)
	Acid.super.new (self, x, y, 190/255, 1, 16/255, 1)
	self.type = "acid"
	self.layer = 3
	self.protected = false
end


function Acid:doAction ()
	if self.turnOver == false then
		self:applyGravity ()
		self:applyGravity ()
		if self:applyGravity (true) == false then
			if self:checkDown () ~= "acid" and self:checkDown () ~= nil and coords [self.x][self.y+1]["invincible"] == false then
				coords [self.x][self.y+1] = Air (self.x, self.y+1)
				coords [self.x][self.y] = Air (self.x, self.y)
			elseif self:checkLeft () ~= "acid" and self:checkLeft () ~= nil and coords [self.x-1][self.y]["invincible"] == false then
				coords [self.x-1][self.y] = Air (self.x-1, self.y)
				coords [self.x][self.y] = Air (self.x, self.y)
			elseif self:checkRight () ~= "acid" and self:checkRight () ~= nil and coords [self.x+1][self.y]["invincible"] == false then
				coords [self.x+1][self.y] = Air (self.x+1, self.y)
				coords [self.x][self.y] = Air (self.x, self.y)
			else
				self:applyLiquid ()
			end
		end
		
		self.turnOver = true
	end
end