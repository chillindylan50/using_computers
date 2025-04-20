function [ data_above_minimum ] = above_value(in_data, x_data_column, varargin )
% above_value remove all data that is below a minimum value.
%   [ data_above_minimum ] = above_value( in_data, x_data_column, minimum_x_value, varargin
%   ). Zero-out all data that is below a minimum value
%
%   Required inputs:
%   in_data = array with the input data.
%   x_data_column = column to be examined for being greater than a minimum
%
%   Optional inputs (positional):
%   N/A
%
%   Optional Parameters (not positional, specified by an identifying string):
%   truncateWithNaNs = Replace zero rows with NaN, to keep output array same dimensions as input arry.

% Function parser described here https://www.mathworks.com/help/matlab/matlab_prog/parse-function-inputs.html
% In brief: add[type](inputParser,name,check function)
p = inputParser;
addRequired(p, 'in_data', @isnumeric) % Required, positional. The validation function @isnumeric is optional
addOptional(p, 'x_data_column', @isnumeric) % optional, positional
addParameter(p, 'truncateWithNaNs', false, @islogical) % Required, but not positional. Marked by flag

parse(p, in_data, x_data_column, varargin{:})


if iscell(in_data)
    % Do_something

elseif isnumeric(in_data)
    % do_something_else
    x_column = p.Results.x_data_column;
else
    error("above_value expected numeric data, got non-numeric in_data.")
end
