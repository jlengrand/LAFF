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
function [ alpha ] = laff_norm2 (x)

    function isVector = isVector(x)
        isVector = (size(x, 1) == 1 || size(x, 2) == 1);
    endfunction

    if !isVector(x)
        disp('Error : x not a vector');
        alpha = 'FAILED';
        return 
    end

    xmax = 0.0
    for i=1:size(x, 1)
        if abs( x( i ) > xmax ) 
            xmax = abs( x( i ) );
        end
    end

    x = laff_scal( 1/xmax, x );

    % Use laff_dot to compute the length of x as sqrt( x' * x )
    alpha = sqrt( laff_dot( x, x ) );

    alpha *= xmax;
    
endfunction