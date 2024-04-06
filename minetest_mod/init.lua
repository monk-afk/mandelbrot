--==[[   Mandelbrot Set   ]]==--
--==[[  BSD-3 © 2024 monk ]]==--
--[[
  Mandelbrot Formula snippet obtained without endorsement from:
  https://benchmarksgame-team.pages.debian.net/benchmarksgame/license.html

  Revised BSD license
  This is a specific instance of the Open Source Initiative (OSI) BSD license template.

  Copyright © 2004-2008 Brent Fulgham, 2005-2024 Isaac Gouy

  All rights reserved.

  Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

    1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.

    2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.

    3. Neither the name "The Computer Language Benchmarks Game" nor the name "The Benchmarks Game" nor the name "The Computer Language Shootout Benchmarks" nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.

  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
]]
local coords = {}

local make_coords = function(pos, size)
  local xLim, zLim, yLim = size, size, size
  local M = 2/xLim

  for x = 1, xLim do
    local Ci = x * M - 1

    for z = 1, zLim do
      local Cr = z * M - 1.5
      local Zr, Zi, Zrq, Ziq = Cr, Ci, Cr * Cr, Ci * Ci

      for y = 0, yLim do
        Zi = Zr * Zi * 2 + Ci
        Zr = Zrq - Ziq + Cr
        Ziq = Zi * Zi
        Zrq = Zr * Zr

        if Zrq + Ziq > 3.0 then
          coords[#coords+1] = {
            x = x + pos.x,
            z = z + pos.z,
            y = y + pos.y
          }
        end
      end 
    end
  end
  return coords
end

local bulk_set_node = minetest.bulk_set_node

minetest.register_chatcommand("mandelbrot", {
    description = "Set or Unset Mandelbrot Fractal",
    params = "<set>|<unset>|<reset> [<size>]",
    privs = {server = true},
    func = function(name, params)
      local player = minetest.get_player_by_name(name)
      if not player then
        return false, "You must be online to do this."
      end

      local node, size = params:match("^([r]?[e]?[u]?[n]?[s][e][t])%s*(%d*)")
      
      if not tonumber(size) then size = 50 end
      size = math.min(math.max(0, size), 150)

      if node == "set" then
        node = "default:silver_sandstone_brick"
        local pos = vector.round(player:get_pos())
        pos.x = pos.x - (size / 2)
        pos.z = pos.z - (size / 2)
        coords = make_coords(pos, size)
      elseif node == "unset" then
        if not coords[1] then
          return false, "Please do set before unset: /mandelbrot <set>|<unset>|<reset> [<size>]"
        else
          node = "air"
        end
      elseif node == "reset" then
        coords = {}
        return true, "Mandelbrot coordinates cleared."
      else
        return false, "Usage: /mandelbrot <set>|<unset>|<reset> [<size>]"
      end

      print(node, size)
      bulk_set_node(coords, {name=node})
    end
})
