x = [1 2 3 4 5 6 7 8];
y = [89.45 88.9 90.30 90.15 90.35 89.8 89.85 89.15];
plot(x, y, ':black*');

%{
filename = 'sat_train_modified.txt';
filename1 = 'sat_test_modified.txt';
filename2 = 'sat_knn.txt';
M = csvread(filename);
M1 = csvread(filename1);
[rows, cols] = size(M);
[rows1, cols1] = size(M1);
X = M(1: rows, 1:cols - 1);
Y = M(1:rows, cols);
%delete filename2;
knn = ClassificationKNN.fit(X, Y, 'NumNeighbors', 8);
cnt = 0; cnt1 = 0;


x = M1(:, 1 : cols1 - 1);
y = M1(:, cols1);
x1 = knn.predict(x);
cmat = confusionmat(y, x1);
accu = 100 * sum(diag(cmat)) / sum(cmat(:))

for i = 1 : rows1
    x = M1(i, 1 : cols1 - 1);
    y = M1(i, cols1);
    x1 = knn.predict(x);
    if (x1 ~= y) 
        cnt = cnt + 1;
        ans = [x, y];
        %disp(ans);
        %dlmwrite(filename2, ans, '-append', 'delimiter', ',');
    end;
    
    cnt1 = cnt1 + 1;
end;



disp(cnt);
disp('misclassified out of');
disp(cnt1);
acc = 100*((cnt1 - cnt) / cnt1);
disp(acc);
%}