function [kel] = Celsius2Kelvin(cels)
%CELSIUS2KELVIN converts tempreture in degrees celsius to kelvin.
%INPUTS:
%   cels : double value of tempreture in degree celsius
%OUTPUTS:
%   kel: temp in kelvin after convertion
kel = cels + 273.15;
end