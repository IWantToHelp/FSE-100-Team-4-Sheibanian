%Tyler Nguyen, Advait Yadav, Aarsh Duhlani, Brandon Prior, Puneet Kaur 
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
            %disp('Left');
            brick.MoveMotor(MotorPortLeft, -100);
            brick.MoveMotor(MotorPortRight, 100);
            
        case 'rightarrow'
            %disp('Right');
            brick.MoveMotor(MotorPortLeft, 100);
            brick.MoveMotor(MotorPortRight, -100);
            
        case 0
            %disp('No Key Press');
            brick.StopAllMotors('Coast');
            
        case 's'
            %disp('Crane Down');
            brick.MoveMotor(ClawPort, -50);
            
        case 'w'
            %disp('Crane Up');
            brick.MoveMotor(ClawPort, 50);
            
        case 'q'
            break;
    end
end

CloseKeyboard();