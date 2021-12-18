directions = []

function reverse(side)
    return HorizonSide((Int(side) + 2) % 4)
end

function goToAngle()
    while (!isborder(robot, Nord) || !isborder(robot, West))
        while !isborder(robot, Nord)
            move!(robot, Nord)
            push!(directions, Nord)
        end
        while !isborder(robot, West)
            move!(robot, West)
            push!(directions, West)
        end
    end
end

function putMarkersToAngle(side)
    while !isborder(robot, side)
        move!(robot, side)
    end
    putmarker!(robot)
end

function f()
    goToAngle()
    for i in [Sud, Ost, Nord, West]
        putMarkersToAngle(i)
    end

    while length(directions) > 0
        move!(robot, reverse(pop!(directions)))
    end
end

f()