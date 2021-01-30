function plotball(ball)
global border
l=length(ball);
for i=1:l
    r=ball(i).r; theta=0:pi/100:2*pi;
    x=r*cos(theta)+ball(i).s(1); 
    y=r*sin(theta)+ball(i).s(2);
    plot(x,y,'-')
    axis(border)
    hold on
end
for k=1:l
    text(ball(k).s(1),ball(k).s(2),{k});
end
hold off
end
