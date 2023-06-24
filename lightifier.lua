Lightifier = Particle:extend ()


function Lightifier:new (x, y)
	Lightifier.super.new (self, x, y, 231/255, 175/255, 126/255, 1)
	self.type = "lightifier"
	self.layer = 20
	self.invincible = true
end


function Lightifier:doAction ()
	if self.turnOver == false then
		if self:checkUp () ~= nil and self:checkUp () ~= "air" and coords [self.x][self.y-1]["invincible"] == false then
			local change = coords [self.x][self.y-1]
			if change.layer >= -18 then
				change.layer = change.layer-2
				change.r = change.r+10/255
				change.g = change.g+10/255
				change.b = change.b+10/255
			end
		end
		if self:checkDown () ~= nil and self:checkDown () ~= "air" and coords [self.x][self.y+1]["invincible"] == false then
			local change = coords [self.x][self.y+1]
			if change.layer >= -18 then
				change.layer = change.layer-2
				change.r = change.r+10/255
				change.g = change.g+10/255
				change.b = change.b+10/255
			end
		end
		if self:checkLeft () ~= nil and self:checkLeft () ~= "air" and coords [self.x-1][self.y]["invincible"] == false then
			local change = coords [self.x-1][self.y]
			if change.layer >= -18 then
				change.layer = change.layer-2
				change.r = change.r+10/255
				change.g = change.g+10/255
				change.b = change.b+10/25
				end
		end
		if self:checkRight () ~= nil and self:checkRight () ~= "air" and coords [self.x+1][self.y]["invincible"] == false then
			local change = coords [self.x+1][self.y]
			if change.layer >= -18 then
				change.layer = change.layer-2
				change.r = change.r+10/255
				change.g = change.g+10/255
				change.b = change.b+10/255
			end
		end
		
		self.turnOver = true
	end
end