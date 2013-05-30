function res = exponentialder(x)
res = (exp(x) ./ (exp(x) + 1).^2)*2 + .1;
endfunction
