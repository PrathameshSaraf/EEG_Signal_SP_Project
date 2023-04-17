% % clc;
% % clear all;
% % close all;
% % im=imread('x31_f18.tif');
% % subplot(3,3,1);
% % imshow(im);
% % title('Original Image');
% % imnew=imadjust(im);
% % subplot(3,3,2);
% % imshow(imnew);
% % title('Image after Stretching');
% % subplot(3,3,4);
% % imhist(im);
% % title('Original Image Histogram');
% % subplot(3,3,5);
% % imhist(imnew);
% % title('Image Histogram');
% % [row col] = size(im);
% % imhist(im);
% % title('Histogram Stretching');
% % x1=70;
% % x2=180;
% % y1=0;
% % y2=255;
% % m=(y2-y1)/(x2-x1);
% % imnew=m*(im-x1)+y1;
% % title('Histogram Stretching');
% % subplot(3,3,3);
% % imshow(imnew);  
% % title('Image after Equalization');      
% % subplot(3,3,6);
% % imhist(imnew)
% % title('Histogram Equalization');
% 
% 
% img = imread('x31_f18.tif');
% x2=159;
% x1=77;
% y2=255;
% y1=0;
% y=y2-y1;
% x=x2-x1;
% m=y/x;
% [rows, cols] = size(img);
% for i=1:rows
%    for j=1:cols
%      imnew(i, j) = m*(img(i, j)-x1) - y1;
%    end;
% end;
% imnew2=imadjust(img);
% subplot(3,2,1)
% imshow(img)
% subplot(3,2,2)
% imhist(img)
% title("original image")
% subplot(3,2,3)
% imshow(imnew)
% subplot(3,2,4)
% imhist(imnew)
% title("user defined stretching")
% subplot(3,2,5)
% imshow(imnew2)
% subplot(3,2,6)
% imhist(imnew2)
% title("function stretching")
% 
% 



clc;
clear all; 
close all;
im=imread('x31_f18.tif');
imshow(im);
noisyim=imnoise(im,'salt & pepper',0.3);
subplot(2,2,1);
imshow(noisyim);
title('Original Image');

subplot(2,2,2);
imhist(noisyim);
title('Histogram of Original Image');

filteredim=medfilt2(noisyim);
subplot(2,2,3);
imshow(filteredim);
title('Img after noise removal');

subplot(2,2,4);
imhist(filteredim);
title('Histogram after noise removal');
imnew2=imadjust(img);
subplot(3,2,1)
imshow(img)
subplot(3,2,2)
imhist(img)
title("original image")
subplot(3,2,3)
imshow(imnew)
subplot(3,2,4)
imhist(imnew)
title("user defined stretching")
subplot(3,2,5)
imshow(imnew2)
subplot(3,2,6)
imhist(imnew2)
title("function stretching")
