function [z] = invMFCC(mfcc, W, n, Nframes, fs, frame_len, frame_shift, z)
%% input
% mfcc = MFCC parameter
% w = the triangular window fliter
% n = # of MFCC paramrter
% Nframes = # of Frame
% fs = frame rate
% frame_len = according to your set of duration
% frame_shift = according to your set of hopsize
%% output 
% z =  synthesis sound by inv-MFCC
WW = W*W';
WW = WW + trace(WW)*10^(-3)*eye(length(WW));
LeftMultiplier = W'/(WW);% to calculate least-square pseudo inverse

for nn = 1:Nframes
    Yhat = exp(idct(mfcc(:,nn)));
    Xhat = LeftMultiplier * Yhat;
    speclen = length(Xhat);
    Xhat(2:end-1) = Xhat(2:end-1).*exp(i*2*pi*rand(speclen-2,1)); % phase randomization
    XhatDoubleSide = [Xhat; conj(Xhat(end-1:-1:2))];
    xhat = ifft(XhatDoubleSide);
    tt = (nn-1)*frame_shift+1: (nn-1)*frame_shift+frame_len;
    z(tt) = z(tt)+ xhat(1:frame_len);
end
