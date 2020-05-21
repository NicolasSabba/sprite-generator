require 'globals'
local Menu   = require 'modules.main-menu.module'
local Canvas = require 'modules.canvas.module'

local menu, canvas

function love.load()
    menu = Menu.new(WIDE - 300, 0, 300, 260)
    canvas = Canvas.new(0, 0, WIDE - 300, HEIGHT)
end

function love.update(dt)
end

function love.draw()
    -- Reset color
    love.graphics.setColor(WHITE)
    menu:draw()
    canvas:draw()
end