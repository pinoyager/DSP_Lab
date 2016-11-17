function [mfcc,W] = MFCC(MagSpec, n, Nframes, fs, Nfft)
%% input
% MagSpec = the absolute of spectrogram
% n = # of MFCC parameter
% Nframes = # of Frame
% frame_len = according to your set of duration
% fs = frame rate
%% output 
% mfcc = MFCC parameter
% w = the triangular window fliter
%% Triangular BPF
% convert to mel-freq
mel_max = 2595*log10(1+ (fs/2)/700);
mel_freq = (1:n+1) * mel_max/(n+1);
% convert to freq

%% Def of mel frequency bands
% freq_center = 700*((10.^(mel_freq./2595))-1);
% 
% centerf = round(freq_center ./((fs/2)/(Nfft/2+1)));  % central peak index
% startf = [1,centerf(1:n-1)];                         % start index
% stopf = [centerf(2:n),(Nfft/2)+1];                   % stop  index
 
%% Creating the triangular filters 
freq_idx = (0:Nfft/2)/(Nfft/2)*fs/2;
high_freq = fs/2;
mel_high_freq = log(high_freq/700+1)*1125;
mel_freq = (0:n+1)/(n+1)*mel_high_freq;
mel_freq = (exp(mel_freq/1125)-1)*700;
W = zeros(n,Nfft/2+1);

for i = 1:n
    [~,idx_low] = min(abs(mel_freq(i)-freq_idx));
    [~,idx_median] = min(abs(mel_freq(i+1)-freq_idx));
    [~,idx_high] = min(abs(mel_freq(i+2)-freq_idx));
    up_length = (idx_median-idx_low);
    down_length = (idx_high-idx_median);
    W(i,idx_low:idx_median) = (0:up_length)/up_length;
    W(i,idx_median:idx_high) = (down_length:-1:0)/down_length;
end


for nn = 1:Nframes
    melEnergy = W*MagSpec(:,nn); % inner products
    mfcc(:,nn) = dct(log(melEnergy));
end