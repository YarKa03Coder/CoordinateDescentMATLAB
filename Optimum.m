classdef Optimum
    
    methods(Static)
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
    end
    
end