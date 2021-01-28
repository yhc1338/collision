function [ball,r]=crash(ball)
r=1;
l=length(ball);
v=zeros(2,l);
s=ones(l,l)*inf;
for i=1:l
    for j=1:l
        s(i,j)=norm(ball(i).s-ball(j).s,2);
    end
end
for i=1:l
    v(:,i)=ball(i).v;
    for j=i:l
        if s(i,j)-(ball(i).r+ball(j).r)<0.001&&i~=j&&norm(ball(i).v,2)>norm(ball(j).v,2)
            ball_l=ball(j).s-ball(i).s;
            a=atan(ball_l(2)/ball_l(1));
            [v01x,v01y]=solveV(ball(i).v,a);
            [v02x,v02y]=solveV(ball(j).v,a);
            v11=v01x+v02y;
            v12=v02x+v01y;
            ball(i).v=v11;
            ball(j).v=v12;
        end
    end
end
if sum(sum(abs(v)))==0
    r=0;
end
    