clc;
filename = 'sat_train_modified.txt';
filename1 = 'sat_test_modified.txt';
filename5 = 'knnp';
%{
MLdeleteMatrix(ttrain);
MLDeleteMatrix(ttest);

MLDeleteMatrix(test);
MLDeleteMatrix(train);
MLDeleteMatrix(knncmat);
%}
clearvars ttrain ttest test train knncmat knnacc;

ttrain = csvread(filename);
ttest = csvread(filename1);

[rtr ctr] = size(ttrain);
[rts cts] = size(ttest);



x = 2;
y = 36;
cnt = 9;
cnt1 = 1;

for i = 1 : 4
    for j = 1 : cnt
            train(1:rtr, j, i) = ttrain(1:rtr, (i - 1) * cnt + j);
            test(1:rts, j, i) = ttest(1:rts, (i - 1) * cnt + j);
    end;
end;

    

[rts cts dts] = size(test);
[rtr ctr dtr] = size(train);
feature_files = 4;

for i = 1 : feature_files
    temp = train(:, :, i);
    [r c] = size(temp);
    X = temp(:, 1 : c);
    Y = ttrain(:, 37);
    
    knn = ClassificationKNN.fit(X, Y, 'NumNeighbors', 5);
    filename6 = strcat(filename5, sprintf('%d%s', i, '.mat'));
    save(filename6, 'knn');
end;

for i = 1 : feature_files
    temp = test(:, :, i);
    [r c] = size(temp);
    X = temp(:, 1 : c);
    Y = ttest(:, 37);
    filename6 = strcat(filename5, sprintf('%d%s', i, '.mat'));
    load(filename6, 'knn');
    disp(knn);
    knnp = knn.predict(X);
    knncmat = confusionmat(Y, knnp);
    temp = knncmat;
    knnacc(i) = 100 * sum(diag(temp)) / sum(temp(:))
end;





