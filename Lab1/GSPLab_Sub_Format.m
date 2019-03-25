%% EED364 : Grpah Signal Processing |[Lab-1]|                                       
% * Author: _Name_(1412001XXX)_ @ SNU MaiL ID
% * Lab Instructor: _Prof.Vijay Kumar Chakka_   
%% Objective: 
% Data Handling (Write your brief description what you have done)
%% Program: 
clc;
clear all;
close all;

% * |*Matlab Commands for Speech or Audio Reading and Writitings*|
[y,Fs] = audioread('Signal_Processing_Audio.mp3');
dt = 1/Fs;
t = 0:dt:4;
y = y(:,1);
%%
% * |*Matlab Commands for Image Reading and Writiting*|
Orgb = imread('RGB_Image.jpg');
%% Results:
% * |*Plot for the Question No*|
figure;plot(t,y(1:length(t)));
title('Speech Signal');xlabel('Time [Sec]');ylabel('Amplitude');
audiowrite('Created_Audio.wav',y(1:length(t)),Fs);
sound(y(1:length(t)),Fs);
%%
% * |*Plot for the Question No*|
figure;imshow(Orgb);title('Image Read');
%%
