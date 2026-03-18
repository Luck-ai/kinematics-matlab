function [th1n , th1r, th2_1, th2_2, th2_1r, th2_2r,  th3_1, th3_2, th3_2r, th3_1r] = invrrr(d1, a2, a3, x, y, z, d_offset, side, angle)

    switch angle
        case 'deg'

            switch side
                case 'none'
                    r = sqrt(x^2 + y^2)
                    s = z - d1
                    D = (r^2 + s^2 -a2^2 - a3^2) / (2 * a2 * a3);
                    th3_1 = atan2d(sqrt(1-D^2), D);
                    th2_1 = atan2d(z-d1, r) - atan2d(a3 * sind(th3_1) , a2 + a3* cosd(th3_1));
                    th1n = atan2d(y,x);
        
                    th3_2 = atan2d(-1 * sqrt(1-D^2), D);
                    th2_2 = atan2d(z-d1, r) - atan2d(a3 * sind(th3_2) , a2 + a3* cosd(th3_2));
                
                    th1r = atan2d(y,x) + 180;
        
                    th2_1r = -180 - th2_1;
                    th3_1r = -1 * th3_1;
        
                    th2_2r = -180 - th2_2;
                    th3_2r = -1 * th3_2;
        
                case 'left'
        
                    r = sqrt(x^2+y^2 - d_offset^2)
                    s = z - d1
                    d = (r^2 + s^2 - a2^2 - a3^2) / (2*a2*a3);
        
                    th3_1 = atan2d(sqrt(1-d^2), d); %% up 
                    th3_2 = atan2d(-1*sqrt(1-d^2), d); %% down
        
                    th2_1 = atan2d(s, r) - atan2d(a3*sind(th3_1), (a2+a3*cosd(th3_1)));
                    th2_2 = atan2d(s, r) - atan2d(a3*sind(th3_2), (a2+a3*cosd(th3_2)));
        
                    th1n = atan2d(y, x)-atan2d(d_offset, r);
                    th1r = 0;
                    th3_1r = 0;
                    th2_1r = 0;
                    th2_2r = 0;
                    th3_2r = 0;
        
                case 'right'
        
                    r = sqrt(x^2+y^2 - d_offset^2)
                    s = z - d1
                    d = (r^2 + s^2 - a2^2 - a3^2) / (2*a2*a3);
        
                    th3_1 = atan2d(sqrt(1-d^2), d);
                    th3_2 = atan2d(-1*sqrt(1-d^2), d);
        
                    th2_1 = atan2d(s, r) - atan2d(a3*sind(th3_1), (a2+a3*cosd(th3_1)));
                    th2_2 = atan2d(s, r) - atan2d(a3*sind(th3_2), (a2+a3*cosd(th3_2)));
        
                    th1n = atan2d(y, x)+atan2d(-d_offset, -r);
        
                    th1r = 0;
                    th3_1r = 0;
                    th2_1r = 0;
                    th2_2r = 0;
                    th3_2r = 0;
        
                otherwise
        
                    disp("Choose none, left or right")
            end 

        case 'rad'

            switch side
                case 'none'
                    r = sqrt(x^2 + y^2)
                    s = z - d1
                    D = (r^2 + s^2 -a2^2 - a3^2) / (2 * a2 * a3);
                    th3_1 = atan2(sqrt(1-D^2), D);
                    th2_1 = atan2(z-d1, r) - atan2(a3 * sin(th3_1) , a2 + a3* cos(th3_1));
                    th1n = atan2(y,x);

                    th3_2 = atan2(-1 * sqrt(1-D^2), D);
                    th2_2 = atan2(z-d1, r) - atan2(a3 * sin(th3_2) , a2 + a3* cos(th3_2));

                    th1r = atan2(y,x) + pi;

                    th2_1r = -pi - th2_1;
                    th3_1r = -1 * th3_1;

                    th2_2r = -pi - th2_2;
                    th3_2r = -1 * th3_2;

                case 'left'

                    r = sqrt(x^2+y^2 - d_offset^2)
                    s = z - d1
                    d = (r^2 + s^2 - a2^2 - a3^2) / (2*a2*a3);

                    th3_1 = atan2(sqrt(1-d^2), d);
                    th3_2 = atan2(-1*sqrt(1-d^2), d);

                    th2_1 = atan2(s, r) - atan2(a3*sin(th3_1), (a2+a3*cos(th3_1)));
                    th2_2 = atan2(s, r) - atan2(a3*sin(th3_2), (a2+a3*cos(th3_2)));

                    th1n = atan2(y, x)-atan2(d_offset, r);
                    th1r = 0;
                    th3_1r = 0;
                    th2_1r = 0;
                    th2_2r = 0;
                    th3_2r = 0;

                case 'right'

                    r = sqrt(x^2+y^2 - d_offset^2)
                    s = z - d1
                    d = (r^2 + s^2 - a2^2 - a3^2) / (2*a2*a3);

                    th3_1 = atan2(sqrt(1-d^2), d);
                    th3_2 = atan2(-1*sqrt(1-d^2), d);

                    th2_1 = atan2(s, r) - atan2(a3*sin(th3_1), (a2+a3*cos(th3_1)));
                    th2_2 = atan2(s, r) - atan2(a3*sin(th3_2), (a2+a3*cos(th3_2)));

                    th1n = atan2(y, x)+atan2(-d_offset, -r);

                    th1r = 0;
                    th3_1r = 0;
                    th2_1r = 0;
                    th2_2r = 0;
                    th3_2r = 0;

                otherwise

                    disp("Choose none, left or right")
            end 

    end

end







