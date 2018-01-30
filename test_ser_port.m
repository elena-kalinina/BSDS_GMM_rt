function test_ser_port

SerPor=OpenSerialPort();
while 1
    if SerPor.BytesAvailable
        onset=str2double(fscanf(SerPor, '%s'));
        fprintf('Onset: %d \n', onset);
        
    end
end
CloseSerialPort(SerPor);