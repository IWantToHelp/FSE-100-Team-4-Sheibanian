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
%Current speed of robot during autonomous movement
AutoSpeed = 50;
%0	No color (Unknown color) 
%1	Black 
%2	Blue 
%3	Green 
%4	Yellow 
%5	Red 
%6	White 
%7	Brown
destinationColor = 4;
%Maximum distance from wall
wallDist = 50;
%minimum distance from wall
wallMinDist = 10; 
%Sets the calibrates gyro
brick.GyroCalibrate(GyroSensorPort);
run("keyboard_control.m");
while 1
    color = brick.ColorCode(ColorSensorPort);
    disp(color);
    distance = brick.UltrasonicDist(SoundSensorPort);
    disp(distance);
    angle = brick.GyroAngle(GyroSensorPort);
    disp(angle);
    isTouched = brick.TouchPressed(TouchSensorPort);
    disp(isTouched);
    if color == destinationColor
        %We start manually controlling the car if we reach the destination
        %color
        run("keyboard_control.m");
        break;
    elseif color == 5
        brick.StopAllMotors('Brake');
        pause(3); 
        brick.MoveMotor(MotorPortLeft, AutoSpeed);
        brick.MoveMotor(MotorPortRight, AutoSpeed);
        pause(1);

    elseif distance < wallDist
        if isTouched
           % moves the car back a little bit and turns the car right, 
           % cause the car sees that there's a wall to the left and that 
           % there's a wall to the front
           brick.MoveMotor(MotorPortLeft, -AutoSpeed);
           brick.MoveMotor(MotorPortRight, -AutoSpeed);
           pause(1);
           brick.MoveMotor(MotorPortLeft, AutoSpeed);
           brick.MoveMotor(MotorPortRight, -AutoSpeed);
           pause(1.5);
        else
        % The car sees that there's a wall to the left, but doesn't see 
        % that there's a wall in front of it, so it continues moving
        % forward
        brick.MoveMotor(MotorPortLeft, AutoSpeed);
        brick.MoveMotor(MotorPortRight, AutoSpeed);
        pause(1);
        end
    %     %idk if this conditional is necessary
    % elseif wallMinDist > distance
    %     %the car is too close to the left so we turn it right a little bit
    %     %and have it move forward
    %     brick.MoveMotor(MotorPortLeft, AutoSpeed);
    %     brick.MoveMotor(MotorPortRight, -AutoSpeed);
    %     pause(.2);
    %     brick.MoveMotor(MotorPortLeft, -AutoSpeed);
    %     brick.MoveMotor(MotorPortRight, -AutoSpeed);
    %     pause(1);
    else
        % The car sees that there's no wall to its left, so it moves
        % forward then turns left, then moves forward again
        brick.MoveMotor(MotorPortLeft, AutoSpeed);
        brick.MoveMotor(MotorPortRight, AutoSpeed);
        pause(2);
        brick.MoveMotor(MotorPortLeft, -AutoSpeed);
        brick.MoveMotor(MotorPortRight, AutoSpeed);
        pause(1.5);
        brick.MoveMotor(MotorPortLeft, AutoSpeed);
        brick.MoveMotor(MotorPortRight, AutoSpeed);
        pause(2);
    end
    brick.StopMotor(MotorPortLeft, 'Brake');
    brick.StopMotor(MotorPortRight, 'Brake');
end
DisconnectBrick(brick);