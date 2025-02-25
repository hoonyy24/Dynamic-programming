% Define the nodes and edges with weights
nodes = {'A', 'AB', 'AC', 'AD', 'ABC', 'ABD', 'ACB', 'ACD', 'ADB', 'ADC', 'ABCD', 'ABDC', 'ACDB', 'ADBC', 'ADCB', 't'};
edges = {...  
    'A', 'AB', 5;
    'A', 'AC', 1;
    'A', 'AD', 15;
    'AB', 'ABC', 20;
    'AB', 'ABD', 4;
    'AC', 'ACB', 20;
    'AC', 'ACD', 3;
    'AD', 'ADB', 4;
    'AD', 'ADC', 3;
    'ABC', 'ABCD', 3;
    'ABD', 'ABDC', 3;
    'ACB', 'ACDB', 4;
    'ACD', 'ACDB', 4;
    'ADB', 'ADBC', 20;
    'ADC', 'ADCB', 20;
    'ABCD', 't', 15;
    'ABDC', 't', 1;
    'ACDB', 't', 5;
    'ADBC', 't', 1;
    'ADCB', 't', 5
};

% Create a directed graph
G = digraph(edges(:,1), edges(:,2), cell2mat(edges(:,3)), nodes);

% Plot the graph with a layered layout
figure;
h = plot(G, 'Layout', 'layered', 'EdgeLabel', G.Edges.Weight, 'ArrowSize', 8);
title('Modified Dijkstra Algorithm - Graph Representation');

% Customize Node Colors
highlight(h, 'A', 'NodeColor', 'g', 'MarkerSize', 10); % Start node
highlight(h, 't', 'NodeColor', 'r', 'MarkerSize', 10); % Target node

% Apply Dijkstra’s Algorithm
startNode = 'A';
endNode = 't';
[shortestPath, totalCost] = shortestpath(G, startNode, endNode);

% Highlight the shortest path with a different color
highlight(h, shortestPath, 'EdgeColor', 'b', 'LineWidth', 2);
highlight(h, shortestPath, 'NodeColor', 'cyan', 'MarkerSize', 8);

% Display results with step-by-step output
fprintf('--- Shortest Path Calculation ---\n');
fprintf('Start Node: %s\n', startNode);
fprintf('End Node: %s\n', endNode);
fprintf('Shortest Path: %s\n', strjoin(shortestPath, ' -> '));
fprintf('Total Cost: %d\n', totalCost);
fprintf('---------------------------------\n');

