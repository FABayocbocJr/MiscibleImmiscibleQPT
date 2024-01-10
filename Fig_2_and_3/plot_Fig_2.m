
hbar = 1.05457148e-34;
M = 1.44316060e-25; %Rb87
L = 96e-6;% 3*RTF;
x0 = L;
t0 = M*L*L/hbar;
E0 = hbar*hbar/(M*L*L);

Nlat = 1024;
Nmodes = 1023;
mu1 = 10937.2;
mu2 = 10937.2;
Omega = 21874.40;
OmegaCr = 0.5*Omega;
tempbar = 0.0;

detun = [27.34 54.69 82.03 109.37 136.72 164.06 191.40 218.74 246.09 273.43];

fs = 14;
lw = 2;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% plot Fig. 2a %%%

tt = 126;

figure(333)
clf
hold on
for dd = 1:length(detun)
filename = sprintf('GPE_data_M_Nlat_1024_mu1_%.2f_mu2_%.2f_Omega_%.2f_detuning_%.2f.mat',mu1,mu2,Omega,detun(dd));
load(filename)
MM = squeeze((mean_rho1(:,tt) - mean_rho2(:,tt))./(mean_rho1(:,tt) + mean_rho2(:,tt)));
plot(tQ*detun(dd)/t0,MM*((detun(dd)/OmegaCr)^(-1/3)),'o-')
end
set(gca, 'XScale', 'log', 'YScale','log')
plot([0.01:0.01:2],0.85*[0.01:0.01:2].^(2/3),'Color','black','LineWidth',1)
fs = 14;
lw = 2;
set(gca,'FontSize',fs,'FontName','Times','TickDir','out','LineWidth',lw-1,'TickLength',[0.01 0.02])
xlabel('$b\tau_{Q}$','Interpreter','latex')
ylabel('$(b/\Omega_\mathrm{c})^{-1/\delta}M$','Interpreter','latex')
box on
grid on
axis([1e-2 1e1 3e-2 1.1e0])
text(7.2e-2,3.4e-1,sprintf('$$\\sim x^{2/3} \\rightarrow$$'),'Interpreter','latex','Color','black','FontSize',fs)
legend('$\hbar b = 0.0025\times \mu_{0}$','$\hbar b = 0.005\times \mu_{0}$','$\hbar b = 0.0075\times \mu_{0}$','$\hbar b = 0.01\times \mu_{0}$','$\hbar b = 0.0125\times \mu_{0}$','$\hbar b = 0.015\times \mu_{0}$','$\hbar b = 0.0175\times \mu_{0}$','$\hbar b = 0.02\times \mu_{0}$','$\hbar b = 0.0225\times \mu_{0}$','$\hbar b = 0.025\times \mu_{0}$','Interpreter','latex','location','southeast','fontsize',fs-2)

print('Fig_2a.eps','-depsc')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%% plot Fig. 2b %%%
figure(123)
clf
hold on
box on
grid on

tt = 101;
for ii = 1:length(detun)
fileName = sprintf('data_M_Nlat_%d_Nmodes_%d_mu1_%.2f_mu2_%.2f_T_%.2f_Omega_%.2f_detuning_%.2f_fine_1_500_b_c.mat',Nlat, Nmodes, mu1, mu2, tempbar, Omega, detun(ii));
load(fileName)
MM = squeeze((mean_rho1(:,tt) - mean_rho2(:,tt))./(mean_rho1(:,tt) + mean_rho2(:,tt)));
err_MM = MM.*sqrt( (sqrt(err_rho1(:,tt).^2 + err_rho2(:,tt).^2)./(mean_rho1(:,tt) - mean_rho2(:,tt))).^2 + (sqrt(err_rho1(:,tt).^2 + err_rho2(:,tt).^2)./(mean_rho1(:,tt) + mean_rho2(:,tt))).^2 );
errorbar(tQ(3:end)*(detun(ii)/t0),MM(3:end)*((detun(ii)/t0)^(-1/3))*((OmegaCr/t0)^(1/3)),1.96*err_MM(3:end)*((detun(ii)/t0)^(-1/3))*((OmegaCr/t0)^(1/3)),'o-')
end

set(gca, 'XScale', 'log', 'YScale','log')
set(gca,'FontSize',fs,'FontName','Times','TickDir','out','LineWidth',lw-1,'TickLength',[0.01 0.02])
xlabel('$b\tau_{Q}$','Interpreter','latex')
ylabel('$(b/\Omega_\mathrm{c})^{-1/\delta}M$','Interpreter','latex')
plot([0.01:0.01:2],0.85*[0.01:0.01:2].^(2/3),'Color','black','LineWidth',1)
text(7.2e-2,3.4e-1,sprintf('$$\\sim x^{2/3} \\rightarrow$$'),'Interpreter','latex','Color','black','FontSize',fs)
axis([1e-2 1e1 3e-2 1.1e0])

print('Fig_2b.eps','-depsc')


