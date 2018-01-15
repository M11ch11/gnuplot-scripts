#use gnuplot plotsimple.gnu -p
#p stands for persistant, which will keep window open
#takes two different files "test1" and "test2" and will plot them in same plot
#with different colors
#file keep to format x-label;mean;stdev

set datafile separator ";"                                                                                              #data in input files is separated by ;
set style data linespoints                                                                                              #use points
set xrange [0:5]                                                                                                        # ..
set autoscale xmax                          
set yrange [0:5]
set autoscale ymax
set offsets graph 0, 0.5, 0.5, 0                                                                                        # => xrange = 0..xmax + margin, so is y
set xlabel "Step"
set ylabel "Time [s]"
set title "Intel"
set key inside right top vertical Right noreverse enhanced autotitle box lt black linewidth 1.000 dashtype solid        #legend
set style textbox transparent margins  1.0,  1.0 border                                                                 #legend
set grid                                                                                                                #grid
plot "test1" title "Testdata" w yerrorbars lc rgb "#000000" pointtype 2, \
 "test2" title "Testdata2" w yerrorbars lc rgb "#ff0000" pointtype 2
#pause mouse keypress "Type a letter in the active window"
set term pdfcairo font "sans,12"
#set output 'out.pdf'
set output 'out_'.strftime('%F_%H-%M-%S.eps', time(0)).'.pdf'
replot
