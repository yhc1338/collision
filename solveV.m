function [v1 v2]=solveV(v,a) 

A=[1 0 1 0;
   0 1 0 1;
   1 -tan(2*pi-a) 0 0;
   0 0 -tan(a) 1];
B=[v(1) v(2) 0 0]';
temp=A\B;
v1=[temp(1);temp(2)];
v2=[temp(3);temp(4)];
   