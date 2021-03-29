% Find k (mxid)
k = 1 + mod(9634,2892);

% Get the matrix
B = ssget(k).A;

% Get dimensions of matrix
[m,n] = size(B);

% Filter the matrix
A = B(1:min([m,n,1000]),1:min([m,n,1000]));

N = size(A, 1);

% Calculate kmax for the given matrix
kmax = floor((N - 1) / 2);
% Calculate pmax for the given matrix
p = floor((kmax - 1) / 2);

% Execute band_stats
P = band_stats(A, p);

% Calculate k array (x axis)
k = zeros(1, p);
for i = 1:(p+1)
    if (i == 1)
        k(i) = 0;
    else
        k(i) = 2 * (i-1) + 1;
    end
end

% Reverse k
k = k';

% Plot the results
plot(k,P(:,1),'-o',k,P(:,2),'-x');
limits = [0, k(end)];
xlim(limits);
title('Band Stats of Matrix');
xlabel('k');
ylabel('Values');
legend({'rnnz','rerr'},'Location','Southeast');
