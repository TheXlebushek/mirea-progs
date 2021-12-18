function inverse(side::HorizonSide)
    return HorizonSide(mod(Int(side) + 2, 4))
end

function f()
    steps1 = 0
    steps2 = 0
    while !isborder(robot, Nord)
        move!(robot, Nord)
        steps1 += 1
    end
    while !isborder(robot, West)
        move!(robot, West)
        steps2 += 1
    end
    putmarker!(robot)
    side = Ost
    while !isborder(robot, Sud)
        putmarker!(robot)
        while !isborder(robot, side)
            move!(robot, side)
            putmarker!(robot)
        end
        side = inverse(side)
        move!(robot, Sud)
    end
    putmarker!(robot)
    while !isborder(robot, side)
        move!(robot, side)
        putmarker!(robot)
    end
    side = inverse(side)
    while !isborder(robot, West)
        move!(robot, West)
    end
    while !isborder(robot, Nord)
        move!(robot, Nord)
    end
    while steps1 > 0
        move!(robot, Sud)
        steps1 -= 1
    end
    while steps2 > 0
        move!(robot, Ost)
        steps2 -= 1
    end
end

f()