A=csvread('gest.csv');
Input=A(:,1:5);
Output=A(:,6:15);
n=0;
while n<1000
    p1 = uint8(1+rand()*249);
    p2 = uint8(1+rand()*249);
    
    IT = Input(p1,:);
    OT = Output(p1,:);
    
    Input(p1,:) = Input(p2,:);
    Output(p1,:) = Output(p2,:);
    
    Input(p2,:) = IT;
    Output(p2,:) = OT;
    n = n + 1;
end 

Input = Input';
Output = Output';
net = patternnet([10 10]);
view(net);
[net,tr] = train(net,Input,Output);
testX = Input(:,tr.testInd);
testT = Output(:,tr.testInd);

testY = net(testX);
testIndices = vec2ind(testY);
plotconfusion(testT,testY);
[c,cm] = confusion(testT,testY);

fprintf('Percentage Correct Classification   : %f%%\n', 100*(1-c));
fprintf('Percentage Incorrect Classification : %f%%\n', 100*c);