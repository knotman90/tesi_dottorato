# Scale font and line width (dpi) by changing the size! It will always display stretched.
set terminal  pdf   enhanced color font 'Helvetica,14' 
#set size 1.0,2;

# Key means label...
set key inside bottom right
#set grid x y2
set xrange [0 : 12000.0]
set x2range [0 : 12000.0]
set xlabel 'Workload - K40'
set ylabel "Time (s)"
set y2label "Speed-up (X)"
set ytics nomirror
set y2tics
set tics out
#set tics font ", 8"
set autoscale  y
set autoscale y2
set key center top title " "
set key outside

set ytics textcolor rgb "#440154"
set y2tics textcolor rgb "#21908d"




#---------------------------------------------
set output 'fractal12k_k40_980_false.pdf'


plot  "data_fractal12k_k40_980_false.dat" using 1:2 smooth csplines title 'Time K40-980' with lines axes x1y1 lt rgb "#440154" , \
'' using 1:2 title "" with points lt rgb "#440154" ,\
"data_fractal12k_k40_980_false.dat" using 1:3 smooth csplines title 'Speed-up K40-980' axes x2y2 lt rgb "#21908d",\
'' using 1:3 with points axes x2y2 title "" lt rgb "#21908d"


#---------------------------------------------
set output 'fractal12k_k40_980_true.pdf'


plot  "data_fractal12k_k40_980_true.dat" using 1:2 smooth csplines title 'Time K40-980' with lines axes x1y1 lt rgb "#440154" , \
'' using 1:2 title "" with points lt rgb "#440154" ,\
"data_fractal12k_k40_980_true.dat" using 1:3 smooth csplines title 'Speed-up K40-980' axes x2y2 lt rgb "#21908d",\
'' using 1:3 with points axes x2y2 title "" lt rgb "#21908d"





#---------------------------------------------
set output 'fractal12k_980_980_false.pdf'
set xlabel 'Workload - GTX980 #1'

plot  "data_fractal12k_980_980_false.dat" using 1:2 smooth csplines title 'Time' with lines axes x1y1 lt rgb "#440154" , \
'' using 1:2 title "" with points lt rgb "#440154" ,\
"data_fractal12k_980_980_false.dat" using 1:3 smooth csplines title 'Speed-up' axes x2y2 lt rgb "#21908d",\
'' using 1:3 with points axes x2y2 title "" lt rgb "#21908d"


