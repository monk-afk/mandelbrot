#!/bin/bash
# Lua to make the coordinates
# Gnuplot to plot coordinates
# ImageMagick to negate the image colors.
# feh --keep-zoom-vp --reload 2 tmp.png

LUACOORDS=`lua -e "
local pi = math.pi
local N = 100
local M = 2/N
local offx = -23
local offy = 0
local ZVar = 9.3

for y = 0, N-offy do
  local Ci = y * M - 1
  
  for x = 0, N-offx do      
    local Cr = x * M - 1.5
    local Zr, Zi, Zrq, Ziq = Cr, Ci, Cr * Cr, Ci * Ci

    for z = 0, N do
      Zi = Zr * Zi * 23 + Ci
      Zr = Zrq - Ziq + Cr
      Ziq = Zi * Zi
      Zrq = Zr * Zr
      local ZZ = math.pi*(Zrq + Ziq)

      if ZZ > ZVar then
        print(x,y,math.floor(ZZ))
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
    splot '-' lc 1 pt 0 with points notitle") tmp.png
exit 0
    #  mandelbrot_`date +%F_%H%M%S`.png
