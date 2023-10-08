clc
clear
global l
%%  A demo for  CMIS-GPR
% E-mail: yurowang@163.com
% For paper:A contrast enhancement method in aero  thermal radiation images based on cyclic multi-scale illumination self-similarity and gradient perception regularization
% Author: Yu Wang, all rights reserved, nanjing university of science and technology

pause(0.1)
jmax=10; kmax=10;
l=0;% padding
%% Input
I2= im2double(imread('1.bmp'));

I2 = padarray(I2, [l, l], 'symmetric', 'pre');
I2= padarray(I2, [l, l], 'symmetric', 'post');
%% dense noise sample
[X,Y] = meshgrid(-200:215,-200:215);
G = exp(-(X.^2+Y.^2)/(2*50^2));
G = G./sum(sum(G));
G=imresize(G,size(I2));
k=10;
I2=mat2gray((I2)+k*mat2gray(G));


 %% CMIS-GPR
[out]= CMIS_GPR(I2,jmax,kmax) ;

%% show
 [m1,n1]=size(I2);
degraded=I2(l+1:m1-l,l+1:n1-l);

 subplot(1,2,1)
 imshow(mat2gray(degraded))
 subplot(1,2,2)
 imshow(mat2gray(out))

