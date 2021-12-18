function inverse(side::HorizonSide)
    return HorizonSide(mod(Int(side) + 2, 4))
end

function f()
    steps1 = 0
    steps2 = 0
    steps3 = 0
    while !isborder(robot, Sud)
        move!(robot, Sud)
        steps1 += 1
    end
    while !isborder(robot, West)
        move!(robot, West)
        steps2 -= 1
    end
    while !isborder(robot, Ost)
        move!(robot, Ost)
        steps3 += 1
        steps2 += 1
    end
    while !isborder(robot, Nord)
        while !isborder(robot, West)
            move!(robot, West)
        end
        steps4 = 0
        putmarker!(robot)
        while steps4 < steps3
            move!(robot, Ost)
            putmarker!(robot)
            steps4 += 1
        end
        move!(robot, Nord)
        steps3 -= 1
    end
    while !isborder(robot, West)
        move!(robot, West)
    end
    steps4 = 0
    putmarker!(robot)
    while steps4 < steps3
        move!(robot, Ost)
        putmarker!(robot)
        steps4 += 1
    end
    steps3 -= 1
    while !isborder(robot, Sud)
        move!(robot, Sud)
    end
    while !isborder(robot, Ost)
        move!(robot, Ost)
    end
    while steps1 > 0
        move!(robot, Nord)
        steps1 -= 1
    end
    while steps2 > 0
        move!(robot, West)
        steps2 -= 1
    end
end

f()