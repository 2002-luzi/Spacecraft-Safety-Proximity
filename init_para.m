clear all

cor_t0 = [0; 0; 0];
cor_c0 = [40; -26; -15];
cor_d = [2; 0; 0];  % destination position

mu = 3.986e14;  %地球引力常数
a = 7178e3;     %半长轴
e = 0.01;       %偏心率
omega = 0;      %近地点幅角
f = 0;          %真近点角
i = pi/6;       %轨道倾角
Omega = 0;      %升交点赤经
u = f+omega;

A_iL_11 = cos(Omega)*cos(u) - sin(Omega)*cos(i)*sin(u);
A_iL_12 = -cos(Omega)*sin(u) - sin(Omega)*cos(i)*cos(u);
A_iL_13 = sin(Omega)*sin(i);
A_iL_21 = cos(Omega)*cos(u) + cos(Omega)*cos(i)*sin(u);
A_iL_22 = -sin(Omega)*sin(u) + cos(Omega)*cos(i)*cos(u);
A_iL_23 = -cos(Omega)+sin(i);
A_iL_31 = sin(i)*sin(u);
A_iL_32 = sin(i) * cos(u);
A_iL_33 = cos(i);

A_iL = [A_iL_11, A_iL_12, A_iL_13; A_iL_21, A_iL_22, A_iL_23; A_iL_31, A_iL_32, A_iL_33];

p = a*(1-e^2); %半通径

r_t0 = p/(1+e*cos(f)) * A_iL(:,1);
r_c0 = A_iL * cor_c0;
trans_mat = [1, 0, 0, r_t0(1); 0, 1, 0, r_t0(2); 0, 0, 1, r_t0(3)];
r_c0 = (trans_mat*[r_c0;1])

theta = pi/4;
lambda = 0.4;
k1 = 2.1;
k2 = 0.07;
k3 = 0.056;
k4 = 2;
k5 = 0.01;