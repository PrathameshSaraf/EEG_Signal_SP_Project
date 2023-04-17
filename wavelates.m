% Load the EEG data
 data=load('C:\Users\pgsar\Downloads\Subject00_1_edfm.mat');
 eeg_data=data.val;

% Reshape the input signal into a 1-dimensional vector
eeg_data = eeg_data(1,:);

% Perform wavelet decomposition using db4 wavelet
[C, L] = wavedec(eeg_data, 5, 'db4'); % Perform 5-level wavelet decomposition using db4 wavelet
% Visualize the wavelet decomposition
A5 = appcoef(C, L, 'db4', 5); % Approximation coefficients at level 5
D5 = detcoef(C, L, 5); % Detail coefficients at level 5
D4 = detcoef(C, L, 4); % Detail coefficients at level 4
D3 = detcoef(C, L, 3); % Detail coefficients at level 3
D2 = detcoef(C, L, 2); % Detail coefficients at level 2
D1 = detcoef(C, L, 1); % Detail coefficients at level 1

subplot(6,1,1); plot(eeg_data); title('Original Signal');
subplot(6,1,2); plot(A5); title('Approximation Coefficients at Level 5');
subplot(6,1,3); plot(D4); title('Detail Coefficients at Level 4');
subplot(6,1,4); plot(D3); title('Detail Coefficients at Level 3');
subplot(6,1,5); plot(D2); title('Detail Coefficients at Level 2');
subplot(6,1,6); plot(D1); title('Detail Coefficients at Level 1');


