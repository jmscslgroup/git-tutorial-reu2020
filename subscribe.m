ROS_MASTER_URI='http://ivory.local:11311'
try
    rosinit(ROS_MASTER_URI);
catch
     disp('rosinit failed. Continuing...')
     rosshutdown;
     rosinit(ROS_MASTER_URI);
end

velSub = rossubscriber('/catvehicle/vel');
figure;
grid minor;
hold on;
t0 = rostime("now");
i = 1;
while 1
    veldata = receive(velSub, 10);
    plot(i, veldata.Linear.X,'g.');
    legend({' velocity'});
    grid on;
    xlabel('Index','Interpreter','latex');
    ylabel('Velocity','Interpreter','latex');
    set(gca,'FontSize',16);
    set(gca,'FontName','Times');
    drawnow;
    i = i+1;
end
