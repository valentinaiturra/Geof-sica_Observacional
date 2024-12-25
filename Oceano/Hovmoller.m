
clc
clear all
close all

%Datos de todas las estaciones
data_1 = load('Estacion_01_Down.asc');
data_17 = load('Estacion_17_Down.asc');
data_18 = load('Estacion_18_Down.asc');
data_19 = load('Estacion_19_Down.asc');
data_20 = load('Estacion_20_Down.asc');

%Ubicacion geografica estaciones
e1 = [-36.491222, -73.013222];
e17 = [-36.507778, -72.960944];
e18 = [-36.518917, -72.947500];
e19 = [-36.528583, -72.945472];
e20 = [-36.535056, -72.948778];

%Distancia entre cada estacion
dist(1) = distance(e1(1), e1(2), e17(1), e17(2))*111.2;
dist(2) = distance(e17(1), e17(2), e18(1), e18(2))*111.2;
dist(3) = distance(e18(1), e18(2), e19(1), e19(2))*111.2;
dist(4) = distance(e19(1), e19(2), e20(1), e20(2))*111.2;

distancia = [0, cumsum(dist)];

% a puede ser 4, 11, 13 o 14
m = [4,11,13,14]; 

%Se eligen estos cuatro pues son las columnas en que se encuentran las
%variables que se quieren graficar

for n = 1:length(m)
    a = m(n);

    %Se cargan las propiedades
propiedad(:,1) = data_1(:,a);
propiedad(1:22,2) = data_17(:,a);
propiedad(23:end,2) = data_17(end,a);
propiedad(1:16,3) = data_18(:,a);
propiedad(17:end,3) = data_18(end,a);
propiedad(1:12,4) = data_19(:,a);
propiedad(13:end,4) = data_19(end,a);
propiedad(1:6,5) = data_20(:,a);
propiedad(7:end,5) = data_20(end,a);

%Se cargan las profundidades maximas
depth = [data_1(end,3), data_17(end,3), data_18(end,3), data_19(end,3), data_20(end,3)];

num_puntos = 100; % Número de puntos deseado para interpolar
dist_uniforme = linspace(distancia(1), distancia(end), num_puntos);

profundidades = [data_1(end,3), data_17(end,3), data_18(end,3), data_19(end,3), data_20(end,3)];
prof_uniforme = linspace(profundidades(1), profundidades(end),num_puntos);

prof_int = interp1(distancia,depth,dist_uniforme,'linear');

for i = 1:44
   datos_interpolados(i,:) = interp1(distancia, propiedad(i,:), dist_uniforme, 'linear');
   X(i,:) = dist_uniforme; 
end


for i = 1:100
    Y(:,i) = data_1(:,3); 
end



for k = 1:100
    [~, idx] = min(abs(Y(:,k) - prof_int(k)));
    datos_interpolados(idx+1:end,k) = NaN;
end



%%
p =["Thermal","haline","oxy","dense"];
labe = ["Temperatura °C","Salinidad [PSU]","Oxígeno [μmol/kg]","Densidad [kg/m^3]"];
titu = ["Temperatura ITS-90", "Salinidad práctica", "Oxígeno", "Sigma-t"];


%Se generan las figuras en un subplot
figure(1)
set(gcf, 'Position', [100, 100, 1500, 600])
    subplot(2,2,n)
    s = pcolor(X,Y,datos_interpolados);
    hold on
    [C,h] = contour(X,Y,datos_interpolados,3,'w');
    clabel(C,h,'Color','white')
    colormap(gca,cmocean(char(p(n))))
    set(gca, 'YDir', 'reverse');
    s.LineStyle = 'none';
    colorbar
    xlabel('Distancia [km]')
    ylabel('Presión [db]')
    ylabel(colorbar,char(labe(n)))
    title(char(titu(n)))


%Se generan las figuras por separado
if a == 4
    figure('Position', [100, 100, 800, 200])
    s = pcolor(X,Y,datos_interpolados);
    hold on
    [C,h] = contour(X,Y,datos_interpolados,[10.4:0.4:11.8],'w');
    clabel(C,h,'Color','white')
    colormap(cmocean('Thermal'))
    set(gca, 'YDir', 'reverse');
    s.LineStyle = 'none';
    colorbar
    xlabel('Distancia [km]')
    ylabel('Presión [db]')
    ylabel(colorbar,'Temperatura °C')
    title('Temperatura ITS-90')
elseif a == 11
    figure('Position', [100, 100, 800, 200])
    s = pcolor(X,Y,datos_interpolados);
    hold on
    [C,h] = contour(X,Y,datos_interpolados,[34.45:0.05:34.55],'w');
    clabel(C,h,'Color','white')
    colormap(cmocean('haline'))
    set(gca, 'YDir', 'reverse');
    s.LineStyle = 'none';
    colorbar
    xlabel('Distancia [km]')
    ylabel('Presión [db]')
    ylabel(colorbar,'Salinidad [PSU]')
    title('Salinidad práctica')
elseif a == 13
    figure('Position', [100, 100, 800, 200])
    s = pcolor(X,Y,datos_interpolados);
    hold on
    [C,h] = contour(X,Y,datos_interpolados,[20:20:80],'k');
    clabel(C,h)
    colormap(cmocean('oxy'))
    set(gca, 'YDir', 'reverse');
    s.LineStyle = 'none';
    colorbar
    xlabel('Distancia [km]')
    ylabel('Presión [db]')
    ylabel(colorbar,'Oxígeno [μmol/kg]')
    title('Oxígeno')
elseif a == 14
    figure('Position', [100, 100, 800, 200])
    s = pcolor(X,Y,datos_interpolados);
    hold on
    [C,h] = contour(X,Y,datos_interpolados,[26.20:0.1:26.60],'w');
    clabel(C,h,'Color','w')
    colormap(cmocean('dense'))
    set(gca, 'YDir', 'reverse');
    s.LineStyle = 'none';
    colorbar
    xlabel('Distancia [km]')
    ylabel('Presión [db]')
    ylabel(colorbar,'Densidad [kg/m^3]')
    title('Sigma-t')
end
end
%%
