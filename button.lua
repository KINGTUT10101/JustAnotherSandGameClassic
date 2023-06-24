Button = Object:extend ()

function Button:new (x, y, w, h, color, title, desc, icon, scale, func)
	self.x = x or 5
	self.y = y or 5
	self.w = w or 50
	self.h = h or 50
	self.color = color or {1, 1, 1, 1}
	self.title = title or "" -- The text that appears on the button
	self.desc = desc or "" -- The text that will appear at the bottom of the screen when the user hovers over the button
	self.icon = icon
	self.scale = scale or 1 -- The size of the icon
	if self.icon ~= nil then
		self.iconCenterX = ((self.w - (icon:getWidth ()*self.scale))/2)+self.x
		self.iconCenterY = ((self.h - (icon:getHeight ()*self.scale))/2)+self.y
	end
	self.func = func or function () end -- This will be executed when the button is pressed
end


function Button:hoverCheck (mouseX, mouseY)
	local check
	if mouseX >= self.x and mouseY >= self.y and mouseX <= self.x+self.w and mouseY <= self.y+self.h then
		check = true
	else
		check = false
	end
	
	return check
end


function Button:draw (mouseX, mouseY)
	-- Renders the button itself
	love.graphics.setColor (self.color)
	love.graphics.rectangle ("fill", self.x, self.y, self.w, self.h)
	love.graphics.setColor (1, 1, 1, 1)
	love.graphics.rectangle ("line", self.x, self.y, self.w, self.h)
	
	-- Renders the button's icon and text
	if self.icon ~= nil then
		love.graphics.draw(self.icon, self.iconCenterX, self.iconCenterY, 0, self.scale)
	end
	love.graphics.printf (self.title, self.x, self.y, self.w, "center")
	
	-- Renders the tooltip
	if self:hoverCheck (mouseX, mouseY) == true then
		love.graphics.print ("* " .. self.desc, 15, winSizeH-20)
	end
end