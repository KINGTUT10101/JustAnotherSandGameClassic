Velcro = Particle:extend ()


function Velcro:new (x, y)
	Velcro.super.new (self, x, y, 75/255, 49/255, 82/255, 1)
	self.type = "velcro"
	self.layer = 10
end


-- Gum sticks to adjacent tiles
function Velcro:doAction ()
	if self.turnOver == false then
		
		if self:checkUp () ~= "velcro" and self:checkDown () ~= "velcro"
		and self:checkLeft () ~= "velcro" and self:checkRight () ~= "velcro" then
			self:applyGravity ()
		end
		
		self.turnOver = true
	end
end