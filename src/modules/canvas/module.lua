local Canvas = {}
Canvas.__index = Canvas

function Canvas.new(wide, height)
    local c = {}
    setmetatable(c, Canvas)
    c.wide = wide or 0
    c.height = height or 0
    return c
end

function Canvas.draw(self, x, y)
    love.graphics.setColor(SLIDER_COLOR)
    love.graphics.rectangle('fill', x, y, self.wide, self.height)
end

return Canvas