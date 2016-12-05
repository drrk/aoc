# This is going to be fun, brute foce md5 hashing, 
# it's like finding bitcoins
require 'digest'

code = '        '
seq = 0
door_id = 'wtnhxymk'
found = 0
while found < 8
  md5sum = ''
  until md5sum.start_with?('00000')
    md5sum = Digest::MD5.hexdigest "#{door_id}#{seq}"
    seq += 1
  end
  case md5sum[5]
  when '0'..'7'
    if code[md5sum[5].to_i] == ' '
      code[md5sum[5].to_i] = md5sum[6] 
      found += 1
      print '.'
    end
  end 
end
print "\n#{code}\n"