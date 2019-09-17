function [fun,law]=generationFunction(coordenadas, tipo)
entradas=length(coordenadas);
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
            law=law+"coordenadas(1)"
        else
            law=law+"+coordenadas("+string(i)+").*x"+string(i-1);
        end
    end
else

fun="[y]=fun(x)";
law="y=";
    for i=1:entradas
        if(i==1)
            law=law+"coordenadas(1)"
        end
        if(i==2)
            law=law+"+coordenadas("+string(i)+").*x";
        else
            law=law+"+coordenadas("+string(i)+").*x.^"+string(i-1);
        end
    end
end
endfunction
