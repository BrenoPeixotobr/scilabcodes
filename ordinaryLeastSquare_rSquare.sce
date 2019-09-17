/*Essa rotina utliza o metodo dos minimos quadrados para gerar os coeficientes das funções. Ela calcula com o método da regressão multipla e aceita tanto funções de uma unica variavel com de grau maior que 1, quanto funções de multiplas variaveis


This routine uses the least squares method to generate the coefficients of the functions. It calculates with the multiple regression method and accepts both single-variable functions with degree greater than 1 and multi-variable functions.

*/

function r2 = r2_ajustado(c,c2)
r2=1-sum((c-c2).^2)/(sum(c.^2)-1/length(c)*(sum(c)^2));
endfunction

function coeficientes=regressao_multipla(matriz_variaveis,y)
z=[ones(y);matriz_variaveis];
coeficientes=(z*z')\(z*y');
endfunction

function [fun,law]=generationFunction(coeficientes, tipo)
entradas=length(coeficientes);
if(tipo==0)
fun="[y]=fun(";
    for i=1:(entradas-1)
        fun=fun+"x"+string(i);
        if(i==entradas-1)
            fun=fun+")";
        else
            fun=fun+","
        end
    end

law="y="
    for i=1:entradas
        if(i==1)
            law=law+"coeficientes(1)"
        else
            law=law+"+coeficientes("+string(i)+").*x"+string(i-1);
        end
    end
else

fun="[y]=fun(x)";
law="y=";
    for i=1:entradas
        if(i==1)
            law=law+"coeficientes(1)"
        elseif(i==2)
            law=law+"+coeficientes("+string(i)+").*x";
        else
            law=law+"+coeficientes("+string(i)+").*x.^"+string(i-1);
        end
    end
end
endfunction


function [coeficientes,r2]=executar(matriz,vetor,tipo,n_linhas)
if(tipo==0)
coeficientes=regressao_multipla(matriz,vetor);
[fun,law]=generationFunction(coeficientes,tipo);
deff(fun,law);
comando="vetor2=fun(";
    for i=1:n_linhas
        if(i==n_linhas)
             comando=comando+"matriz("+string(i)+",:));"
        else
            comando=comando+"matriz("+string(i)+",:),"
        end
    end
execstr(comando);
r2=r2_ajustado(vetor,vetor2);
else
coeficientes=regressao_multipla(matriz,vetor);
[fun,law]=generationFunction(coeficientes,tipo);
deff(fun,law);
comando="vetor2=fun(matriz)";
execstr(comando);
r2=r2_ajustado(vetor,vetor2);
end
endfunction


temperatura=[20 30 30 40 60 80];
pressao=[1.5 1.5 1.2 1.0 1.0 0.8];
tempo=[9.4 8.2 9.7 9.5 6.9 6.5];
m=[temperatura;pressao];


[c,res]=executar(m,tempo,0,2);
disp(res);

x=[1 1.5 2];
y=[1.2 1.3 2.3];

[c,res]=executar(x,y,1,2);
disp(res);
