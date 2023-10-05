display('PUSH button to start the tone.')
while brick.TouchPressed(1) == 0
    while brick.TouchPressed(1) == 1
        display('Release Button to turn tone off.')
        brick.playTone(100, 300, 500); 
    end
end
display('Done!') 