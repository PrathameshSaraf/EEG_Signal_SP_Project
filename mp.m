data = load('C:\Users\pgsar\Downloads\Subject00_1_edfm.mat');

% Extract the raw signal matrix from the data file
raw_signal = data.val;

% Plot the first channel of the raw signal matrix
figure;
plot(raw_signal(1,:));
xlabel('Sample');
ylabel('Signal amplitude');
title('Raw EE0G signal - Channel 1');

figure;
plot(raw_signal(21,:));




data = load('C:\Users\pgsar\Downloads\Subject00_1_edfm.mat');

% Extract the raw signal matrix from the data file
eeg_data = data.val;

% Compute the sampling frequency and time step
fs = 250; % Assuming a sampling rate of 250 Hz
dt = 1/fs;

% Compute the Fourier transform of each EEG signal
fft_data = zeros(size(eeg_data));
for i = 1:size(eeg_data, 1)
    fft_data(i,:) = fft(eeg_data(i,:));
end

% Compute the frequency axis for the FFT data
freq_axis = linspace(0, fs/2, size(eeg_data, 2)/2+1);

% Plot the FFT data for one of the signals
signal_index = 1; % Change this to plot a different signal
subplot(2,1,1);
plot((0:size(eeg_data,2)-1)*dt, eeg_data(signal_index,:));
xlabel('Time (s)');
ylabel('Signal amplitude');
title(sprintf('EEG signal #%d', signal_index));

subplot(2,1,2);
plot(freq_axis, abs(fft_data(signal_index,1:length(freq_axis))));
xlabel('Frequency (Hz)');
ylabel('Magnitude');
title(sprintf('FFT of EEG signal #%d', signal_index));



data = load('C:\Users\pgsar\Downloads\Subject00_1_edfm.mat');

% Extract the raw signal matrix from the data file
eeg_dataset = data.val;

% Define the Laplace transform function
Laplace = @(x) diff([0 x]);

% Create a matrix to store the Laplace transforms
Laplace_transforms = zeros(size(eeg_dataset));

% Loop through each channel and compute the Laplace transform
for channel = 1:size(eeg_dataset,1)
    Laplace_transforms(channel,:) = Laplace(eeg_dataset(channel,:));
end

% Save the Laplace transforms to a new .mat file
save('eeg_dataset_Laplace.mat', 'Laplace_transforms');
% Plot the Laplace-transformed data
figure;
plot(Laplace_transforms(1,:));
xlabel('Frequency (Hz)');
ylabel('Laplace-transformed signal');
% 
% % Load the data file
% data = load('C:\Users\pgsar\Downloads\Subject00_1_edfm.mat');
% 
% 
% % Extract the raw signal matrix from the data file
% raw_signal = data.val;
% 
% % Define the time vector (assuming the signal is sampled at 256 Hz)
% t = 0:1/256:(size(raw_signal, 2)-1)/256;
% 
% % Compute the FFT of the first channel of the raw signal
% fft_signal = fft(raw_signal(1,:));
% 
% % Compute the frequency vector
% f = 0:256/size(raw_signal,2):256/2;
% 
% % Plot the magnitude and phase spectra
% figure;
% subplot(2,1,1);
% plot(f, abs(fft_signal(1:length(f))));
% title('Magnitude spectrum');
% xlabel('Frequency (Hz)');
% ylabel('Magnitude');
% subplot(2,1,2);
% plot(f, angle(fft_signal(1:length(f))));
% title('Phase spectrum');
% xlabel('Frequency (Hz)');
% ylabel('Phase (radians)');
% Get the raw signal values from the loaded data
% raw_signal = val;
% 
% Compute the Laplace transform of the signal
% laplace_transform = fftshift(fft(raw_signal));
% 
% Plot the raw signal and its Laplace transform
% figure;
% subplot(2,1,1);
% plot(raw_signal);
% title('Raw Signal');
% xlabel('Time (s)');
% ylabel('Amplitude');
% subplot(2,1,2);
% plot(laplace_transform);
% title('Laplace Transform');
% xlabel('Frequency (Hz)');
% ylabel('Amplitude');
% 
% 
