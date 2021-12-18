function inverse(side::HorizonSide)
    return HorizonSide(mod(Int(side) + 2, 4))
end

function f(x::HorizonSide, y::HorizonSide)
    steps = 0
    while !isborder(robot, x) && !isborder(robot, y)
        steps += 1
        move!(robot, x)
        move!(robot, y)
        putmarker!(robot)
    end
    x = inverse(x)
    y = inverse(y)
    while steps > 0
        move!(robot, x)
        move!(robot, y)
        steps -= 1
    end
end

putmarker!(robot)
f(Nord, West)
f(Sud, Ost)
f(Ost, Nord)
f(West, Sud)