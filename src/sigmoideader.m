function res = sigmoideader(x,b)
res  = b - b*tanh(b*x).^2 + 0.1;
endfunction