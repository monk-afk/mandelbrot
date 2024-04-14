local N = 100
local M = 2/N
for y = 0, N-1 do
  local Ci = y * M - 1
  for x = 0, N-1 do      
    local Cr = x * M - 1.5
    local Zr, Zi, Zrq, Ziq = Cr, Ci, Cr * Cr, Ci * Ci
    for z = 0, N-1 do
      Zi = Zr * Zi * 2 + Ci
      Zr = Zrq - Ziq + Cr
      Ziq = Zi * Zi
      Zrq = Zr * Zr
      if Zrq + Ziq > 4.0 then
        print(x,y,z)
        break
      end
    end
  end
end