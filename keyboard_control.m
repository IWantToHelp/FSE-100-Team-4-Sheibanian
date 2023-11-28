%Tyler Nguyen, Advait Yadav, Aarsh Duhlani, Brandon Prior, Puneet Kaur 
global key
InitKeyboard()
manualspeed = -50;
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
            brick.MoveMotor(MotorPortLeft, manualspeed);
            brick.MoveMotor(MotorPortRight, -manualspeed);
            % turnLeft(brick);
           % angleCurr = brick.GyroAngle(GyroSensorPort);
           % newAngle = angleCurr-86;
           % brick.MoveMotor(MotorPortLeft, TurnSpeed);
           % brick.MoveMotor(MotorPortRight, -TurnSpeed);
           % while brick.GyroAngle(GyroSensorPort)>newAngle
           %     pause(.1);
           % end
           % brick.StopMotor(MotorPortLeft, 'Brake');
           % brick.StopMotor(MotorPortRight, 'Brake');
            
        case 'rightarrow'
            %disp('Right');
            brick.MoveMotor(MotorPortLeft, -manualspeed);
            brick.MoveMotor(MotorPortRight, manualspeed);
            % turnRight(brick);
            % angleCurr = brick.GyroAngle(GyroSensorPort);
            % newAngle = angleCurr+86;
            % brick.MoveMotor(MotorPortLeft, -TurnSpeed);
            % brick.MoveMotor(MotorPortRight, TurnSpeed);
            % while brick.GyroAngle(GyroSensorPort)<newAngle
            %     pause(.1);
            %     % angleCurr = brick.GyroAngle(GyroSensorPort);
            % end
        % brick.StopMotor(MotorPortLeft, 'Brake');
        % brick.StopMotor(MotorPortRight, 'Brake');
            
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
% function turnRight(brick)
% angleCurr = brick.GyroAngle(GyroSensorPort);
% newAngle = angleCurr+90;
% while angleCurr<newAngle
%     brick.MoveMotor(MotorPortLeft, -AutoSpeed);
%     brick.MoveMotor(MotorPortRight, AutoSpeed);
%     pause(.1);
%     angleCurr = brick.GyroAngle(GyroSensorPort);
% end
% brick.StopMotor(MotorPortLeft, 'Brake');
% brick.StopMotor(MotorPortRight, 'Brake');
% end
% function turnLeft(brick)
% angleCurr = brick.GyroAngle(GyroSensorPort);
% newAngle = angleCurr-90;
% while angleCurr>newAngle
%     brick.MoveMotor(MotorPortLeft, AutoSpeed);
%     brick.MoveMotor(MotorPortRight, -AutoSpeed);
%     pause(.1);
%     angleCurr = brick.GyroAngle(GyroSensorPort);
% brick.StopMotor(MotorPortLeft, 'Brake');
% brick.StopMotor(MotorPortRight, 'Brake');
% end  
% end