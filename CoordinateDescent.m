classdef CoordinateDescent < handle
  
    properties
        eps = 0.0001; % Search accurancy
        h = 0.1; % Initial search step
        iterationCount = 1; % number of iterations
        XY0 = [0 0]; % Search start point ([x y])
        equation = @(x,y) sin(x-2.5).*sin(y-1.5); % Functional dependence
    end
    
    methods
        
        function set.iterationCount(obj, value)
            obj.iterationCount = value;
        end
        
        function set.h(obj, value)
            obj.h = value;
        end
        
        function [Xout, Yout, Zout] = FindOptimum(obj)
            
            Xout = [obj.XY0(1)]; % array of x-coordinate values
            Yout = [obj.XY0(2)]; % array of y-coordinate values
            Zout = [obj.equation(Xout(end),Yout(end))]; % array of z-coordinate values (values of functional dependence)
            
            while true
                [x, y, z] = Optimum.GetHigherPoint(Xout(end), Yout(end), obj.h, obj.equation);
                if(abs(z - Zout(end)) < obj.eps) % stop (search) criteria
                    break;
                elseif (z > Zout(end))
                    Xout(end + 1) = x;
                    Yout(end + 1) = y;
                    Zout(end + 1) = z;
                else
                    obj.h = 0.5 * obj.h; 
                end
                
                obj.iterationCount = obj.iterationCount + 1;
            end
            
        end
    end
    
end