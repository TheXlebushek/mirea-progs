function reverse(side)
    return HorizonSide((Int(side) + 2) % 4)
end

function goTo(side)
    while !isborder(robot, side)
        putmarker!(robot)
        move!(robot, side)
    end
end

function set(side1, side2, dir)
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

function f()
    dir = []
    set(Nord, West, dir)
    for i in [Sud, Ost, Nord, West]
        goTo(i)
    end
    while length(dir) > 0
        move!(robot, reverse(pop!(dir)))
    end
end

f()