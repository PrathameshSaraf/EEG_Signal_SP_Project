% program for linear convolution
% clc;
% clear .11;
% close all;
% 
% x=[2 4 1 3];
% h=[2 1 3 -2];
% 
% x1=length(x);
% h1=length(h);
% 
% y1=x1+h1-1;
% for n=0:y1-1
%     y(n+1)=0;
%     for k=0:x1-1
%         if(n-k+1)>0 && (n-k+1)<=h1
%             y(n+1)=y(n+1)+x(k+1)*h(n-k+1)
%         end
%     end
% end


x=input('Enter x sequence : ');
h=input('Enter y sequence : ');

y=user_define(x,h)


function [y]=user_define(x,h)

clc;
close all;
x1=length(x) ;
h1=length (h);
yl=x1+h1-l;
for n=0:y1-1
    y(n+1)=0;
    for k=0:x1-1
        if(n-k+1)>0 && (n-k+1)<=h1
            y(n+1)=y(n+1)+x(k+1)*h(n-k+1)
        end
    end
end
end