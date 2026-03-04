% Для очищення простору
clear;
close all;
clc;

% Завдання 1
% Завантаження та відображення стандартних зображень
img1 = imread('pout.tif'); 
img2 = imread('moon.tif');  
img3 = imread('peppers.png');

figure, imshow(img1), title('pout.tif');
figure, imshow(img2), title('moon.tif');
figure, imshow(img3), title('peppers.png');

% Завдання 2
% Завантаження зображення, що зберігається в довільному каталозі в мене
% безпосередньо в середовищі
img4 = imread('Image/Gingerbread.png');
figure, imshow(img4),title('Gingerbread.png');

% Завдання 3
% Одержати інформацію про завантажені зображення
whos img1;
whos img2;
whos img3;
whos img4;

% Завдання 4
% Зберегти завантажені зображення в заданому каталозі з указівкою шляху 
% до нього.
imwrite(img1, 'Downloads/pout_copy.jpg');
imwrite(img2, 'Downloads/moon_copy.jpg');
imwrite(img3, 'Downloads/peppers_copy.png');
imwrite(img4, 'Downloads/Gingerbread_copy.png');

% Завдання 5
% Побудувати гістограми яскравостей
figure, imhist(img1);
title('Гістограма pout.tif');

figure, imhist(img2);
title('Гістограма moon.tif');

img3_gray = rgb2gray(img3);
figure, imhist(img3_gray);
title('Гістограма peppers (gray)');

img4_gray = rgb2gray(img4);
figure, imhist(img4_gray);
title('Гістограма Gingerbread (gray)');

% Завдання 6
% Виконати контрастування
img1_adjust = imadjust(img1);
img2_adjust = imadjust(img2);
img3_adjust = imadjust(img3, stretchlim(img3), []);
img4_adjust = imadjust(img4, stretchlim(img4), []);

% Завдання 7
% Відобразити зображення з підвищеною контрастністю

figure, imshow(img1), title('Оригінал img1');
figure, imshow(img1_adjust), title('Підвищена контрастність img1');

figure, imshow(img2), title('Оригінал img2');
figure, imshow(img2_adjust), title('Підвищена контрастність img2');

figure, imshow(img3), title('Оригінал img3');
figure, imshow(img3_adjust), title('Підвищена контрастність img3');

figure, imshow(img4), title('Оригінал img4');
figure, imshow(img4_adjust), title('Підвищена контрастність img4');

% Завдання 8
% Відобразити негатив зображення

img_negative = imcomplement(img1);
figure, imshow(img_negative), title('Негатив img1');

img_negative = imcomplement(img2);
figure, imshow(img_negative), title('Негатив img2');

img_negative = imcomplement(img3);
figure, imshow(img_negative), title('Негатив img3');

img_negative = imcomplement(img4);
figure, imshow(img_negative), title('Негатив img4');

% Завдання 9
% Ознайомлення з Help
help imadjust

% Завдання 10
% Відповіді на контрольні питання

% 1. Що таке гістограма розподілу яскравостей?
% Гістограма розподілу яскравостей - це графік, який показує,
% скільки пікселів зображення мають кожний рівень яскравості (0–255).

% 2. Що таке контрастність зображення?
% Контрастність - це різниця між найтемнішими і найсвітлішими
% ділянками зображення.

% 3. Як при контрастуванні змінюється гістограма?
% При підвищенні контрастності гістограма розтягується
% на ширший діапазон (ближче до 0 і 255),
% пікселі розподіляються більш рівномірно.

% 4. Як зменшити контрастність зображення?
% Потрібно звузити діапазон яскравостей,
% наприклад за допомогою imadjust із меншим вихідним інтервалом.

% 5. Як одержати негативне зображення?
% Негатив отримують інверсією яскравостей:
% або функцією imcomplement(),
% або відніманням значень від максимального (наприклад 255 - I).