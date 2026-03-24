% Для очищення простору
clear;
close all;
clc;

% Завдання 1-2
% Завантаження та відображення стандартних зображень
I = imread('cameraman.tif');
figure, imshow(I);
title('Вихідне зображення');

% Завдання 3-4
% Здійснити процедуру перекручення зображення 
% змінюючи параметри LEN і THETA.
% Відобразити перекручене зображення.

% ЕКСПЕРИМЕНТИ
LEN_values = [10, 30, 50];      % різні довжини змазування
THETA_values = [0, 45, 90];     % різні кути

for i = 1:length(LEN_values)
    for j = 1:length(THETA_values)

        LEN = LEN_values(i);      
        THETA = THETA_values(j);     

        PSF = fspecial('motion', LEN, THETA);

        blurred = imfilter(I, PSF, 'conv', 'circular');

      
        % Завдання 5-6
        % Виконати процедуру відновлення зображення.
        restored = deconvwnr(blurred, PSF, 0);


        % Завдання 7
        % Виконати зашумлення початкового зображення та повторити пункти 2-6.
        noisy = imnoise(blurred, 'gaussian', 0, 0.001);

        restored_noisy = deconvwnr(noisy, PSF, 0.01);

        figure;
        subplot(2,2,1), imshow(I), title('Оригінал');
        subplot(2,2,2), imshow(blurred), title('Змазане');
        subplot(2,2,3), imshow(restored), title('Без шуму');
        subplot(2,2,4), imshow(restored_noisy), title('З шумом');

        sgtitle(['LEN=', num2str(LEN), ', THETA=', num2str(THETA)]);

    end
end