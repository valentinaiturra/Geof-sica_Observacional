function Analisis(filename,d,e)
%filename: es el archivo de la estacion
%d: direccion puede ser 'descenso' o 'ascenso'
%e: Numero de estacion

%Ejemplo:  Analisis('Estacion_01_Down.asc','descenso',1)

data = load(filename);
%%
pres = data(:,3);
temp = data(:,4);
sal = data(:,11);
dens = data(:,14);
oxi = data(:,13);

temp_norm = normalize(temp);
sal_norm = normalize(sal);
dens_norm = normalize(dens);
oxi_norm = normalize(oxi);

%%

direccion = d;
estacion = num2str(e);


figure()
subplot(2,2,1)
    plot(temp,pres,'Color','blue','LineWidth',1.5)
    set(gca, 'YDir', 'reverse');
    grid minor
    ylabel('Presión [dbar]')
    xlabel('Temperatura [°C]')
    title('Temperatura ITS-90')
subplot(2,2,2)
    plot(sal,pres,'Color','red','LineWidth',1.5)
    set(gca, 'YDir', 'reverse');
    grid minor
    ylabel('Presión [dbar]')
    xlabel('Salinidad [PSU]')
    title('Salinidad')
subplot(2,2,3)
    plot(dens,pres,'Color','yellow','LineWidth',1.5)
    set(gca, 'YDir', 'reverse');
    grid minor
    ylabel('Presión [dbar]')
    xlabel('Densidad [kg/m^3]')
    title('Sigma-t')
subplot(2,2,4)
    plot(oxi,pres,'Color','green','LineWidth',1.5)
    set(gca, 'YDir', 'reverse');
    grid minor
    ylabel('Presión [dbar]')
    xlabel('Oxígeno [μmol/kg]')
    title('Oxígeno')
sgtitle(['Propiedades físicas de ', direccion, ' en estación ', estacion])
    %%

figure()
plot(temp_norm,pres,'Color','blue','LineWidth',1.5)
hold on
plot(sal_norm,pres,'Color','red','LineWidth',1.5)
plot(dens_norm,pres,'Color','yellow','LineWidth',1.5)
plot(oxi_norm,pres,'Color','green','LineWidth',1.5)
set(gca, 'YDir', 'reverse');
grid minor
legend('Temperatura [°C]', 'Salinidad [PSU]', 'Densidad [kg/m^3]', 'Oxígeno [μmol/kg]','Location','best')
ylabel('Presión [dbar]')
xlabel('Valores noramlizados')
title(['Propiedades físicas normalizadas para la estación ', estacion, ' en ', direccion])
end

%%
% 
% e1 = [-36.491222, -73.013222];
% e17 = [-36.507778, -72.960944];
% e18 = [-36.518917, -72.947500];
% e19 = [-36.528583, -72.945472];
% e20 = [-36.535056, -72.948778];