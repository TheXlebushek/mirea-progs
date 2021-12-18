function f(n::Int)
    steps = []
    while !isborder(robot, Sud)
        move!(robot, Sud)
        push!(steps, Nord)
    end
    while !isborder(robot, West)
        move!(robot, West)
        push!(steps, Ost)
    end
    k = 0
    done = false
    while !done
        k = (k + 1) % 2
        for i = 1:n
            j = 0
            while !isborder(robot, Ost)
                if trunc(j / n) % 2 != k
                    putmarker!(robot)
                end
                j += 1
                move!(robot, Ost)
            end
            if trunc(j / n) % 2 != k
                putmarker!(robot)
            end
            while !isborder(robot, West)
                move!(robot, West)
            end
            if !isborder(robot, Nord)
                move!(robot, Nord)
            else
                done = true
                break
            end
        end
    end
    while !isborder(robot, West)
        move!(robot, West)
    end
    while !isborder(robot, Sud)
        move!(robot, Sud)
    end
    for i in steps
        move!(robot, i)
    end
end

f(2)