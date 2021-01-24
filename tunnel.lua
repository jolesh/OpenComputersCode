local robot = require("robot")
local component = require("component")

--config:
local length = 10 --set length of tunnel here, max 64
local conduit = false --set to "true" for conduits
local pumpkin = true --set to "true" for pumpkins
local pumpkinOffset = 2 --should not be greater than pumpkinSpace
local pumpkinSpace = 5 --every Xth row has pumkins

local pumpkinSlot = 2
local row = 0
local block = 0
local stack = 2
if conduit == true then
    stack = stack + 2
    pumpkinSlot = pumpkinSlot + 2
end
if pumpkin == true then
    stack = stack + 1
end

function brick()
    block = block + 1
    if(block%64 == 0) then
        stack = stack + 1
        robot.select(stack)
    end
end

function pumpkinRight()
    if pumpkin == true then
        if row%pumpkinSpace == pumpkinOffset then
            forward()
            robot.turnRight()
            robot.swing()
            robot.select(pumpkinSlot)
            robot.place()
            robot.select(stack)
            robot.turnRight()
            forward()
            robot.turnAround()
        end
    end
    wall()
end

function pumpkinLeft()
    if pumpkin == true then
        if row%pumpkinSpace == pumpkinOffset then
            forward()
            robot.turnLeft()
            robot.swing()
            robot.select(pumpkinSlot)
            robot.place()
            robot.select(stack)
            robot.turnLeft()
            forward()
            robot.turnAround()
        end
    end
    wall()
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
    pumpkinRight()
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
    pumpkinLeft()
    down()
    wall()
    wallDown()
    robot.turnAround()
    robot.forward()
    robot.turnLeft()
    row = row + 1
end