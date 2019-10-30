

ROS_MASTER_URI='http://ivory.local:11311';
try
    rosinit(ROS_MASTER_URI);
catch
     disp('rosinit failed. Continuing...')
     rosshutdown;
     rosinit(ROS_MASTER_URI);
end



velpub = rospublisher('/catvehicle/cmd_vel',rostype.geometry_msgs_Twist);


velMsgs = rosmessage(velpub);

t = 0:0.0001:10;
y = abs(2.*sin(t));
i = 1;
while i < length(t)
    velMsgs.Linear.X = y(i);
    velMsgs.Angular.Z = 0.02;
    send(velpub, velMsgs);
    i = i + 1;
    if (i >= length(t) - 1)
        i = 1;
    end
end