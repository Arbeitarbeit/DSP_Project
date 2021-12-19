close all;
clear all;

%% Consider a signal dimension of 600.  Consider the number of rows of the sensing matrix A to be from the set {100, 200, 300, 400, 500,600}.  
sig_dim = 600;
from_set = [100, 200, 300, 400, 500, 600];

%% For each number of rows, randomly generate a sensing matrix A
A1 = randn(from_set(1));
A2 = randn(from_set(2));
A3 = randn(from_set(3));
A4 = randn(from_set(4));
A5 = randn(from_set(5));
A6 = randn(from_set(6));

%% Consider sparsity k of 10, 20, 30, ...., 600. For each sparsity, randomly generate 20 signals
k = (10:10:600);

min = 1;
max = sig_dim;

for b = 1:60
    rand_location{b} = min + rand(1,k(b)) * (max-min);
    for i = 1:20
        signal = zeros(20,600);
        for j = 1:size(rand_location{b})
            rand_value = randn(1);
            signal(i,floor(rand_location{b}(j))) = rand_value;
        end
    end
end

%%  For each sensing matrix and each sparsity, record the number b of signals that L1 decoding successfully recover. 
