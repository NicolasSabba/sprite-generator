require 'globals'
local Menu   = require 'modules.main-menu.module'
local Canvas = require 'modules.canvas.module'

local menu, canvas

-- Check when the mouse is moved
function love.mousemoved( x, y, dx, dy, istouch )
    if x > (WIDE - 300) and y < 248 then
        menu:on_hover(x - (WIDE - 300), y)
    end
end

-- Check clicks
function love.mousepressed( x, y, button, istouch, presses )
    if x > (WIDE - 300) and y < 248 then
        menu:on_click(x - (WIDE - 300), y)
    end
end

function love.load()
    canvas = Canvas.new(WIDE - 300, HEIGHT)
    menu = Menu.new(300, 248)
end

function love.update(dt)

end

function love.draw()
    -- Reset color
    love.graphics.setColor(WHITE)
    menu:draw(WIDE - 300, 0)
    canvas:draw(0, 0)
end