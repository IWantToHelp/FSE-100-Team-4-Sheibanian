%Tyler Nguyen, Advait Yadav, Aarsh Duhlani, Brandon Prior, Puneet Kaur 
%Ports and their devices
% A 
% B Claw Motor
% C Right Motor
% D Left Motor
% 1 Sound Sensor
% 2 Gyro Sensor
% 3 Color Sensor
% 4 
% Mode of Color Sensor: Color Code
% Motor Speed: 100 
ClawPort = 'B';
MotorPortLeft = 'D';
MotorPortRight = 'C';
ColorSensorPort = '1';
brick = ConnectBrick('EV3G');
brick.SetColorMode(ColorSensorPort, 2)
MotorSpeed = 10;

%brick.MoveMotor(MotorPortRight, MotorSpeed);
%pause(10);
%brick.MoveMotor(MotorPortLeft, MotorSpeed);
%pause(10);
%brick.StopMotor(MotorPortLeft, 'Coast');
%brick.StopMotor(MotorPortRight, 'Coast');
brick.MoveMotor(ClawPort, MotorSpeed);
pause(5);
brick.StopMotor(ClawPort, 'Coast');
DisconnectBrick(brick);
