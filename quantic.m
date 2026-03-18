function [A2, eqt, eqv, eqa] = quantic(q0, qf, v0, vf, a0 , af, t0 ,tf)

T2 = [1 t0 t0^2 t0^3 t0^4 t0^5;
    0 1 2*t0 3*t0^2 4*t0^3 5*t0^4;
    0 0 2 6*t0 12*t0^2 20*t0^3;
    1 tf tf^2 tf^3 tf^4 tf^5;
    0 1 2*tf 3*tf^2 4*tf^3 5*tf^4;
    0 0 2 6*tf 12*tf^2 20*tf^3];

Q2 = [q0; v0; a0; qf; vf; af];

A2 = round(inv(T2) * Q2,5);

for i = 1: tf * 100
    t2(i) = i / 100;
    q2(i) = A2(1) + A2(2)*t2(i) + A2(3)*t2(i)^2 + A2(4)*t2(i)^3 + A2(5)*t2(i)^4 + A2(6)*t2(i)^5;
    v2(i) = A2(2) + 2*A2(3)*t2(i) + 3*A2(4)*t2(i)^2 + 4*A2(5)*t2(i)^3 + 5*A2(6)*t2(i)^4;
    a2(i) = 2*A2(3) + 6*A2(4)*t2(i) + 12*A2(5)*t2(i)^2 + 20*A2(6)*t2(i)^3;
end

syms T;

digits(4); 
eqt = vpa(A2(1) + A2(2)*T + A2(3)*T^2 + A2(4)*T^3 + A2(5)*T^4 + A2(6)*T^5);
eqv = vpa(A2(2) + 2*A2(3)*T + 3*A2(4)*T^2 + 4*A2(5)*T^3 + 5*A2(6)*T^4);
eqa = vpa(2*A2(3) + 6*A2(4)*T + 12*A2(5)*T^2 + 20*A2(6)*T^3);

subplot(3,1,1);
plot(t2, q2);
xlim([t0, tf]);
xlabel('Time (s)');
ylabel('Position (q)');
title('Cubic Polynomial Trajectory');

subplot(3,1,2);
plot(t2, v2);
xlim([t0, tf]);

xlabel('Time (s)');
ylabel('Velocity (v)');

subplot(3,1,3);
plot(t2,a2);
xlim([t0, tf]);

xlabel('Time (s)');
ylabel('Acceleration (a)');

end
