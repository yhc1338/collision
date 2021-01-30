function [ball,r]=collision(ball,t)
global border
r=1;
l=length(ball);
v=zeros(2,l);
s0=ones(l,l)*inf;
s1=ones(l,l)*inf;
for i=1:l
    for j=1:l
        s0(i,j)=norm(ball(i).s-ball(j).s,2);
    end
end
%next time for judging collision
ball1=move(ball,t);
for i=1:l
    for j=1:l
        s1(i,j)=norm(ball1(i).s-ball1(j).s,2);
    end
end
for i=1:l
    for j=1:l
        s0(i,j)=norm(ball(i).s-ball(j).s,2);
    end
end
for i=1:l
    v(:,i)=ball(i).v;
    for j=i:l
        % judge whether collision other ball
        if s0(i,j)-(ball(i).r+ball(j).r)>0&&s1(i,j)-(ball(i).r+ball(j).r)<0
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
    
    % judge whether collision the border
    if ball(i).s(1)-ball(i).r-border(1)>0&&ball1(i).s(1)-ball(i).r-border(1)<0
        [v1,v2]=solveV(ball(i).v,0);
        ball(i).v=v1-v2;
    end
    if ball(i).s(1)+ball(i).r-border(2)<0&&ball1(i).s(1)+ball(i).r-border(2)>0
        [v1,v2]=solveV(ball(i).v,0);
        ball(i).v=v1-v2;
    end
    if ball(i).s(2)-ball(i).r-border(3)>0&&ball1(i).s(2)-ball(i).r-border(3)<0
        [v1,v2]=solveV(ball(i).v,pi/2);
        ball(i).v=v1-v2;
    end
    if ball(i).s(2)+ball(i).r-border(4)<0&&ball1(i).s(2)+ball(i).r-border(4)>0
        [v1,v2]=solveV(ball(i).v,-pi/2);
        ball(i).v=v1-v2;
    end
end
if sum(sum(abs(v)))==0
    r=0;
end
