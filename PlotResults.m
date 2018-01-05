% Sajad Saeedi, 2009
% Run this script to plot the results of the SIMULINK simulation
% sajad.saeedi.g@gmail.com
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% plot error convergence
Lm=2;    % starting slope
Lp=20;   % final slope

index1 = 4;
index2 = 4;
Xmin = (-8e-5)*index1;
Xmax =  (8e-5)*index1;
Ymin = (-2e-3)*index2;
Ymax =  (2.5e-3)*index2;
Step = 1/100000000;
L1 = Xmin:Step:Xmax;
zz=Ymin:(100*Step):Ymax;

figure('name', 'error convergence')
plot(0,zz, 'r-');    % To draw X axes
hold on;
plot (L1, 0, 'r-');  % To draw Y axes
hold on;
slope = (L.signals.values);
plot (L1, -Lp*L1,'k-.');  % To draw final sliding surface
hold on;
slope = (L.signals.values);
plot (L1, -Lm*L1,'k-.');  % To draw initial sliding surface
hold on;
y = (e.signals.values)';
plot(y, ed.signals.values);
axis([Xmin, Xmax, Ymin, Ymax]);
title('System behavior');

%% plot surface slope

y1 = (e.signals.values)';
y2 = (ed.signals.values)';
s1 = y1*y1'
s2 = y2*y2'
s  = s1 + s2

% To draw (Landa) Sliding Surface Value
figure('name', 'surface slope')
% a=(Lm+1)/(Lm-1); %direclty drawing using Landa function
% T=(1/2)*(log(a*(Lp-1)/(Lp+1)));
% 
% t=0:1/1000:T;
% Ln=((3+exp(2*t))./(3-exp(2*t)));
% plot(t,Ln)
time = 0:1/1000:2;
plot(time, L.signals.values);
title('Sliding surface slope');
xlabel('time');
axis([0,2,1,22]);

i = 1;
Ns = 0;
while round(L.signals.values(i)) ~= 20
    Ny1 = (e.signals.values(i));
    Ny2 = (ed.signals.values(i));
    Ns1 = Ny1*Ny1;
    Ns2 = Ny2*Ny2;
    Ns  = Ns1 + Ns2 + Ns;
    i = i+1;
end

%% Reaching time
% If you want to calculate the reaching time, uncomment and run this part
% syms x;
% T=0.1;
% Lm = 2;
% Lp = 20;
% S = x*((Lm+(x^2-1)^(1/2)+x) + (Lm+(x^2-1)^(1/2)-x)*exp(T/(2*x)))/((Lm+(x^2-1)^(1/2)+x) - (Lm+(x^2-1)^(1/2)-x)*exp(T/(2*x)))-(x^2-1)^(1/2)-Lp;
% pretty(S)
% solve(S)
