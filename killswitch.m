%Tyler Nguyen, Advait Yadav, Aarsh Duhlani, Brandon Prior, Punnet 
brick = ConnectBrick('EV3G');
while brick.TouchPressed(1) == 0
    brick.playTone(100, 300, 500); 
end