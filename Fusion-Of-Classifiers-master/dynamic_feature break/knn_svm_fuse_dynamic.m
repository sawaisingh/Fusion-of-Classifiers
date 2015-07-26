clc;

%while(1)
    clear;
    filename = 'sat_train_modified.txt';
    filename1 = 'sat_test_modified.txt';
    filename5 = 'knnp';
    classes = 6;
    
    clearvars ttrain ttest test train knncmat knnacc knnaccuclass B;

    ttrain = csvread(filename);
    ttest = csvread(filename1);

    A = [];
    
    [rtr ctr] = size(ttrain);
    [rts cts] = size(ttest);

    val = 192;
    C = [2 3 4];
    
    x = C(randi(3, 1, 1));
    x = 1;
    y = 36;


    cnt = 0;
    cnt1 = 1;
    while(1)
        f = false;
        r = randi(36, 1, 1);
        [ur uc] = size(A);
        for j = 1 : uc
            if (r == A(j))
                f = true;
                break;
            end;
        end;
        if (f == false)
            A = [A r];

            cnt = cnt + 1;
            if ((y / cnt) == x)

                for j = 1 : cnt
                    train(1:rtr, j, cnt1) = ttrain(1:rtr, A((cnt1 - 1) * cnt + j));
                    test(1:rts, j, cnt1) = ttest(1:rts, A((cnt1 - 1) * cnt + j));
                end;
                A;
                cnt = 0;
                cnt1 = cnt1 + 1;
            end;
        end;

        if (uc == 36) 
            break;
        end
    end;

    [rts cts dts] = size(test)
    [rtr ctr dtr] = size(train);
    feature_files = x;



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
        [r c] = size(temp)
        X = temp(:, 1 : c);
        Y = ttest(:, 37);
        filename6 = strcat(filename5, sprintf('%d%s', i, '.mat'));
        load(filename6, 'knn');
        %disp(knn);
        knnp = knn.predict(X);
        knncmat(:, :, i) = confusionmat(Y, knnp);
        temp = knncmat(:, :, i);
        knnacc(i) = 100 * sum(diag(temp)) / sum(temp(:));
        for j = 1 : classes
            knnaccuclass(i, j) = 100 * (temp(j, j)) / sum(temp(j, :));
        end;

    end;
    knnacc(:)

    cnt1 = 0;
    cnt2 = 0;
    for i = 1 : rts
        B = zeros(classes);
        ma = 0;
        for j = 1 : feature_files
            temp = test(:, :, j);
            [r c] = size(temp);
            X = temp(i, :);
            Y = ttest(i, 37);
            filename6 = strcat(filename5, sprintf('%d%s', j, '.mat'));
            load(filename6, 'knn');
            %disp(knn);
            knnp = knn.predict(X);
            B(knnp) = B(knnp) + knnacc(j);

        end
        for j = 1 : classes
            if (ma < B(j)) 
                ma = B(j);
                class = j;
            else
                if (ma == B(j) && ma ~= 0) 
                    cnt2 = cnt2 + 1;

                end;
            end;
        end;

        if (class ~= Y)
            cnt1 = cnt1 + 1;
        end;
        ans = [cnt1 i cnt2];
    end
    ans   
    if (cnt1 < val) 
        val = cnt1;
        A
    end;
    
%end;
   






