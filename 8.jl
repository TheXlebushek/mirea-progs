function inverse(side::HorizonSide)
    return HorizonSide(mod(Int(side) + 2, 4))
end

function f()

    # Тут решение.
    steps = 0
    side = West
    while isborder(robot, Nord)
        steps += 1
        side = inverse(side)
        for i = 1:steps
            move!(robot, side)
        end
    end
    move!(robot, Nord)

end

f()