local Canvas = {}
Canvas.__index = Canvas

function Canvas.new(x, y, wide, height)
    local c = {}
    setmetatable(c, Canvas)
    c.x = x or 0
    c.y = y or 0
    c.wide = wide or 0
    c.height = height or 0
    return c
end

function Canvas.draw(self)
    love.graphics.setColor(BACKGROUND_COLOR)
    love.graphics.rectangle('fill', self.x, self.y, self.wide, self.height)
end

return Canvas