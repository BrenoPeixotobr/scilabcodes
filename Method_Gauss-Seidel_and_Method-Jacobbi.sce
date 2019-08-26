function [solucao, erro, interacoes] = Gauss_Seidel(A, b, casas)
erro_max=0.5*(10^(2-casas));//precisão
[m,n] = size(A);
x0 =zeros(n,1); //Solução inicial
//verificação da norma  de linha
for i=1:n
    soma_linha=(sum(A(i,:))-A(i,i))/A(i,i);
    if(soma_linha>=1)
        printf("Matriz não converge");
        abort;   
    end

end

erro = 10;
solucao = x0;
x1 = solucao;
interacoes=0;
i=0; s=0;


while erro > erro_max & interacoes<=1000
  for i=1:n 
    num = 0;
    for j=1:n
      if j <> i then
        num = num + A(i,j)*solucao(j);
      end;
    end;
    solucao(i) = (1/A(i,i))*(b(i)-num);
  end;
  erro = norm((A*solucao)-b,'inf');
  interacoes = interacoes+1;
end;
endfunction 
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


function [solucao, erro, interacoes] = Gauss_Jacobbi(A, b, casas)
[m,n] = size(A);
erro_max=0.5*(10^(2-casas));//precisão

//verificação da norma  de linha
for i=1:n
    soma_linha=(sum(A(i,:))-A(i,i))/A(i,i);
    if(soma_linha>=1)
        printf("Matriz não converge");
        abort;   
    end

end



x0 =zeros(n,1); //solução inicial
erro = 10;
solucao = x0;
interacoes=0;
i=0; s=0;
for i=1:n
    for s=1:n
        AA(i,s) = A(i,s)/A(i,i);
    end;
    be(i) = b(i)/A(i, i);
end;

AB = AA;
bc = be;

while erro > erro_max & interacoes<=1000
    solucao = bc - ((AB-I)*solucao);
    erro = norm((AB*solucao)-bc,'inf');
    interacoes = interacoes+1;
end;
endfunction
