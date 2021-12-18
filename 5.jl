v0 = []
v1 = []
v2 = []
v3 = []
v4 = []

function d()
    while length(v0) > 0
        side = v0[length(v0)]
        if side == 0
            step = v1[length(v1)]
            while step > 0
                move!(robot, Sud)
                step -= 1
            end
            pop!(v1)
        elseif side == 1
            step = v2[length(v2)]
            while step > 0
                move!(robot, West)
                step -= 1
            end
            pop!(v2)
        elseif side == 2
            step = v3[length(v3)]
            while step > 0
                move!(robot, Nord)
                step -= 1
            end
            pop!(v3)
        else
            step = v4[length(v4)]
            while step > 0
                move!(robot, Ost)
                step -= 1
            end
            pop!(v4)
        end
        pop!(v0)
    end
end

function f()
    while !isborder(robot, Nord) || !isborder(robot, West)
        step = 0
        while !isborder(robot, Nord)
            move!(robot, Nord)
            step += 1
        end
        push!(v0, 0)
        push!(v1, step)
        step = 0
        while !isborder(robot, West)
            move!(robot, West)
            step += 1
        end
        push!(v0, 3)
        push!(v4, step)
    end
    putmarker!(robot)
    d()
    while !isborder(robot, Nord) || !isborder(robot, Ost)
        step = 0
        while !isborder(robot, Nord)
            move!(robot, Nord)
            step += 1
        end
        push!(v0, 0)
        push!(v1, step)
        step = 0
        while !isborder(robot, Ost)
            move!(robot, Ost)
            step += 1
        end
        push!(v0, 1)
        push!(v2, step)
    end
    putmarker!(robot)
    d()
    while !isborder(robot, Sud) || !isborder(robot, Ost)
        step = 0
        while !isborder(robot, Sud)
            move!(robot, Sud)
            step += 1
        end
        push!(v0, 2)
        push!(v3, step)
        step = 0
        while !isborder(robot, Ost)
            move!(robot, Ost)
            step += 1
        end
        push!(v0, 1)
        push!(v2, step)
    end
    putmarker!(robot)
    d()
    while !isborder(robot, Sud) || !isborder(robot, West)
        step = 0
        while !isborder(robot, Sud)
            move!(robot, Sud)
            step += 1
        end
        push!(v0, 2)
        push!(v3, step)
        step = 0
        while !isborder(robot, West)
            move!(robot, West)
            step += 1
        end
        push!(v0, 3)
        push!(v4, step)
    end
    putmarker!(robot)
    d()
end

f()