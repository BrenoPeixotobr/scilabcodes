function coeficientes=regressao_multipla(matriz_variaveis,y)
z=[ones(y);matriz_variaveis];
coeficientes=(z*z')\(z*y');
endfunction
