% main file
% Paper:Magnetic Resonance Imaging reconstruction via non-convex total variation regularization
% SHEN Marui, LI Jincheng, ZHANG Ya, ZOU Jian*
% zoujian@yangtzeu.edu.cn

clc; clear all; close all

%    I_org = phantom(256);          % Shepp Logan

I_org = imread('data/brain.bmp');   % brain
I_org = im2double(rgb2gray(I_org));

 
%  I_org = imread('data/Brain angiography.jpg'); %  
%  I_org=im2double(I_org);
    

[m, n] = size(I_org);scale = sqrt(m * n);

% load Umask_random_03_01    % Random sampling with 30% sampling rate and 0.05 sampling radius
% R_0 = Umask;

load Umask_Cartesian_100  % Cartesian sampling with 100 readout lines
R_0 = Umask;

% load Umask_radial_10     % Radial sampling with 10 trajectory lines
% R_0 = Umask;


R = fftshift(R_0);
Y = R.*fft2(I_org) / scale;  % k-space data


lamda  = 0.01;  % total variation penalty parameter
rho    = 150;  % augmented Lagrangian parameter
numItr = 100;  % maximum times of iteration
rectol = 1e-4;  % stopping tolerance
I_res = rec_tv(R, Y, lamda, rho, numItr, rectol);%TV-L1
I_res2 = rec_tv2(R, Y, lamda, rho, numItr, rectol);%MCTV-L1
I_res3 = rec_mctv(R, Y, lamda, rho, numItr, rectol);%TV-L2
I_res4 = rec_mctv2(R, Y, lamda, rho, numItr, rectol);%MCTV-L2

ReErr = norm(abs(I_org(:)) - abs(I_res(:))) / norm(abs(I_org(:)));
ReErr2 = norm(abs(I_org(:)) - abs(I_res2(:))) / norm(abs(I_org(:)));
ReErr3 = norm(abs(I_org(:)) - abs(I_res3(:))) / norm(abs(I_org(:)));
ReErr4 = norm(abs(I_org(:)) - abs(I_res4(:))) / norm(abs(I_org(:)));
PSNR = psnr(I_org, abs(I_res));
PSNR2 = psnr(I_org, abs(I_res2));
PSNR3 = psnr(I_org, abs(I_res3));
PSNR4 = psnr(I_org, abs(I_res4));
fprintf('The relative error of TV_L1 reconstruction result is %.4f.\n', ReErr)     
fprintf('The relative error of MCTV_L1 reconstruction result is %.4f.\n', ReErr2)
fprintf('The relative error of TV_L2 reconstruction result is %.4f.\n', ReErr3)
fprintf('The relative error of MCTV_L2 reconstruction result is %.4f.\n', ReErr4)

fprintf('The PSNR of TV_L1 reconstruction result is %.4f.\n', PSNR)                
fprintf('The PSNR of MCTV_L1 reconstruction result is %.4f.\n', PSNR2)
fprintf('The PSNR of TV_L2 reconstruction result is %.4f.\n', PSNR3)
fprintf('The PSNR of MCTV_L2 reconstruction result is %.4f.\n', PSNR4)

plot_res4(I_org, R_0, I_res, I_res2,I_res3, I_res4);


