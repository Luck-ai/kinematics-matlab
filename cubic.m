function [A, eqt, eqv, eqa] = cubic(q0,qf,v0,vf,t0,tf)

Q = [q0; v0; qf; vf];
T = [1 t0 t0^2 t0^3 ; 0 1 2*t0 3*t0^2; 1 tf tf^2 tf^3 ; 0 1 2*tf 3*tf^2;];

A = inv(T) * Q;

for i = 1:tf * 100
    t(i) = i / 100;
    q(i) = A(1) + A(2)*t(i) + A(3)*t(i)^2 + A(4)*t(i)^3;
    v(i) = A(2) + 2* A(3)*t(i) + 3*A(4)*t(i)^2;
    a(i) = 2*A(3) + 6*A(4) * t(i);

end

syms T;

digits(4);
eqt = vpa(A(1) + A(2)*T + A(3)*T^2 + A(4)*T^3);
eqv = vpa(A(2) + 2*A(3)*T + 3*A(4)*T^2);
eqa = vpa(2*A(3) + 6*A(4)*T);

subplot(3,1,1);
plot(t, q);
xlim([t0, tf]);
xlabel('Time (s)');
ylabel('Position (q)');
title('Cubic Polynomial Trajectory');

subplot(3,1,2);
plot(t, v);
xlim([t0, tf]);

xlabel('Time (s)');
ylabel('Velocity (v)');

subplot(3,1,3);
plot(t,a);
xlim([t0, tf]);

end


