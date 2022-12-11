class Monkey
    def initialize(items, inspect_op, inspect_val, test_div, tdest, fdest)
        @items = items
        @inspect_op = inspect_op
        @inspect_val = inspect_val
        @test_div = test_div
        @tdest = tdest
        @fdest = fdest
        @count = 0
    end

    def throw_item
        @count += 1
        item = @items.shift
        if @inspect_op == :add
            item += @inspect_val
        elsif @inspect_op == :mul
            item *= @inspect_val
        elsif @inspect_op == :sq
            item *= item
        else
        end
        item %= @@current_lcm

        if item % @test_div == 0
            @@monkeys[@tdest].catch(item)
        else
            @@monkeys[@fdest].catch(item)
        end
    end

    def throw_all
        item_count = @items.size
        item_count.times do
            throw_item
        end
    end

    def catch(worry)
        @items.push(worry)
    end

    def count()
        return @count
    end

    def test_div
        return @test_div
    end

    def self.set_monkeys(monkeys)
        @@monkeys = monkeys
        @@current_lcm = 1
        for m in 0..7 do
            @@current_lcm = @@current_lcm.lcm(@@monkeys[m].test_div)
        end
    end

    def self.monkey_round
        for m in 0..7 do
            @@monkeys[m].throw_all
        end
    end

    def self.monkey_business
        activity = []
        for m in 0..7 do
            activity.push @@monkeys[m].count
        end
        activity.sort!
        return activity[7] * activity[6]
    end
end

monkeys = []
monkeys.push Monkey.new([54, 61, 97, 63, 74],:mul, 7, 17, 5, 3)
monkeys.push Monkey.new([61, 70, 97, 64, 99, 83, 52, 87],:add, 8, 2, 7, 6)
monkeys.push Monkey.new([60, 67, 80, 65],:mul, 13, 5, 1, 6)
monkeys.push Monkey.new([61, 70, 76, 69, 82, 56],:add, 7, 3, 5, 2)
monkeys.push Monkey.new([79, 98],:add, 2, 7, 0, 3)
monkeys.push Monkey.new([72, 79, 55],:add, 1, 13, 2, 1)
monkeys.push Monkey.new([63],:add, 4, 19, 7, 4)
monkeys.push Monkey.new([72, 51, 93, 63, 80, 86, 81],:sq, 0, 11, 0, 4)

Monkey.set_monkeys(monkeys)

for round in 1..10000 do
    Monkey.monkey_round
end

print "#{Monkey.monkey_business}\n"