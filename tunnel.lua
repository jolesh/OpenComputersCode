local robot = require("robot")
local component = require("component")

function wall()
    robot.swing()
    robot.place()
end

function wallUp()
    robot.swingUp()
    robot.placeUp()
end

function wallDown()
    robot.swingDown()
    robot.placeDown()
end

function forward()
    robot.swing()
    robot.forward()
end

function up()
    robot.swingUp()
    robot.up()
end

function down()
    robot.swingDown()
    robot.down()
end

forward()
robot.swingUp()
robot.swingDown()
robot.select(1)
robot.placeDown()
robot.select(2)
robot.turnRight()
forward()
wallDown()
wall()
up()
wall()
up()
wall()
wallUp()
robot.turnAround()
forward()
wallUp()
forward()
wallUp()
wall()
down()
wall()
down()
wall()
wallDown()
robot.turnAround()
robot.forward
robot.turnLeft()