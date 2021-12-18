function next(side, kol)
    return HorizonSide((Int(side) + kol) % 4)
end

function goAround(side)
    kol = 0
    while isborder(robot, side)
        if !isborder(robot, next(side, 1))
            move!(robot, next(side, 1))
            kol += 1
        else
            break
        end
    end
    if isborder(robot, side)
        for i = 1:kol
            if !isborder(robot, next(side, 3))
                move!(robot, next(side, 3))
            end
        end
        return false
    else
        move!(robot, side)
        while isborder(robot, next(side, 3))
            move!(robot, side)
        end
        for i = 1:kol
            if !isborder(robot, next(side, 3))
                move!(robot, next(side, 3))
            end
        end
        return true
    end
end

function moveAndKol(side, kol)
    flag = false
    ok = true
    count = 0
    while true
        if (isborder(robot, next(side, kol)) && !flag)
            flag = true
            count += 1
        elseif !isborder(robot, next(side, kol))
            flag = false
        end
        if (isborder(robot, side))
            ok = goAround(side)
        end
        if ok
            if !isborder(robot, side)
                move!(robot, side)
            end
        else
            break
        end
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