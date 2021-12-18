function inverse(side::HorizonSide)
    return HorizonSide(mod(Int(side) + 2, 4))
end

function f()
    steps = []
    while !isborder(robot, Nord)
        move!(robot, Nord)
        push!(steps, inverse(Nord))
    end
    while !isborder(robot, Ost)
        move!(robot, Ost)
        push!(steps, inverse(Ost))
    end


    # Тут решение.
    a = 0
    if length(steps) % 2 == 0
        a -= 1
    end
    side = Ost
    while !isborder(robot, Sud)
        side = inverse(side)
        # putmarker!(robot)
        while !isborder(robot, side)
            move!(robot, side)
            a += 1
            if a % 2 == 1
                putmarker!(robot)
            end
        end
        move!(robot, Sud)
        a += 1
    end
    side = inverse(side)
    while !isborder(robot, side)
        move!(robot, side)
        a += 1
        if a % 2 == 1
            putmarker!(robot)
        end
    end


    while !isborder(robot, Nord)
        move!(robot, Nord)
    end
    while !isborder(robot, Ost)
        move!(robot, Ost)
    end
    while length(steps) > 0
        move!(robot, pop!(steps))
    end
end

f()