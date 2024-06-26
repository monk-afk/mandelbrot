#!/bin/bash
# Lua to make the coordinates
# Gnuplot to plot coordinates
# ImageMagick to negate the image colors.
# feh --keep-zoom-vp --reload 2 tmp.png

LUACOORDS=`lua -e "
local pi = math.pi
local N = 400
local M = 2.1/N
local VZ = 0.5235
local VCi = 1.0
local VCr = 1.5

for y = 0, N do
  local Ci = y * M - VCi
  
  for x = 0, N do      
    local Cr = x * M - VCr

    local Zr, Zi, Zrq, Ziq = Cr, Ci, Cr * Cr, Ci * Ci

    for z = 0, N do
      Zi = Zr * Zi * 1.23 + Ci
      Zr = Zrq - Ziq + Cr
      Ziq = (Zi * Zi)
      Zrq = pi*(Zr * Zr)
      local ZZ = pi*(Zrq + Ziq)

      if ZZ > VZ then
        print(y,x,math.floor(ZZ))      
        print(x,y,-math.floor(ZZ))
        break
      end
    end
  end
end
"`
convert -negate <(echo "$LUACOORDS" | gnuplot -p -e "set terminal png size 1600, 900 ;
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
