clc
clear all;
close all;

% Define filter specifications
Fs = 200;           % Sampling frequency (Hz)
cutoff = 50;        % Filter cutoff frequency (Hz)
order = 11;          % Filter order

% Design filter coefficients
b = fir1(order, cutoff/(Fs/2));

% Plot filter frequency response
freqz(b, 1, 1024, Fs);

% Apply filter to input signal
t = 0:1/Fs:1-1/Fs;   % Time vector (1 second)
x = sin(2*pi*100*t);  % Input sinusoidal signal
y = filter(b, 1, x);  % Filtered output signal

% Plot input and output signals
figure;
subplot(2,1,1);
plot(t, x);
title('Input Signal');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(2,1,2);
plot(t, y);
title('Output Signal');
xlabel('Time (s)');
ylabel('Amplitude');

% 
% clc;
% clear all;
% close all;
% Fs=1000;
% F1=10; F2=50; F3=80; F4=120;
% Ts=1/Fs;
% t=0:Ts:1;
% x=sin(2*pi*F1*t)+sin(2*pi*F2*t)+sin(2*pi*F3*t)+sin(2*pi*F4*t);
% subplot(2,1,1)
% plot(x);
% xlabel('time')
% ylabel('Amplitude')
% subplot(2,1,2)
% plot(abs(fft(x)))
% xlabel('Freuency')
% ylabel('Amplitude of FT')
% title('Magnitude spectrum of original signal')
% %%%%%%%% Design for FIR using windowing method
% N=151;
% Fc=60;
% wc=(2*Fc)/Fs;
% b=fir1(N,wc);
% figure;
% freqz(b,1);
% xfilter=filter(b,1,x)
% figure;
% subplot(2,1,1)
% plot(xfilter);
% subplot(2,1,2)
% plot(abs(fft(xfilter)))
% xlabel('Frequency')
% ylabel('Amplitude of FT')
% title('Magnitude spectrum of filtered signal')
