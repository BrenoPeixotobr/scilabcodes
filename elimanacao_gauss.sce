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
    residuo=norm(b1-A1*x,'inf');
endfunction
