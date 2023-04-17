% Load the EEG signal data into MATLAB
data=load('C:\Users\pgsar\Downloads\Subject00_1_edfm.mat');
eeg_signal=data.val;

% % Apply high-pass filter to remove low-frequency noise
% fs = 1000; % Sampling frequency
% fc = 5; % Cutoff frequency
% [b, a] = butter(4, fc/(fs/2), 'high');
% eeg_filtered = filter(b, a, eeg);
% 
% % Apply morphological filter to enhance spikes
% se = strel('line', 10, 0); % Structuring element for morphological filter
% eeg_morph = imtophat(eeg_filtered, se); % Morphological filter
% 
% % Detect spikes in the filtered signal
% threshold = 3*std(eeg_morph); % Threshold for spike detection
% spike_indices = find(eeg_morph > threshold); % Spike indices
% 
% % Plot original signal and filtered signal with detected spikes
% t = (0:length(eeg)-1)/fs; % Time vector
% subplot(2,1,1);
% plot(t, eeg);
% title('Original EEG Signal');
% xlabel('Time (s)');
% ylabel('Amplitude (\muV)');
% subplot(2,1,2);
% plot(t, eeg_morph);
% hold on;
% plot(t(spike_indices), eeg_morph(spike_indices), 'ro');
% title('Filtered EEG Signal with Detected Spikes');
% xlabel('Time (s)');
% ylabel('Amplitude (\muV)');

 
% Filter the EEG signal using a bandpass filter
fs = 256; % Sampling frequency
[b, a] = butter(2, [0.5 50]/(fs/2)); % Define the filter coefficients
filtered_signal = filter(b, a, eeg_signal);

% Calculate the median and standard deviation of the filtered signal
xmedian = median(filtered_signal(:));
sigma = 6745.0 / xmedian;

% Detect spikes using the automatic threshold rule
spike_indices = find(filtered_signal > sigma);

% Plot the original EEG signal and the detected spikes
t = (0:length(eeg_signal)-1)/fs; % Time vector
figure;
subplot(2,1,1);
plot(t, eeg_signal);
title('Original EEG Signal');
xlabel('Time (s)');
ylabel('Amplitude');
subplot(2,1,2);
plot(t, filtered_signal);
hold on;
plot(t(spike_indices), filtered_signal(spike_indices), 'ro');
title('Filtered EEG Signal with Detected Spikes');
xlabel('Time (s)');
ylabel('Amplitude');