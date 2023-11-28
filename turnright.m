angleCurr = brick.GyroAngle(GyroSensorPort);
newAngle = angleCurr+86;
while angleCurr<newAngle
    brick.MoveMotor(MotorPortLeft, -TurnSpeed);
    brick.MoveMotor(MotorPortRight, TurnSpeed);
    pause(.1);
    angleCurr = brick.GyroAngle(GyroSensorPort);
end