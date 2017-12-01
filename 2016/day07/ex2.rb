require 'strscan'
ssl_count = 0

File.open('input.txt').each do |line|
  aba = []
  bab = []
  in_brackets = false
  buffer = StringScanner.new(line.chomp.strip)
  until buffer.rest.empty?
    nextch = buffer.peek(1)
    case nextch
    when '['
      in_brackets = true
    when ']'
      in_brackets = false
    else
      buffer.match?(/([a-z])([a-z])\1/)
      if buffer.matched? && buffer.matched[0] != buffer.matched[1]
        if in_brackets
          bab.push(buffer.matched)
        else
          aba.push(buffer.matched)
        end
      end
    end
    buffer.getch
  end
  aba.each do |item|
    rev = "#{item[1]}#{item[0]}#{item[1]}"
    if bab.member?(rev)
      ssl_count += 1
      break
    end
  end
end
print "Count: #{ssl_count}\n"
