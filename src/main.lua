require 'globals'
local Menu   = require 'modules.main-menu.module'
local Canvas = require 'modules.canvas.module'

local menu, canvas

function love.load()
    menu = Menu.new(300, 248)
    canvas = Canvas.new(WIDE - 300, HEIGHT)
end

function love.update(dt)
end

function love.draw()
    -- Reset color
    love.graphics.setColor(WHITE)
    menu:draw(WIDE - 300, 0)
    canvas:draw(0, 0)
end