filename = 'C:\Users\mad.exe\Desktop\proj\sat.trn';
filename1 = 'C:\Users\mad.exe\Desktop\proj\sat.tst';
M = csvread(filename);
M1 = csvread(filename1);
[rows, cols] = size(M);
[rows1, cols1] = size(M1);
X = M(1: rows, 1:cols - 1);
Y = M(1:rows, cols);

navbay = NaiveBayes.fit(X, Y, 'distribution', 'mn');
knn = ClassificationKNN.fit(X, Y, 'NumNeighbors', 6);

X = M1(1: rows1, 1:cols1 - 1);
Y = M1(1: rows1, cols1);

c1 = navbay.predict(X);
c2 = knn.predict(X);
cc = unique(Y)
%cc = unique(c1)
%cc = unique(c2)
cmat1 = confusionmat(Y, c1);
cmat2 = confusionmat(Y, c2);

disp(cmat1);
acc1 = 100*sum(diag(cmat1))/sum(cmat1(:));
disp(acc1);

disp(cmat2);
acc2 = 100*sum(diag(cmat2))/sum(cmat2(:));
disp(acc2);
%disp(sum(diag(cmat1)));
%disp(sum(diag(cmat2)));
%disp(rows1);
cnt = 0;
for i = 1 : rows1
    if(c1(i) == c2(i)) 
        if (c1(i) ~= Y(i)) 
            cnt = cnt + 1; 
        end;
    else 
        if (c1(i) ~= Y(i))
            cnt = cnt + 1;
        end;
    end;    
end;
acc1 = 100*(rows1 - cnt)/rows1;
disp(rows1 - cnt);    
