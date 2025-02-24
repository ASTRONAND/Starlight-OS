local glib = require("/lib/glib")
local y = 8
local x = 20
term.setBackgroundColor(colors.lightBlue)
term.clear()
local bird = {}
local FBL = require("/bin/flappybird/FBlib")
local pipe = FBL.pipe
local function tick()
  while true do
    term.setBackgroundColor(colors.lightBlue)
    term.clear()
    bird = {
      4,2,
      {
        "3","4","f","3",
        "4","4","4","1",
      },
      {
        "4","4","0","1",
        "3","4","4","3",
      },
      {
        7,5,4,11,
        11,9,10,4,
      }
    }
    glib.drawSprite(pipe,x,6)
    glib.drawSprite(pipe,x+5,6)
    glib.drawSprite(pipe,x+10,-10)
    glib.drawSprite(pipe,x+15,6)
    glib.drawSprite(pipe,x+20,6)
    glib.drawSprite(pipe,x+25,6)
    glib.drawSprite(bird,5,y)
    glib.printScreenBuffer()
    sleep(1)
    y = y + 1
    x = x - 1
  end
end
local function input()
  while true do
    local i1,i2 = os.pullEvent()
    if i1 == "key" and i2 == keys.space then
      y = y - 2
    end
    sleep(0)
  end
end
parallel.waitForAny(tick, input)
