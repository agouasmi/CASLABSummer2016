function Hf = source_Hf(q)

global xc Ac

run 'constants.m'

Nc = length(xc);
Hf = zeros(Nc,4);

for i = 1:Nc
   
    state = q(i,:);
    
    [~,u,~,~,h] =  con_to_prim(state);
    
    wp_ox = kf*state(4)*S(xc(i)); 
    wp_f  = Cf * wp_ox;
    
    Hf(i,:) = wp_f*[1 u h -1/Cf]/Ac(i);

end

end