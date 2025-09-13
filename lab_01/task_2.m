clear; close all; clc;



which -all Quaternion
which -all UnitQuaternion

% 3.6
figure;
hold on; grid on ;view(3);
axis([-1 2 -1 2 -1 2]);
trplot(eye(4), 'frame', '0');

% 3.7
Rx=rotx(15,'deg');
Ry=roty(25,'deg');   
Rz=rotz(35,'deg');   
R1_0 = Rx * Ry * Rz;
tranimate(eye(3), R1_0,'axis',[-1 2 -1 2 -1 2], 'color','r');
trplot(R1_0, 'frame','1', 'color','r', 'arrow');
disp('R1_0 ='); disp(R1_0);

% 3.8
testR = R1_0;
rpy_default = tr2rpy(testR);              % default sequence
rpy_zyx     = tr2rpy(testR, 'zyx');
rpy_xyz     = tr2rpy(testR, 'xyz');
rpy_yxz     = tr2rpy(testR, 'yxz');

fprintf('Task 3.8 — tr2rpy default (radians): [roll pitch yaw] = [%.4f %.4f %.4f]\n', rpy_default);
fprintf('           tr2rpy zyx   (radians): [%.4f %.4f %.4f]\n', rpy_zyx);
fprintf('           tr2rpy xyz   (radians): [%.4f %.4f %.4f]\n', rpy_xyz);
fprintf('           tr2rpy yxz   (radians): [%.4f %.4f %.4f]\n', rpy_yxz);

%3.9
R = [ 0.8138  0.0400  0.5798;
      0.2962  0.8298 -0.4730;
     -0.5000  0.5567  0.6634 ];

rpy_deg = tr2rpy(R, 'zyx', 'deg');      % [roll psi, pitch theta, yaw phi]
psi = rpy_deg(1);  theta = rpy_deg(2);  phi = rpy_deg(3);

fprintf('RPY (deg): roll ψ = %.4f°, pitch θ = %.4f°, yaw φ = %.4f°\n', psi, theta, phi);

% 2) Opposite conversion check (should reconstruct R)
R_from_rpy = rpy2r([psi theta phi], 'zyx', 'deg');
fprintf('||R - rpy2r||_F = %.3e\n', norm(R - R_from_rpy, 'fro'));

% 3) Product of basic rotation matrices (same ZYX order)
R_basic = rotz(phi, 'deg') * roty(theta, 'deg') * rotx(psi, 'deg');
fprintf('||R - (Rz*Ry*Rx)||_F = %.3e\n', norm(R - R_basic,'fro'));

