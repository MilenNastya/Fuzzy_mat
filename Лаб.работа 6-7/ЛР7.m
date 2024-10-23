% Метод анализа иерархий для выбора телефона

% Критерии оценки:
criteria = {'Цена', 'Производительность', 'Камера', 'Батарея', 'Память', 'Дизайн'};

% Варианты телефонов:
phones = {'iPhone 12 ', 'iPhone 12 Pro Max', 'iPhone 13', 'iPhone 13 Pro Max', 'iPhone 14', 'iPhone 14 Pro Max'};

% Матрица попарных сравнений для критериев
% Пример: Цена важнее производительности, производительность важнее камеры и т.д.
criteriaMatrix =  [1    1/3  1/5  1/7  1/9  1/9;
                      3    1    3    5    7    9;
                      5    1/3  1    3    5    7;
                      7    1/5  1/3  1    3    5;
                      9    1/7  1/5  1/3  1    3;
                      9    1/9  1/7  1/5  1/3  1];
   


% Нормализация матрицы критериев
nCriteriaMatrix = criteriaMatrix ./ sum(criteriaMatrix);

% Рассчет весов критериев
criteriaWeights = mean(nCriteriaMatrix, 2);

% Печать весов критериев
disp('Веса критериев:');
for i = 1:length(criteria)
    fprintf('%s: %.4f\n', criteria{i}, criteriaWeights(i));
end

% Матрицы попарных сравнений для вариантов по каждому критерию
% Пример для критерия "Цена"
priceMatrix = [1 2 3 5 7 9;
               1/2 1 2 3 5 7;
               1/3 1/2 1 2 3 5;
               1/5 1/3 1/2 1 2 3;
               1/7 1/5 1/3 1/2 1 2;
               1/9 1/7 1/5 1/3 1/2 1];
           
% Аналогично заполняются матрицы для других критериев
% Матрица для производительности
 performanceMatrix = [1    1/2  2  3  4  6;
                        2    1    3  4  5  7;
                        1/2  1/3  1  2  3  4;
                        1/3  1/4  1/2 1  2  3;
                        1/4  1/5  1/3 1/2 1  2;
                        1/6  1/7  1/4 1/3 1/2 1];
   
  % Матрица для камеры
   cameraMatrix = [1   3   4  6  7  8;
                   1/3 1   2  3  4  5;
                   1/4 1/2 1  2  3  4;
                   1/6 1/3 1/2 1  2  3;
                   1/7 1/4 1/3 1/2 1  2;
                   1/8 1/5 1/4 1/3 1/2 1];
   
 % Матрица для батареи
   batteryMatrix = [1   2   3   5   6   8;
                    1/2 1   2   3   4   6;
                    1/3 1/2 1   2   3   4;
                    1/5 1/3 1/2 1   2   3;
                    1/6 1/4 1/3 1/2 1   2;
                    1/8 1/6 1/4 1/3 1/2 1];
   
% Матрица для памяти
       memoryMatrix = [1   2   4   5   7   8;
                   1/2 1   3   4   6   7;
                   1/4 1/3 1   2   3   5;
                   1/5 1/4 1/2 1   2   4;
                   1/7 1/6 1/3 1/2 1   3;
                   1/8 1/7 1/5 1/4 1/3 1];
   

 % Матрица для дизайна
    designMatrix = [1   1/2 2  4  5  6;
                   2   1   3  5  6  7;
                   1/2 1/3 1  2  3  4;
                   1/4 1/5 1/2 1  2  3;
                   1/5 1/6 1/3 1/2 1  2;
                   1/6 1/7 1/4 1/3 1/2 1];
   

% Рассчет весов критериев
criteriaWeights = mean(nCriteriaMatrix, 2);

% Рассчет весов для каждого критерия
priceWeights = mean(priceMatrix ./ sum(priceMatrix), 2);
performanceWeights = mean(performanceMatrix ./ sum(performanceMatrix), 2);
cameraWeights = mean(cameraMatrix ./ sum(cameraMatrix), 2);
batteryWeights = mean(batteryMatrix ./ sum(batteryMatrix), 2);
memoryWeights = mean(memoryMatrix ./ sum(memoryMatrix), 2);
designWeights = mean(designMatrix ./ sum(designMatrix), 2);

% Окончательная оценка телефонов
finalScores = [priceWeights performanceWeights cameraWeights batteryWeights memoryWeights designWeights] * criteriaWeights;

% Вывод результатов
disp('Итоговые оценки для каждого телефона:');
for i = 1:length(phones)
    fprintf('%s: %.4f\n', phones{i}, finalScores(i));
end

% Нахождение лучшего телефона
[~, bestPhoneIdx] = max(finalScores);
fprintf('Наилучший выбор: %s\n', phones{bestPhoneIdx});

