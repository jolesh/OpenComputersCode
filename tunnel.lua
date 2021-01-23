local robot = require("robot")
local component = require("component")

local block = 0
local stack = 2

function brick()
    block = block + 1
    if(block%64 == 0) then
        stack = stack + 1
        robot.select(stack)
    end
end

function wall()
    robot.swing()
    robot.place()
    brick()
end

function wallUp()
    robot.swingUp()
    robot.placeUp()
    brick()
end

function wallDown()
    robot.swingDown()
    robot.placeDown()
    brick()
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

for i = 1, 10, 1 do
    forward()
    robot.swingUp()
    robot.swingDown()
    robot.select(1)
    robot.placeDown()
    robot.select(stack)
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
    robot.forward()
    robot.turnLeft()
end