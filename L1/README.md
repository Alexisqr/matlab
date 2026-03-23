# Лабораторна робота № 1
## Мета роботи

Метою даної лабораторної роботи є утворення основних навичок роботи із зображеннями в додатку Image Processing Toolbox середовища MATLAB.

## Хід роботи
### Завдання 1 
Завантажити з бібліотеки MATLAB і відобразити на екрані ПК кілька зображень у різних форматах.
Було завантажено кілька зображень у різних форматах:
-	pout.tif
-	moon.tif
-	peppers.png
  
Зображення були відображені на екрані за допомогою функції imshow().
```
% Завдання 1
% Завантаження та відображення стандартних зображень
img1 = imread('pout.tif'); 
img2 = imread('moon.tif');  
img3 = imread('peppers.png');

figure, imshow(img1), title('pout.tif');
figure, imshow(img2), title('moon.tif');
figure, imshow(img3), title('peppers.png');
```
<img width="507" height="232" alt="image" src="https://github.com/user-attachments/assets/6bd2a176-86b7-49af-a1df-d8efecb2cd47" />

### Завдання 2
Завантажити зображення, що зберігається в довільному каталозі (з безпосередньою вказівкою шляху до нього).
Було завантажено зображення Gingerbread.png із папки MATLAB Drive із прямим зазначенням шляху до файлу.

```
% Завдання 2
% Завантаження зображення, що зберігається в довільному каталозі в мене
% безпосередньо в середовищі
img4 = imread('Image/Gingerbread.png');
figure, imshow(img4),title('Gingerbread.png');
```
<img width="287" height="351" alt="image" src="https://github.com/user-attachments/assets/e72da729-cb85-4208-b805-befa44bef292" />

### Завдання 3
Одержати інформацію про завантажені зображення.
За допомогою функцій whos було визначено:
- розміри зображень-
- кількість каналів (чорно-біле або RGB)
- тип даних (uint8)

```
% Завдання 3
% Одержати інформацію про завантажені зображення
whos img1;
whos img2;
whos img3;
whos img4;
```
<img width="734" height="428" alt="image" src="https://github.com/user-attachments/assets/6bb9d7fc-38a6-4812-90c4-057134092d2a" />

### Завдання 4
Зберегти завантажені зображення в заданому каталозі з указівкою шляху до нього.
Завантажені зображення були збережені у заданому каталозі за допомогою функції imwrite().

```
% Завдання 4
% Зберегти завантажені зображення в заданому каталозі з указівкою шляху 
% до нього.
imwrite(img1, 'Downloads/pout_copy.jpg');
imwrite(img2, 'Downloads/moon_copy.jpg');
imwrite(img3, 'Downloads/peppers_copy.png');
imwrite(img4, 'Downloads/Gingerbread_copy.png');

```

<img width="300" height="172" alt="image" src="https://github.com/user-attachments/assets/bbcc0942-107c-4944-a535-e53e68de4add" />

### Завдання 5
З використанням процедури imhist(I) знайти гістограми розподілу яскравостей завантажених зображень і відобразити їх на екрані ПК.

Для напівтонового зображення була побудована гістограма за допомогою функції imhist(I).

Для кольорового зображення попередньо виконано перетворення у відтінки сірого (rgb2gray), після чого побудовано гістограму.
Гістограма показує розподіл пікселів за рівнями яскравості.

```
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
```

<img width="684" height="428" alt="image" src="https://github.com/user-attachments/assets/edd7fefb-9e23-4ebc-a3c4-e30e24fab101" />

### Завдання 6
З використанням процедури imadjust(I); виконати контрастування зображень.

Для підвищення контрастності використано функцію:

Для підвищення контрастності використано функцію imadjust(I)

Для RGB-зображення контрастування виконано із використанням imadjust(I, stretchlim(I), [])

```
% Завдання 6
% Виконати контрастування
img1_adjust = imadjust(img1);
img2_adjust = imadjust(img2);
img3_adjust = imadjust(img3, stretchlim(img3), []);
img4_adjust = imadjust(img4, stretchlim(img4), []);
```

### Завдання 7
Відобразити зображення з підвищеною контрастністю на екрані ПК.

Після обробки зображення стало більш чітким, темні ділянки стали темнішими, а світлі – світлішими.

```
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
```

<img width="823" height="471" alt="image" src="https://github.com/user-attachments/assets/66d92aca-7903-4758-8bed-a2189edc4c86" />

<img width="797" height="466" alt="image" src="https://github.com/user-attachments/assets/82524262-7d2f-4373-a28e-a55bc84c9738" />

### Завдання 8
Відобразити негатив зображення.

Негатив було отримано за допомогою функції imcomplement(I)

При цьому світлі області стали темними, а темні – світлими.

```
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
```

<img width="748" height="430" alt="image" src="https://github.com/user-attachments/assets/78e8f090-7a8c-4eb2-9f2c-8e355525323d" />

### Завдання 9
З використанням Help MATLAB ознайомитися більш детально з особливостями процедури контрастування зображень imadjust.

```
% Завдання 9
% Ознайомлення з Help
help imadjust
```

<img width="633" height="813" alt="image" src="https://github.com/user-attachments/assets/0ba14490-9ec7-4fb0-8b59-b71cb12c8e64" />

## Висновки
У ході лабораторної роботи було вивчено основні засоби MATLAB для роботи з цифровими зображеннями. Отримано практичні навички завантаження, аналізу та обробки зображень, побудови гістограм, підвищення контрастності та створення негативів.
Було встановлено, що зміна контрастності безпосередньо впливає на розподіл яскравостей зображення, що відображається у зміні гістограми.

## Контрольні запитання

1. Що таке гістограма розподілу яскравостей?

   Гістограма розподілу яскравостей - це графік, який показує, скільки пікселів зображення мають кожний рівень яскравості (0–255).

2. Що таке контрастність зображення?

   Контрастність - це різниця між найтемнішими і найсвітлішими ділянками зображення.

3. Як при контрастуванні змінюється гістограма?

   При підвищенні контрастності гістограма розтягується на ширший діапазон (ближче до 0 і 255), пікселі розподіляються    більш рівномірно.

4. Як зменшити контрастність зображення?

   Потрібно звузити діапазон яскравостей, наприклад за допомогою imadjust із меншим вихідним інтервалом.

5. Як одержати негативне зображення?

   Негатив отримують інверсією яскравостей:
   -	або функцією imcomplement(),
   -	або відніманням значень від максимального (наприклад 255 - I).








