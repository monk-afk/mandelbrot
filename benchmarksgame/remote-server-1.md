BenchmarksGame - Tests
======================
- https://benchmarksgame-team.pages.debian.net/benchmarksgame/fastest/lua-ruby.html

Table of Contents
------------------
1. [Local PC](/local-pc.md)
> 2. [Remote Server #1](/remote-server-1.md)
>    - [1000 Reps](/remote-server-1.md#1000-reps)
>    - [lua 16000](/remote-server-1.md#lua-16000)

### lscpu
```
Model name:          AMD EPYC 7282 16-Core Processor
  CPU MHz:             2794.748
  BogoMIPS:            5589.49
  CPU(s):              2
  Thread(s) per core:  1
  Core(s) per socket:  2
  Socket(s):           1
  Stepping:            0
Caches (sum of all):
  L1d cache:           128 KiB
  L1i cache:           128 KiB
  L2 cache:            1 MiB
  L3 cache:            16 MiB
NUMA:
  NUMA node(s):        1
```
### lsmem
```
  Memory block size:       128M
  Total online memory:       3G
```
## 

Lua 16000
---------------
`perf stat lua mandelbrot.lua 16000 > /dev/null`

## Performance counter stats for 'lua **[lua3.lua](https://benchmarksgame-team.pages.debian.net/benchmarksgame/program/mandelbrot-lua-3.html)** 16000':
```
        254,702.04 msec task-clock                #    0.999 CPUs utilized          
             2,083      context-switches          #    0.008 K/sec                  
                 7      cpu-migrations            #    0.000 K/sec                  
               171      page-faults               #    0.001 K/sec                  
   797,282,870,914      cycles                    #    3.130 GHz                    
     3,463,133,175      stalled-cycles-frontend   #    0.43% frontend cycles idle   
    13,242,446,595      stalled-cycles-backend    #    1.66% backend cycles idle    
 2,581,802,335,833      instructions              #    3.24  insn per cycle         
                                                  #    0.01  stalled cycles per insn
   387,397,113,244      branches                  # 1520.982 M/sec                  
        83,853,512      branch-misses             #    0.02% of all branches        

     254.894015598 seconds time elapsed

     254.424890000 seconds user
       0.225497000 seconds sys
```

## Performance counter stats for 'lua **[mandelbrot_table.lua](/mandelbrot_table.lua)** 16000':
```
        258,876.75 msec task-clock                #    1.000 CPUs utilized          
               743      context-switches          #    0.003 K/sec                  
                 3      cpu-migrations            #    0.000 K/sec                  
             7,614      page-faults               #    0.029 K/sec                  
   805,790,892,738      cycles                    #    3.113 GHz                    
     4,331,972,590      stalled-cycles-frontend   #    0.54% frontend cycles idle   
    17,635,249,733      stalled-cycles-backend    #    2.19% backend cycles idle    
 2,603,407,458,946      instructions              #    3.23  insn per cycle         
                                                  #    0.01  stalled cycles per insn
   391,502,292,377      branches                  # 1512.312 M/sec                  
                 0      branch-misses             #    0.00% of all branches        

     258.945674097 seconds time elapsed

     258.118153000 seconds user
       0.735934000 seconds sys

------------------------------------------------------------------------------------------

        257,925.45 msec task-clock                #    0.999 CPUs utilized          
             1,285      context-switches          #    0.005 K/sec                  
                11      cpu-migrations            #    0.000 K/sec                  
             7,648      page-faults               #    0.030 K/sec                  
   802,468,648,383      cycles                    #    3.111 GHz                    
     4,472,296,667      stalled-cycles-frontend   #    0.56% frontend cycles idle   
    17,244,012,415      stalled-cycles-backend    #    2.15% backend cycles idle    
 2,603,303,314,215      instructions              #    3.24  insn per cycle         
                                                  #    0.01  stalled cycles per insn
   391,466,575,734      branches                  # 1517.751 M/sec                  
                 0      branch-misses             #    0.00% of all branches        

     258.068600998 seconds time elapsed

     257.210317000 seconds user
       0.682859000 seconds sys

------------------------------------------------------------------------------------------

        258,759.57 msec task-clock                #    0.999 CPUs utilized          
             1,337      context-switches          #    0.005 K/sec                  
                 8      cpu-migrations            #    0.000 K/sec                  
             7,884      page-faults               #    0.030 K/sec                  
   807,826,898,656      cycles                    #    3.122 GHz                    
     4,403,613,511      stalled-cycles-frontend   #    0.55% frontend cycles idle   
    17,610,705,009      stalled-cycles-backend    #    2.18% backend cycles idle    
 2,603,304,418,739      instructions              #    3.22  insn per cycle         
                                                  #    0.01  stalled cycles per insn
   391,466,669,812      branches                  # 1512.859 M/sec                  
                 0      branch-misses             #    0.00% of all branches        

     258.909393890 seconds time elapsed

     258.056947000 seconds user
       0.661320000 seconds sys

------------------------------------------------------------------------------------------

        264,688.04 msec task-clock                #    0.999 CPUs utilized          
             1,789      context-switches          #    0.007 K/sec                  
                 4      cpu-migrations            #    0.000 K/sec                  
               117      page-faults               #    0.000 K/sec                  
   828,026,934,390      cycles                    #    3.128 GHz                    
     4,259,836,721      stalled-cycles-frontend   #    0.51% frontend cycles idle   
    17,270,924,460      stalled-cycles-backend    #    2.09% backend cycles idle    
 2,606,401,853,021      instructions              #    3.15  insn per cycle         
                                                  #    0.01  stalled cycles per insn
   392,045,813,240      branches                  # 1481.162 M/sec                  
                 0      branch-misses             #    0.00% of all branches        

     264.854067565 seconds time elapsed

     264.442844000 seconds user
       0.200049000 seconds sys

------------------------------------------------------------------------------------------

        262,212.67 msec task-clock                #    0.999 CPUs utilized          
             1,680      context-switches          #    0.006 K/sec                  
                12      cpu-migrations            #    0.000 K/sec                  
               113      page-faults               #    0.000 K/sec                  
   818,582,011,911      cycles                    #    3.122 GHz                    
     4,275,959,311      stalled-cycles-frontend   #    0.52% frontend cycles idle   
    16,753,362,549      stalled-cycles-backend    #    2.05% backend cycles idle    
 2,606,399,470,667      instructions              #    3.18  insn per cycle         
                                                  #    0.01  stalled cycles per insn
   392,045,196,130      branches                  # 1495.142 M/sec                  
                 0      branch-misses             #    0.00% of all branches        

     262.401242094 seconds time elapsed

     261.998311000 seconds user
       0.170575000 seconds sys

------------------------------------------------------------------------------------------

        263,620.19 msec task-clock                #    0.999 CPUs utilized          
             1,612      context-switches          #    0.006 K/sec                  
                 4      cpu-migrations            #    0.000 K/sec                  
               114      page-faults               #    0.000 K/sec                  
   823,256,113,233      cycles                    #    3.123 GHz                    
     4,746,466,434      stalled-cycles-frontend   #    0.58% frontend cycles idle   
    16,835,627,424      stalled-cycles-backend    #    2.05% backend cycles idle    
 2,606,397,522,102      instructions              #    3.17  insn per cycle         
                                                  #    0.01  stalled cycles per insn
   383,689,651,431      branches                  # 1455.464 M/sec                  
        10,956,832      branch-misses             #    0.00% of all branches        

     263.792028716 seconds time elapsed

     263.400674000 seconds user
       0.182263000 seconds sys
```
##

1000 Reps
---------
> `for reps in `seq 1 6`; do perf stat --null -r 1000 lua mandelbrot.lua 200 > /dev/null; done`

## Performance counter stats for 'lua **lua3.lua** 200' (1000 runs):
```
          0.042496 +- 0.000185 seconds time elapsed  ( +-  0.43% )
          0.042984 +- 0.000181 seconds time elapsed  ( +-  0.42% )
          0.043001 +- 0.000198 seconds time elapsed  ( +-  0.46% )
          0.043616 +- 0.000184 seconds time elapsed  ( +-  0.42% )
          0.043840 +- 0.000240 seconds time elapsed  ( +-  0.55% )
          0.044131 +- 0.000239 seconds time elapsed  ( +-  0.54% )
```

## Performance counter stats for 'lua **mandelbrot_table.lua** 200' (1000 runs):
```
          0.042406 +- 0.000180 seconds time elapsed  ( +-  0.42% )
          0.042712 +- 0.000165 seconds time elapsed  ( +-  0.39% )
          0.042847 +- 0.000182 seconds time elapsed  ( +-  0.43% )
          0.043130 +- 0.000164 seconds time elapsed  ( +-  0.38% )
          0.043388 +- 0.000173 seconds time elapsed  ( +-  0.40% )
          0.043759 +- 0.000190 seconds time elapsed  ( +-  0.43% )
```