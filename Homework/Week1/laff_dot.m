## Copyright (C) 2018 julien Lengrand-Lambert
## 
## This program is free software; you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 3 of the License, or
## (at your option) any later version.
## 
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
## 
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <http://www.gnu.org/licenses/>.

## Author: julien Lengrand-Lambert <jlengrand@juliens-MacBook-Pro.local>
## Created: 2018-05-03
function [ alpha ] = laff_dot (x, y)

y_out = y;

    function isVector = isVector(x)
        isVector = (size(x, 1) == 1 || size(x, 2) == 1);
    endfunction

    function isCompatible = isCompatible(x, y)
        isCompatible = (isequal(size(x), size(y)) || isequal(size(x), fliplr(size(y))));
    endfunction

    if !isVector(x)
        disp('Error : x not a vector');
        alpha = 'FAILED';
        return 
    end

    if !isVector(y)
        disp('Error : y not a vector');
        alpha = 'FAILED';
        return
    end

    if !isCompatible(x, y)
        disp('Error : x and y are not compatible');
        alpha = 'FAILED';
        return
    end

    alpha = 0;
    for i = 1:max(size(x))
        alpha += y(i) * x(i)
    end
    
endfunction