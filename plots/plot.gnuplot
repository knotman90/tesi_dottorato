# Scale font and line width (dpi) by changing the size! It will always display stretched.
set terminal  pdf  enhanced color font 'Arial-Bold,10' 
set size 1,1;
set key font ",9"

#--------Create some linestyles for our data--------
# pt = point type (triangles, circles, squares, etc.)
# ps = point size
set style line 1 lt 1 lc rgb "#A00000" lw 2.5 pt 3 ps 1.1
set style line 4 lt 1 lc rgb "#0000A0" lw 2.5 pt 6 ps 1.1
set style line 5 lt 1 lc rgb "#0000A0" lw 2.5 pt 4 ps 1.1
#--------other styles--------
#set style line 2 lt 1 lc rgb "#00A000" lw 2.5 pt 11 ps 1.1
#set style line 3 lt 1 lc rgb "#5060D0" lw 2.5 pt 9 ps 1.1

#set style line 6 lt 1 lc rgb "#00D0D0" lw 2.5 pt 12 ps 1.1
#set style line 7 lt 1 lc rgb "#B200B2" lw 2.5 pt 5 ps 1.1


#--------Main settings--------
set key inside bottom right
#set grid x y2
set xrange [0 : 12000.0]
set x2range [12000 : 0.0]
set xlabel 'Workload - K40'
set ylabel "Time (ms)"
set y2label "Speed-up (X)"
set ytics nomirror
set y2tics
set tics out
#set tics font ", 8"
set autoscale  y
set autoscale y2
set key center top title " "
#set key outside
#set key  bottom

#Left vertical axis same time serie color
set ytics textcolor rgb "#A00000"
#Right vertical axis same speedup serie color
set y2tics textcolor rgb "#0000A0"


set x2label 'Workload-980'
set x2tics nomirror
set x2tics


set grid y2tics my2tics  # draw lines for each ytics and mytics
set grid xtics mytics  # draw lines for each ytics and mytics
#set mytics 2           # set the spacing for the mytics
set grid               # enable the grid

#---------------------------------------------
set output 'fractal12k_k40_980_false.pdf'


plot  "data_fractal12k_k40_980_false.dat" using 1:2  title 'Time K40-980' with lp ls 1 axes x1y1 , \
"data_fractal12k_k40_980_false.dat" using 1:3 title 'Speed-up K40-980' with lp ls 4 axes x1y2 


#---------------------------------------------
set output 'fractal12k_k40_980_true.pdf'


plot  "data_fractal12k_k40_980_true.dat" using 1:2 title 'Time K40-980' w lp ls 1 axes x1y1 , \
"data_fractal12k_k40_980_true.dat" using 1:3 title 'Speed-up K40-980' w lp ls 4 axes x1y2 





#---------------------------------------------
set output 'fractal12k_980_980_false.pdf'
set xlabel 'Workload - GTX980 #1'
set key center right
set x2label 'Workload - GTX980 #2'
plot  "data_fractal12k_980_980_false.dat" using 1:2 title 'Time' w lp ls 1 axes x1y1,\
"data_fractal12k_980_980_false.dat" using 1:3 title 'Speed-up' w lp ls 4 axes x1y2 ,\


#---------------------------------------------
set output 'fractal12k_980_980_true.pdf'
set xlabel 'Workload - GTX980 #1'
set key center right
set x2label 'Workload - GTX980 #2'
plot  "data_fractal12k_980_980_true.dat" using 1:2 title 'Time' w lp ls 1 axes x1y1,\
"data_fractal12k_980_980_true.dat" using 1:3 title 'Speed-up' w lp ls 4 axes x1y2 ,\



#LARGE FRACTAL DATASET 17k*17k

set xrange [0 : 17000.0]
set x2range [17000 : 0.0]

#---------------------------------------------
set output 'fractal12k_K40-980-980_true.pdf'
set xlabel 'Workload - K40'
set key center right
set x2label 'Workload - GTX980 #1 and #2'
#set title "Time - Speedup 3 GPU"
plot  "data_fractal12k_K40-980-980_true.dat" using 1:2 title 'Time' w lp ls 1 axes x1y1,\
"data_fractal12k_K40-980-980_true.dat" using 1:3 title 'Speed-up' w lp ls 4 axes x1y2 ,\


#---------------------------------------------
set output 'fractal12k_K40-980-980_false.pdf'
set xlabel 'Workload - K40'
set key top right 
set x2label 'Workload - GTX980 #1 and #2'
#set title "Time - Speedup 3 GPU"
plot  "data_fractal12k_K40-980-980_false.dat" using 1:2 title 'Time' w lp ls 1 axes x1y1,\
"data_fractal12k_K40-980-980_false.dat" using 1:3 title 'Speed-up' w lp ls 4 axes x1y2 ,\



#--------------large fractal multinode 4 gpu 2 per nodes--
set xrange [0 : 17000.0]
set x2range [17000 : 0.0]

set output 'fractal17k_2nodes_K40+980-K20+980_true.pdf'
set xlabel 'Workload - K40(node1) \& K20(node2)'
set key top center
set x2label 'Workload - GTX980(node1) \& GTX980(node2)'
#set title "Time - Speedup 3 GPU"
plot  "data_fractal17k_2nodes_K40+980-K20+980_true.dat" using 1:2 title 'Time' w lp ls 1 axes x1y1,\
"data_fractal17k_2nodes_K40+980-K20+980_true.dat" using 1:3 title 'Speed-up' w lp ls 4 axes x1y2 ,\





#SOBEL--------------------------------------------------

set xrange [0 : 15000.0]
set x2range [15000 : 0.0]

#---------------------------------------------
set output 'sobel_k40_980.pdf'
set xlabel 'Workload - K40'
set key center 
set x2label 'Workload - GTX980'
#set title "Time - Speedup 3 GPU"
plot  "data_sobel_k40_980.dat" using 1:2 title 'Time' w lp ls 1 axes x1y1,\
"data_sobel_k40_980.dat" using 1:3 title 'Speed-up' w lp ls 4 axes x1y2 ,\


#------------2 nodes---2 GPU----------------------
set output 'sobel_2nodes_k40_980.pdf'
set xlabel 'Workload - K40(node1)'
set key center 
set x2label 'Workload - GTX980(node2)'
#set title "Time - Speedup 2 GPU on two nodes"
plot  "data_sobel_2nodes_k40-980.dat" using 1:2 title 'Time' w lp ls 1 axes x1y1,\
"data_sobel_2nodes_k40-980.dat" using 1:3 title 'Speed-up' w lp ls 4 axes x1y2 ,\


#------------2 nodes---4 GPU----------------------
set output 'sobel_2nodes_k40+980-K20+980.pdf'
set xlabel 'Workload - K40(node1) \& K20(node2)'
set key center 
set x2label 'Workload - GTX980(node1) \& GTX980(node2)'
#set title "Time - Speedup 2 nodes 2 GPUs/node"
plot  "data_sobel_2nodes_k40+980-K20+980.dat" using 1:2 title 'Time' w lp ls 1 axes x1y1,\
"data_sobel_2nodes_k40+980-K20+980.dat" using 1:3 title 'Speed-up' w lp ls 4 axes x1y2 ,\




#---------------------------------------------
set output 'sobel_k40_980_980.pdf'
set xlabel 'Workload - K40'
set key top center 
set x2label 'Workload - GTX980 #1 and #2'
#set title "Time - Speedup 3 GPU"
plot  "data_sobel_k40_980_980.dat" using 1:2 title 'Time' w lp ls 1 axes x1y1,\
"data_sobel_k40_980_980.dat" using 1:3 title 'Speed-up' w lp ls 4 axes x1y2 ,\


#BLUR--------------------------------------------------

#---------------------------------------------
set output 'blur_k40_980.pdf'
set xlabel 'Workload - K40'
set key center 
set x2label 'Workload - GTX980'
#set title "Time - Speedup 3 GPU"
plot  "data_blur_k40_980.dat" using 1:2 title 'Time' w lp ls 1 axes x1y1,\
"data_blur_k40_980.dat" using 1:3 title 'Speed-up' w lp ls 4 axes x1y2 ,\


#---------------------------------------------
set output 'blur_k40_980_980.pdf'
set xlabel 'Workload - K40'
set key top center 
set x2label 'Workload - GTX980 #1 and #2'
#set title "Time - Speedup 3 GPU"
plot  "data_blur_k40_980_980.dat" using 1:2 title 'Time' w lp ls 1 axes x1y1,\
"data_blur_k40_980_980.dat" using 1:3 title 'Speed-up' w lp ls 4 axes x1y2 ,\



#----------sciddicaT---------

set style line 6 lt 3 lw 2
set style arrow 8  nohead nofilled  linewidth 1.00  lc rgb "blue"
set style arrow 9  heads  linewidth 1.000  lc rgb "blue"

set xrange [0 : 3600.0]
set x2range [3600 : 0.0]
#---------------------------------------------

set output 'sciddica_k40_980.pdf'
set xlabel 'Workload - K40'
set key top right 
set x2label 'Workload - GTX980'

set arrow 1 from 0,second 9.68  to 3600, second 9.68 as 8
set label 1 "Speed-up GTX980" at 1300,second 9.55 center font "Courier-Bold,8" 

set arrow 2 from 0,second 5.51  to 3600, second 5.51 as 8
set label 2 "Speed-up K40" at 2500,second 5.72 center font "Courier-Bold,8" 

plot  "data_sciddicaT_stressR-k40_980.dat" using 1:2 title 'Time K40+GTX980' w lp ls 1 axes x1y1,\
"data_sciddicaT_stressR-k40_980.dat" using 1:3 title 'Speed-up K40+GTX980' w lp ls 4 axes x1y2 ,\



#---------------------------------------------
set output 'sciddica_980_980.pdf'
set xlabel 'Workload - 980 #1'
set key top right 
set x2label 'Workload - 980 #2'
#set title "Time - Speedup 2 GPU"

unset arrow 2
unset label 2
plot  "data_sciddicaT_stressR-980_980.dat" using 1:2 title 'Time GTX980+GTX980' w lp ls 1 axes x1y1,\
"data_sciddicaT_stressR-980_980.dat" using 1:3 title 'Speed-up GTX980+GTX980' w lp ls 4 axes x1y2 ,\

unset arrow 1
unset label 1


#---------------------------------------------
set output 'sciddica_k40_980_980.pdf'
set xlabel 'Workload - K40'
set key top center 
set x2label 'Workload - GTX980 #1 and #2'
#set title "Time - Speedup 3 GPUs"
plot  "data_sciddicaT_stressR_K40-980-980.dat" using 1:2 title 'Time' w lp ls 1 axes x1y1,\
"data_sciddicaT_stressR_K40-980-980.dat" using 1:3 title 'Speed-up' w lp ls 4 axes x1y2 ,\



#------------2 nodes---4 GPU----------------------
set output 'sciddica_2nodes_k40+980_K20+980.pdf'
set xlabel 'Workload - K40(node1) \&K20(node2)'
set key center 
set x2label 'Workload - GTX980(node1) \& GTX980(node2)'
#set title "Time - Speedup 4 GPU on two nodes"
plot  "data_sciddica_2nodes_K40+980_K20+980.dat" using 1:2 title 'Time' w lp ls 1 axes x1y1,\
"data_sciddica_2nodes_K40+980_K20+980.dat" using 1:3 title 'Speed-up' w lp ls 4 axes x1y2 ,\






#STANDARD TEST SCIDDICAT
set xrange [0 : 610]
set x2range [610 : 0.0]
#---------------------------------------------
set output 'sciddica_standard_k40_980.pdf'
set xlabel 'Workload - K40'
set key top center 
set x2label 'Workload - GTX980'
#set title "Time - Speedup 2 GPUs"
plot  "data_sciddicaT_standard-k40_980.dat" using 1:2 title 'Time' w lp ls 1 axes x1y1,\
"data_sciddicaT_standard-k40_980.dat" using 1:3 title 'Speed-up' w lp ls 4 axes x1y2 ,\





#----------------BAR-----------------


reset
set terminal  pdf  enhanced color font 'Arial-Bold,10' size 2.5,3
set boxwidth 0.6 
set style fill   solid 1.00 border lt -1
set grid nopolar
set grid noxtics nomxtics ytics nomytics noztics nomztics nortics nomrtics \
 nox2tics nomx2tics noy2tics nomy2tics nocbtics nomcbtics
 set grid layerdefault   lt 0 linecolor 0 linewidth 0.500,  lt 0 linecolor 0 linewidth 0.500

set lmargin at screen 0.15;
set rmargin at screen 0.98;
set bmargin at screen 0.259;
set tmargin at screen 0.98;


set style fill solid 
set key top center
set yrange [5:58]
set style fill solid
set xtics border in scale 0,0 nomirror rotate by -90  autojustify

#set xlabel '#GPU'
set ylabel 'Speed-up (X)'



#-------------------------
set output 'blur_scaling.pdf'
set xtics rotate by 45 right 
plot "data_blur_scaling.dat" using 1:3:xtic(2) t '' with boxes fillstyle pattern 1 lt -1 , 'data_blur_scaling.dat' using 1:3:3 with labels center boxed offset 0,1 notitle 


#-------------------------
set output 'sobel_scaling.pdf'
set yrange [5:88]


plot "data_sobel_scaling.dat" using 1:3:xtic(2)  t ''with boxes fillstyle pattern 1 lt -1 , 'data_sobel_scaling.dat' using 1:3:3 with labels center boxed offset 0,1 notitle


#-------------------------
set output 'fractal_true_scaling.pdf'
set yrange [5:630]
set lmargin at screen 0.15;
set rmargin at screen 0.98;
set bmargin at screen 0.22;
set tmargin at screen 0.98;
plot "data_fractal12k_scaling_true.dat" using 1:3:xtic(2)  t ''with boxes fillstyle pattern 1 lt -1 , 'data_fractal12k_scaling_true.dat' using 1:3:3 with labels center boxed offset 0,1 notitle



#-------------------------
set output 'fractal_false_scaling.pdf'
set yrange [5:275]
set lmargin at screen 0.15;
set rmargin at screen 0.98;
set bmargin at screen 0.22;
set tmargin at screen 0.98

plot "data_fractal12k_scaling_false.dat" using 1:3:xtic(2)  t ''with boxes fillstyle pattern 1 lt -1 , 'data_fractal12k_scaling_false.dat' using 1:3:3 with labels center boxed offset 0,1 notitle


#-------------------------
set output 'sciddicaT_scaling.pdf'
set yrange [0:28]
set lmargin at screen 0.16;
set rmargin at screen 0.98;
set bmargin at screen 0.265;
set tmargin at screen 0.98;


set arrow 1 from 0.1,7.7  to 0.71,10.5 
set label 1 "1.75x" at 0.2, 9.5 center font "Arial-Bold,8" 

set arrow 2 from 1.1,12  to 1.65,15.8 
set label 2 "1.54x" at 1.12, 14.2 center font "Arial-Bold,8" 

set arrow 3 from 2.1,17  to 2.65,20.5 
set label 3 "0.79x" at 2.1, 19.1 center font "Arial-Bold,8" 

set arrow 4 from 3.1,22  to 3.65,26.5 
set label 4 "0.77x" at 3, 24 center font "Arial-Bold,8" 

plot "data_sciddicaT_stressR_scaling.dat" using 1:3:xtic(2)  t ''with boxes fillstyle pattern 10 lt -1 , 'data_sciddicaT_stressR_scaling.dat' using 1:3:3 with labels center boxed offset 0,1 notitle
unset arrow 1
unset label 1
unset arrow 2
unset label 2
unset arrow 3
unset label 3
unset arrow 4
unset label 4

#-------------------------
set output 'sciddicaT_standard_scaling.pdf'
set yrange [0:17]
set lmargin at screen 0.16;
set rmargin at screen 0.98;
set bmargin at screen 0.22;
set tmargin at screen 0.98;

set arrow 1 from 0.3,16  to 0.9,8.4 
set label 1 "-2.2x" at 0.9, 12 center font "Arial-Bold,8" 

set arrow 2 from 1.25,7.8  to 1.9,6.4 
set label 2 "-1.36x" at 1.7,7.5 center font "Arial-Bold,8" 

set arrow 3 from 2.3,6.0  to 2.75,5.5 
set label 3 "-1.12x" at 2.6,6.25 center font "Arial-Bold,8" 


plot "data_sciddicaT_standard_scaling.dat" using 1:3:xtic(2)  t ''with boxes fillstyle pattern 10 lt -1 , 'data_sciddicaT_standard_scaling.dat' using 1:3:3 with labels center boxed offset 0,1 notitle

