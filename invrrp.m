function [th1n, th1r, th2n , th2r, d3] = invrrp(Px, Py, Pz, d1, a2, d_offset, side, angle)

switch angle

    case 'deg'

        switch side
            case 'none'
        
                r = sqrt(Px^2+Py^2)
                s = Pz - d1
        
                d3 = sqrt(r^2 + s^2) - a2;
        
                th2n = atan2d(s, r); 
        
                th1n = atan2d(Py, Px);
        
                th1r = th1n + 180;
                th2r = -180 - th2n;
        
            case 'right'
        
                r = sqrt(Px^2+Py^2 - d_offset^2)
                s = Pz - d1
        
                d3 = sqrt(r^2 + s^2) - a2;
        
                th2n = atan2d(s, r);
        
                th1n = atan2d(Py, Px) + atan2d(-d_offset, -r);
        
                th2r = 0; th1r = 0;
        
            case 'left'
        
                r = sqrt(Px^2+Py^2 - d_offset^2)
                s = Pz - d1
        
                d3 = sqrt(r^2 + s^2) - a2;
        
                th2n = atan2d(s, r);
        
                th1n = atan2d(Py, Px) - atan2d(d_offset, r);
        
                th2r = 0; th1r = 0;
        end

    case 'rad'

        switch side

            case 'none'

                r = sqrt(Px^2+Py^2);
                s = Pz - d1;

                d3 = sqrt(r^2 + s^2) - a2;

                th2n = atan2(s, r); 

                th1n = atan2(Py, Px);

                th1r = th1n + pi;
                th2r = -pi - th2n;

            case 'right'

                r = sqrt(Px^2+Py^2 - d_offset^2);
                s = Pz - d1;

                d3 = sqrt(r^2 + s^2) - a2;

                th2n = atan2(s, r);

                th1n = atan2(Py, Px) + atan2(-d_offset, -r);

                th2r = 0; th1r = 0;

            case 'left'

                r = sqrt(Px^2+Py^2 - d_offset^2);
                s = Pz - d1;

                d3 = sqrt(r^2 + s^2) - a2;

                th2n = atan2(s, r);

                th1n = atan2(Py, Px) - atan2(d_offset, r);

                th2r = 0; th1r = 0;
        end

end 

end




