/* refinamento de solução
r = b -Ax
uma solução aproximada
X¹=X⁰+xC⁰
Ax¹=b
A(X⁰+C⁰)=b
*/
function [x,residuo] = Gauss(A,b)
[m,n] = size(A);
b1=b;
A1=A;
for k = 1:n-1
    for i = k+1:n
        mult = A(k,k)/A(i,k);
        b(i)=b(k)-mult*b(i);
        A(i,k:n) = A(k,k:n)-mult*A(i,k:n);

    end
end

// retrosubstituicao
x = zeros(n,1);
x(n)=b(n)/A(n,n);
for i = n-1:-1:1
    x(i) = (b(i)-A(i,i+1:n)*x(i+1:n))/A(i,i);
end
    residuo=b1-(A1*x);
endfunction

A=[2 -1 4 1 -1;-1 3 -2 -1 2;5 1 3 -4 1;3 -2 -2 -2 3;-4 -1 -5 3 -4];
b=[7;1;33;24;-80];

[a1,a2]=Gauss(A,b);
r=a2;
C=[];
x=a1;
for interacao=1:1000
    erro=norm(r,'inf');
    if(erro<10^(-14))
        disp(interacao);
        break;
    else
    [L,U]=lu(A);
    Y=L\r;
    C=U\Y;
    x=x+C;
    r=b-A*x
    end
end

