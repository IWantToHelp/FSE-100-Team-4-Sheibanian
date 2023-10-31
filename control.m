%Tyler Nguyen, Advait Yadav, Aarsh Duhlani, Brandon Prior, Puneet Kaur 
%Ports and their devices
% A 
% B Claw Motor
% C Right Motor
% D Left Motor
% 1 Color Sensor
% 2 Sound Sensor
% 3 Gyro Sensor
% 4 
% Mode of Color Sensor: Color Code
% Motor Speed: 100 
ClawPort = 'B';
MotorPortLeft = 'D';
MotorPortRight = 'C';
ColorSensorPort = 1;
SoundSensorPort = 2;
GyroSensorPort = 3;
brick = ConnectBrick('EV3G');
brick.SetColorMode(ColorSensorPort, 2)
brick.GyroCalibrate(GyroSensorPort);
MotorSpeed = 10;
run("keyboard_control.m")
%brick.MoveMotor(MotorPortRight, MotorSpeed);
%pause(10);
%brick.MoveMotor(MotorPortLeft, MotorSpeed);
%pause(10);
%brick.StopMotor(MotorPortLeft, 'Brake');
%brick.StopMotor(MotorPortRight, 'Brake');
while 1
    color = brick.ColorCode(ColorSensorPort);
    disp(color);
    %distance = brick.UltrasonicDist(SoundSensorPort);
    %disp(distance);
    %angle = brick.GyroAngle(GyroSensorPort);
    %disp(angle);
    %rotate 90 right
    %color = readColor(colorSensor);
    %soundLevel = readSoundLevel(soundSensor);
    %isTouched = readTouch(touchSensor);

    %if isTouched
    %    motorLeft.Speed = -30;
%        motorRight.Speed = -30;
 %       pause(1);
  %      motorLeft.Speed = 30;
   %     motorRight.Speed = -30;
    %    pause(1);
    %elseif soundLevel > 50
     %   motorLeft.Speed = 0;
     %   motorRight.Speed = 0;
    %elseif strcmp(color, 'black')
    %    motorLeft.Speed = 30;
    %    motorRight.Speed = -30;
    %else
     %   motorLeft.Speed = 30;
      %  motorRight.Speed = -30;
    %end

    pause(1);

    %rotate 90 left
% %    run("keyboard_control.m")4
%    brick.MoveMotor(MotorPortRight, MotorSpeed);
%    pause(10);
%    brick.MoveMotor(MotorPortLeft, MotorSpeed);
%    pause(10);
%    brick.StopMotor(MotorPortLeft, 'Brake');
%    brick.StopMotor(MotorPortRight, 'Brake');
end
brick.MoveMotor(ClawPort, 10);
pause(5);
brick.StopMotor(ClawPort, 'Brake');
