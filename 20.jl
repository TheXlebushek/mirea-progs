function next(side, kol)
    return HorizonSide((Int(side) + kol) % 4)
end

function moveAndKol(side, kol)
    flag = false
    count = 0
    while !isborder(robot, side)
        if (isborder(robot, next(side, kol)) && !flag)
            flag = true
            count += 1
        elseif !isborder(robot, next(side, kol))
            flag = false
        end
        move!(robot, side)
    end
    return count
end

function f()
    side = Ost
    n = 1
    count = 0
    while !isborder(robot, Nord)
        count += moveAndKol(side, n)
        side = next(side, 2)
        n = (n + 2) % 4
        move!(robot, Nord)
    end
    println(count)
end

f()