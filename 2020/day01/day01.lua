
function searchArray(array, value)
    for index,item in ipairs(array) do
       if item == value then
            return true
        end
    end
    return false
end

function task1()
    print ("Task1:")
    for index, line in ipairs(list) do 
        local difference = 2020 - line
        if searchArray(list, difference) then
            print ("\tfound values: " .. line .. " " .. difference .. " answer: " .. line * difference)
            return
        end
    end
end

function task2()
    print ("Task2:")
    for index, line in ipairs(list) do 
        local difference1 = 2020 - line
        -- Loop the array, and for each remaining value, take it of the current difference, and see if we can find the third value in the list
        for index2, line2 in ipairs(list) do
            if (index2 ~= index) then -- Skip the value we already are using, elese difference will just be 0, this add a comparison, but removes a calculation, not sure if it's more efficient
                local difference = difference1 - line2

                if (difference > 0) then -- No negative values, so shortcut searching the list
                    if searchArray(list, difference) then
                        print ("\tfound values: " .. line .. " " .. line2 .. " " .. difference .. " answer: " .. line * line2 * difference)
                        return
                    end
                end
            end
        end
    end
end

-- Load file into table
file = io.open("input.txt")
lines = file:lines("n")
list = {}
for line in lines do
    table.insert(list, line)
end
file:close()

-- Run tasks
task1()
task2()

