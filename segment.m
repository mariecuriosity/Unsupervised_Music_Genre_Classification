%% input mp3 (location to mp3 file) and segments (time points of segment boundaries)
%Outputs mfc, energy, delta, and delta-delta coefficients of segments
function [mfc] = segment(mp3,segments)
	[data, Fs] = audioread(mp3);
    data = data(:,1);
    for i = 1:(length(segments)-1)
        d_start = floor(segments(i)*Fs);
        d_end = floor(segments(i+1)*Fs-1);
        dat = data(d_start:d_end);
        mfc{i} = melcepst(dat,Fs,'0EdD',12); %Mel-Frequency Cepstral Coefficients
    end
end    