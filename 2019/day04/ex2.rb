count = 0
(245318..765747).each do |val|
  sval = val.to_s
  dup_flg = false
  chk_flg = false
  fail_flg = false
  increment_flg = true
  last_digit = sval[0].to_i
  (1..5).each do |i|
    unless dup_flg
      if sval[i].to_i == last_digit
        fail_flg = chk_flg
        chk_flg = true
      elsif chk_flg && !fail_flg
        dup_flg = true
      else
        fail_flg = false
        chk_flg = false
      end
    end
    last_digit = sval[i].to_i
    if sval[i].to_i < sval[i - 1].to_i
      increment_flg = false
      break
    end
  end
  dup_flg = true if chk_flg && !fail_flg # Make sure we count if just the last two digits are the pair.
  count += 1 if dup_flg && increment_flg
end
puts count
