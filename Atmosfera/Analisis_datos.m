clc
clear all

dat_day_1 = load("dia2_18_oct_2024.txt");
dat_day_2 = load("dia3_19_oct_2024.txt");

datos = [dat_day_1; dat_day_2];
datos = datos(:,4:12);

dat_day_1_table = readtable("dia2_18_oct_2024.txt");
fecha_day_1 = table2array(dat_day_1_table(:,1));

dat_day_2_table = readtable("dia3_19_oct_2024.txt");
fecha_day_2 = table2array(dat_day_2_table(:,1));

fecha = [fecha_day_1; fecha_day_2];

clear dat_day_1 dat_day_2 dat_day_1_table dat_day_2_table fecha_day_1 fecha_day_2

%%

% "WS_ms","WindDir","SlrkW","SlrkJ_Tot","AirTC","RH","NetSW","NetLW","NetRad"
% "meters/second","degrees","kW/m^2","kJ/m^2","Deg C","%","W/m^2","W/m^2","W/m^2"

fecha_vec = datevec(fecha);

for i = 1:24
    day_18(:,i) = find(fecha_vec(:,3) == 18 & fecha_vec(:,4) == i-1);
    cd_fecha(:,i) = fecha(day_18(:,i));
    cd_datos(:,i) = datos(day_18(:,i),2);
    cd_datos_velo(:,i) = datos(day_18(:,i),1);
end

degree = [0:20:360];



%find(A < 180 & A > 160)

%porcentaje(12,1) = 2
%count = 0;
for k = 1:24
    for j = 1:19
        B = find(cd_datos(:,k) < degree(j) & cd_datos(:,k) > degree(j)-20);
        porcentaje(20-j,k) = length(B)/12;
        clear B
    end
end

X = [0:23];
for i = 2:19
    X(i,:) = X(1,:);
end

degree = degree';

for i = 2:24
    degree(:,i) = degree(:,1);
end

figure()
pcolor(X, degree, porcentaje)
colorbar
xlabel('Hora')
ylabel('Dirección del viento [degree]')
title('Frecuencia de la dirección del viento para el día 18 de Octubre de 2024')

%%
cd_datos_direc = cd_datos;
for j = 1: 24
    for i = 1:12
        U(i,j) = cd_datos_velo(i,j)*3.6 * cos(deg2rad(cd_datos_direc(i,j)));
        V(i,j) = cd_datos_velo(i,j)*3.6 * sin(deg2rad(cd_datos_direc(i,j)));
    end
end
quiver(X,degree, U,V,1,'Color','r','LineWidth',2)

% figure()
% pcolor(X, degree, porcentaje)
% colorbar
% hold on
% 
% quiver(X(1,3),degree(3,1), U,V,0.25,'Color','r','LineWidth',2)
% xlabel('Hora')
% ylabel('Dirección del viento [degree]')
% title('Frecuencia de la dirección del viento para el día 18 de Octubre de 2024')
% 
% figure()
% 
% quiver(X(1,2),degree(2,1), U*0.25,V*10,'Color','r','LineWidth',2)