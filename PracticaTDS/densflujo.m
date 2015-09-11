function M=densflujo(lambdau,T)
den=lambdau.^5.*(exp(1.43879e4./(lambdau.*T)));
M=3.74183e4./den;