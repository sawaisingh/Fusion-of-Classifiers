clc;
x = 1;
filename2 = 'C:\Users\mad.exe\Desktop\proj\final project\train_class';
filename3 = 'C:\Users\mad.exe\Desktop\proj\final project\test_class';
for i = 1 : 6
    filename = strcat(filename2,sprintf('%d%s',i,'.txt'));
    filename1 = strcat(filename3, sprintf('%d%s', i, '.txt'));
    M = csvread(filename);
    M1 = csvread(filename1);
    [rows, cols] = size(M);
    [rows1, cols1] = size(M1);
    if (rows ~= 0 && rows1 ~= 0)
        X = M(1: rows, 1:cols - 1);
        Y = M(1:rows, cols);
        options.MaxIter = 100000;
        
        svm1 = svmtrain(X, Y, 'Options', options);
        S(i) = svm1;
        X = M1(1: rows1, 1:cols1 - 1);
        Y = M1(1: rows1, cols1);

        c3 = svmclassify(S(i), X);
        cmat3 = confusionmat(Y, c3);
        disp(cmat3);

        acc = sum(diag(cmat3)) / sum(cmat3(:));
        disp(acc);
        accuracy(i) = acc;
        
        
    end;
end;
cnt = 0;cnt1 = 0;
filename4 = 'C:\Users\mad.exe\Desktop\proj\final project\sat_test_modified.txt';
N = csvread(filename4);
for i = 1 : rows1
    ans = 0.0;
    class = 0;
    i
    for j = 1 : 6
        filename1 = strcat(filename3, sprintf('%d%s', j, '.txt'));
        M = csvread(filename1);
        M = M(i, :);
        [rows, cols] = size(M);
        X = M(1:cols-1);
        Y = M(cols);
        
        c3 = svmclassify(S(j), X);
        if (c3 == 1)
            if (ans < accuracy(j)) 
                ans = accuracy(j);
                class = j;
            end;
        end        
    end;
    if (class ~= N(i, 37)) 
        cnt = cnt + 1
        if (N(i, 37) == 4)
            cnt1 = cnt1+1;
        end;
    end;
    
        
end;
cnt
cnt1
%dlmwrite('C:\Users\mad.exe\Desktop\proj\final project\svm_accuracy.txt', acc, '-append');


