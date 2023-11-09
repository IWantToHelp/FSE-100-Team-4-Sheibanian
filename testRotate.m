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
AutoSpeed = 30;
brick.MoveMotor(MotorPortLeft, AutoSpeed);
brick.MoveMotor(MotorPortRight, -AutoSpeed);
pause(3);