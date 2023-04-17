% clc
% clear all
% close all
% f=4
% fs=200
% ts=1/fs
% t=0:ts:1;
% x=sin(2*pi*f*t)
% plot(x,"red");
% xlabel("time");
% ylabel('Amplitude');
% title('Sine wave');
% figure
% stem(x,"green");
% xlabel("time");
% ylabel('Amplitude');
% title('Sine wave');


% 
% 
% clc
% clear all
% close all
% f=4
% fs=200
% ts=1/fs
% t=0:ts:1;
% x=sin(2*pi*f*t)
% figure
% subplot(2,1,1)
% plot(x,"red");
% xlabel("time");
% ylabel('Amplitude');
% title('Sine wave');
% 
% x=cos(2*pi*f*t)
% subplot(2,1,2)
% plot(x,"green");
% xlabel("time");
% ylabel('Amplitude');
% title('Cos wave');



% clc
% clear all
% close all
% 
% f=4
% fs=200
% ts=1/fs
% t=0:ts:1;
% x=sin(2*pi*f*t)
% figure
% plot(x,"red");
%  
% hold on;
% x=cos(2*pi*f*t)
% plot(x,"green");
% xlabel("time");
% ylabel('Amplitude');


clc
clear all
close all
f=4
fs=200
ts=1/fs
t=0:ts:1;
figure
x=sin(2*pi*f*t)
subplot(3,1,1)
plot(x,'red');
xlabel("time");
ylabel('Amplitude');
title('Sine Wave');

xfft=fft(x);
xfftmag=abs(xfft);
subplot(3,1,2)
plot(xfftmag,'blue');
xlabel("freq");
ylabel('magnitude');
title('Angle Spectrum');

xfftphase=angle(xfft);
subplot(3,1,3)
plot(xfftphase,'green');
xlabel("freq");
ylabel('phase angle');
title('Phase Spectrum');

