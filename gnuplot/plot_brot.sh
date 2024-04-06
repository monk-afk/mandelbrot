#!/bin/bash
# Lua to make the coordinates
# Gnuplot to plot coordinates
# ImageMagick to negate the image colors.

LUACOORDS=`lua -e "
  local xLim = 400                -- xLim adds points
  local yLim = xLim
  local zLim = 149                -- zLim add layers
  local Mscl = 2.7/xLim           -- Mscl changes scale

  for x = 1, xLim do
    local Ci = x * Mscl - 1.25    -- Ci adjust x position

    for y = 1, yLim do
      local Cr = y * Mscl - 1.85  -- Cr ajust y position
      local Zr, Zi, Zrq, Ziq = Cr, Ci, Cr * Cr, Ci * Ci

      for z = 0, zLim do
        Zi  = Zr * Zi * 2 + Ci
        Zr  = Zrq - Ziq + Cr
        Ziq = Zi * Zi
        Zrq = Zr * Zr

        if Zrq + Ziq > 3.0 then   -- noise sensitivity
          print(x, y, z)          -- negate for reversed (-z)
          break
        end
      end 
    end
  end
"`
convert -negate <(echo "$LUACOORDS" | gnuplot -p -e "set terminal png size 800, 800 ;
    set isosamples 100 ;
    set ticslevel 0 ;
    set border ;
    set xlabel \"x\";
    set ylabel \"y\";
    set zlabel \"z\";
    unset key ;
    unset tics ;
    set autoscale ;
    splot '-' lc 1 pt 0 with points notitle") mandelbrot_`date +%F_%H%M%S`.png
exit 0
