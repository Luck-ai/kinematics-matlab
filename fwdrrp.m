function matrix = fwdrrp(th1 , th2, d3, d1, a2, d_offest, side)

switch side

    case 'none'
        
         R = 0; P = 1;
        
         L3b(1) = Link([0 d1 0 pi/2, R]);
         L3b(2) = Link([0 -d_offest a2 0, R]);
         L3b(3) = Link([0 0 0 pi/2, R]);
         L3b(4) = Link([0 d3 0 0, P]);
         RRP = SerialLink(L3b);
 
         matrix = fkine(RRP, [th1 th2 pi/2 d3]);

    case 'left'


         R = 0; P = 1;
        
         L3b(1) = Link([0 d1 0 pi/2, R]);
         L3b(2) = Link([0 -d_offest a2 0, R]);
         L3b(3) = Link([0 0 0 pi/2, R]);
         L3b(4) = Link([0 d3 0 0, P]);
         RRP = SerialLink(L3b);
 
         matrix = fkine(RRP, [th1 th2 pi/2 d3]);

    case 'right'

         R = 0; P = 1;
        
         L3b(1) = Link([0 d1 0 pi/2, R]);
         L3b(2) = Link([0 d_offest a2 0, R]);
         L3b(3) = Link([0 0 0 pi/2, R]);
         L3b(4) = Link([0 d3 0 0, P]);
         RRP = SerialLink(L3b);
 
         matrix = fkine(RRP, [th1+pi th2 pi/2 d3]);


end