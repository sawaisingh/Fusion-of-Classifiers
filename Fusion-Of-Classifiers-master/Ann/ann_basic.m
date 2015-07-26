clc;
clear;
filename = 'sat_train_ann.txt';
filename1 = 'sat_test_ann.txt';

ttrain = csvread(filename);
ttest = csvread(filename1);
[r c] = size(ttrain);

inp = ttrain(1:r, 1:c-6);
out = ttrain(1:r, c-5 : c);
inp = inp';
out = out';

net = patternnet([15 6]);
net.divideParam.trainRatio = 85/100;
net.divideParam.valRatio = 15/100;
net.divideParam.testRatio = 0/100;

%view(net);
[net, tr] = train(net, inp, out);

X = ttest(:, 1:c-6);
T = ttest(:, c-5:c);
X = X';
T = T';

Y = net(X);
plotconfusion(T, Y);
[c cm] = confusion(T, Y);
1-c