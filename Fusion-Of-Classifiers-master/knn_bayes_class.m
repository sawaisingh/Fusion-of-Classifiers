clc;
filename = 'C:\Users\mad.exe\Desktop\proj\final project\sat_train_modified.txt';
filename1 = 'C:\Users\mad.exe\Desktop\proj\final project\sat_test_modified.txt';
M = csvread(filename);
M1 = csvread(filename1);
[rows, cols] = size(M);
[rows1, cols1] = size(M1);
X = M(1: rows, 1:cols - 1);
Y = M(1:rows, cols);

navbay = NaiveBayes.fit(X, Y);
knn = ClassificationKNN.fit(X, Y, 'NumNeighbors', 5);
disp(knn);
X = M1(1: rows1, 1:cols1 - 1);
Y = M1(1: rows1, cols1);
c1 = navbay.predict(X);
c2 = knn.predict(X);

cmat1 = confusionmat(Y, c1);
cmat2 = confusionmat(Y, c2);

disp(cmat1);
acc1 = 100*sum(diag(cmat1))/sum(cmat1(:));
%disp(acc1);

disp(cmat2);
acc2 = 100*sum(diag(cmat2))/sum(cmat2(:));
%disp(acc2);
cnt = 0;
c1c = zeros(6, 1);
c2c = zeros(6, 1);
for i = 1 :6
    c1c(i) = 100 * cmat1(i, i) / sum(cmat1(i, :));
    c2c(i) = 100 * cmat2(i, i) / sum(cmat2(i, :));  
end;
disp(c1c);
disp(c2c);
for i = 1 : rows1
    if(c1(i) == c2(i)) 
        if (c2(i) ~= Y(i)) 
            cnt = cnt + 1; 
        end;
    else 
        if (c2(i) ~= Y(i))
            cnt = cnt + 1;
        end;
    end;    
end;
acc1 = 100*(rows1 - cnt)/rows1;
disp(acc1);    
