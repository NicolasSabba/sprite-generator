function love.conf(t)
--    t.identity = nil                    -- The name of the save directory (string)
--    t.appendidentity = false            -- Search files in source directory before save directory (boolean)
    t.version = "11.3"                      -- The LÖVE version this game was made for (string)
    t.console = false                   -- Attach a console (boolean, Windows only)
    t.window.title = "Sprite Generator"         -- The window title (string)

--    t.window.icon = TODO                 -- Filepath to an image to use as the window's icon (string)
    t.window.width = 1200                -- The window width (number)
    t.window.height = 720               -- The window height (number)
    t.window.resizable = false          -- Let the window be user-resizable (boolean)
    t.window.vsync = 1                  -- Vertical sync mode (number)
end