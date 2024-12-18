
clc
clear all

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
a = 13;
propiedad(:,1) = data_1(:,a);
propiedad(1:22,2) = data_17(:,a);
propiedad(23:end,2) = data_17(end,a);
propiedad(1:16,3) = data_18(:,a);
propiedad(17:end,3) = data_18(end,a);
propiedad(1:12,4) = data_19(:,a);
propiedad(13:end,4) = data_19(end,a);
propiedad(1:6,5) = data_20(:,a);
propiedad(7:end,5) = data_20(end,a);

%%
% idx = find(propiedad == 0);
% propiedad(idx) = NaN;
%%
num_puntos = 100; % Número de puntos deseado (ajústalo según necesidades)
dist_uniforme = linspace(distancia(1), distancia(end), num_puntos);

for i = 1:44
   datos_interpolados(i,:) = interp1(distancia, propiedad(i,:), dist_uniforme, 'linear');
   X(i,:) = dist_uniforme; 
end

for i = 1:100
    Y(:,i) = data_1(:,3); 
end


%%

if a == 4
    figure()
    s = pcolor(X,Y,datos_interpolados);
    hold on
    [C,h] = contour(X,Y,datos_interpolados,'k');
    clabel(C,h)
    colormap('jet')
    set(gca, 'YDir', 'reverse');
    s.LineStyle = 'none';
    colorbar
    xlabel('Distancia [km]')
    ylabel('Presión [db]')
    ylabel(colorbar,'Temperatura °C')
    title('Temperatura ITS-90')
elseif a == 11
    figure()
    s = pcolor(X,Y,datos_interpolados);
    hold on
    [C,h] = contour(X,Y,datos_interpolados,'k');
    clabel(C,h)
    colormap('jet')
    set(gca, 'YDir', 'reverse');
    s.LineStyle = 'none';
    colorbar
    xlabel('Distancia [km]')
    ylabel('Presión [db]')
    ylabel(colorbar,'Salinidad [PSU]')
    title('Salinidad práctica')
elseif a == 13
    figure()
    s = pcolor(X,Y,datos_interpolados);
    hold on
    [C,h] = contour(X,Y,datos_interpolados,'k');
    clabel(C,h)
    colormap('jet')
    set(gca, 'YDir', 'reverse');
    s.LineStyle = 'none';
    colorbar
    xlabel('Distancia [km]')
    ylabel('Presión [db]')
    ylabel(colorbar,'Oxígeno [μmol/kg]')
    title('Oxígeno')
elseif a == 14
    figure()
    s = pcolor(X,Y,datos_interpolados);
    hold on
    [C,h] = contour(X,Y,datos_interpolados,'k');
    clabel(C,h)
    colormap('jet')
    set(gca, 'YDir', 'reverse');
    s.LineStyle = 'none';
    colorbar
    xlabel('Distancia [km]')
    ylabel('Presión [db]')
    ylabel(colorbar,'Densidad [kg/m^3]')
    title('Sigma-t')
end