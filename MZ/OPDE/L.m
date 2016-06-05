function LF = L(F)

global A B X0 Y0

[dF1,dF2] = dif_central(F);

LF = (A + X0.^2.*Y0 - B*X0 - X0).*dF1 + ...
          (B*X0 - X0.^2.*Y0).*dF2;