%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This script tests your implementation of seamCarving function, and you can 
% also use it for resizing your own images.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Clear all
clear; close all; clc;

%% Load data
image = imread('../data/sea.jpg');
sz = size(image);
% resize image to half size
image = imresize(image, [floor(sz(1)/3), floor(sz(2)/3)]);
sz = size(image);
figure
imshow(image)

%% Image resizing
% apply seam carving
tic
image_seamCarving = seamCarving(double(image), [sz(1), floor(sz(2)/2)]);
figure
imshow(uint8(image_seamCarving))
imwrite(uint8(image_seamCarving),'../index_files/sea_seamCarving.jpg')

toc
% apply scaling 
image_scaling_width = imresize(image, [sz(1), floor(sz(2)/2)]);
figure
imshow(image_scaling_width)
imwrite(image_scaling_width,'../index_files/sea_scaling.jpg')

% apply cropping 
image_crop_width = imcrop(image, [1, 1, floor(sz(2)/2), sz(1)]);
figure
imshow(image_crop_width)
imwrite(image_crop_width,'../index_files/sea_crop.jpg')


