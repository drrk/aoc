count = 0
(245318..765747).each do |val|
  sval = val.to_s
  dup_flg = false
  increment_flg = true
  (1..5).each do |i|
    dup_flg = true if sval[i] == sval[i - 1]
    if sval[i].to_i < sval[i - 1].to_i
      increment_flg = false
      break
    end
  end
  count += 1 if dup_flg && increment_flg
end
puts count
