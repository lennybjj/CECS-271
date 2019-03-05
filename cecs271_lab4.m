clear all;clc
% first plot the function

xl = input ('xl value= ');
fun = @g;
z = fzero(fun,xl);
fprintf('Zero in respect to xl: %4.6f \n',z)
xu = input ('xu value= ');



x  = xl:.5:xu;
f =@(x) g(x);
RAEx =0.5;


plot(x,f(x));grid

hold on
while (abs(xl-xu) > RAEx)
 fa=f(xl);
 fb=f(xu);
 xm=(xl+xu)/2;
 fxm=f(xm);
 AE = xu - xm;
 RAE = AE/xm+1;
 t = 5;
 
 h1 = plot(xm,f(xm),'o','MarkerFaceColor','red','MarkerSize',10);
 pause(t);
 hold on
 h2 = plot(xl,0,'o','MarkerFaceColor','black','MarkerSize',5);
 hold on
 h3 = plot(xu,0,'o','MarkerFaceColor','black','MarkerSize',5);
 pause(t);
 delete(h1);
 delete(h2);
 delete(h3);
 
 fprintf('xl=%5.4f xu=%5.4f xm=%5.4f AE=%4.4f RAE=%5.4f \n',xl,xu,xm,AE,RAE)

 if (fa *fxm > 0);
    xl=xm;
 else
    xu=xm;
 end
 
end
hold off


function y = g(a)
    y = a.*exp(cos(a)) - .5;
end