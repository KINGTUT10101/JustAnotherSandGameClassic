Deleter = Particle:extend ()


function Deleter:new (x, y)
	Deleter.super.new (self, x, y, 0.25, 0.25, 0.25, 1)
	self.type = "deleter"
	self.layer = 20
	self.invincible = true
end


function Deleter:doAction ()
	if self.turnOver == false then
		if self:checkUp () ~= nil and coords [self.x][self.y-1]["invincible"] == false then
			coords [self.x][self.y-1] = Air (self.x, self.y-1)
		end
		if self:checkDown () ~= nil and coords [self.x][self.y+1]["invincible"] == false then
			coords [self.x][self.y+1] = Air (self.x, self.y+1)
		end
		if self:checkLeft () ~= nil and coords [self.x-1][self.y]["invincible"] == false then
			coords [self.x-1][self.y] = Air (self.x-1, self.y)
		end
		if self:checkRight () ~= nil and coords [self.x+1][self.y]["invincible"] == false then
			coords [self.x+1][self.y] = Air (self.x+1, self.y)
		end
		
		self.turnOver = true
	end
end