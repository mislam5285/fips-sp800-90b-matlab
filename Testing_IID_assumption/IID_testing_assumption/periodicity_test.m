%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Copyright 2018 Crypto4a Technologies Inc.
%
% Permission is hereby granted, free of charge, to any person obtaining a 
% copy of this software and associated documentation files (the "Software"),
% to deal in the Software without restriction, including without limitation 
% the rights to use, copy, modify, merge, publish and/or distribute copies 
% of the Software, and to permit persons to whom the Software is 
% furnished to do so subject to the following conditions:
%
% The above copyright notice and this permission notice shall be included 
% in all copies or substantial portions of the Software.
%
% THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS 
% OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
% MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN
% NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, 
% DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR 
% OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE 
% USE OR OTHER DEALINGS IN THE SOFTWARE.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% [T] = periodicity_test(input_data,p)
%
% This function is specified in NIST SP-800-90B (January 2018) in section
% 5.1.9. It first converts every non-overlapping 8 bit sequence into a list 
% of integers (input_data_conv) between 0 and 8 corresponding to the number 
% of '1' in that sequence. Then, it measures periodic structures.
%
% input_data:   vector of input bits (binary only). Can handle only 
%               horizontal vectors.
%
% p:            lag value used to find periodicity patterns
%
% T:            Result of the test, which corresponds to the number of
%               times value separated by p are the same
%
function[T] = periodicity_test(input_data, p)

    % Converting the sequence into a list of integers ranging from 0 to 8
    input_data_conv = convert1(input_data, 8);

    % Declaring some parameters
    L = length(input_data_conv);
    T = 0;

    % Running through the data
    for i = 1:L-p
        if input_data_conv(i) == input_data_conv(i+p)
            T = T+1;
        end
    end
end
