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
ClawPort = 'B';
MotorPortLeft = 'D';
MotorPortRight = 'C';
ColorSensorPort = '1';
brick = ConnectBrick('EV3G');
brick.SetColorMode(ColorSensorPort, 2)

%brick.MoveMotor(MotorPortRight, MotorSpeed);
%pause(10);
%brick.MoveMotor(MotorPortLeft, MotorSpeed);
%pause(10);
%brick.StopMotor(MotorPortLeft, 'Coast');
%brick.StopMotor(MotorPortRight, 'Coast');
%brick.MoveMotor(ClawPort, MotorSpeed);
%pause(5);
%brick.StopMotor(ClawPort, 'Coast');


global key
InitKeyboard();
while 1
    pause(0.1);
    switch key
        case 'uparrow'
            %disp('Up');
            brick.MoveMotor(MotorPortLeft, -100);
            brick.MoveMotor(MotorPortRight, -100);
            
        case 'downarrow'
            %disp('Down');
            brick.MoveMotor(MotorPortLeft, 100);
            brick.MoveMotor(MotorPortRight, 100);
            
        case 'leftarrow'
            brick.MoveMotor(MotorPortLeft, -100);
            brick.MoveMotor(MotorPortRight, 100);
            
        case 'rightarrow'
            brick.MoveMotor(MotorPortLeft, 100);
            brick.MoveMotor(MotorPortRight, -100);
            
        case 0
            %disp('No Key Press');
            brick.StopAllMotors('Coast');
            
        case 'w'
            %disp('Crane Up');
            brick.MoveMotor(ClawPort, -50);
            
        case 's'
            %disp('Crane Down');
            brick.MoveMotor(ClawPort, 50);
            
        case 'q'
            break;
    end
end

CloseKeyboard();
DisconnectBrick(brick);