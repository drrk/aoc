# This is going to be fun, brute foce md5 hashing,
# it's like finding bitcoins
require 'digest'

code = ''
seq = 0
door_id = 'wtnhxymk'
while code.length < 8
  md5sum = ''
  until md5sum.start_with?('00000')
    md5sum = Digest::MD5.hexdigest "#{door_id}#{seq}"
    seq += 1
  end
  code += md5sum[5].to_s
  print '.'
end
print "\n#{code}\n"
