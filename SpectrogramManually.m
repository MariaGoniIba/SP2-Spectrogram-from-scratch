clear; clc; close all

% Plot manually a time-frequency plot
load spectral_codeChallenge.mat

figure(1)
plot(time,signal)
title('Original signal')
xlabel('seconds')

N = length(signal);

% "manual" Welch's method

% 500ms window length in seconds*srate
winlength = 0.5*srate; 

% number of points of overlap
nOverlap = 0;   %round(srate);

% window onset times
winonsets = 1:winlength-nOverlap:N-winlength;

% note: different-length signal needs a different-length Hz vector
hzW = linspace(0,srate/2,floor(winlength/2)+1);

% Hann window
hannw = .5 - cos(2*pi*linspace(0,1,winlength))./2;

% initialize the power matrix (windows x frequencies)
spow=[];

% loop over frequencies
for wi=1:length(winonsets)

    % get a chunk of data from this time window
    datachunk = signal(winonsets(wi):winonsets(wi)+winlength-1);
    
    % apply Hann taper to data
    datachunk = datachunk .* hannw;
    
    % compute its power and enter into matrix
    tmppow = abs(fft(datachunk)/winlength).^2;
    
    % power matrix
    spow = [spow; tmppow(1:length(hzW))];
end

% Plot spectrogram
imagesc(winonsets,hzW,spow')
axis xy % to flip the plot
ylim([0 40])
set(gca,'XTickLabel',[-2.75:2.75])
xlabel("Time (seconds)")
ylabel("Frequency (Hz)")
title('Spectrogram')
