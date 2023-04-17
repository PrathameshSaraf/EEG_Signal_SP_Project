data=load('C:\Users\pgsar\Downloads\Subject00_1_edfm.mat');
val=data.val;
% Define the sampling frequency and the time vector
fs = 250; % Sampling frequency in Hz
t = (0:size(val, 2)-1) / fs; % Time vector in seconds

% Loop over each signal in the dataset
for i = 1:size(val, 11)
    %power spect density
    % The PSD is a measure of the power distribution of a signal over its frequency range
    % Compute the power spectral density of the signal
    [psd, freq] = pwelch(val(i,:), [], [], [], fs); 
    
    % Plot the time-domain and frequency-domain of the signal
    figure;
    subplot(2, 1, 1);
    plot(t, val(i,:));
    xlabel('Time (s)');
    ylabel('Amplitude');
    title(['Signal ' num2str(i) ' - Time-Domain']);
    
    subplot(2, 1, 2);
    plot(freq, 10*log10(psd));
    xlabel('Frequency (Hz)');
    ylabel('Power/Frequency (dB/Hz)');
    title(['Signal ' num2str(i) ' - Frequency-Domain']);
end
