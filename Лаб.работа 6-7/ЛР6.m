% Данные из таблицы
power = [180, 176, 176, 181, 177, 180];
torque = [67, 70, 68, 67, 66, 66];
mass = [850, 1000, 860, 860, 820, 800];
fprintf('Начальные данные:\n');
fprintf('Вариант\tМощность\tКрутящий момент\tМасса\n');
for i = 1:length(power)
    fprintf('%d\t\t%d\t\t%d\t\t\t%d\n', i, power(i), torque(i), mass(i));
end
% Нормализация данных
max_power = max(power);
max_torque = max(torque);
min_mass = min(mass);
normalized_power = power / max_power;
normalized_torque = torque / max_torque;
normalized_mass = min_mass ./ mass; % маскируем, чтобы меньше было лучше

% Вывод нормализованных данных
fprintf('\nНормализованные данные:\n');
fprintf('Вариант\tМощность\tКрутящий момент\tМасса\n');
for i = 1:length(power)
    fprintf('%d\t\t%.2f\t\t%.2f\t\t\t%.2f\n', i, normalized_power(i), normalized_torque(i), normalized_mass(i));
end

% Весовые коэффициенты для оценки (при необходимости можно изменить)
w_power = 0.4;
w_torque = 0.3;
w_mass = 0.3;

% Расчет итогового показателя для каждого двигателя
score = w_power * normalized_power + w_torque * normalized_torque + w_mass * normalized_mass;

% Вывод итогового показателя
fprintf('\nИтоговый показатель для каждого двигателя:\n');
fprintf('Вариант\tИтоговый показатель\n');
for i = 1:length(score)
    fprintf('%d\t\t%.2f\n', i, score(i));
end

% Определение оптимального двигателя
[~, optimal_engine] = max(score);

fprintf('\nОптимальный вариант двигателя: %d\n', optimal_engine);
