--[[ Revised BSD license
This is a specific instance of the Open Source Initiative (OSI) BSD license template.

Copyright © 2004-2008 Brent Fulgham, 2005-2024 Isaac Gouy

All rights reserved.

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.

Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.

Neither the name "The Computer Language Benchmarks Game" nor the name "The Benchmarks Game" nor the name "The Computer Language Shootout Benchmarks" nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 ]]
local write, char, concat = io.write, string.char, table.concat
local N = tonumber(arg and arg[1]) or 100
local M, b, p = 2/N, 1, {}
write("P4\n", N, " ", N, "\n")
for y = 0, N-1 do
  local Ci = y * M - 1
  for x = 0, N-1 do      
    local Cr = x * M - 1.5
    local Zr, Zi, Zrq, Ziq = Cr, Ci, Cr * Cr, Ci * Ci
    b = b + b
    for z = 1, 49 do
      Zi = Zr * Zi * 2 + Ci
      Zr = Zrq - Ziq + Cr
      Ziq = Zi * Zi
      Zrq = Zr * Zr
      if Zrq + Ziq > 4.0 then b=b+1 break end
    end
    if b >= 256 then p[#p+1] = char(511-b) ; b = 1 end
  end
end
write(concat(p))  -- table.unpack will overflow