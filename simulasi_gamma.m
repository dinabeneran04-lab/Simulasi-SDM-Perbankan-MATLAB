function plot_figure1()
% Parameter dari Tabel 1
params.k = 0.25;
params.beta = 0.15;
params.gamma = [1.5e-4 ,1.5e-5 ,1.4e-4];
params.delta = 0.01;
params.tau = 0.15;
params.xi = 0.05;
params.psi = 0.05;
params.phi = 0.01;
% Kondisi awal
F0 = 3389;
E0 = 4756;
V0 = 970;
% Waktu simulasi (5 tahun)
tspan = [0 5];
% Warna untuk plot
colors = ['r', 'g', 'b'];
labels = {'gamma = 1.5e-4', 'gamma = 1.5e-5', 'gamma = 1.6813e-5'};
figure;
% Subplot 1: Fresher Employees
subplot(2,2,1);
hold on;
for i = 1:3
[t,y] = ode45(@(t,y) hr_model(t,y,params.gamma(i), params), tspan, [F0; E0; V0]);
plot(t, y(:,1), colors(i), 'LineWidth', 2);
end
title('(a) Fresher Employees');
xlabel('Time (year)');
ylabel('Fresher employees');
legend(labels);
grid on;
% Subplot 2: Expert Employees
subplot(2,2,2);
hold on;
for i = 1:3
[t,y] = ode45(@(t,y) hr_model(t,y,params.gamma(i), params), tspan, [F0; E0; V0]);
plot(t, y(:,2), colors(i), 'LineWidth', 2);
end
title('(b) Expert Employees');
xlabel('Time (year)');
ylabel('Expert employees');
grid on;
% Subplot 3: Vacancies
subplot(2,2,3);
hold on;
for i = 1:3
[t,y] = ode45(@(t,y) hr_model(t,y,params.gamma(i), params), tspan, [F0; E0; V0]);
plot(t, y(:,3), colors(i), 'LineWidth', 2);
end
title('(c) Vacancies');
xlabel('Time (year)');
ylabel('Vacancies');
grid on;
% Subplot 4: Total Employees
subplot(2,2,4);
hold on;
for i = 1:3
[t,y] = ode45(@(t,y) hr_model(t,y,params.gamma(i), params), tspan, [F0; E0; V0]);
plot(t, y(:,1) + y(:,2), colors(i), 'LineWidth', 2);
end
title('(d) Total Employees of the Bank');
xlabel('Time (year)');
ylabel('Total employees');
grid on;
end
function dydt = hr_model(~, y, gamma, params)
% Parameter tetap
beta = params.beta;
k = params.k;
delta = params.delta;
tau = params.tau;
xi = params.xi;
psi = params.psi;
phi = params.phi;
F = y(1);
E = y(2);
V = y(3);
dFdt = k * V - beta * F - gamma * F * E - delta * F - tau * F;
dEdt = -xi * V + gamma * F * E - psi * E - delta * E + tau * F;
dVdt = -phi * E + gamma * F * E - k * V + beta * F + delta * F + psi * E + delta * E + xi * V;
dydt = [dFdt; dEdt; dVdt];
end
