Individuos=zeros(100,21); %100 indivíduos onde a coluna 21 é referente aos pesos

for i=1:100 %individuos iniciais 
Individuos(i,1:20)=int32(randi([0, 1], [1, 20])); %geração dos individuos   
end
%%%plot%%%
[x,y] = meshgrid(0:.5:20);
Z = abs(x.*sin((pi/4).*y)+y.*sin((pi/4).*x));
mesh(x,y,Z)
%%%%

for o=4000;    
mut=randi(200); %mutação, troca o bit
if mut==1
    a=randi(100);
    b=randi(20);
    if Individuos(a,b)==1
    Individuos(a,b)=0;
    else
        Individuos(a,b)=1;
    end
end
soma=0;
for k=1:100 %soma máxima
    %o 51.15 se dá pro máximo ser 20
x=1/51.15*(512*Individuos(k,10)+256*Individuos(k,9)+128*Individuos(k,8)+64*Individuos(k,7)+32*Individuos(k,6)+16*Individuos(k,5)+8*Individuos(k,4)+4*Individuos(k,3)+2*Individuos(k,2)+1*Individuos(k,1));
y=1/51.15*(512*Individuos(k,20)+256*Individuos(k,19)+128*Individuos(k,18)+64*Individuos(k,17)+32*Individuos(k,16)+16*Individuos(k,15)+8*Individuos(k,14)+4*Individuos(k,13)+2*Individuos(k,12)+1*Individuos(k,11));
f=abs(x.*sin((pi/4).*y)+y.*sin((pi/4).*x)); %valor da função
soma=f+soma; %soma o valor máximo dos dados adquiridos
Individuos(k,21)=f; %peso de cada individuo
end

pesos=ones(1,round(soma));
k=1;

for g=1:100  %gera a matriz de pesos
    pesos(1,k:round(Individuos(g,21))+k)=g; %determina que determinado numero de linhas receba determinado valor de acordo com o  peso do individuo
    k=round(Individuos(g,21))+k;        
end


filhos=zeros(100,21);
for k=1:100 %gera os filhos e faz o crossover
    a=randi(round(soma));
    b=pesos(a); %num. do primeiro indivíduo;
    a=randi(round(soma));
    c=pesos(a);%num. do segundo indivíduo;
    d=randi(19); %bit que ocorrerá o crusamento
    filhos(k,1:d)=Individuos(c,1:d);   
    filhos(k,d+1:20)=Individuos(b,d+1:20);      
end
Individuos=filhos; %exclui os pais
end
%%RESULTADOS%%
for k=1:100 %soma máxima
    %o 51.15 se dá pro máximo ser 20
x=1/51.15*(512*Individuos(k,10)+256*Individuos(k,9)+128*Individuos(k,8)+64*Individuos(k,7)+32*Individuos(k,6)+16*Individuos(k,5)+8*Individuos(k,4)+4*Individuos(k,3)+2*Individuos(k,2)+1*Individuos(k,1));
y=1/51.15*(512*Individuos(k,20)+256*Individuos(k,19)+128*Individuos(k,18)+64*Individuos(k,17)+32*Individuos(k,16)+16*Individuos(k,15)+8*Individuos(k,14)+4*Individuos(k,13)+2*Individuos(k,12)+1*Individuos(k,11));
f=abs(x.*sin((pi/4).*y)+y.*sin((pi/4).*x)); %valor da função
Individuos(k,21)=f; %peso de cada individuo
end

[a k]=max(Individuos(:,21))
x=1/51.15*(512*Individuos(k,10)+256*Individuos(k,9)+128*Individuos(k,8)+64*Individuos(k,7)+32*Individuos(k,6)+16*Individuos(k,5)+8*Individuos(k,4)+4*Individuos(k,3)+2*Individuos(k,2)+1*Individuos(k,1))
y=1/51.15*(512*Individuos(k,20)+256*Individuos(k,19)+128*Individuos(k,18)+64*Individuos(k,17)+32*Individuos(k,16)+16*Individuos(k,15)+8*Individuos(k,14)+4*Individuos(k,13)+2*Individuos(k,12)+1*Individuos(k,11))
