close;
clear;
clc;

%% read image
filename = 'image.jpg';
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
I6 = rotation(I, pi);

%% show image
figure('name', 'grey scale image'),
imshow(I2);

figure('name', 'flip horizontal'),
imshow(I3);

figure('name', 'flip vertical'),
imshow(I4);

figure('name', 'flip vertical and horizontal'),
imshow(I5);
%}
figure('name', 'rotation 180 degree'),
imshow(I6);
%% write image
% save image for your report

filename2 = 'gray_image.jpg';
imwrite(I2, filename2);
imwrite(I3, 'fliplr.jpg');
imwrite(I4, 'flipud.jpg');
imwrite(I5, 'fliplr_and_flipud.jpg');
imwrite(I6, 'rotate_180degree.jpg');


