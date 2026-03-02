function matrix = fwdrrr(th1 , th2, th3, d1, a2, a3, d_offest, side)

switch side

    case 'none'

        L1a(1) = Link([0 d1 0 pi/2, 0]);
        L1a(2) = Link([0 0 a2 0, 0]);
        L1a(3) = Link([0 0 a3 0,0]);

        robot1b = SerialLink(L1a);

        matrix = fkine(robot1b, [th1 th2 th3]);

    case 'left'


        L2b(1) = Link([0  d1 0 pi/2, 0]);
        L2b(2) = Link([0 -d_offest a2 0, 0]);
        L2b(3) = Link([0 0 a3 0,0]);

        robot2b = SerialLink(L2b);

        matrix = fkine(robot2b, [th1 th2 th3]);

    case 'right'


        L(1) = Link([0 d1 0 pi/2, 0]);
        L(2) = Link([0 d_offest a2 0, 0]);
        L(3) = Link([0 0 a3 0, 0]);
        RRR_right = SerialLink(L);
        matrix = fkine(RRR_right, [th1 + pi, th2, th3]);
   
        
end 