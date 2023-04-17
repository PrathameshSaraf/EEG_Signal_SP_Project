clc;
clear all;
close all;

Fs=1000;
F1=50; F2=150; F3=320; F4=360;
Ts=1/Fs;
t=0:Ts:1;
x=sin(2*pi*F1*t)+sin(2*pi*F2*t)+sin(2*pi*F3*t)+sin(2*pi*F4*t);

% Plot the original signal and its magnitude spectrum
figure(1);
subplot(2,1,1)
plot(t, x);
xlabel('time')
ylabel('Amplitude')
subplot(2,1,2)
plot(abs(fft(x)))
xlabel('Frequency')
ylabel('Amplitude of FT')
title('Magnitude spectrum of original signal')

Wp = 0.4;
Ws = 0.6;

Ap1=0.89;
Ap = 10 * log10(Ap1);% convert to dB

Rs1=0.18;
Rs = 10 * log10(Rs1);% convert to dB

[n, Wn] = buttord(Wp, Ws, Ap,Rs );
[b, a] = butter(n, Wn,"low");
display(Wn)

display(n)
display(b)
display(a)
figure
freqz(b, a, 512);
xfilter = filter(b, a, x);
figure;
subplot(2, 1, 1);
plot(xfilter);
title('Signal');
xlabel('Time');
ylabel('Amplitude');
subplot(2, 1, 2);
plot(abs(fft(xfilter)));
title('Magnitude spectrum of original signal');
xlabel('Frequency')
ylabel('Amplitude');