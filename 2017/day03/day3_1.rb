def spiral(n)
        k=((Math.sqrt(n)-1)/2).ceil
        t = 2*k+1
        m = t*t 
        t = t-1

        if n  >= m-t
          return k-(m-n),-k
        else 
          m = m-t 
        end
        if n >= m-t
          return -k,-k+(m-n)
        else 
          m = m-t 
        end
        if n >= m-t
          return -k+(m-n),k 
        else 
          return k,k-(m-n-t) 
        end
end
pos = spiral(289326)
print pos[0].abs + pos[1].abs
