% Define the transfer function H(z) = (z^2 - 0.5z + 1)/(z^3 - 0.9z^2 + 0.2z + 0.1)
b = [1 -0.5 1];
a = [1 -0.9 0.2 0.1];


% Convert the transfer function to zero-pole-gain form
[z, p, k] = tf2zp(b, a);

% Print the zeros, poles, and gain
disp('Zeros:');
disp(z);
disp('Poles:');
disp(p);
disp('Gain:');
disp(k);

% Convert the zero-pole-gain form back to a transfer function
[b_new, a_new] = zp2tf(z, p, k);
 
% Reverse the order of the coefficients
b_new = fliplr(b_new);
a_new = fliplr(a_new);

b = [2 3];
a = [1 1/sqrt(2) 1/4];

[b,a] = eqtflength(b,a);
[z,p,k] = tf2zp(b,a); 
zplane(b,a)
text(real(z)+0.1,imag(z),"Zero")
text(real(p)+0.1,imag(p),"Pole")

% Verify that the new transfer function matches the original transfer function
disp('Original transfer function:');
disp(tf(a, b));
disp('New transfer function:');
disp(tf(a_new, b_new));

% Plot the poles and zeros in the complex plane
figure;
pzmap(tf(a, b));
title('Pole-Zero Map');