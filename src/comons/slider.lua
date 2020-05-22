local Slider = {}
Slider.__index = Slider

function Slider.new(wide, height, min_value, max_value, value, step, click_callback)
    local s = {}
    setmetatable(s, Slider)
    -- Size
    s.wide = wide or 1
    s.height = height or 1
    -- Values
    s.min_value = min_value or 0
    s.max_value = max_value or 1
    s.value = value or 0
    s.step = step or 0.1
    -- Slider graphics
    s.amount_marks = (s.max_value - s.min_value) / s.step
    s.space_marks = s.wide / s.amount_marks
    -- Return function
    s.click_callback = click_callback or function() print('no function') end
    -- Graphics
    s.hover = false
    s.canvas = love.graphics.newCanvas(s.wide, s.height)
    s:draw_canvas()
    return s
end

function Slider.draw_canvas(self)
    love.graphics.setCanvas(self.canvas)
        love.graphics.clear( )
        -- Draw bar
        love.graphics.setColor(SLIDER_COLOR)
        love.graphics.rectangle('fill', 0, (self.height / 2) - 2, self.wide, 4)
        -- Draw marks
        for i = 0, self.amount_marks do
            love.graphics.rectangle('fill', i * self.space_marks - 2, (self.height / 2) - 4, 4, 8)
        end
        -- Draw selector
        if self.hover then
            love.graphics.setColor(SLIDER_SHADOW)
            love.graphics.circle('fill', ((self.value / self.step) - 1) * self.space_marks, (self.height / 2), (self.height / 2))
        end
        love.graphics.setColor(SLIDER_COLOR)
        love.graphics.circle('fill', ((self.value / self.step) - 1) * self.space_marks, (self.height / 2), (self.height / 2) - 2)
        love.graphics.setColor(WHITE)
    love.graphics.setCanvas()
end

function Slider.draw(self, x, y)
    love.graphics.draw(self.canvas, x, y);
end

function Slider.on_hover(self)
    if not self.hover then
        self.hover = true
        self:draw_canvas()
    end
end

function Slider.off_hover(self)
    self.hover = false
    self:draw_canvas()
end

function Slider.on_click(self, x, y)
    local new_value = (math.floor((x / self.space_marks) + 0.5) + 1) * self.step
    self.value = new_value
    self:draw_canvas()
    self.click_callback(new_value)
end

return Slider