local robot = require("robot")
local component = require("component")

--[[
    Start: 
    invt: elec. wrench equipped and configurator in 1
    pos: standing infront of redstone torch
]]

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