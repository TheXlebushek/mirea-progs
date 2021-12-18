function f()
    steps1 = 0
    steps2 = 0
    while !isborder(robot, Nord)
        steps1 += 1
        move!(robot, Nord)
    end
    while !isborder(robot, West)
        steps2 += 1
        move!(robot, West)
        putmarker!(robot)
    end
    steps2 = 11 - steps2
    while !isborder(robot, Sud)
        move!(robot, Sud)
        putmarker!(robot)
    end
    while !isborder(robot, Ost)
        move!(robot, Ost)
        putmarker!(robot)
    end
    while !isborder(robot, Nord)
        move!(robot, Nord)
        putmarker!(robot)
    end
    while steps2 > 0
        move!(robot, West)
        putmarker!(robot)
        steps2 -= 1
    end
    while steps1 > 0
        move!(robot, Sud)
        steps1 -= 1
    end
end

f()