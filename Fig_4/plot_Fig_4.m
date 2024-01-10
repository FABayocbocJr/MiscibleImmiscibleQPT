clear all

load data_Nlat_1024_Nmodes_1023_mu1_10937.20_mu2_10937.20_T_0.00_Omega_21874.40_detuning_0.00_fine_1_500.mat

fs = 14;
lw = 2;

figure(444)
clf
h1 = errorbar(tQ(3:end),Nd(3:end),err_Nd(3:end),'o');
set(gca, 'XScale', 'log', 'YScale','log')
hold on
h2 = errorbar(tQ(21:61),Nd(21:61),err_Nd(21:61),'o');
plot(tQ,(1.886*(1.116./tQ).^(0.3306)),'Color','black','LineWidth',lw-0.5)
grid
h2.Color = h1.Color;
h2.MarkerFaceColor = h1.Color;
set(gca,'FontSize',fs,'FontName','Times','TickDir','out','LineWidth',lw-1,'TickLength',[0.01 0.02])
xlabel('$\tau_{Q}~[\textrm{ms}]$','Interpreter','latex')
ylabel('$N_{d}$','Interpreter','latex')
axis([1e-2 5e-1 2e0 1e1])
text(1.1e-2,6.5e0,sprintf('$$\\propto \\tau_{Q}^{-1/3} \\rightarrow$$'),'Interpreter','latex','Color','black','FontSize',fs)
xticklabels({'10', '100'})
yticks([2 4 6 8 10 20])

print('Fig_4.eps','-depsc')
