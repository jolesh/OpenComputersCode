local robot = require("robot")
local component = require("component")

--[[
    Start: 
    invt: elec. wrench equipped and configurator in 1
    pos: standing infront of redstone torch
]]
while(true) do
--remove:
robot.select(1)
robot.swing() --torch
robot.forward()
robot.suck()
robot.use() --miner
robot.forward()
component.inventory_controller.equip() --configurator
robot.turnLeft()
robot.use(3, true) -- cable1
robot.turnRight()
robot.use(3, true) -- tesseract
robot.forward()
robot.turnLeft()
robot.use(3, true) -- cable2
robot.turnRight()
component.inventory_controller.equip() --elec. wrench

--move:
for i = 1, 32, 1 do
  robot.forward()
end

--build:
robot.turnLeft()
robot.select(5)
robot.place() --cable 2
robot.turnRight()
robot.back()
robot.select(6)
robot.place() --tesseract
robot.turnLeft()
robot.select(5)
robot.place() --cable 1
robot.turnRight()
robot.back()
robot.select(4)
robot.place() --miner
robot.select(3)
component.inventory_controller.dropIntoSlot(3, 2) --scannercard
robot.up()
robot.select(2)
robot.placeDown() --torch
robot.back()
robot.down()

--sleep one hour:
os.sleep(3600)
end