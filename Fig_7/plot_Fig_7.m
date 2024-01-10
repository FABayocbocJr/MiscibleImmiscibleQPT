


hbar = 1.05457148e-34;
M = 1.44316060e-25; %Rb87
L = 96e-6;
x0 = L;
t0 = M*L*L/hbar;
E0 = hbar*hbar/(M*L*L);

fs = 14;
lw = 2;

load Fig_7_data.mat

% plot Fig 7a

figure(111)
clf
ll = 3;
imagesc(t*t0,x*x0,transpose((density1_a(:,:)-density2_a(:,:))./(density1_a(:,:)+density2_a(:,:))))
set(gca,'YDir','normal')
set(gca,'FontSize',fs,'FontName','Times','TickDir','out','LineWidth',lw-1,'TickLength',[0.01 0.02])
xlabel('$t~[\textrm{ms}]$','Interpreter','latex')
ylabel('$x~[\mu\textrm{m}]$','Interpreter','latex')
xticklabels({'0', '50', '100', '150'})
yticklabels({'40', '30', '-20', '-10', '0', '10', '20', '30', '40'})
colorbar
hold on
plot([t(101) t(101)]*t0,[x(1) x(end)]*x0,'--r','LineWidth',lw)
plot([t(201) t(201)]*t0,[x(1) x(end)]*x0,'-g','LineWidth',lw)

print('Fig_7a.eps','-depsc')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% plot Fig 7b

figure(222)
clf
tt = 126;
t(tt)*t0*1000
plot(x*x0,(density1_b-density2_b)./(density1_b+density2_b),'LineWidth',lw-1)
hold on
tt = 241;
t(tt)*t0*1000
plot(x*x0,(density1_c-density2_c)./(density1_c+density2_c),'LineWidth',lw-1)
ylabel('$M$','Interpreter','latex')
set(gca,'FontSize',fs,'FontName','Times','TickDir','out','LineWidth',lw-1,'TickLength',[0.01 0.02])
grid on
axis([-Inf Inf -1 1])
xlabel('$x~[\mu\textrm{m}]$','Interpreter','latex')
xticklabels({'40', '-20', '0', '20', '40'})
legend('$t=94.59~\mathrm{ms}$','$t=181.61~\mathrm{ms}$','Interpreter','latex','location','southeast','fontsize',fs-2)

print('Fig_7b.eps','-depsc')


