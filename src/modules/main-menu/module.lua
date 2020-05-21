local Menu = {}
Menu.__index = Menu

function Menu.new(x, y, wide, height)
    local m = {}
    setmetatable(m, Menu)
    m.x = x or 0
    m.y = y or 0
    m.wide = wide or 0
    m.height = height or 0
    m.font = love.graphics.newFont('assets/font/UbuntuMono-Bold.ttf', 17)
    m.amount_sprites = 9
    m.wide_sprites = 8
    m.height_sprites = 8
    m.generations_sprites = 10
    m.canvas = love.graphics.newCanvas(m.wide, m.height)
    m:draw_canvas()
    return m
end

function Menu.draw_canvas(self)
    love.graphics.setCanvas(self.canvas)
        love.graphics.setColor(LIGTH_BACKGROUND_COLOR)
        love.graphics.rectangle('fill', 0, 0, self.wide, self.height)
        love.graphics.setColor(FONT_COLOR)
        love.graphics.setFont(self.font)
        love.graphics.print('AMOUNT OF SPRITES:', 10, 10)
        love.graphics.print('WIDE OF SPRITES:', 10, 70)
        love.graphics.print('HEIGTHT OF SPRITES:', 10, 130)
        love.graphics.print('AMOUNT OF SAVED GENERATIONS:', 10, 190)
    love.graphics.setCanvas()
end

function Menu.draw(self)
    love.graphics.draw(self.canvas, self.x, self.y)
end

return Menu
