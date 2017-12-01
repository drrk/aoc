require 'strscan'
tls_count = 0
File.open('input.txt').each do |line|
  in_brackets = false
  supports_tls = false
  buffer = StringScanner.new(line.chomp.strip)
  until buffer.eos?
    nextch = buffer.peek(1)
    case nextch
    when '['
      in_brackets = true
      buffer.getch
    when ']'
      in_brackets = false
      buffer.getch
    else
      buffer.match?(/([a-z])([a-z])\2\1/)
      if buffer.matched? && buffer.matched[0] != buffer.matched[1]
        if in_brackets
          supports_tls = false
          break
        else
          supports_tls = true
        end
      end
      buffer.scan(/[a-z]/)
    end
  end
  tls_count += 1 if supports_tls
end
print "Count: #{tls_count}\n"
