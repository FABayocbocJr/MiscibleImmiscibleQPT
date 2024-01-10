%%% Matlab file for plotting Fig. 1 %%%

load Fig_1_data.mat

fs = 14;
lw = 2;

figure(1)
clf
hold on
grid on
box on
axis([-0.5 0.5 -8.25 3.25 -0.1 0.1])

%%%%%%%%%%%%%%%%%%%%

% plot top Bloch sphere

[Xs, Yx, Zx] = sphere(25);
mySphere = surf(0.08*Xs, 1.15*Yx+2, 0.1*Zx);
shading interp
mySphere.FaceAlpha = 0.25

text(-0.115, 2, 0, '$\left| 1 \right>$', 'Interpreter', 'latex', ...
    'FontSize', 12, 'HorizontalAlignment', 'Center')
text(0.115, 2, 0, '$\left| 2 \right>$', 'Interpreter', 'latex', ...
    'FontSize', 12, 'HorizontalAlignment', 'Center')


% plot middle Bloch sphere

[Xs, Yx, Zx] = sphere(25);
mySphere = surf(0.08*Xs, 1.15*Yx-7, 0.1*Zx);
shading interp
mySphere.FaceAlpha = 0.25

text(-0.115, -7, 0, '$\left| 1 \right>$', 'Interpreter', 'latex', ...
    'FontSize', 12, 'HorizontalAlignment', 'Center')
text(0.115, -7, 0, '$\left| 2 \right>$', 'Interpreter', 'latex', ...
    'FontSize', 12, 'HorizontalAlignment', 'Center')


% plot bottom Bloch sphere

[Xs, Yx, Zx] = sphere(25);
mySphere = surf(0.08*Xs, 1.15*Yx-2, 0.1*Zx);
shading interp
mySphere.FaceAlpha = 0.25

text(-0.115, -2, 0, '$\left| 1 \right>$', 'Interpreter', 'latex', ...
    'FontSize', 12, 'HorizontalAlignment', 'Center')
text(0.115, -2, 0, '$\left| 2 \right>$', 'Interpreter', 'latex', ...
    'FontSize', 12, 'HorizontalAlignment', 'Center')


%%%%%%%%%%%%%%%%%%%%
% plot densities

%density at t=0
h1 = plot(x,(density1_a-density2_a)./(density1_a+density2_a),'Linewidth',lw-1);

%density at t=t_f
h2 = plot(x,(density1_b-density2_b)./(density1_b+density2_b) - 4.5,'Linewidth',lw-1);
view([0 90])

ax = gca;
% Define helper funcitons to normalize from axis coordinates to normalized position in figure.
xnorm = @(x)((x-ax.XLim(1))./(ax.XLim(2)-ax.XLim(1))).*ax.InnerPosition(3)+ax.InnerPosition(1)
ynorm = @(y)((y-ax.YLim(1))./(ax.YLim(2)-ax.YLim(1))).*ax.InnerPosition(4)+ax.InnerPosition(2)

xx1 = [xnorm(0.001) xnorm(0.001)];
yy1 = [ynorm(2.05) ynorm(3.05)];
annotation('textarrow',xx1,yy1,'FontSize',13,'Linewidth',2)

xx2 = [xnorm(0.001) xnorm(-0.069)];
yy2 = [ynorm(-1.81) ynorm(-1.81)];
annotation('textarrow',xx2,yy2,'FontSize',13,'Linewidth',2)

xx3 = [xnorm(.001) xnorm(0.071)];
yy3 = [ynorm(-6.6) ynorm(-6.6)];
annotation('textarrow',xx3,yy3,'FontSize',13,'Linewidth',2)


%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%

xx4 = [xnorm(-0.4) xnorm(-0.15)];
yy4 = [ynorm(-3.1) ynorm(-2.4)];
annotation('textarrow',xx4,yy4,'FontSize',13,'Linewidth',1,'Color','red')

xx5 = [xnorm(-0.225) xnorm(-0.1)];
yy5 = [ynorm(-3.1) ynorm(-2.4)];
annotation('textarrow',xx5,yy5,'FontSize',13,'Linewidth',1,'Color','red')

xx6 = [xnorm(0.125) xnorm(0.075)];
yy6 = [ynorm(-3.1) ynorm(-2.4)];
annotation('textarrow',xx6,yy6,'FontSize',13,'Linewidth',1,'Color','red')

%%%%%%%%

xx7 = [xnorm(-0.3) xnorm(-0.15)];
yy7 = [ynorm(-5.3) ynorm(-6.)];
annotation('textarrow',xx7,yy7,'FontSize',13,'Linewidth',1,'Color','red')

xx8 = [xnorm(-0.15) xnorm(-0.075)];
yy8 = [ynorm(-5.3) ynorm(-6.)];
annotation('textarrow',xx8,yy8,'FontSize',13,'Linewidth',1,'Color','red')

xx9 = [xnorm(0.25) xnorm(0.075)];
yy9 = [ynorm(-5.3) ynorm(-6.)];
annotation('textarrow',xx9,yy9,'FontSize',13,'Linewidth',1,'Color','red')

h2.Color = h1.Color;
set(gca,'FontSize',fs,'FontName','Times','TickDir','out','LineWidth',lw-1,'TickLength',[0.01 0.02])
plot([-0.5 0.5],[-0.75 -0.75],'Linewidth',lw-0.75,'Color','black')
yticks([-5.5 -4.5 -3.5 0])
yticklabels({'-1', '0', '1', '0'})
set(gca, 'XTickLabel', {'$-L/2$', '0', '$-L/2$'}, 'TickLabelInterpreter', 'latex');
xlabel('$x$','Interpreter','latex')
ylabel('$\frac{\rho_{1}(x)-\rho_{2}(x)}{\rho_{1}(x)+\rho_{2}(x)}$','Interpreter','latex')

print('Fig_1.eps','-depsc')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%