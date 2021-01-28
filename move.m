function ball=move(ball,t)
l=length(ball);
for i=1:l
ball(i).s=ball(i).s+ball(i).v*t;
end