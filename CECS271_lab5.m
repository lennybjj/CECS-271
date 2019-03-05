clear all;clc 
%% User inputs 
x0 = input("Please input x0: ");
x1 = input("Please input x1: ");
T= input("Please input the pause time: ");

%% This block of code gives me the coefficients for horner's algorithm 
amount = input("How many values will you be inserting?: ");
c = 1;
coe = [1:amount];
while c-1 ~= amount
    p = input("Please enter c value: ");
    coe(c)= p;
    c = c + 1;
    
end 




%% Send the coe to the function to use Horner's Algorithm and graph function    
ax = x0:.5:x1;
gr =@(ax) g(coe,ax);


plot(ax, gr(ax),'black','MarkerSize', 10);title('results');grid

%Sending the values to the function 
f(coe);

%% Find the zero 
z = fzero(gr, x0);
fprintf('\nZero in respect to x0: %4.6f \n\n', z)

%% Secant Method and plotting
RAEx =1;
counter = 0;

while( RAEx >= 0.5 )
    grx0 = gr(x0);
    grx1 = gr(x1);
    
    pause(T);

    hold on
    h0 =  plot(x0,gr(x0),'o','MarkerFaceColor','red','MarkerSize',5);
    h1 =  plot(x1,gr(x1),'o','MarkerFaceColor','red','MarkerSize',5);
    h2 =  plot([x0 x1], [grx0 grx1], 'red');
    grid on
    hold off
    
    pause(T);
    delete(h0);
    delete(h1);
    delete(h2);
    
    % Calculations for secant method 
    x2 = x1 - ((gr(x1)*(x1-x0))/(gr(x1)-gr(x0)));
    AE = x1 - x2;
    RAEx = abs((AE/x1)*100);
    fprintf('x%d = %.6f    x%d = %.6f    x%d = %.6f    AE = %.6f    RAE =  %.6f%% \n\n',counter,x0,(counter+1),x1,(counter+2) ,x2, AE, RAEx);
    x0 = x1;
    x1 = x2;
    counter = counter + 1 ;
    
end

%% Horner's Algorithm evaluated
function y = f(coef) 
    syms x; 
    n = length(coef);
    results = coef(1);
    for j = 2 : n % starts the for loop
        results = results*x + coef(j);
    end % ends the for loop
   
    %making it look nice
    pw = length(coef)-1;
    str = zeros(1,length(coef),'sym');
    
    i = 1; 
    while i <= length(coef)
        str(i) = (coef(i)*(x^pw));
        i = i + 1; 
        pw = pw - 1;
    end
    
    fprintf("\nThe function is: \n")
    for p = 1 : length(coef)
        if( p ~= length(coef) )
            fprintf(char(str(p)));
            fprintf(' + ');
         else
            fprintf(char(str(p)) );
        end
    end
    fprintf('\n')   
    
    y = results;% solution is saved to y
end

%% Function to be used to graph
function a = g(coef,xe)
    n = length(coef);
    results = coef(1);
    for j = 2 : n % starts the for loop
        results = results.*xe + coef(j);
    end % ends the for loop
    a = results; 
end