% Load EEG data
data=load('C:\Users\pgsar\Downloads\Subject00_1_edfm.mat');
EEG_Data=data.val;
L = length(EEG_Data);
Fs = 1000; % Hz
time = 0:1/Fs:(L-1)/Fs;
% Convert EEG_Data to a vector
EEG_Data = EEG_Data(1,:);

% Plot the time domain
figure;
plot(time, EEG_Data);
title('EEG Signal in Time Domain');
xlabel('Time (s)');
ylabel('Amplitude (uV)');

% Plot the frequency domain
Fs = 1000; % Sampling frequency
L = length(EEG_Data); % Length of signal
f = Fs*(0:(L/2))/L;
Y = fft(EEG_Data);
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
figure;
plot(f,P1);
title('EEG Signal in Frequency Domain');
xlabel('Frequency (Hz)');
ylabel('Magnitude (uV)');


%  It is a way of decomposing a signal into different frequency bands, 
% each of which can be analyzed separately.
% Perform Discrete Wavelet Transform (DWT)
[c,l] = wavedec(EEG_Data,5,'db4');
approx = appcoef(c,l,'db4');
[cd1,cd2,cd3,cd4,cd5] = detcoef(c,l,[1 2 3 4 5]);
figure;
subplot(6,1,1); plot(approx); title('Approximation Coefficients');
subplot(6,1,2); plot(cd1); title('Level 1 Detail Coefficients');
subplot(6,1,3); plot(cd2); title('Level 2 Detail Coefficients');
subplot(6,1,4); plot(cd3); title('Level 3 Detail Coefficients');
subplot(6,1,5); plot(cd4); title('Level 4 Detail Coefficients');
subplot(6,1,6); plot(cd5); title('Level 5 Detail Coefficients');

% Filtering
% High-pass filter
HPF = 0.5; % High-pass filter cutoff frequency
[b,a] = butter(4, HPF/(Fs/2), 'high');
EEG_Data_HPF = filtfilt(b,a,EEG_Data);

% Low-pass filter
LPF = 40; % Low-pass filter cutoff frequency
[b,a] = butter(4, LPF/(Fs/2), 'low');
EEG_Data_LPF = filtfilt(b,a,EEG_Data);

% Plot the filtered signals
figure;
subplot(2,1,1); plot(time, EEG_Data_HPF); title('EEG Signal after High-pass Filtering');
xlabel('Time (s)');
ylabel('Amplitude (uV)');
subplot(2,1,2); plot(time, EEG_Data_LPF); title('EEG Signal after Low-pass Filtering');
xlabel('Time (s)');
ylabel('Amplitude (uV)');

