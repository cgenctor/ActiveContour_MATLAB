%% CRV_12_activecontour
% name : Candas Genctor

%% clean up 
clear;
close all;
clc;
%% Gray-scale Image
I = imread('ActiveContourTestImages/ac01-star.png');
imshow(I)
title('Original Image with noise')
%% preprocessing
Img = im2bw(I); % image is binarized. it includes now 0s and 1s
%Img(:) = ~Img;
Img = medfilt2(Img); % to remove the salt and pepper noise from the original image
%imshowpair(Img,I,'montage')
imshow(Img)
%title('Original Image And Without Noise')
%% let the user choose an initial curve and close the figure afterwards.
mask = roipoly(Img);
%% to extract the boundary of the object
bw = activecontour(Img,mask,200,'edge');
%%
%hold on;
%visboundaries(bw,'Color','r'); 
%% Create a maximized figure and plot the initial and the final curve on the original image.
figure()
imshow(I)
hold on;
% a = labeloverlay(I,mask);          
% b = labeloverlay(I,bw);
a = visboundaries(mask,'Color','b');           
b = visboundaries(bw,'Color','r'); 
% imshowpair(a,b,'montage')
hold off;
%% Gray-scale Image
I = imread('ActiveContourTestImages/ac02-SubjectiveContourIllusion.png');
%imshow(I)
%title('Subjective contour illusion')
%% let the user choose an initial curve and close the figure afterwards.
mask = roipoly(I);
%% to extract the boundary of the object
bw = activecontour(I,mask,200,'edge');
%% Create a maximized figure and plot the initial and the final curve on the original image.
figure()
imshow(I)
hold on;
% a = labeloverlay(I,mask);          
% b = labeloverlay(I,bw);
a = visboundaries(mask,'Color','b');           
b = visboundaries(bw,'Color','r'); 
% imshowpair(a,b,'montage')
hold off;
% the variation problem solved by the snake is very closely related to a
% variational formulation proposed by Brady et al. for the information of
% subjective contours. Ullman's proposal of interpolation using piecewise
% circular arcs would probably also produce a very similar interpolation. 
% An appealing aspect of the snake model is that the same snake that finds 
% subjectives contours can very efficiently find more traditional edges in 
% natural imagery. Basically draw the contour very close to subjective
% contours.
%% Gray-scale Image
I = imread('ActiveContourTestImages/ac03-prostate.png');
%% preprocesing
pout = imread('ActiveContourTestImages/ac03-prostate.png');
pout_imadjust = imadjust(pout);
pout_histeq = histeq(pout);
pout_adapthisteq = adapthisteq(pout);
% montage({pout,pout_imadjust,pout_histeq,pout_adapthisteq},'Size',[1 4])
% title("Original Image and Enhanced Images using imadjust, histeq, and adapthisteq")
%% let the user choose an initial curve and close the figure afterwards.
mask = roipoly(pout_adapthisteq);
%% to extract the boundary of the object
bw = activecontour(pout_adapthisteq,mask,200,'edge');
%% Create a maximized figure and plot the initial and the final curve on the original image.
figure()
imshow(pout)
hold on;
% a = labeloverlay(I,mask);          
% b = labeloverlay(I,bw);
a = visboundaries(mask,'Color','b');           
b = visboundaries(bw,'Color','r'); 
% imshowpair(a,b,'montage')
hold off;
