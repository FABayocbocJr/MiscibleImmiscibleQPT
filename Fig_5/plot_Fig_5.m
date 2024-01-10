clear all

Nlat = 1024;
Nmodes = 1023;
g11 = 1.09372;
g22 = 1.09372;
g12 = 2.18744;

mu1 = 10937.20;
mu2 = 10937.20;

rho01 = mu1/g11;
rho02 = mu2/g22;

xi0 = (1/sqrt(2*rho01*(2*g12 - g11 - g22)/2))/sqrt(2);
tau0 = 1/(2*rho01*(2*g12 - g11 - g22)/2);
Delta = (g11*g22)/(g12*g12);
OmegaCr = g11*(rho01)*(1/sqrt(Delta)- 1);
Omega = 2*OmegaCr;
tempbar = 0.0;

hbar = 1.05457148e-34;
M = 1.44316060e-25; %Rb87
L = 96e-6;
x0 = L;
t0 = M*L*L/hbar;

detun = [27.34 54.69 82.03 109.37 136.72 164.06 191.40 218.74 246.09 273.43];% omega_perp=2pi500Hz

%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% plot Fig 5a

figure(111)
clf
hold on
box on
grid on

fs = 14;
lw = 2;

xmin = 2e-2;
xmax = 4e0;
ymin = 7e-5;
ymax = 3e0;

ee = 1;

plot([xmin xmax],[1 1],'--','Color','black','LineWidth',lw)
for i = 1:length(detun)
    fileName = sprintf('data_Nlat_%d_Nmodes_%d_mu1_%.2f_mu2_%.2f_T_%.2f_Omega_%.2f_detuning_%.2f_fine_1_500.mat',Nlat, Nmodes, mu1, mu2, tempbar, Omega, detun(i));
    load(fileName)
    
    errorbar(tQ(3:end)*((detun(i)/t0)^ee)/((OmegaCr/t0)^(ee-1)),Nd(3:end)./(1.886*(1.116./tQ(3:end)).^(0.3306)),1.96*(err_Nd(3:end)./(1.886*(1.116./tQ(3:end)).^(0.3306))),'o')
end

set(gca, 'XScale', 'log', 'YScale','log')
set(gca,'FontSize',fs,'FontName','Times','TickDir','out','LineWidth',lw-1,'TickLength',[0.01 0.02])
ylabel('$\hat{\xi}N_{d}$','Interpreter','latex','FontSize',fs)
xlabel('$b\tau_{Q}$','Interpreter','latex','FontSize',fs)
legend('$\hat{\xi}N_{d} = \hat{\xi}N_{d}(b=0)$','$\hbar b = 0.0025\times \mu_{0}$','$\hbar b = 0.005\times \mu_{0}$','$\hbar b = 0.0075\times \mu_{0}$','$\hbar b = 0.01\times \mu_{0}$','$\hbar b = 0.0125\times \mu_{0}$','$\hbar b = 0.015\times \mu_{0}$','$\hbar b = 0.0175\times \mu_{0}$','$\hbar b = 0.02\times \mu_{0}$','$\hbar b = 0.0225\times \mu_{0}$','$\hbar b = 0.025\times \mu_{0}$','Interpreter','latex','location','southwest','fontsize',fs-2)
axis([xmin xmax ymin ymax])

print('Fig_5a.eps','-depsc')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% plot Fig 5b

figure(222)
clf
hold on
box on
grid on

xmin = 1e-3;
xmax = 4e-1;
ymin = 7e-5;
ymax = 3e0;

ee = 3/2;

plot([xmin xmax],[1 1],'--','Color','black','LineWidth',lw)
for i = 1:length(detun)
    fileName = sprintf('data_Nlat_%d_Nmodes_%d_mu1_%.2f_mu2_%.2f_T_%.2f_Omega_%.2f_detuning_%.2f_fine_1_500.mat',Nlat, Nmodes, mu1, mu2, tempbar, Omega, detun(i));
    load(fileName)
    
    errorbar(tQ(3:end)*((detun(i)/t0)^ee)/((OmegaCr/t0)^(ee-1)),Nd(3:end)./(1.886*(1.116./tQ(3:end)).^(0.3306)),1.96*(err_Nd(3:end)./(1.886*(1.116./tQ(3:end)).^(0.3306))),'o')
end

set(gca, 'XScale', 'log', 'YScale','log')
set(gca,'FontSize',fs,'FontName','Times','TickDir','out','LineWidth',lw-1,'TickLength',[0.01 0.02])
ylabel('$\hat{\xi}N_{d}$','Interpreter','latex','FontSize',fs)
xlabel('$b^{3/2}\tau_{Q}/\Omega_\mathrm{c}^{1/2}$','Interpreter','latex','FontSize',fs)
legend('$\hat{\xi}N_{d} = \hat{\xi}N_{d}(b=0)$','$\hbar b = 0.0025\times \mu_{0}$','$\hbar b = 0.005\times \mu_{0}$','$\hbar b = 0.0075\times \mu_{0}$','$\hbar b = 0.01\times \mu_{0}$','$\hbar b = 0.0125\times \mu_{0}$','$\hbar b = 0.015\times \mu_{0}$','$\hbar b = 0.0175\times \mu_{0}$','$\hbar b = 0.02\times \mu_{0}$','$\hbar b = 0.0225\times \mu_{0}$','$\hbar b = 0.025\times \mu_{0}$','Interpreter','latex','location','southwest','fontsize',fs-2)
axis([xmin xmax ymin ymax])

print('Fig_5b.eps','-depsc')
