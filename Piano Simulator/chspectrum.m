function rv = chspectrum(f, func, rate)
[n,channels] = size(f);
if channels > 4
    error('signal has more than four channels')
end

if nargin < 3
    rate = 8192;
end

rv = zeros(size(f));
for m = 0:rate:n
    lo = m + 1;
    if m +rate <= n
        hi = m + rate;
        F = fft(f(lo:hi,:));
    else
        hi = n;
        extf = [f(lo:hi,:);
            zeros(rate-(hi-lo+1), channels)];
        F = fft(extf);
    end
    Fp = func(F);
    fp = real(ifft(Fp));
    rv(lo:hi,:) = fp (1:hi-lo+1,:);
end
end