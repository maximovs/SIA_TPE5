function res = linear(x)
if (abs(x)>1)
    res = sign(x);
else
    res = x;
endif
endfunction