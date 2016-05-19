function s = S(x)

in2m = 0.0254;

ls = 0  * in2m;
lf = 5 * in2m;

s = (1 + sin(-pi/2 + 2*pi*(x - ls)/(lf - ls))).*(x < lf).*(x > ls);