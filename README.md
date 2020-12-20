# CoordinateDescentMATLAB
## Description
Implementation of coordinate descent method to find optimum value (maximum of the function) and display results using both 2D and 3D plots, 
using OOP in [MATLAB](https://www.mathworks.com/products/matlab.html)
## Realization 
  The main algorithm is decsribed in *`CoordinateDescent.m`* file, which contains *`FindOptimum`* function:
  ```matlab
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
  ```
  So, the main goal of algorithm is:
  1. Compute coordinates of new point `Optimum.GetHigherPoint(Xout(end), Yout(end), obj.h, obj.equation)`
  2. Check *criteria* option `abs(z - Zout(end)) < obj.eps`
  3. Compute new *search step* value if needed `obj.h = 0.5 * obj.h`
  
  Static function *`GetHigherPoint`* implemented in *`Optimum.m`* file:
  ```matlab
  function [x, y, z] = GetHigherPoint(xPrevious, yPrevious, h, equation)
  %GetHigherPoint Find coordinate of next best decision, based on previous decision
            
    right = equation(xPrevious + h, yPrevious);
    left = equation(xPrevious - h, yPrevious);
    up = equation(xPrevious, yPrevious + h);
    down = equation(xPrevious, yPrevious - h);
            
    maxValue = max([right left up down]);
            
    switch maxValue
        case right
            [x, y, z] = deal(xPrevious + h, yPrevious, right);
        case left
            [x, y, z] = deal(xPrevious - h, yPrevious, left);
        case up
            [x, y, z] = deal(xPrevious, yPrevious + h, up);
        case down
            [x, y, z] = deal(xPrevious, yPrevious - h, down);
    end
end
  ```
## Preview

### 2D plot

![Alt Text](/images/gif_2d.gif)

### 3D plot

![Alt Text](/images/gif_3d.gif)
