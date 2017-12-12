%% Digital Image and Video Processing(University of Maryland College Park) - Final Porject(Spring 2015)
% Developer: Amirsina Torfi(amirsina.torfi@gmail.com)
% 
%  This file is the main file for executing the software. This software get
%  and image and extract and reconstruct the QR-code within. After Pattern
%  Recognition the software decode the message within the QR-code and
%  display it.
%
% This software is solely for QR-codes version 1 through 6.
%
% Some functions called by this main function:
%     GetPattern_message_Fn.m
%
% Inputs:
%          module: QR-code module which cannot be automatically detected by software.
%          Im: Input image
%          AP_h_check: Authorization for horizontally check the alignment
%          pattern(See documentation)
% Outputs:
%          Msg: Message within the QR-code
%          QR: QR-code pattern

%% ====================== Part 1: Basic inputs ==============================
clc
clear all
close all
global module       % Global definition for being used in other subfunctions.
% Input dialog
prompt = {'Please input the version:'};
dlg_title = 'Version';
num_lines = 1;
def = {'2'};
answer = inputdlg(prompt,dlg_title,num_lines,def);
[version, ~] = str2num(answer{1});
module=4*version+17;    % Number of modules(General formula=4*(Version Number)+17)  

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   INPUT THE IMAGE HERE   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Im = imread('left5.jpg');     % Input image.
tic     % Start the timing process

%% ====================== Part 2: Horizontal check ratio request for validating Alignment pattern ===========
% Construct a questdlg with three options
choice = questdlg('Would you prefer horizontal check_ratio for validating Alignment Pattern?', ...
	'AP Validation,Horizontal Check', ...
	'Yes','No','Yes');
% Handle response
switch choice
    case 'Yes'

        AP_h_check = 1;
    case 'No'

        AP_h_check = 0;

end

%% ====================== Part 3: Recalling the main function for pattern recognition and message extraction =====
[Msg,QR,FIPs,FIP_L,AP_Loc] = GetPattern_message_Fn(Im,AP_h_check);
% End the timing process
toc


%% Compare with reference
%% 296 Code Cuztomization

%Reference QR image convert to binary
reference = imread('test2.jpg');   
I = rgb2gray(reference);
Th = graythresh(reference);
Out = imbinarize(I,Th);

%Resize the images
Im_binary=imresize(Out, [100 100], 'nearest');
QR =imresize(QR, [100 100], 'nearest');

% Norm of difference. If below tolerance, output the x and y global
% coordinates(longitude,latitude)
if norm(Im_binary-QR) <= 1e-5
    coor = [31.9; 99.1];    %Assuming this is longitude latitude
    norm(Im_binary-QR)
else
    disp('QR code not detected');
end

% Find the center of the QR pattern
QRcenter = [(FIP_L(1,2)+FIP_L(3,2))/2; (FIP_L(1,1)+FIP_L(3,1))/2];

% Read the QR-code message
figure;
subplot(1,3,1)
imshow(Im);
hold on;
scatter(QRcenter(1),QRcenter(2),'r')
title('Main Image')
subplot(1,3,2)
imshow(QR)
title('Reconstructed QR-code')
subplot(1,3,3)
imshow(reference);
title('Reference image');
