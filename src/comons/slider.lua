local Slider = {}
Slider.__index = Slider

function Slider.new(x, y, wide, height, min_value, max_value, step, callback)
    local s = {}
    setmetatable(s, Slider)
    return s
end

return Slider