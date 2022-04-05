function Resultados=simpson3_8simple(a,b,f)
syms x real;
global sol1;
derivadaevaluada=0;
derivadamaxima=0;
Error=[];
I=[];
so1=[];

%Solución real en el intervalo dado
sol1=double(int(f,a,b));
h=(b-a)/3;
I=3*h*double(subs(f,x,a)+subs(f,x,b)+3*subs(f,x,(2*a+b)/3)+3*subs(f,x,(a+2*b)/3))/8;

%Cálculo de la cota de error
y = a:0.01:b;
c=numel(y);   
derivada=diff(f,x,2);
for i =1:c
    derivadaevaluada=abs(double(subs(derivada,y(i))));
    if derivadaevaluada >=  derivadamaxima    
        derivadamaxima=derivadaevaluada;
    end
end
Error=(3*derivadamaxima*h^5)/80;

%Cálculo
format long;
Resultados=[1,I,Error];
end            