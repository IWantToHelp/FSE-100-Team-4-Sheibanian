%Tyler Nguyen, Advait Yadav, Aarsh Duhlani, Brandon Prior, Puneet Kaur 
%Ports and their devices
% A 
% B Claw Motor
% C Left Motor
% D Right Motor
% 1 Touch Sensor
% 2 Color Sensor
% 3 Sound Sensor
% 4 Gyro Sensor
% Mode of Color Sensor: Color Code
% Motor Speed: 100 
ClawPort = 'B';
MotorPortLeft = 'C';
MotorPortRight = 'D';
TouchSensorPort = 1; 
ColorSensorPort = 2;
SoundSensorPort = 3;
GyroSensorPort = 4;

%CONNECTS TO EV3
brick = ConnectBrick('EV3G');
%Sets the color sensor to output color in terms of integers
brick.SetColorMode(ColorSensorPort, 2)
%Sets the current gyro to 0
brick.GyroCalibrate(GyroSensorPort);
%Current speed of robot during autonomous movement since forward is facing
%the touch sensor
AutoSpeed = -50;
TurnSpeed = -20;
%0	No color (Unknown color) 
%1	Black 
%2	Blue 
%3	Green 
%4	Yellow 
%5	Red 
%6	White 
%7	Brown
startingColor = 4;
destinationColor = 3;
%Maximum Distance from wall
wallMaxDist = 50;
%Distance from wall to turn
wallDist = 70;
%minimum distance from wall
wallMinDist = 20; 
run("keyboard_control.m");
%Sets the calibrates gyro
brick.StopMotor(MotorPortLeft, 'Brake');
brick.StopMotor(MotorPortRight, 'Brake');
brick.GyroCalibrate(GyroSensorPort);
color = brick.ColorCode(ColorSensorPort);
while color ~= destinationColor
    while color~=5
    %displays the current color, distance from wall and whether the color sensor is activated 
    color = brick.ColorCode(ColorSensorPort);
    disp(color);
    distance = brick.UltrasonicDist(SoundSensorPort);
    disp(distance);
    % angle = brick.GyroAngle(GyroSensorPort);
    % disp(angle);
    isTouched = brick.TouchPressed(TouchSensorPort);
    disp(isTouched);
    if distance < wallDist && distance > wallMinDist && distance < wallMaxDist
        if isTouched
           % moves the car back a little bit and turns the car left, 
           % cause the car sees that there's a wall to the right and that 
           % there's a wall to the front
           brick.MoveMotor(MotorPortLeft, -AutoSpeed);
           brick.MoveMotor(MotorPortRight, -AutoSpeed);
           pause(1);
           % turnLeft(brick, GryoSensorPort);
           % angleCurr = brick.GyroAngle(GyroSensorPort);
           % newAngle = angleCurr-86;
           % while angleCurr>newAngle
           %     brick.MoveMotor(MotorPortLeft, TurnSpeed);
           %     brick.MoveMotor(MotorPortRight, -TurnSpeed);
           %     pause(.1);
           %     angleCurr = brick.GyroAngle(GyroSensorPort);
           % end
           run("turnleft.m");
           brick.StopMotor(MotorPortLeft, 'Brake');
           brick.StopMotor(MotorPortRight, 'Brake');
           % brick.MoveMotor(MotorPortLeft, AutoSpeed);
           % brick.MoveMotor(MotorPortRight, -AutoSpeed);
           % pause(.8);
        else
        % The car sees that there's a wall to the right, but doesn't see 
        % that there's a wall in front of it, so it continues moving
        % forward
        brick.MoveMotor(MotorPortLeft, AutoSpeed);
        brick.MoveMotor(MotorPortRight, AutoSpeed);
        pause(1);
        end
        %idk if this conditional is necessary
    elseif wallMinDist > distance
        %the car is too close to the right so we move it back and we turn 
        %it left a litte, then have it move forward
        brick.MoveMotor(MotorPortLeft, -AutoSpeed);
        brick.MoveMotor(MotorPortRight, -AutoSpeed);
        pause(1);
        brick.MoveMotor(MotorPortLeft, AutoSpeed);
        brick.MoveMotor(MotorPortRight, -AutoSpeed);
        pause(.1);
        brick.MoveMotor(MotorPortLeft, AutoSpeed);
        brick.MoveMotor(MotorPortRight, AutoSpeed);
        pause(1);
    elseif distance > wallMaxDist && distance < wallDist
        %the car is too close to the left so we move it back and we turn 
        %it right a litte, then have it move forward
        brick.MoveMotor(MotorPortLeft, -AutoSpeed);
        brick.MoveMotor(MotorPortRight, -AutoSpeed);
        pause(1);
        brick.MoveMotor(MotorPortLeft, -AutoSpeed);
        brick.MoveMotor(MotorPortRight, AutoSpeed);
        pause(.1);
        brick.MoveMotor(MotorPortLeft, AutoSpeed);
        brick.MoveMotor(MotorPortRight, AutoSpeed);
        pause(1);
    else
        % if the robot touches the wall, but there's room for it to turn
        % right, it will move back a little
        if isTouched
            brick.MoveMotor(MotorPortLeft, -AutoSpeed);
            brick.MoveMotor(MotorPortRight, -AutoSpeed);
            pause(3);
        end
        % The car sees that there's no wall to its right, so it moves
        % forward then turns right, then moves forward again
        brick.MoveMotor(MotorPortLeft, AutoSpeed);
        brick.MoveMotor(MotorPortRight, AutoSpeed);
        pause(1.5);
        % turnRight(brick, GryoSensorPort);
        % angleCurr = brick.GyroAngle(GyroSensorPort);
        % newAngle = angleCurr+86;
        % while angleCurr<newAngle
        %     brick.MoveMotor(MotorPortLeft, -TurnSpeed);
        %     brick.MoveMotor(MotorPortRight, TurnSpeed);
        %     pause(.1);
        %     angleCurr = brick.GyroAngle(GyroSensorPort);
        % end
        run("turnright.m");
        brick.StopMotor(MotorPortLeft, 'Brake');
        brick.StopMotor(MotorPortRight, 'Brake');
        brick.MoveMotor(MotorPortLeft, AutoSpeed);
        brick.MoveMotor(MotorPortRight, AutoSpeed);
        if(brick.ColorCode(ColorSensorPort)~=5)
        pause(.5);
        else 
        brick.StopMotor(MotorPortLeft, 'Brake');
        brick.StopMotor(MotorPortRight, 'Brake');
        end
        if(brick.ColorCode(ColorSensorPort)~=5)
        pause(.5);
        else 
        brick.StopMotor(MotorPortLeft, 'Brake');
        brick.StopMotor(MotorPortRight, 'Brake');
        end
        if(brick.ColorCode(ColorSensorPort)~=5)
        pause(.5);
        else 
        brick.StopMotor(MotorPortLeft, 'Brake');
        brick.StopMotor(MotorPortRight, 'Brake');
        end
        if(brick.ColorCode(ColorSensorPort)~=5)
        pause(.5);
        else 
        brick.StopMotor(MotorPortLeft, 'Brake');
        brick.StopMotor(MotorPortRight, 'Brake');
        end
        % % brick.MoveMotor(MotorPortLeft, -AutoSpeed);
        % % brick.MoveMotor(MotorPortRight, AutoSpeed);
        % % pause(.8);
        % forwardBySeconds = 2;
        % while and(color ~= 5, forwardBySeconds>0)
        % brick.MoveMotor(MotorPortLeft, AutoSpeed);
        % brick.MoveMotor(MotorPortRight, AutoSpeed);
        % pause(1);
        % forwardBySeconds = forwardBySeconds - 1;
        % color = brick.colorCode(ColorSensorPort);
        % brick.StopMotor(MotorPortLeft, 'Brake');
        % brick.StopMotor(MotorPortRight, 'Brake');
        % end
    end
    brick.StopMotor(MotorPortLeft, 'Brake');
    brick.StopMotor(MotorPortRight, 'Brake');
    end
    if color==5
        %if the car sees red on the floor, the car stops for 3 seconds,
        %then proceeds forward
        brick.StopAllMotors('Brake');
        pause(3); 
        brick.MoveMotor(MotorPortLeft, AutoSpeed);
        brick.MoveMotor(MotorPortRight, AutoSpeed);
        pause(1);
    end
    brick.StopMotor(MotorPortLeft, 'Brake');
    brick.StopMotor(MotorPortRight, 'Brake');
end
run("keyboard_control.m");
while color ~= startingColor
    while color~=5
    %displays the current color, distance from wall and whether the color sensor is activated 
    color = brick.ColorCode(ColorSensorPort);
    disp(color);
    distance = brick.UltrasonicDist(SoundSensorPort);
    disp(distance);
    % angle = brick.GyroAngle(GyroSensorPort);
    % disp(angle);
    isTouched = brick.TouchPressed(TouchSensorPort);
    disp(isTouched);
    if distance < wallDist && distance > wallMinDist && distance < wallMaxDist
        if isTouched
           % moves the car back a little bit and turns the car left, 
           % cause the car sees that there's a wall to the right and that 
           % there's a wall to the front
           brick.MoveMotor(MotorPortLeft, -AutoSpeed);
           brick.MoveMotor(MotorPortRight, -AutoSpeed);
           pause(1);
           % turnLeft(brick, GryoSensorPort);
           % angleCurr = brick.GyroAngle(GyroSensorPort);
           % newAngle = angleCurr-86;
           % while angleCurr>newAngle
           %     brick.MoveMotor(MotorPortLeft, TurnSpeed);
           %     brick.MoveMotor(MotorPortRight, -TurnSpeed);
           %     pause(.1);
           %     angleCurr = brick.GyroAngle(GyroSensorPort);
           % end
           run("turnleft.m");
           brick.StopMotor(MotorPortLeft, 'Brake');
           brick.StopMotor(MotorPortRight, 'Brake');
           % brick.MoveMotor(MotorPortLeft, AutoSpeed);
           % brick.MoveMotor(MotorPortRight, -AutoSpeed);
           % pause(.8);
        else
        % The car sees that there's a wall to the right, but doesn't see 
        % that there's a wall in front of it, so it continues moving
        % forward
        brick.MoveMotor(MotorPortLeft, AutoSpeed);
        brick.MoveMotor(MotorPortRight, AutoSpeed);
        pause(1);
        end
        %idk if this conditional is necessary
    elseif wallMinDist > distance
        %the car is too close to the right so we move it back and we turn 
        %it left a litte, then have it move forward
        brick.MoveMotor(MotorPortLeft, -AutoSpeed);
        brick.MoveMotor(MotorPortRight, -AutoSpeed);
        pause(1);
        brick.MoveMotor(MotorPortLeft, AutoSpeed);
        brick.MoveMotor(MotorPortRight, -AutoSpeed);
        pause(.1);
        brick.MoveMotor(MotorPortLeft, AutoSpeed);
        brick.MoveMotor(MotorPortRight, AutoSpeed);
        pause(1);
    elseif distance > wallMaxDist && distance < wallDist
        %the car is too close to the left so we move it back and we turn 
        %it right a litte, then have it move forward
        brick.MoveMotor(MotorPortLeft, -AutoSpeed);
        brick.MoveMotor(MotorPortRight, -AutoSpeed);
        pause(1);
        brick.MoveMotor(MotorPortLeft, -AutoSpeed);
        brick.MoveMotor(MotorPortRight, AutoSpeed);
        pause(.1);
        brick.MoveMotor(MotorPortLeft, AutoSpeed);
        brick.MoveMotor(MotorPortRight, AutoSpeed);
        pause(1);
    else
        % if the robot touches the wall, but there's room for it to turn
        % right, it will move back a little
        if isTouched
            brick.MoveMotor(MotorPortLeft, -AutoSpeed);
            brick.MoveMotor(MotorPortRight, -AutoSpeed);
            pause(3);
        end
        % The car sees that there's no wall to its right, so it moves
        % forward then turns right, then moves forward again
        brick.MoveMotor(MotorPortLeft, AutoSpeed);
        brick.MoveMotor(MotorPortRight, AutoSpeed);
        pause(1.5);
        % turnRight(brick, GryoSensorPort);
        % angleCurr = brick.GyroAngle(GyroSensorPort);
        % newAngle = angleCurr+86;
        % while angleCurr<newAngle
        %     brick.MoveMotor(MotorPortLeft, -TurnSpeed);
        %     brick.MoveMotor(MotorPortRight, TurnSpeed);
        %     pause(.1);
        %     angleCurr = brick.GyroAngle(GyroSensorPort);
        % end
        run("turnright.m");
        brick.StopMotor(MotorPortLeft, 'Brake');
        brick.StopMotor(MotorPortRight, 'Brake');
        brick.MoveMotor(MotorPortLeft, AutoSpeed);
        brick.MoveMotor(MotorPortRight, AutoSpeed);
        for c=1:4
            if(brick.ColorCode(ColorSensorPort)~=5)
            pause(.5);
            else 
            brick.StopMotor(MotorPortLeft, 'Brake');
            brick.StopMotor(MotorPortRight, 'Brake');
            end
        end
        % if(brick.ColorCode(ColorSensorPort)~=5)
        % pause(.5);
        % else 
        % brick.StopMotor(MotorPortLeft, 'Brake');
        % brick.StopMotor(MotorPortRight, 'Brake');
        % end
        % if(brick.ColorCode(ColorSensorPort)~=5)
        % pause(.5);
        % else 
        % brick.StopMotor(MotorPortLeft, 'Brake');
        % brick.StopMotor(MotorPortRight, 'Brake');
        % end
        % if(brick.ColorCode(ColorSensorPort)~=5)
        % pause(.5);
        % else 
        % brick.StopMotor(MotorPortLeft, 'Brake');
        % brick.StopMotor(MotorPortRight, 'Brake');
        % end
        % % % brick.MoveMotor(MotorPortLeft, -AutoSpeed);
        % % brick.MoveMotor(MotorPortRight, AutoSpeed);
        % % pause(.8);
        % forwardBySeconds = 2;
        % while and(color ~= 5, forwardBySeconds>0)
        % brick.MoveMotor(MotorPortLeft, AutoSpeed);
        % brick.MoveMotor(MotorPortRight, AutoSpeed);
        % pause(1);
        % forwardBySeconds = forwardBySeconds - 1;
        % color = brick.colorCode(ColorSensorPort);
        % brick.StopMotor(MotorPortLeft, 'Brake');
        % brick.StopMotor(MotorPortRight, 'Brake');
        % end
    end
    brick.StopMotor(MotorPortLeft, 'Brake');
    brick.StopMotor(MotorPortRight, 'Brake');
    end
    if color==5
        %if the car sees red on the floor, the car stops for 3 seconds,
        %then proceeds forward
        brick.StopAllMotors('Brake');
        pause(3); 
        brick.MoveMotor(MotorPortLeft, AutoSpeed);
        brick.MoveMotor(MotorPortRight, AutoSpeed);
        pause(1);
    end
    brick.StopMotor(MotorPortLeft, 'Brake');
    brick.StopMotor(MotorPortRight, 'Brake');
end
run("keyboard_control.m");
DisconnectBrick(brick);
% function turnRight(brick, GryoSensorPort)
% angleCurr = brick.GyroAngle(GyroSensorPort);
% newAngle = angleCurr+86;
% while angleCurr<newAngle
%     brick.MoveMotor(MotorPortLeft, -AutoSpeed);
%     brick.MoveMotor(MotorPortRight, AutoSpeed);
%     pause(.1);
%     angleCurr = brick.GyroAngle(GyroSensorPort);
% end
% brick.StopMotor(MotorPortLeft, 'Brake');
% brick.StopMotor(MotorPortRight, 'Brake');
% end
% function turnLeft(brick, GryoSensorPort)
% angleCurr = brick.GyroAngle(GyroSensorPort);
% newAngle = angleCurr-90;
% while angleCurr>newAngle
%     brick.MoveMotor(MotorPortLeft, AutoSpeed);
%     brick.MoveMotor(MotorPortRight, -AutoSpeed);
%     pause(.1);
%     angleCurr = brick.GyroAngle(GyroSensorPort);
% end  
% brick.StopMotor(MotorPortLeft, 'Brake');
% brick.StopMotor(MotorPortRight, 'Brake');
% end