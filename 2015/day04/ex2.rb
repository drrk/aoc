require 'digest'

seq = -1
key  = 'bgvyzdsv'

md5sum = ''
until md5sum.start_with?('000000')
  seq += 1    
  md5sum = Digest::MD5.hexdigest "#{key}#{seq}"
end

print "\n#{seq}\n"
