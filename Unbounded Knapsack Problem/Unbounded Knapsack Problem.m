% Unbounded Knapsack Problem 

function MaxValue = unboundednapsack(v,w,z)
    
    N = length(v); % The number of items        
    DP = zeros(1, z+1); % Initialize DP array, DP(1) represents DP(0) (max value when capacity is 0)
  
    % Compute the optimal value for each capacity from 1 to z
    for k = 1:z
        for i = 1:N
            if w(i) <= k
                % When adding item i at capacity k:
                % DP(k - w(i) + 1) corresponds to the optimal value at capacity (k - w(i))
                DP(k+1) = max(DP(k+1), DP(k - w(i) + 1) + v(i));
                % At each capacity k, the algorithm iterates over all items i and updates DP(k+1) to store only the maximum possible value among all considered items.
            end
        end
    end

    % The maximum value for knapsack capacity z is stored in DP(z+1)
    MaxValue = DP(z+1);
end

% MATLAB uses 1-based indexing (indices start from 1)
% DP(0) cannot be directly stored, so DP(1) is used instead
% As a result, the DP array is defined from DP(1) to DP(z+1) to represent DP(0) to DP(z)
   
v = [4,6,10]; % Values of items
w = [10,20,30]; % Weights of items
z = 200; % Set capacity to 200kg

MaxValue = unboundednapsack(v,w,z);
disp(['Maximum value: ', num2str(MaxValue)]);

