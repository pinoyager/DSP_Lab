%% Spectrogram
%clear ; close all;

%[x,fs] = audioread('SteveJobs.wav');

%%% Record your own sound %%%
% sec = 2;    
% fs = 8000;
% recorder = audiorecorder(fs, 16, 1); 
% recordblocking(recorder, sec); 
% x = getaudiodata(recorder);
% sound(x,fs);
%%% Record your own sound %%%

a = 0.95;
y =filter([1,-a],1,x );     % pre-emphasis
z = zeros(size(y));

%%% You have to set %%% 
n = 20; % number of mel energy bands
% lower bound: 6
% high bound: 200
% Frame + Window + FFT  
dur = 0.02; % sec
hopsize = 0.01;

%%% You have to set %%% 

frame_len = round(dur * fs);
frame_shift = round(hopsize * fs);
Nfft = 1024;
window = hann(frame_len);
[S,freq,~] = spectrogram(y,window,frame_len-frame_shift,Nfft,fs);
MagSpec = abs(S);
Nframes = size(S,2);
%% MFCC
%%% You can revise %%% 
[mfcc, W] = MFCC(MagSpec, n, Nframes, fs, Nfft);
%%% You can revise %%% 

% mfcc(5:20, :) = 0;
% W(5:20, :) = 0;

mfcc(1:4, :) = 0;
W(1:4, :) = 0;

%% inv_MFCC
%%% You can revise %%% 
z = invMFCC(mfcc, W, n, Nframes, fs, frame_len, frame_shift, z);
soundsc(z, fs);
%%% You can revise %%% 