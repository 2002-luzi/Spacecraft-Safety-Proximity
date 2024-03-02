% hold on
% [X, Y] = meshgrid(0:0.1:50, -30:30);
% Z_1 = sqrt(X.^2.*tan(theta)^2 - Y.^2);
% Z_2 = -Z_1;
% surf(X, Y, Z_1);
% surf(X, Y, Z_2);

close all
phi = pi/4;
a = -pi:.05*pi:pi;
r = 0: 0.2: 40;
[A, R] = meshgrid(a, r);%xoy平面上的极坐标
X = R.* cos(A);
Y = R.* sin(A);
Z = cot(phi) * sqrt(X.^2 + Y.^2);
s = surf(Z, Y, X, 'FaceAlpha',0.5);
s.EdgeColor = 'none';
hold on
p = plot3(out.r(:,1),out.r(:,2), out.r(:,3),'Color','r');
p.LineWidth = 3;
r_out = out.r;
plot3(r_out(1,1),r_out(1,2), r_out(1,3), '-o', 'Color','b', 'MarkerSize', 5, 'MarkerFaceColor','#D9FFFF');
plot3(r_out(end,1),r_out(end,2), r_out(end,3), '-o', 'Color','b', 'MarkerSize', 5, 'MarkerFaceColor','#D9FFFF');