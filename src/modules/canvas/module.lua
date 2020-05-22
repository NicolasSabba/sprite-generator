local Canvas = {}
Canvas.__index = Canvas

function Canvas.new(wide, height)
    local c = {}
    setmetatable(c, Canvas)
    -- Size
    c.wide = wide or 0
    c.height = height or 0
    -- Canvas
    c.canvas = love.graphics.newCanvas(c.wide, c.height)
    c:draw_canvas()
    return c
end

function Canvas.draw_canvas(self)
    love.graphics.setCanvas(self.canvas)
        love.graphics.clear( )
        love.graphics.setColor(LIGTH_BACKGROUND_COLOR)
        love.graphics.rectangle('fill', 0, 0, self.wide, self.height)
        love.graphics.setColor(SEPARATOR_COLOR)
        love.graphics.setLineWidth(5)
        love.graphics.rectangle('line', 0, 0, self.wide, self.height)
        love.graphics.setLineWidth(1)
        love.graphics.setColor(WHITE)
    love.graphics.setCanvas()
end

function Canvas.draw(self, x, y)
    love.graphics.draw(self.canvas, x, y)
end

return Canvas