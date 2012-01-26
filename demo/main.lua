-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- include the library
local memory = require("memory")

-- make a clear button
local clear = display.newText("Clear All Particles", 10, 10, native.systemFont, 16)
clear:setTextColor(255,0,0)

clear.touch = function(e)
  if e.phase == "ended" then
    memory.kill() -- this kills everything stored in memory
  end

  return true -- stop event from propagating
end

clear:addEventListener("touch", clear.touch)


-- generate 30 random particles
for i=1,30 do
  local x = math.random (50, display.contentWidth - 50)
  local y = math.random (50, display.contentHeight - 50)
  local particle = display.newCircle( x, y, 30 )

  particle.touch = function(e)
    if e.phase == "ended" then
      memory.remove(particle) -- remove just this particle from memory
    end

    return true -- stop event from propagating
  end

  particle.clean = function()
    particle:removeEventListener("touch", particle.touch)
    display.remove(particle)
    particle = nil
  end

  particle:addEventListener("touch", particle.touch)

  memory.add(particle) -- add the particle to memory
end