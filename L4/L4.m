% Для очищення простору
clear;
close all;
clc;

images = {'cameraman.tif', 'moon.tif', 'coins.png'};

for i = 1:length(images)
    
    % Завдання 1: Завантаження
    f = imread(images{i});
    
    if size(f,3) == 3
        f = rgb2gray(f);
    end
    
    figure, imshow(f)
    title(['Завдання 1: Зображення - ', images{i}]);
    
    
    % Завдання 2: Спектр
    F = fft2(f);
    Slog = log(1 + abs(F));
    
    figure, imshow(Slog, [])
    title(['Завдання 2: Спектр - ', images{i}]);
    
    
    % Завдання 3: Центрування
    Fc = fftshift(F);
    Slog_c = log(1 + abs(Fc));
    
    figure, imshow(Slog_c, [])
    title(['Завдання 3: Центрований спектр - ', images{i}]);
    
    
    % Завдання 4: Відновлення
    F_back = ifftshift(Fc);
    img_back = ifft2(F_back);
    
    figure, imshow(abs(img_back), [])
    title(['Завдання 4: Відновлене - ', images{i}]);

end


