clc
clear
r=1;
global border
border=[-10 10 -10 10];
dt=0.01;
draw=0;
ball(1)=create(r,[0;0],[80;-10]);
ball(2)=create(r,[4;1.2],[0;0]);
ball(3)=create(r,[4;-1.2],[0;0]);
ball(4)=create(r,[6.5;0],[0;0]);
ball(5)=create(r,[6.5;2.4],[0;0]);
ball(6)=create(r,[6.5;-2.4],[0;0]);

while(1)
    ball=move(ball,dt);
    [ball,p]=collision(ball,dt);
    plotball(ball)
%     if draw==1
%         draw=0;
        drawnow
        pause(0.001)
%     end
    if p==0
        break
    end
%     draw=draw+1;
end
