% clc
% clear all
% close all
% f=10
% fs=200
% ts=1/fs
% t=0:ts:1;
% 
% figure
% 
% x=sin(2*pi*f*t)
% subplot(3,1,1)
% plot(x,'red');
% xlabel("time");
% ylabel('Amplitude');
% title('Sin Wave');
% 
% xfft=fft(x);
% xfftmag=abs(xfft);
% subplot(3,1,2)
% plot(xfftmag,'blue');
% xlabel("freq");
% ylabel('magnitude');
% title('Angle Spectrum');



% clc
% clear all
% close all
% f=2
% fs=200
% ts=1/fs
% t=0:ts:1;
% 
% figure
% 
% x=10*sin(2*pi*f*t)
% subplot(3,1,1)
% plot(x,'red');
% xlabel("time");
% ylabel('Amplitude');
% title('Sin Wave');
% 
% xfft=fft(x);
% xfftmag=abs(xfft);
% subplot(3,1,2)
% plot(xfftmag,'blue');
% xlabel("freq");
% ylabel('magnitude');
% title('Angle Spectrum');
%  

% clc
% clear all
% close all
% 
% f=2
% fs=200
% ts=1/fs
% t=0:ts:1;
% 
% figure
% 
% x=sin(2*pi*10*t)+sin(2*pi*30*t)
% subplot(3,1,1)
% plot(x,'red');
% xlabel("time");
% ylabel('Amplitude');
% title('Sin Wave');
% 
% xfft=fft(x);
% xfftmag=abs(xfft);
% subplot(3,1,2)
% plot(xfftmag,'blue');
% xlabel("freq");


% clc
% clear all
% close all
% f=2
% fs=200
% ts=1/fs
% t=0:ts:1;
% figure
% 
% x=15*sin(2*pi*5*t)+50*sin(2*pi*10*t)
% subplot(3,1,1)
% plot(x,'red');
% xlabel("time");
% ylabel('Amplitude');
% title('Sin Wave');
% 
% xfft=fft(x);
% xfftmag=abs(xfft);
% subplot(3,1,2)
% plot(xfftmag,'blue');
% xlabel("freq");



% clc
% clear all
% close all
% f=2
% fs=200
% ts=1/fs
% t=0:ts:1;
% figure
% x=sin(2*pi*10*t)+sin(2*pi*30*t)+sin(2*pi*80*t)
% subplot(3,1,1)
% plot(x,'red');
% xlabel("time");
% ylabel('Amplitude');
% title('Sin Wave');
% xfft=fft(x);
% xfftmag=abs(xfft);
% subplot(3,1,2)
% plot(xfftmag,'blue');
% xlabel("freq");
% ylabel('magnitude');
% title('Angle Spectrum');

clc
clear all
close all
x = [4 5 3 2]
y = [3 3 1 2]
conv(x,y)
x = [4 5 3 2]
y = [3 3 1 2]
xcorr(x,y)
