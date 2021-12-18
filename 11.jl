function f()
    steps = []
    fromLeft = 0
    fromTop = 0
    while !isborder(robot, Nord) || !isborder(robot, West)
        if !isborder(robot, Nord)
            push!(steps, Sud)
            move!(robot, Nord)
            fromTop += 1
        else
            push!(steps, Ost)
            move!(robot, West)
            fromLeft += 1
        end
    end
    i = 0
    while !isborder(robot, Ost)
        if i == fromLeft
            putmarker!(robot)
        end
        move!(robot, Ost)
        i += 1
    end
    i = 0
    while !isborder(robot, Sud)
        if i == fromTop
            putmarker!(robot)
        end
        move!(robot, Sud)
        i += 1
    end
    while !isborder(robot, Nord)
        move!(robot, Nord)
    end
    while !isborder(robot, West)
        move!(robot, West)
    end
    i = 0
    while !isborder(robot, Sud)
        if i == fromTop
            putmarker!(robot)
        end
        move!(robot, Sud)
        i += 1
    end
    i = 0
    while !isborder(robot, Ost)
        if i == fromLeft
            putmarker!(robot)
        end
        move!(robot, Ost)
        i += 1
    end
    while !isborder(robot, West)
        move!(robot, West)
    end
    while !isborder(robot, Nord)
        move!(robot, Nord)
    end
    while length(steps) > 0
        move!(robot, pop!(steps))
    end
end

f()