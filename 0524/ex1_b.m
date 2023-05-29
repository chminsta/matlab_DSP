% make a filter part 1
% block pulse at omega(1)
% poly(r): 근이 r의 요소인 다항식의 계수
% b1, a1: z의 다항식임. z^(-1)의 다항식이 아님
b1 = poly([0.98*exp(1i*0.8*pi) 0.98*exp(-1i*0.8*pi)]);
a1 = poly([0.8*exp(1i*0.4*pi) 0.8*exp(-1i*0.4*pi)]);
% make a filter part 2
% allpass filter to induce delay to pulse at omega(2)
a2 = 1;
b2 = 1;
for k=1:4
c = 0.95*exp(1i*(0.15*pi+0.02*pi*k));
bt = poly([1/c' 1/c 1/c' 1/c]); % double zeros
at = poly([c c' c c']); % double poles
a2 = conv(a2,at);
b2 = conv(b2,bt);
end
% combine filters
a = conv(a1,a2);
b = conv(b1,b2);