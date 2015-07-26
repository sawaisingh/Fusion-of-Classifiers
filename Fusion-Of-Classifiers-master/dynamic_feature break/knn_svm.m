clc;
filename = 'sat_train_modified.txt';
filename1 = 'sat_test_modified.txt';

ttrain = csvread(filename);
ttest = csvread(filename1);

A = [];

[rtr ctr] = size(ttrain);
[rts cts] = size(ttest);



x = 4;
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
          
            cnt = 0;
            cnt1 = cnt1 + 1;
        end;
    end;
    
    if (uc == 36) 
        break;
    end
end;
A






