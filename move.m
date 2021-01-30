function ball=move(ball,t)
f=0.01;
l=length(ball);
for i=1:l
    ball(i).s=ball(i).s+ball(i).v*t;
    ball(i).v=ball(i).v-ball(i).v*f;
end
