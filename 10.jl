function inverse(side::HorizonSide)
    return HorizonSide(mod(Int(side) + 2, 4))
end

function f()
    marked = 0
    Temperature = 0
    side = Ost
    while !isborder(robot, Nord)
        while !isborder(robot, side)
            move!(robot, side)
            if ismarker(robot)
                Temperature += temperature(robot)
                marked += 1
            end
        end
        side = inverse(side)
        move!(robot, Nord)
    end
    while !isborder(robot, side)
        move!(robot, side)
        if ismarker(robot)
            Temperature += temperature(robot)
            marked += 1
        end
    end
    if marked
        println(0)
    else
        println(Temperature / marked)
    end
end

f()