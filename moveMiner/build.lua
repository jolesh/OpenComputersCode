local robot = require("robot")
local component = require("component")

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
