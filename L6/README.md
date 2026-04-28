# Лабораторна робота № 6
## Мета роботи

Метою даної лабораторної роботи є набуття знань про існуючи
методи стиснення зображень та ознайомитися з основними з них.

### Завдання 1
Завантажте з бібліотеки MATLAB кілька різних зображень.

У цьому завданні були завантажені тестові зображення з бібліотеки MATLAB
за допомогою функції imread. Для відображення зображень була використана функція imshow. 
Команда figure створює нове вікно для кожного зображення, а функція title додає підпис до нього.

```
I1 = imread('cameraman.tif');
I2 = imread('peppers.png');
I3 = imread('autumn.tif');

imgs = {I1, I2, I3};
n = length(imgs);

figure(1); clf;
for i = 1:n
    subplot(1,n,i);
    imshow(imgs{i});
    title(['Original ', num2str(i)]);
end

```

<img width="417" height="206" alt="image" src="https://github.com/user-attachments/assets/95c75645-8abf-4926-aa2a-74a74a6e1c3f" />



### Завдання 2

З використанням функції rgb2gray перетворіть кольорові зображення в чорно-білі. Відобразіть результат.

На даному етапі було виконано перетворення кольорових зображень у відтінки сірого за допомогою функції rgb2gray.
Для кожного зображення відображено одночасно оригінал та його чорно-білу версію. Результати згруповані в одному
вікні для зручного порівняння

```
grayImgs = cell(1,n);

figure(2); clf;
for i = 1:n
    
    img = imgs{i};
    
    if size(img,3)==3
        grayImgs{i} = rgb2gray(img);
    else
        grayImgs{i} = img;
    end
    
    subplot(2,n,i);
    imshow(imgs{i});
    title(['Original ', num2str(i)]);
    
    subplot(2,n,i+n);
    imshow(grayImgs{i});
    title(['Gray ', num2str(i)]);
    
end

```

<img width="431" height="537" alt="image" src="https://github.com/user-attachments/assets/9dac86ce-a067-47b7-a24b-2fc5f5d4a135" />

### Завдання 3

З використанням функції B = blockproc(I,[N N],dct) і процедури
dct = @(block_struct)T*block_struct.data*T'; виконайте поблочне
дискретне косинусне перетворення зображень.

До кожного зображення застосовано поблочне дискретне косинусне перетворення (ДКП) з розбиттям на блоки 8×8.
Це дозволяє перейти від просторового представлення зображення до частотного.

```
T = dctmtx(8);
dctImgs = cell(1,n);

for i = 1:n
    I = im2double(grayImgs{i});
    
    dctImgs{i} = blockproc(I, [8 8], ...
    @(block_struct) T * block_struct.data * T', ...
    'PadPartialBlocks', true, ...
    'PadMethod', 'replicate');
end

```

### Завдання 4

Відобразіть результат поблочного ДКП усього вихідного зображення з
використанням функції imshow. Під час відображення масиву ДКП-коефіцієнтів
використовуйте логарифмічний масштаб. Поясніть вигляд отриманого
зображення.

Відображено спектр ДКП у логарифмічному масштабі, що дозволяє краще побачити розподіл коефіцієнтів.
Основна енергія зосереджена в низькочастотній області (верхній лівий кут).

```
figure;
for i = 1:n
    subplot(2,n,i);
    imshow(grayImgs{i});
    title(['Gray ', num2str(i)]);
    
    subplot(2,n,i+n);
    imshow(mat2gray(log(abs(dctImgs{i})+1)));
    title(['DCT log ', num2str(i)]);
end

```

<img width="407" height="391" alt="image" src="https://github.com/user-attachments/assets/6171805a-c889-4ae6-a8b5-b3da7b570a2b" />

### Завдання 5

З використанням процедур invdct = @(block_struct) T' *
block_struct.data * T; і I2 = blockproc(B,[8 8],invdct); відновіть
зображення за його ДКП-спектром.

Виконано зворотне ДКП для відновлення зображення з його спектра. 
Отримане зображення практично не відрізняється від оригіналу, що підтверджує коректність перетворення.

```
invdct = @(block_struct) T' * block_struct.data * T;
reconImgs = cell(1,n);

figure;
for i = 1:n
    reconImgs{i} = blockproc(dctImgs{i}, [8 8], invdct, ...
    'PadPartialBlocks', true, ...
    'PadMethod', 'replicate');
    
    subplot(2,n,i);
    imshow(grayImgs{i});
    title(['Original ', num2str(i)]);
    
    subplot(2,n,i+n);
    imshow(reconImgs{i}, []); % ВАЖЛИВО
    title(['Reconstructed ', num2str(i)]);
end
```

<img width="404" height="408" alt="image" src="https://github.com/user-attachments/assets/e44e9cd4-cfbf-40fc-9248-be5d581798ac" />

### Завдання 6

З використанням процедури цілочислового ділення/множення J =
N*round(J/N); виконайте квантування результатів ДКП для різних значень
кроку квантування N. Поясніть, як працює ця процедура, і що отримується в її
результаті.

Застосовано квантування коефіцієнтів ДКП шляхом округлення до значень, кратних N. 
Це призводить до зменшення точності та появи значних спотворень у зображенні.

```
N = 2 ;
quantImgs = cell(1,n);

figure;
for i = 1:n
    Bq = N * round(dctImgs{i} / N);
    
    quantImgs{i} = blockproc(Bq, [8 8], invdct, ...
    'PadPartialBlocks', true, ...
    'PadMethod', 'replicate');
    subplot(2,n,i);
    imshow(grayImgs{i});
    title(['Original ', num2str(i)]);
    
    subplot(2,n,i+n);
       imshow(quantImgs{i}, []);
    title(['Quant N=', num2str(N)]);
end
```

### Завдання 7

Виконаєте квантування коефіцієнтів ДКП, використовуючи процедуру

Квантування виконано за допомогою маски, яка зберігає лише низькочастотні коефіцієнти, а високочастотні обнуляє.
У результаті зображення втрачає дрібні деталі та стає більш згладженим.

```
mask = [1 1 1 1 0 0 0 0;
        1 1 1 0 0 0 0 0;
        1 1 0 0 0 0 0 0;
        1 0 0 0 0 0 0 0;
        0 0 0 0 0 0 0 0;
        0 0 0 0 0 0 0 0;
        0 0 0 0 0 0 0 0;
        0 0 0 0 0 0 0 0];

maskImgs = cell(1,n);

figure;
for i = 1:n
    
   Bmasked = blockproc(dctImgs{i}, [8 8], ...
    @(block_struct) block_struct.data .* mask, ...
    'PadPartialBlocks', true, ...
    'PadMethod', 'replicate');
   
    maskImgs{i} = blockproc(Bmasked, [8 8], invdct, ...
    'PadPartialBlocks', true, ...
    'PadMethod', 'replicate');
    
    subplot(2,n,i);
    imshow(grayImgs{i});
    title(['Original ', num2str(i)]);
    
    subplot(2,n,i+n);
    imshow(maskImgs{i}, []);
    title(['Mask Quant ', num2str(i)]);
end
```

### Завдання 8

З використанням процедур invdct = @(block_struct) T' *
block_struct.data * T; і I2 = blockproc(B,[8 8],invdct);
відновіть зображення за його квантованим ДКП-спектром.(зроблено в 6-7)

Після квантування виконано зворотне ДКП для відновлення зображення.
Отриманий результат містить втрати якості, що є наслідком видалення частини частотної інформації.

<img width="403" height="381" alt="image" src="https://github.com/user-attachments/assets/692aeae4-13ac-4d85-996d-2b6f9063d428" />

<img width="401" height="414" alt="image" src="https://github.com/user-attachments/assets/d34fed03-5a07-415d-84c0-c6a72e263d3f" />

### Завдання 9

Поясніть, отриманий результат і яка мета досягається квантуванням
коефіцієнтів ДКП?

Отриманий результат показує, що після квантування та зворотного ДКП зображення відновлюється із втратами якості:
з’являється розмиття, можуть зникати дрібні деталі та іноді помітні блокові артефакти. 
Це відбувається тому, що під час квантування частина коефіцієнтів ДКП змінюється або обнуляється, особливо 
у високочастотній області, яка відповідає за деталі зображення.

Метою квантування коефіцієнтів ДКП є зменшення обсягу даних шляхом зниження точності представлення інформації.
Завдяки цьому більшість коефіцієнтів стають малими або нульовими, що значно спрощує їх подальше стиснення,
навіть незважаючи на певну втрату якості зображення.
