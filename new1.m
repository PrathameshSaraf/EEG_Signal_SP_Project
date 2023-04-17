
% Load the dataset
data1=load("C:\Users\pgsar\Downloads\Subject00_1_edfm.mat");
data=data1.val;

% Define the sampling rate and time vector
fs = 250; % Sampling rate in Hz
t = (0:size(data,2)-1)/fs; % Time vector in seconds

% Apply a bandpass filter to remove noise outside the frequency range of interest
f_low = 0.5; % Lower cutoff frequency in Hz
f_high = 30; % Upper cutoff frequency in Hz
Wn = [f_low f_high]/(fs/2); % Normalized cutoff frequencies
order = 3; % Filter order
[b,a] = butter(order, Wn, 'bandpass'); % Design the filter coefficients
data_filt = filtfilt(b, a, data); % Apply the filter to the data using zero-phase filtering

% Apply a notch filter to remove 50 Hz noise (assuming you are in a country where the power line frequency is 50 Hz)
f_notch = 50; % Notch frequency in Hz
Q = 20; % Quality factor
[b,a] = iirnotch(f_notch/(fs/2), f_notch/(fs/2)/Q);% Design the notch filter coefficients
data_filt = filtfilt(b, a, data_filt); % Apply the filter to the data using zero-phase filtering

% Perform baseline correction to remove any DC offset
data_bc = bsxfun(@minus, data_filt, mean(data_filt,2));

% Calculate the power spectral density (PSD) using Welch's method
window_size = round(fs*2); % 2-second window
noverlap = round(window_size/2); % 50% overlap
nfft = 2^nextpow2(window_size); % Next power of 2 for FFT
[psd, f] = pwelch(data_bc', window_size, noverlap, nfft, fs);

% Plot the PSD
figure;
plot(f, 10*log10(psd));
xlabel('Frequency (Hz)');
ylabel('Power (dB)');
title('Power Spectral Density');

% Calculate the mean PSD across all channels
mean_psd = mean(psd, 2);

% Identify the peak frequency
[peak_power, peak_freq_idx] = max(mean_psd);
peak_freq = f(peak_freq_idx);

% Calculate the wavelet coefficients using a Morlet wavelet
scales = 1:100; % Define the range of scales to analyze
[cfs, frequencies] = cwt(data_bc(1,:), scales, 'morl', 'plot'); % Analyze the first channel as an example

% Calculate the mean wavelet coefficients across all channels
mean_cfs = abs(mean(cfs, 1));

% Calculate statistical measures such as mean, standard deviation, and entropy
mean_val = mean(data_bc, 2);
std_val = std(data_bc, 0, 2);
% Calculate the entropy of the data using the Shannon entropy formula
hist_counts = histcounts(data_bc(:), 'Normalization', 'probability');
entropy_val = -sum(hist_counts.*log2(hist_counts));

% Perform classification using a support vector machine (SVM) classifier
% Note: This part of the code assumes that you have already split your dataset into training and testing sets (X_train, y_train, X_test, y_test)

% Train the SVM classifier using the training data
svm_model = fitcsvm(X_train, y_train);

% Use the trained SVM model to predict the class labels of the test data
y_pred = predict(svm_model, X_test);

% Evaluate the accuracy of the classifier
accuracy = sum(y_pred==y_test)/length(y_test);

% Finally, interpret the results to draw meaningful conclusions about the data
