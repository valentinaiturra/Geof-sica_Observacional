function ascdesc(filename_d,filename_u,e)
%Funcion para generar graficos de ascenso y descenso
%Ejemplo: ascdesc('Estacion_18_Down.asc','Estacion_18_Up.asc',18)

Estacion_down= load(filename_d);
Estacion_up = load(filename_u);

estacion = num2str(e);

pres_d = Estacion_down(:,2);
temp_d = Estacion_down(:,4);
sal_d = Estacion_down(:,11);
dens_d = Estacion_down(:,14);
oxi_d = Estacion_down(:,13);

pres_u = Estacion_up(:,2);
temp_u = Estacion_up(:,4);
sal_u = Estacion_up(:,11);
dens_u = Estacion_up(:,14);
oxi_u = Estacion_up(:,13);

%%
figure()
subplot(1,4,1)
    plot(temp_d,pres_d,'LineWidth',1.5)
    hold on
    plot(temp_u,pres_u,'LineWidth',1.5)
    set(gca, 'YDir', 'reverse');
    grid minor
    xlabel('Temperatura [°C]')
    ylabel('Presión [dbar]')
    title('Temperatura ITS-90')
    legend('Descenso','Ascenso','Location','best')
subplot(1,4,2)
    plot(sal_d,pres_d,'LineWidth',1.5)
    hold on
    plot(sal_u,pres_u,'LineWidth',1.5)
    set(gca, 'YDir', 'reverse');
    grid minor
    ylabel('Presión [dbar]')
    xlabel('Salinidad [PSU]')
    title('Salinidad')
    legend('Descenso','Ascenso','Location','best')
subplot(1,4,3)
    plot(dens_d,pres_d,'LineWidth',1.5)
    hold on
    plot(dens_u,pres_u,'LineWidth',1.5)
    set(gca, 'YDir', 'reverse');
    grid minor
    ylabel('Presión [dbar]')
    xlabel('Densidad [kg/m^3]')
    title('Sigma-t')
    legend('Descenso','Ascenso','Location','best')
subplot(1,4,4)
    plot(oxi_d,pres_d,'LineWidth',1.5)
    hold on
    plot(oxi_u,pres_u,'LineWidth',1.5)
    set(gca, 'YDir', 'reverse');
    grid minor
    ylabel('Presión [dbar]')
    xlabel('Oxígeno [μmol/kg]')
    title('Oxígeno')
    legend('Descenso','Ascenso','Location','best')
sgtitle(['Propiedades físicas de estación ', estacion])
