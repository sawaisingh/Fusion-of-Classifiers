clc;
filename = 'C:\Users\mad.exe\Desktop\proj\final project\train_class7.txt';
filename1 = 'C:\Users\mad.exe\Desktop\proj\final project\test_class7.txt';
M = csvread(filename);
M1 = csvread(filename1);
[rows, cols] = size(M);
[rows1, cols1] = size(M1);
X = M(1: rows, 1:cols - 1);
Y = M(1:rows, cols);
options.MaxIter = 100000;
svm1 = svmtrain(X, Y, 'Options', options);

X = M1(1: rows1, 1:cols1 - 1);
Y = M1(1: rows1, cols1);

c3 = svmclassify(svm1, X);
cmat3 = confusionmat(Y, c3);
disp(cmat3);

acc = cmat3(2, 2) / (cmat3(2, 1) + cmat3(2, 2));
%dlmwrite('C:\Users\mad.exe\Desktop\proj\final project\svm_accuracy.txt', acc, '-append');


