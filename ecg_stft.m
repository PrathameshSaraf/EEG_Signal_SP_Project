
% Load the EEG dataset
data=load('C:\Users\pgsar\Downloads\Subject00_1_edfm.mat');
val=data.val;

% Define the sampling frequency and the time vector
fs = 250; % Sampling frequency in Hz
t = (0:size(val, 2)-1) / fs; % Time vector in seconds

% Loop over each signal in the dataset
for i = 1:size(val, 1)
    % Compute the statistical features of the signal
    signal_mean = mean(val(i,:));
    signal_median = median(val(i,:));
    signal_variance = var(val(i,:));
    signal_std = std(val(i,:));
    signal_skewness = skewness(val(i,:));
    
    % Plot the time-domain features of the signal
    subplot(size(val, 1), 1, i);
    plot(t, val(i,:));
    xlabel('Time (s)');
    ylabel('Amplitude');
    title(['Signal ' num2str(i) ' - Time-Domain Features']);
%     legend('Signal', ['Mean = ' num2str(signal_mean)], ['Median = ' num2str(signal_median)], ...
%         ['Variance = ' num2str(signal_variance)], ['Std = ' num2str(signal_std)], ...
%         ['Skewness = ' num2str(signal_skewness)]);
end
