# Scale font and line width (dpi) by changing the size! It will always display stretched.
set terminal  pdf   enhanced color font 'Arial-Bold,10' 
set size 1,1;


#--------Create some linestyles for our data--------
# pt = point type (triangles, circles, squares, etc.)
# ps = point size
set style line 1 lt 1 lc rgb "#A00000" lw 2.5 pt 3 ps 1.1
set style line 4 lt 1 lc rgb "#0000A0" lw 2.5 pt 6 ps 1.1

#--------other styles--------
#set style line 2 lt 1 lc rgb "#00A000" lw 2.5 pt 11 ps 1.1
#set style line 3 lt 1 lc rgb "#5060D0" lw 2.5 pt 9 ps 1.1
#set style line 5 lt 1 lc rgb "#D0D000" lw 2.5 pt 4 ps 1.1
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




