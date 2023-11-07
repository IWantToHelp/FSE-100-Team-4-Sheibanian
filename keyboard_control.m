%Tyler Nguyen, Advait Yadav, Aarsh Duhlani, Brandon Prior, Puneet Kaur 
global key
InitKeyboard()
manualspeed = 70;
while 1
    pause(0.1);
    switch key
        case 'downarrow'
            %disp('Down');
            brick.MoveMotor(MotorPortLeft, -manualspeed);
            brick.MoveMotor(MotorPortRight, -manualspeed);
            
        case 'uparrow'
            %disp('Up');
            brick.MoveMotor(MotorPortLeft, manualspeed);
            brick.MoveMotor(MotorPortRight, manualspeed);
            
        case 'leftarrow'
            %disp('Left');
            brick.MoveMotor(MotorPortLeft, -manualspeed);
            brick.MoveMotor(MotorPortRight, manualspeed);
            
        case 'rightarrow'
            %disp('Right');
            brick.MoveMotor(MotorPortLeft, manualspeed);
            brick.MoveMotor(MotorPortRight, -manualspeed);
            
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