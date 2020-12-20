clear; clc;
instance = CoordinateDescent;

disp('Properties of instance before invocation of the method');
disp(instance); % Properties of instance before invocation method 

[X, Y, Z] = FindOptimum(instance);

disp('Properties of instance after invocation of the method');
disp(instance); % new values of the properties of the instance after optimum was found

% 2-D plot
figure;
plot(X,Y,'b*-'), 
title({['2-D plot'],['h = ',num2str(instance.h),blanks(3),'i = ',num2str(instance.iterationCount)]}),
axis equal, grid on;

% 3-D plots
figure;
[meshX, meshY] = meshgrid(X,Y);
mesh(meshX, meshY, instance.equation(meshX, meshY)),
hold on 
    plot3(X, Y, Z, 'b-*') 
hold off,
title({['3-D plot'],['h = ',num2str(instance.h),blanks(4),'i = ',num2str(instance.iterationCount)]}),
axis equal;

figure
[meshX, meshY] = meshgrid(-5:0.25:5);
mesh(meshX, meshY, instance.equation(meshX, meshY)),
hold on
    plot3(X, Y, Z, 'b-*') 
hold off,
title({['3-D plot'],['h = ',num2str(instance.h),blanks(4),'i = ',num2str(instance.iterationCount)]}),
axis equal;