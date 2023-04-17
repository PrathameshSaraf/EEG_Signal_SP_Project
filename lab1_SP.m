% plot the impluse wave 
clc
clear all
close all

for i=-10:10
    if i==0
        delta(i+1)=1;
    else
        delta(i+11)=0;
    end

    stem(delta);
end


% 
% for i=-10:10
%     if i>=0
%        Ramp(i+11)=i;
%     else
%         Ramp(i+11)=0;
%     end
% 
%     stem(Ramp);
% end
% 
% 
% 
% % plot the step wave 
% clc
% clear all
% close all
% 
% for i=-10:10
%     if i>=0
%        step(i+11)=1;
%     else
%         step(i+11)=0;
%     end
% 
%     stem(step);
% end
% 
% 
% 
% % plot the impluse wave 
% i=[-10:10]
% delta=(i==0);
% stem(delta);
% 
% 
% % plot the step wave 
% i=[-10:10]
% step=(i>=0);
% stem(step);
% 
% 
% f=4
% fs=200
% ts=1/fs
% t=0:ts:1;
% x=sin(2*pi*f*t)
% plot(x);
% figure
% stem(x);
