# csound_udo
my csound udos

indexcount is usefull to count integer index values in order to read ony kind of array or tables
here is the syntax :
kindex indexcount ktrig, kmax, kmode 

ktrig : when 1 is received (from a metro or a trigger for examples), indexcount start counting 
kmax : is the max value to whom indexcount is going to count
kmode : the manner that behave indexcount ( 0 : Read forward only, 1: Read backward only, Backward then forward, 3 : Forward then backward

example : 

kmax tableng 400
kread = kmax/p3
ktrig metro kread*2

kmode = 0

kindex indexcount ktrig, kmax, kmode 
