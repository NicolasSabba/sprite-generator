local Slider = require 'comons.slider'

local Menu = {}
Menu.__index = Menu

function Menu.new(wide, height)
    local m = {}
    setmetatable(m, Menu)
    -- Size
    m.wide = wide or 0
    m.height = height or 0
    -- Fonts
    m.font = love.graphics.newFont('assets/font/UbuntuMono-Bold.ttf', 17)
    -- Default values
    m.amount_sprites = 9
    m.wide_sprites = 8
    m.height_sprites = 8
    m.generations_sprites = 10
    -- Sliders
    m.amount_sprites_slider = Slider.new(m.wide - 40, 20,
     1, 10, m.amount_sprites, 1,
     function(new_value) m.amount_sprites = new_value end
    )
    m.wide_sprites_slider = Slider.new(m.wide - 40, 20,
     8, 64, m.wide_sprites, 8,
     function(new_value) m.wide_sprites = new_value end
    )
    m.height_sprites_slider = Slider.new(m.wide - 40, 20,
     8, 64, m.height_sprites, 8,
     function(new_value) m.height_sprites = new_value end
    )
    m.generations_sprites_slider = Slider.new(m.wide - 40, 20,
     10, 90, m.generations_sprites, 10,
     function(new_value) m.generations_sprites = new_value end
    )
    -- Graphics
    m.canvas = love.graphics.newCanvas(m.wide, m.height)
    m:draw_canvas()
    return m
end

function Menu.draw_canvas(self)
    love.graphics.setCanvas(self.canvas)
        love.graphics.clear( )
        love.graphics.setColor(LIGTH_BACKGROUND_COLOR)
        love.graphics.rectangle('fill', 0, 0, self.wide, self.height)
        love.graphics.setColor(SEPARATOR_COLOR)
        love.graphics.setLineWidth(5)
        love.graphics.rectangle('line', 0, 0, self.wide, self.height)
        love.graphics.setLineWidth(1)
        love.graphics.setColor(WHITE)
        love.graphics.setFont(self.font)
        love.graphics.print({FONT_COLOR, 'AMOUNT OF SPRITES: ' .. self.amount_sprites}, 10, 10)
        self.amount_sprites_slider:draw(20, 38)
        love.graphics.print({FONT_COLOR, 'WIDE OF SPRITES: ' .. self.wide_sprites}, 10, 70)
        self.wide_sprites_slider:draw(20, 98)
        love.graphics.print({FONT_COLOR, 'HEIGTHT OF SPRITES: ' .. self.height_sprites}, 10, 130)
        self.height_sprites_slider:draw(20, 158)
        love.graphics.print({FONT_COLOR, 'AMOUNT OF SAVED GENERATIONS: ' .. self.generations_sprites}, 10, 190)
        self.generations_sprites_slider:draw(20, 218)
    love.graphics.setCanvas()
end

function Menu.draw(self, x, y)
    love.graphics.draw(self.canvas, x, y)
end

function Menu.on_hover(self, x, y)
    local amount_sprites = x > 20 and y > 38 and x < self.wide - 20 and y < 58
    local wide_sprites = x > 20 and y > 98 and x < self.wide - 20 and y < 118
    local height_sprites = x > 20 and y > 158 and x < self.wide - 20 and y < 178
    local generations_sprites = x > 20 and y > 218 and x < self.wide - 20 and y < 238
    if amount_sprites and not self.amount_sprites_slider.hover then
        self.amount_sprites_slider:on_hover()
        self:draw_canvas()
    elseif wide_sprites and not self.wide_sprites_slider.hover then
        self.wide_sprites_slider:on_hover()
        self:draw_canvas()
    elseif height_sprites and not self.height_sprites_slider.hover then
        self.height_sprites_slider:on_hover()
        self:draw_canvas()
    elseif generations_sprites and not self.generations_sprites_slider.hover then
        self.generations_sprites_slider:on_hover()
        self:draw_canvas()
    elseif not amount_sprites and self.amount_sprites_slider.hover then
        self.amount_sprites_slider:off_hover()
        self:draw_canvas()
    elseif not wide_sprites and self.wide_sprites_slider.hover then
        self.wide_sprites_slider:off_hover()
        self:draw_canvas()
    elseif not height_sprites and self.height_sprites_slider.hover then
        self.height_sprites_slider:off_hover()
        self:draw_canvas()
    elseif not generations_sprites and self.generations_sprites_slider.hover then
        self.generations_sprites_slider:off_hover()
        self:draw_canvas()
    end
end

function Menu.on_click(self, x, y)
    local amount_sprites = x > 20 and y > 38 and x < self.wide - 20 and y < 58
    local wide_sprites = x > 20 and y > 98 and x < self.wide - 20 and y < 118
    local height_sprites = x > 20 and y > 158 and x < self.wide - 20 and y < 178
    local generations_sprites = x > 20 and y > 218 and x < self.wide - 20 and y < 238
    if amount_sprites then
        self.amount_sprites_slider:on_click(x - 20, y - 38)
        self:draw_canvas()
    elseif wide_sprites then
        self.wide_sprites_slider:on_click(x - 20, y - 98)
        self:draw_canvas()
    elseif height_sprites then
        self.height_sprites_slider:on_click(x - 20, y - 158)
        self:draw_canvas()
    elseif generations_sprites then
        self.generations_sprites_slider:on_click(x - 20, y - 218)
        self:draw_canvas()
    end
end

return Menu
