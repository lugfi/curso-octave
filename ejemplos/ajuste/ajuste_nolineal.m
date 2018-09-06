## Copyright (C) 2018 ferna
## 
## This program is free software: you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
## 
## This program is distributed in the hope that it will be useful, but
## WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
## 
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see
## <https://www.gnu.org/licenses/>.
##
## Author: ferna <ferna@DESKTOP-6ITLPEC>
## Created: 2018-08-24

clear all;
close all;

# Semilla de los numeros aleatorios
# (para tener siempre las mismas incertezas)
rand("seed", 9874)

A = 3.4; w = 5; fi = 0.43;
preal = [A w fi];

# Genero los datos que luego voy a ajustar
# En la vida real, tendría que cargar mis datos
t_data = linspace(0,3*pi/w,15);
x_data = A*(cos(w*t_data + fi) + 0.01*randn(size(t_data)));

# Modelo
F = @(t, p) p(1)*cos(p(2) .*t + p(3)); 

# Función de eror
J = @(p) norm( x_data -  F(t_data, p) );

# Ajuste
p_hat = fminsearch(J, [3 1 0]);
% stats
disp([preal;p_hat])
disp((preal-p_hat)./preal*100)


# Curva estiamda
t_hat = linspace(min(t_data), max(t_data), 1000);
x_hat = F(t_hat, p_hat);

# Plots
figure;
hold on;
plot(t_data, x_data, 'o');
plot(t_hat, x_hat);

