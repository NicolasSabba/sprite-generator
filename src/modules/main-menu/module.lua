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
    m.amount_sprites_slider = Slider.new(m.wide - 40, 20, 1, 10, m.amount_sprites, 1)
    m.wide_sprites_slider = Slider.new(m.wide - 40, 20, 8, 64, m.wide_sprites, 8)
    m.height_sprites_slider = Slider.new(m.wide - 40, 20, 8, 64, m.height_sprites, 8)
    m.generations_sprites_slider = Slider.new(m.wide - 40, 20, 10, 90, m.generations_sprites, 10)
    -- Graphics
    m.canvas = love.graphics.newCanvas(m.wide, m.height)
    m:draw_canvas()
    return m
end

function Menu.draw_canvas(self)
    love.graphics.setCanvas(self.canvas)
        love.graphics.setColor(LIGTH_BACKGROUND_COLOR)
        love.graphics.rectangle('fill', 0, 0, self.wide, self.height)
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

return Menu
