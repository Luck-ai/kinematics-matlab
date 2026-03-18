function [jv, jw, jfinal] = jcb(n, t_all, robot)
    Z = sym(zeros(3,n+1));
    O = sym(zeros(3,n+1));

    Z(:, 1) = [0;0;1];
    O(:, 1) = [0;0;0];

    for i = 1:n
        Z(:,i+1) = simplify(t_all(i).a);
        O(:, i+1) = simplify(t_all(i).t);
    end

    jv = sym(zeros(3, n));
    jw = sym(zeros(3, n));

    for i = 1:n
        z_prev = Z(:, i);
        o_prev = O(:, i);
        fprintf('Joint %d Matrix:\n', i);
        simplify(t_all(i))
        
        fprintf('Z vector:\n'); 
        disp(Z(:,i+1));
        
        fprintf('O vector:\n');
        disp(O(:,i+1));
        if robot.links(i).isrevolute
            jv(:, i) = cross(z_prev, O(:,n+1) - o_prev);
            jw(:, i) = z_prev;

        elseif robot.links(i).isprismatic
            jv(:, i) = z_prev;
            jw(:, i) = [0; 0; 0];
        end
    end
    jv = simplify(jv);
    jw = simplify(jw);
    jfinal = simplify([jv; jw]);
end

% Example Usage:
% syms th1 d2 d4 d1 d3 thd real

% L2(1) = Link([th1 d1 0 0 , 0]);
% L2(2) = Link([0 d2 d3 0, 1]);
% L2(3) = Link([thd 0 0 -pi/2, 0]);
% L2(4) = Link([0 d4 0 0, 1]);
% robot = SerialLink(L2);
% [~, t_all] = fkine(robot, [th1 d2 thd d4]);

% [jv, jw, jf] = jcb(4, t_all, robot)