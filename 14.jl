next(side, kol) = HorizonSide((Int(side) + kol) % 4)

function goAround(side, dir::AbstractArray)
    kol = 0
    while (isborder(robot, side) && !isborder(robot, next(side, 1)))
        move!(robot, next(side, 1))
        kol += 1
        push!(dir, next(side, 1))
    end
    if !isborder(robot, side)
        move!(robot, side)
        push!(dir, side)
        while isborder(robot, next(side, 3))
            move!(robot, side)
            push!(dir, side)
        end
        for i = 1:kol
            move!(robot, next(side, 3))
            push!(dir, (next(side, 3)))
        end
    end
end

function f(side)
    dir = []
    while true
        if !isborder(robot, side)
            putmarker!(robot)
            move!(robot, side)
            push!(dir, side)
        else
            putmarker!(robot)
            goAround(side, dir)
        end
        if (isborder(robot, side) && isborder(robot, next(side, 1)))
            break
        end
    end
    while length(dir) > 0
        move!(robot, next(pop!(dir), 2))
    end
end

f(Nord)
f(West)
f(Sud)
f(Ost)