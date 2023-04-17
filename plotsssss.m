
% Load the EEG signal data into MATLAB
data=load('C:\Users\pgsar\Downloads\Subject00_1_edfm.mat');
eeg_data=data.val;

% Define the frequency and time parameters of the EEG signal
fs = 256; % Sampling frequency of EEG signal

% Define the frequency bands of interest
delta_band = [0.5, 4];
theta_band=[4,8];
alpha_band = [8, 13];
beta_band=[13,30];
gamma_band=[30,100];

% Loop over all EEG signals in your dataset
for i = 1:size(eeg_data, 11)
    eeg_signal = eeg_data(i, :); % Extract the i-th EEG signal from your dataset
    t = 0:1/fs:(length(eeg_signal)-1)/fs; % Time vector for EEG signal

    % Calculate the power spectral density (PSD) of the EEG signal
    nfft = 2^nextpow2(length(eeg_signal)); % Length of FFT
    psd = abs(fft(eeg_signal, nfft)).^2/length(eeg_signal)/fs; % Power spectral density
    f = fs/2*linspace(0,1,nfft/2+1); % Frequency vector for PSD

    % Identify the frequency bins corresponding to the frequency bands of interest
    delta_bin = [find(f>=delta_band(1),1), find(f<=delta_band(2),1,'last')];
    theta_bin = [find(f>=theta_band(1),1), find(f<=theta_band(2),1,'last')];
    alpha_bin = [find(f>=alpha_band(1),1), find(f<=alpha_band(2),1,'last')];
    beta_bin = [find(f>=beta_band(1),1), find(f<=beta_band(2),1,'last')];
    gamma_bin = [find(f>=gamma_band(1),1), find(f<=gamma_band(2),1,'last')];

    % Extract the spectral power in each frequency band
    delta_power = psd(delta_bin(1):delta_bin(2));
    theta_power = psd(theta_bin(1):theta_bin(2));
    alpha_power = psd(alpha_bin(1):alpha_bin(2));
    beta_power = psd(beta_bin(1):beta_bin(2));
    gamma_power = psd(gamma_bin(1):gamma_bin(2));

    % Plot the EEG signal and the power in each frequency band
    figure;
    subplot(6,1,1);
    plot(t, eeg_signal);
    xlabel('Time (s)');
    ylabel('Amplitude');
    title(sprintf('EEG Signal %d', i));

    subplot(6,1,2);
    plot(f(delta_bin(1):delta_bin(2)), delta_power);
    xlabel('Frequency (Hz)');
    ylabel('Power Spectral Density');
    title('Delta Band');
    
    subplot(6,1,3);
    plot(f(theta_bin(1):theta_bin(2)), theta_power);
    xlabel('Frequency (Hz)');
    ylabel('Power Spectral Density');
    title('Theta Band');

    subplot(6,1,4);
    plot(f(alpha_bin(1):alpha_bin(2)), alpha_power);
    xlabel('Frequency (Hz)');
    ylabel('Power Spectral Density');
    title('Alpha Band');

    subplot(6,1,5);
    plot(f(beta_bin(1):beta_bin(2)), beta_power);
    xlabel('Frequency (Hz)');
    ylabel('Power Spectral Density');
    title('beta Band');

    subplot(6,1,6);
    plot(f(gamma_bin(1):gamma_bin(2)), gamma_power);
    xlabel('Frequency (Hz)');
    ylabel('Power Spectral Density');
    title('Gamma Band');
end
