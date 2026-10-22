clc
clearvars
close all

x = [15,20,25,30,35,40,45,50,55];
y = [sind(15),sind(20),sind(25),sind(30),sind(35),sind(40),sind(45),sind(50),sind(55)];

p0 =  [14,56]; % 14 then 56

n = length(x);
h = x(2)-x(1);
F = zeros(n,n);
F(:,1) = y;

for j = 2:n
    for i = j:n
        F(i,j) = F(i,j-1)-F(i-1,j-1);
    end
end
c= F(n,n);
for k = n-1:-1:1
    p = poly(x(1))/h;
    p(2) = p(2)-(k-1);
    c = conv(c,p)/k;
    m = length(c);
    c(m) = c(m)+F(k,k);

end
A = polyval(c,p0(1));
D = polyval(c,p0(2));

T1 = sind(14);
T2 = sind(56);
R1 = abs((T1-A)/T1)*100;
R2 = abs((T2-D)/T2)*100;

fprintf('Approximation error For X = 14 is : %.4f\n',A);
fprintf('Approximation error For X = 56 is : %.4f\n',D)
fprintf('The Persentage of True error For x = 14 is : %.10f\n',R1)
fprintf('The Persentage of True error For x = 56 is : %.10f\n',R2)
% x = linspace(x(1),x(n),100);
% plot(x,y,'r')
% hold on
% plot(x,y,'o')

syms X 

Y = vpa(c(1)+c(2)*X+c(3)*X*(X-1)/2+c(4)*X*(X-1)*(X-2)/6,6);
X = 1:1:180;
Y = subs(Y);
figure;
plot(X,Y,'color','r','Linewidth',3)
title('Gregory Interpolation')
xlabel('X')
ylabel('Y')
grid on
