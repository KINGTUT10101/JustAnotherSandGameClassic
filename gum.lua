Gum = Particle:extend ()


function Gum:new (x, y)
	Gum.super.new (self, x, y, 1, 64/255, 140/255, 1)
	self.type = "gum"
	self.layer = 10
end


-- Gum sticks to adjacent tiles
function Gum:doAction ()
	if self.turnOver == false then
		
		if self:checkUp () == "air" and self:checkDown () == "air"
		and self:checkLeft () == "air" and self:checkRight () == "air" then
			self:applyGravity ()
		end
		
		self.turnOver = true
	end
end