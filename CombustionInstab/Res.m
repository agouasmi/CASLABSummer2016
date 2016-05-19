function Re = Res(q)
% Computes the residual

global dx A Ac flux T0_in mp_in

run 'constants.m'

% Retrieve number of cells
Nc = size(q,1);
Nf = Nc + 1;

Re = zeros(Nc,4);

%% Inlet (Temperature and mass inflow rate given/ pressure is extrapolated/ Y = 1)

[~,~,p,~,~,~] =  con_to_prim(q(1,:));
M = MMass(1);

T = T0_in; 
r = p*M/(R*T);

mp = mp_in;
u = mp/(r*A(1));

ho = h_o(1,u,T);

q_in = [r r*u r*ho - p r];

switch flux
    case 1
        F = RoeFlux(q_in,q(1,:));
    case 2
        F = lax_wendroff_flux(q_in,q(1,:));
end
 
Re(1,:) = Re(1,:) + A(1)/Ac(1)*F/dx;

%% Interior faces

for i = 2:Nf-1
    
    l = i-1;
    r = i;
    
    ql = q(l,:);
    qr = q(r,:);
    
    switch flux
        case 1
            F = RoeFlux(ql,qr);
        case 2
            F = lax_wendroff_flux(ql,qr);
    end
    
    Re(l,:) = Re(l,:) - A(i)/Ac(l)*F/dx;
    Re(r,:) = Re(r,:) + A(i)/Ac(r)*F/dx;
    
end

%% Supersonic outlet

switch flux
    case 1
        F = RoeFlux(q(Nc,:),q(Nc,:));
    case 2
        F = lax_wendroff_flux(q(Nc,:),q(Nc,:));
end

Re(Nc,:) = Re(Nc,:) - A(Nf)/Ac(Nc)*F/dx;


%% Source terms
H  = source_H(q);
Hf = source_Hf(q);

Re = Re + H + Hf;

end
