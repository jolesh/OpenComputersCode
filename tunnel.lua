local robot = require("robot")
local component = require("component")

local length = 10 --set length of tunnel here, max 64
local conduit = false --to "true" for conduits

local block = 0
local stack
if conduit == true then
    stack = 4
else
    stack = 2
end

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

for i = 1, length, 1 do
    forward()
    robot.swingUp()
    robot.swingDown()
    robot.select(1) --specialblock
    robot.placeDown()
    robot.select(stack) --wallblock
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
    if conduit == true then
        robot.swingUp()
        robot.select(2) --conduit1
        robot.placeUp()
        robot.select(3) --conduit2
        robot.placeUp()
        robot.select(stack) --wallblock
    else
        wallUp()
    end
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