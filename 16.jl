dir = []

function next(side, kol)
    return HorizonSide((Int(side) + kol) % 4)
end

function set(side1, side2)
    while (!isborder(robot, side1) || !isborder(robot, side2))
        while !isborder(robot, side1)
            move!(robot, side1)
            push!(dir, side1)
        end
        while !isborder(robot, side2)
            move!(robot, side2)
            push!(dir, side2)
        end
    end
end

function goAround(side)
    num = 0
    kol = 0
    while (isborder(robot, side) && !isborder(robot, next(side, 1)))
        move!(robot, next(side, 1))
        push!(dir, next(side, 1))
        kol += 1
    end
    if !isborder(robot, side)
        move!(robot, side)
        push!(dir, side)
        num += 1
        while isborder(robot, next(side, 3))
            move!(robot, side)
            push!(dir, side)
            num += 1
        end
    end
    for i = 1:kol
        move!(robot, next(side, 3))
        push!(dir, next(side, 3))
    end
    return num
end

function drawLine(side)
    num = 0
    while true
        if !isborder(robot, side)
            putmarker!(robot)
            move!(robot, side)
            push!(dir, side)
            num += 1
        else
            putmarker!(robot)
            num += goAround(side)
        end
        if (num == 11 || (isborder(robot, side) && isborder(robot, next(side, 1))))
            break
        end
    end
    putmarker!(robot)
end

function f()
    set(Sud, West)

    side = Ost
    while true
        drawLine(side)
        if isborder(robot, Nord)
            break
        end
        move!(robot, Nord)
        push!(dir, Nord)
        side = next(side, 2)
    end
    while length(dir) > 0
        move!(robot, next(pop!(dir), 2))
    end
end

f()