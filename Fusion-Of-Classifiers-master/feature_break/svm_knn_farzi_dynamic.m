clc;
filename1 = 'sat_feature_train';
filename3 = 'sat_feature_test';
filename5 = 'knnp';
feature_files = 2;
clearvars ttrain ttest test train knncmat;
for i = 1 : feature_files
    filename = strcat(filename1, sprintf('%d%s', i, '.txt'));
    train(:,:,i) = csvread(filename);
    
    filename2 = strcat(filename3, sprintf('%d%s', i, '.txt'));
    test(:, :, i) = csvread(filename2);
end;

for i = 1 : feature_files
    temp = train(:, :, i);
    [r c] = size(temp);
    X = temp(:, 1 : c - 1);
    Y = temp(:, c);
    
    knn = ClassificationKNN.fit(X, Y, 'NumNeighbors', 5);
    filename6 = strcat(filename5, sprintf('%d%s', i, '.mat'));
    save(filename6, 'knn');
end;

for i = 1 : feature_files
    temp = test(:, :, i);
    [r c] = size(temp);
    X = temp(:, 1 : c - 1);
    Y = temp(:, c);
    filename6 = strcat(filename5, sprintf('%d%s', i, '.mat'));
    load(filename6, 'knn');
    disp(knn);
    knnp = knn.predict(X);
    knncmat(:, :, i) = confusionmat(Y, knnp);
    temp = knncmat(:, :, i);
    knnacc(i) = 100 * sum(diag(temp)) / sum(temp(:))
end;