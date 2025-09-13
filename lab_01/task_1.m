clear; close all; clc;

% 3.1
figure; hold on; grid on; axis([-4 7 -2 7]);
trplot2(eye(3), 'frame','0');

% 3.2
p_in_0 = [5;6];
quiver(0,0, p_in_0(1), p_in_0(2), 'b');
text(p_in_0(1)-0.4, p_in_0(2)-0.2, 'p', 'FontSize', 12, 'Color', 'b');

% 3.3
R_1_in_0 = rot2(45*pi/180);
T_1_in_0 = [R_1_in_0 [0;0]; 0 0 1];
tranimate2(eye(3), T_1_in_0, 'cleanup', true);
trplot2(T_1_in_0, 'frame','1', 'color','r');

% 3.4
q_in_1 = [-3;2]; q_in_0 = R_1_in_0 * q_in_1;
quiver(0,0, q_in_0(1), q_in_0(2), 'r');
text(q_in_0(1)-0.2, q_in_0(2)+0.1, 'q', 'FontSize', 12, 'Color', 'r');

% 3.5
R68 = rot2(68,"deg");           
r_in_0 = R68 * p_in_0;          
quiver(0,0, r_in_0(1), r_in_0(2), 0, 'Color','g');
text(r_in_0(1), r_in_0(2), '  r', 'Color','g','FontWeight','bold');