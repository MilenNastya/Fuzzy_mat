
weights = [0.3 0.2 0.3 0.4 0.5;   % Стаж работы на рынке
           0.3 0.4 0.4 0.2 0.3;   % Репутация института
           0.1 0.1 0.2 0.3 0.1;   % Форма обучения
           0.3 0.3 0.1 0.1 0.1];  % Продолжительность обучения

[numCriteria, numExperts] = size(weights);
ranks = zeros(size(weights));
for j = 1:numExperts
    [~, sortedIdx] = sort(weights(:, j), 'descend');
    ranks(sortedIdx, j) = 1:numCriteria;
end
meanRanks = mean(ranks, 2);
meanWeights = mean(weights, 2);
normalizedWeights = meanWeights / sum(meanWeights);
W = 12 * sum(sum((ranks - meanRanks).^2)) / (numExperts^2 * (numCriteria^3 - numCriteria));
disp('Оценка согласованности мнений экспертов:');
disp('-----------------------------------------');
fprintf('Параметр                     | Оценка значимости      | Ранги                   | Средний коэффициент\n');
fprintf('                             | (коэффициенты)         |                         | веса\n');
disp('-----------------------------------------');
for i = 1:numCriteria
    fprintf('%-25s |', ['Критерий ' num2str(i)]);
    fprintf(' %4.2f %4.2f %4.2f %4.2f %4.2f |', weights(i, :));
    fprintf(' %3d %3d %3d %3d %3d |', ranks(i, :));
    fprintf(' %0.3f\n', normalizedWeights(i));
end

disp('-----------------------------------------');
disp(['Суммарный средний коэффициент веса: ', num2str(sum(normalizedWeights))]);

fprintf('Коэффициент конкордации (согласованности): %.3f\n', W);
