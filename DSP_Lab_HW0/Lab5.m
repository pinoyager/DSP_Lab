close;
clear;
clc;

%% read image
filename = 't_mac_dunk.jpg';
I = imread(filename);
figure('name', 'source image');
imshow(I);

%% ----- pre-lab ----- %%
% output = function(input1, input2, ...);
% grey_scale function
I2 = grey_scale(I);

%% ----- homework lab ----- %%
% flip function
I3 = flip(I,0);
I4 = flip(I,1);
I5 = flip(I,2);

% rotation function
I6 = rotation(I, pi/3);

%% show image
figure('name', 't_mac grey scale image'),
imshow(I2);

figure('name', 't_mac flip horizontal'),
imshow(I3);

figure('name', 't_mac flip vertical'),
imshow(I4);

figure('name', 't_mac flip vertical and horizontal'),
imshow(I5);
%}
figure('name', 't_mac rotation 60 degree'),
imshow(I6);
%% write image
% save image for your report

filename2 = 'tmac_gray_image.jpg';
imwrite(I2, filename2);
imwrite(I3, 'tmac_fliplr.jpg');
imwrite(I4, 'tmac_flipud.jpg');
imwrite(I5, 'tmac_fliplr_and_flipud.jpg');
imwrite(I6, 'tmac_rotate_60degree.jpg');


