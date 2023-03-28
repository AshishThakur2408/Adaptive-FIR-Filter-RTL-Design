# Adaptive-FIR-Filter-RTL-Design
An adaptive filter is a filter with non-constant coefficients. The filter coefficients are adjusted based on an criterium which is often defined to optimize the performance of the filter in its ability to estimate an unknown quantity in an input signal.
In this lecture, we will limit ourselves to adaptive FIR filters. The basic outline of an adaptive FIR filter is shown in the following figure. The filter accepts an input signal x and produces an output signal y. The FIR coefficients of this filter are adjustable, meaning that at every new sample of x, the coefficients can take on a new value. The new value of filter coefficients is determined using a coefficient update algorithm, which computes an adjustment for each filter coefficient based on an error signal e. The error signal e is typically computed as the difference between the actual output signal y and a desired output signal d.
![image](https://user-images.githubusercontent.com/117371658/228351748-79814d07-9116-4a1f-a8ef-12e0a4374bff.png)
The desired output signal d depends on the specific application of the adaptive filter. However, the adaptive algorithm will change the coefficients so as to minimize the mean squared value of the error signal e. That is, given that the filter output is defined by filter coefficients
![image](https://user-images.githubusercontent.com/117371658/228351831-07e5a31b-d4c6-4e22-9101-e7bdfed23ccc.png)
we try to minimize the expected square error:
![image](https://user-images.githubusercontent.com/117371658/228351912-b88f3b44-cb81-400c-9c03-3992f488faee.png)
There are generally four different configurations common for an adaptive filter:
1. System Identification
2. Noise Cancellation
3. Equalization
4. Adaptive Prediction
