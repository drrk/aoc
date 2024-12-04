def checkSafety(report)
    increasing = false
    decreasing = false
    safe = true # Safe until we prove otherwise
    last = nil
    report.each do |level|
        if last != nil  # First time round just record the value
            if level == last
                safe = false
            else
                if level > last
                    if decreasing
                        # decreasing set, but we increased - unsafe
                        safe = false
                    else
                        if  level - last > 3
                            # Increased too fast - unsafe
                            safe = false
                        end
                    end
                    increasing = true
                else
                    if increasing
                        # increasing set, but we decreased - unsafe
                        safe = false
                    else
                        if last - level > 3
                            # Decreased too fast - unsafe
                            safe = false
                        end
                    end
                    decreasing = true
                end
            end
        end
        break unless safe
        last = level
    end
    return safe
end

safeCount = 0
dampedCount = 0
unsafeReports = Array.new
# Pull input into two arrays
File.open('input.txt').each do |line|
    line.chomp!
    report = line.split.map { |i| i.to_i}
    if checkSafety(report)
        safeCount += 1
    else
        unsafeReports.push(report)
    end
end
dampedCount = safeCount
unsafeReports.each do |report|
    # Try each report, dropping on value in turn until we get a safe result, or run out of values to drop
    report.each_index do |i|
        dampedReport = report.dup()
        dampedReport.delete_at(i)
        if checkSafety(dampedReport)
            dampedCount += 1
            break    
        end
    end
end


print "Number of Safe Reports (Part 1): #{safeCount}\nNumber of Safe Reports with damping (Part 2): #{dampedCount}\n\n"