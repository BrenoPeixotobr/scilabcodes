function y0 = lagrange_interp(x, y, x0)
/*x é a entrada obeservada.
y são os pontos medidos.
x0 ponto a ser interpolado 
% y0 o valor interpolado
*/
y0 = 0;
n = length(x);
for j = 1 : n
    t = 1;
    for i = 1 : n
        if i~=j
            t = t * (x0-x(i))/(x(j)-x(i));
        end
    end
    y0 = y0 + t*y(j);
end
endfunction 

