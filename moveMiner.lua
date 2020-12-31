local robot = require("Robot")

--[[
    Start: 
    invt: elec. wrench equipped and configurator in 1
    pos: standing infront of redstone torch
]]

robot.swing() --torch
robot.forward()
robot.use() --miner
robot.forward()
component.inventory_controller.equip() --configurator
robot.use(5, true) -- cable1
robot.use(3, true) -- tesseract
robot.forward()
robot.use(5, true) -- cable2