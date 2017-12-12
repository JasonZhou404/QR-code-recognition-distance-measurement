reference = imread('left.jpg');
reference1 = imread('left11.jpg');
reference2 = imread('left22.jpg');
reference3 = imread('left3.jpg');
reference4 = imread('left4.jpg');
reference5 = imread('left5.jpg');
reference6 = imread('left6.jpg');
img = imresize(reference, [500 500], 'nearest');
img1 = imresize(reference1, [500 500], 'nearest');
img2 = imresize(reference2, [500 500], 'nearest');
img3 = imresize(reference3, [500 500], 'nearest');
img4 = imresize(reference4, [500 500], 'nearest');
img5 = imresize(reference5, [500 500], 'nearest');
img6 = imresize(reference6, [500 500], 'nearest');
%%
close all
figure()
imshow(img);
hold on;
scatter(265,265);
%%
close all
figure()
imshow(img1);
hold on;
scatter(240,120);
%%
close all
figure()
imshow(img2);
hold on;
scatter(210,305);
%%
close all
figure()
imshow(img3);
hold on;
scatter(175,253);
%%
close all
figure()
imshow(img4);
hold on;
scatter(193,250);
%%
close all
figure()
imshow(img5);
hold on;
scatter(110,400);
%%
close all
figure()
imshow(img6);
hold on;
scatter(250,227);



