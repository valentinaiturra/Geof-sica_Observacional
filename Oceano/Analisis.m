function Analisis(filename,e)
%filename: es el archivo de la estacion
%d: direccion puede ser 'descenso' o 'ascenso'
%e: Numero de estacion

%Ejemplo:  Analisis('Estacion_01_Down.asc',1)

clc
close all



data = load(filename);

%%

%Se guardan las variables extraidas del archivo CTD
pres = data(:,3);
temp = data(:,4);
sal = data(:,11);
dens = data(:,14);
oxi = data(:,13);
%%

estacion = num2str(e);

% Se grafica las propiedades fisicas en subfigure
figure('Position', [100, 100, 800, 600])
subplot(2,2,1)
    plot(temp,pres,'Color','blue','LineWidth',1.5)
    set(gca, 'YDir', 'reverse');
    grid minor
    axis tight
    ylabel('Presión [dbar]')
    xlabel('Temperatura [°C]')
    title('Temperatura ITS-90')
subplot(2,2,2)
    plot(sal,pres,'Color','red','LineWidth',1.5)
    set(gca, 'YDir', 'reverse');
    grid minor
    axis tight
    ylabel('Presión [dbar]')
    xlabel('Salinidad [PSU]')
    title('Salinidad')
subplot(2,2,3)
    plot(dens,pres,'Color','magenta','LineWidth',1.5)
    set(gca, 'YDir', 'reverse');
    grid minor
    axis tight
    ylabel('Presión [dbar]')
    xlabel('Densidad [kg/m^3]')
    title('Sigma-t')
subplot(2,2,4)
    plot(oxi,pres,'Color','green','LineWidth',1.5)
    set(gca, 'YDir', 'reverse');
    grid minor
    axis tight
    ylabel('Presión [dbar]')
    xlabel('Oxígeno [μmol/L]')
    title('Oxígeno')
sgtitle(['Propiedades físicas en estación ', estacion])
    %%

% Se grafica las propiedades fisicas en un mismo plot

figure('Position', [500, 50, 400, 730])

    ax1 = gca;
    axPos = ax1.Position;
    ax1.Position = axPos + [0 0.35 0 -0.35];
        plot(ax1,temp,pres,'Color','blue','LineWidth',1.5)
        axis tight
        title(['Propiedades físicas en estación ', estacion])
    ax1.YDir = 'reverse';
    ax1.XLabel.String = 'Temperatura [°C]';
    ax1.XLabel.Color = 'blue';
    ax1.XColor = 'blue';
    ax1.YLabel.String = 'Presión [dbar]';
    ax1.Box = 'off';
    ax1.LineWidth = 2;



    ax2 = axes('position', (axPos .* [1 1 1 1e-3]) + [0 0.35 0 0.465], 'color', 'none', 'linewidth', 2);
        plot(ax2,sal,pres,'Color','red','LineWidth',1.5)
        axis tight
    ax2.Color = 'none';
        axis(ax2, 'off');
    ax2.YDir = 'reverse';
        ax5 = axes('position', (axPos .* [1 1 1 1e-3]) + [0 0.25 0 0], 'color', 'none','FontSize',9.5,'linewidth', 2);
        ax5.XLim = [min(sal) max(sal)];
        ax5.XLabel.String = 'Salinidad [PSU]';
        ax5.XLabel.Color = 'red';
        ax5.XColor = 'red';


    ax3 = axes('position', (axPos .* [1 1 1 1e-3]) + [0 0.35 0 0.465], 'color', 'none', 'linewidth', 2);
        plot(ax3,dens,pres,'Color','magenta','LineWidth',1.5)
        axis tight
    ax3.Color = 'none';
        axis(ax3, 'off');
    ax3.YDir = 'reverse';
        ax7 = axes('position', (axPos .* [1 1 1 1e-3]) + [0 0.05 0 0], 'color', 'none','FontSize',9.5,'linewidth', 2);
        ax7.XLim = [min(dens) max(dens)];
        ax7.XLabel.String = 'Densidad [kg/m^3]';
        ax7.XLabel.Color = 'magenta';
        ax7.XColor = 'magenta';


    ax4 = axes('position', (axPos .* [1 1 1 1e-3]) + [0 0.35 0 0.465], 'color', 'none', 'linewidth', 2);
        plot(ax4,oxi,pres,'Color','green','LineWidth',1.5)
        axis tight
    ax4.Color = 'none';
        axis(ax4, 'off');
    ax4.YDir = 'reverse';
        ax6 = axes('position', (axPos .* [1 1 1 1e-3]) + [0 0.15 0 0], 'color', 'none','FontSize',9.5,'linewidth', 2);
        ax6.XLim = [min(oxi) max(oxi)];
        ax6.XLabel.String = 'Oxígeno [μmol/L]';
        ax6.XLabel.Color = 'green';
        ax6.XColor = 'green';

end
