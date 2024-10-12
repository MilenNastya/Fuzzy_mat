% 1 2 5 4 3 6 - порядок критериев в какой-то матрице или другая информация
criteria = {'Качество зерна', 'Цена зерна', 'Транспортные расходы', ...
            'Форма оплаты', 'Минимальная партия', 'Надежность поставки'};
A = [1 0.5 0.2 0.25 0.33 0.167;
    2 1 0.4 0.5 0.67 0.333;
    5 2.5 1 1.25 1.67 0.833;
    4 2 0.8 1 1.33 0.667;
    3 1.5 0.6 0.75 1 0.5;
    6 3 1.2 1.5 2 1];
    
function [weights, consistencyIndex] = calculate_weights(matrix, iterations)
n = size(matrix, 1);
weights = ones(n, 1) / n;
for iter = 1:iterations
    eigVector = matrix * weights;
    weights = eigVector / sum(eigVector);
end

% макс значение
lambdaMax = sum((matrix * weights) ./ weights) / n;

% расчет итерационной силы критерия
consistencyIndex = (lambdaMax - n) / (n - 1);
end

% 3 итерации
[weights_var9, consistencyIndex_var9] = calculate_weights(A, 3);

disp('Вывод весов после 3 итераций :');
for i = 1:length(criteria)
    fprintf('%s: %.3f\n', criteria{i}, weights_var9(i));
end
fprintf('Вывод итерационной силы критерия: %.3f\n', consistencyIndex_var9);
disp('Вывод матрицы:');
disp(A);
