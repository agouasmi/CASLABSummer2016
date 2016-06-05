function R = Res(f,n)

global A B X0 Y0

F = addBC(f,n);

[dF1_up,dF1_do,dF2_up,dF2_do] = dif(F);

LF = max(-(A + X0.^2.*Y0 - B*X0 - X0),0).*dF1_up + ...
         min(-(A + X0.^2.*Y0 - B*X0 - X0),0).*dF1_do + ...
            max(-(B*X0 - X0.^2.*Y0),0).*dF2_up + ...
               min(-(B*X0 - X0.^2.*Y0),0).*dF2_do;

% LF = X0.^2.*Y0.*dF1 - X0.^2.*Y0.*dF2;

% R = -LF;
R = -Q_proj(LF);
