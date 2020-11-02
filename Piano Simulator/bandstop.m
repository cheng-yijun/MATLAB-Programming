function rv = bandstop (F, band)
[n,m] = size(band);
if n>1 || m >2
    error('band malformed')
end
if band(1) > band(2) || band(2) >4096 || band(1) > 4096 || band(1) < 1 ||band(2) < 1
    error('no')
end

if any(mod(band(1),1)) ~=0 || any(mod(band(2),1)) ~=0
    error ('no')
end

rv = [F(1:band(1),:);
    zeros(band(2) - band(1) + 1, size (F,2));
    F(band(2)+2:end-band(2),:);
    zeros(band(2) - band(1) + 1, size (F,2));
    F(end-band(1)+2:end, :)];
end