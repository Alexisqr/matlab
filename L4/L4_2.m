% Для очищення простору
clear;
close all;
clc;


f = imread('cameraman.tif');
if size(f,3)==3
    f = rgb2gray(f);
end

[M, N] = size(f);

sigma_values = [1, 5];

for s = 1:length(sigma_values)
    
    sigma = sigma_values(s);
    
    % Завдання 5: Вікно фільтра
    h = fspecial('gaussian', [M N], sigma);
    
    figure, imshow(h, [])
    title(['Завдання 5: Вікно фільтра, sigma = ', num2str(sigma)]);
    
    
    % Завдання 6: Частотна характеристика
    H = fft2(h);
    Hc = fftshift(H);
    
    figure, imshow(log(1 + abs(Hc)), [])
    title(['Завдання 6: АЧХ, sigma = ', num2str(sigma)]);
    
end



