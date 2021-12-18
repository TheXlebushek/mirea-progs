function next(side::HorizonSide)
    return HorizonSide(mod(Int(side) + 1, 4))
end

function f()

    # Тут решение.
    side = Nord
    a = 1
    while !ismarker(robot)
        for i = 1:a
            if !ismarker(robot)
                move!(robot, side)
            end
        end
        side = next(side)
        for i = 1:a
            if !ismarker(robot)
                move!(robot, side)
            end
        end
        side = next(side)
        a += 1
    end

end

f()