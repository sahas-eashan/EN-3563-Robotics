clear; close all; clc;

% 3.1
figure; hold on; grid on; axis([0 4 0 4 0 3]); view(35,25);
trplot(eye(4),'frame','0','color','b');

% 3.2
q0  = [2; 1; 1];
R1_0 = rotz(pi/2);   % 90° about z
t1_0 = q0;

% 3.3
quiver3(0,0,0, q0(1),q0(2),q0(3), 0, 'Color','b');

qx = q0(1); qy = q0(2); qz = q0(3);
C = [ 0  0  0;   qx 0  0;   qx qy 0;   0  qy 0;   0  0  qz;   qx 0  qz;   qx qy qz;   0  qy qz ];
E = [1 2; 2 3; 3 4; 4 1;   5 6; 6 7; 7 8; 8 5;   1 5; 2 6; 3 7; 4 8];
for k = 1:size(E,1)
    i = E(k,1); j = E(k,2);
    plot3([C(i,1) C(j,1)], [C(i,2) C(j,2)], [C(i,3) C(j,3)], 'b--');
end


% 3.4
H1_0 = rt2tr(R1_0, t1_0);          % homogeneous transform
trplot(H1_0,'frame','1','color','r');
disp('H1_0 ='); disp(H1_0);

% 3.5
p1 = [0.5; 0.8; 0.6];             % define p1 in frame {1}
u  = R1_0 * p1;                   % p1 expressed in {0}
quiver3(t1_0(1), t1_0(2), t1_0(3), u(1), u(2), u(3), 0, 'Color','r');
p0 = h2e(H1_0 * e2h(p1));          % p0 = H1_0 * p1 (homogeneous)
quiver3(0,0,0, p0(1), p0(2), p0(3), 0, 'Color','g');

% 3.6
if ~exist('p1','var'), p1 = [0.5;0.8;0.6]; end
u = R1_0 * p1;                    % p1 expressed in {0}
quiver3(q0(1),q0(2),q0(3), u(1),u(2),u(3), 0, 'Color','r');  % red arrow from origin of {1}

% 3.7
figure; hold on; grid on; axis([-4 2 -1 3 -2 2]); view(35,25);
trplot(eye(4),'frame','1','color','r');
quiver3(0,0,0, p1(1),p1(2),p1(3), 0, 'Color','r');

% 3.8
H0_1 = inv(H1_0); disp('H0_1 ='); disp(H0_1);

% 3.9
trplot(H0_1,'frame','0','color','b');

% 3.10
[~, t0_1] = tr2rt(H0_1);
quiver3(0,0,0, t0_1(1), t0_1(2), t0_1(3), 0, 'Color','b'); 
fprintf('t0_1 = [%.4f %.4f %.4f]^T\n', t0_1);

% 3.11
if ~exist('H0_1','var'), H0_1 = inv(H1_0); end
[~, t0_1] = tr2rt(H0_1);
d = t0_1 - p1;
quiver3(p1(1), p1(2), p1(3), d(1), d(2), d(3), 0, 'Color','g');



