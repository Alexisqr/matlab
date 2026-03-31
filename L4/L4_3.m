% Для очищення простору
clear;
close all;
clc;



images = {'cameraman.tif', 'moon.tif'};
sigma = 5;

for i = 1:length(images)
    
    f = imread(images{i});
    
    if size(f,3)==3
        f = rgb2gray(f);
    end
    
    [M, N] = size(f);
    
    % FFT
    F = fft2(f);
    
    % фільтр
    h = fspecial('gaussian', [M N], sigma);
    H = fft2(h);
    
    % Завдання 8: Фільтрація 
    Y = F .* H;
    img_filtered = ifft2(Y);
    
    figure, imshow(f)
    title(['Оригінал - ', images{i}]);
    
    figure, imshow(abs(img_filtered), [])
    title(['Завдання 8: Частотна фільтрація (sigma=', num2str(sigma), ')']);
    
  
end


f = imread('cameraman.tif');

if size(f,3)==3
    f = rgb2gray(f);
end

% Завдання 9: Просторова фільтрація
h_small = fspecial('gaussian', [15 15], 5);

img_spatial = imfilter(f, h_small);

figure, imshow(f)
title('Оригінал');

figure, imshow(img_spatial, [])
title('Завдання 9: Просторова фільтрація');

