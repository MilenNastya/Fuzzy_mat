%x = (2 : 0.1 : 10);
%y = gaussmf(x, [1 6]);
%plot(x, y)
%x1=(0 : 0.1 :10);
%x2=(0 : 0.1 : 10);
%[X,Y]=meshgrid(x1,x2);
%Z= min(trimf(X,[7 10 13]),trimf(Y,[7 10 13]));
%plot3(X,Y,Z)

x = (0 : 0.1 : 10);
mf1 = trimf(x, [7 10 13]);
mf2 = trimf(x, [7 10 13]);
Z = max(0.5 *mf1, 0.5*mf2);
figure('Tag','defuzz');
plot(x, Z, 'LineWidth', 1)
h_gca = gca;
h_gca.YTick = [0 .45 1];
ylim([-1 1]);
grid minor;

x3 = defuzz(x, Z, 'mom');
h2.Color = gray;
t2.Color = gray;
h3 = line([x3 x3], [0.2 0.6], 'Color', 'k');
t3 = text(x3, 0.2, 'mom', 'FontWeight','bold');
fprintf("Результат дефаззификации: ");
disp(x3);