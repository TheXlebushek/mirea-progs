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
    side = Ost
    isOk = false
    for i = 1:10
        move!(robot, Sud)
        side = inverse(side)
        for j = 1:11
            if !isborder(robot, side)
                move!(robot, side)
            else
                isOk = true
                break
            end
        end
        if isOk
            break
        end
    end
    while isborder(robot, side)
        putmarker!(robot)
        move!(robot, Sud)
    end
    putmarker!(robot)
    move!(robot, side)
    while isborder(robot, Nord)
        putmarker!(robot)
        move!(robot, side)
    end
    putmarker!(robot)
    move!(robot, Nord)
    side = inverse(side)
    while isborder(robot, side)
        putmarker!(robot)
        move!(robot, Nord)
    end
    putmarker!(robot)
    move!(robot, side)
    while isborder(robot, Sud)
        putmarker!(robot)
        move!(robot, side)
    end
    putmarker!(robot)


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