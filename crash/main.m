clc
clear
dt=0.1;
ball(1)=create(1,[0;0],[2;0]);
ball(2)=create(1,[4;1.2],[0;0]);
ball(3)=create(1,[4;-1.2],[0;0]);
ball(4)=create(1,[6.5;0],[0;0]);
ball(5)=create(1,[6.5;2.4],[0;0]);
ball(6)=create(1,[6.5;-2.4],[0;0]);

while(1)
    ball=move(ball,dt);
    [ball,~]=crash(ball);
    plotball(ball)
    drawnow
    pause(0.001)
end