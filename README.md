# Signal Processing (DS) project 2: Computing an spectrogram manually

# Credit
The dataset and proposal of the exercise is from the Udemy course [Signal Processing Problems, solved in Matlab and in Python](https://www.udemy.com/course/signal-processing/). I highly recommend this course for those learning signal processing.

# Why spectrogram? Brief theory 
When applying the FFT to the entire signal, the signal is treated as if it were static.

If there are non-stationaries in the signal, that is, the characteristics of the signal change over time, a more appropriate technique is called the Welch's method.
With Welch’s method, we cut the signal in windows and apply the FFT in each window. Finally, you average the power spectrum of all windows together.
This method increases the signal to noise ratio compared with the FFT. If the features of the signal are the same over time, then both results with the FFT and the Welch's method will be the same. 

However, in some signals those changes over time are the ones you want to investigate. Therefore, Welch's method is not good since it averages all the individual window's together. 
An alternative to understand how spectral features change over time is to compute a time-frequency analysis, also knows as spectrogram.

# Proposal
The goal of the exercise is to compute manually (no spectrogram function) the spectrogram of the following chirp.
<p align="center">
    <img width="400" src="https:/originalsignal">
</p>

# Solution
I cut the signal into 500ms non-overlapping windows. 
As explained, with Welch's method you would compute each window separetely and then average them altogether. 
Intead in the spectrogram, I will compute each window and arrange them in a matrix for the final plot. 

<p align="center">
    <img width="400" src="https:/finalplot">
</p>

This kind of plot helps to understand how the spectrum of the signal changes over time. 
