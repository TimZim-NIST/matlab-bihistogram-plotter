%
% Author:       Timothy Zimmerman (timothy.zimmerman@nist.gov)
% Organization: National Institute of Standards and Technology
%               U.S. Department of Commerce
% License:      Public Domain
% Name:         bihist.m
%
% Description:
%   Produces a bihistogram plot of the provided datasets. As described in 
%   the NIST Engineering Statistics Handbook:
%       The bihistogram is an [exploratory data analysis] tool for assessing 
%       whether a before-versus-after engineering modification has caused 
%       a change in
%          * location;
%          * variation; or
%          * distribution.
%       It is a graphical alternative to the two-sample t-test. The 
%       bihistogram can be more powerful than the t-test in that all of the 
%       distributional features (location, scale, skewness, outliers) are 
%       evident on a single plot. It is also based on the common and well-
%       understood histogram.
%
% References:
%   http://www.itl.nist.gov/div898/handbook/eda/section3/bihistog.htm
%   https://www.mathworks.com/help/matlab/ref/histcounts.html
%   https://www.mathworks.com/help/matlab/ref/bar.html
%   https://www.mathworks.com/help/matlab/graphics_transition/why-are-plot-lines-different-colors.html
%   https://www.mathworks.com/help/matlab/ref/barh.html
%

function [  ] = bihist( i, j, bin_width, k )
%CREATE_BIHIST Outputs a bihistogram figure
%   Takes two arrays and produces a bihistogram figure. Script also provides 
%   the cability to perform bootstrapping (with replacement) for experiments 
%   with small sample sizes. 

% Checks if the bootstrapping array exists (parameter k).
% Array format: [sample-size, num-iterations], or []
if ~isempty(k)
    [d1,~,~] = bootstrap(i,k(1),k(2));
    [d2,~,~] = bootstrap(j,k(1),k(2));
    % If we are bootstrapping, bihistogram normalization is 'probability'
    norm_type = 'probability';
else
    d1 = i;
    d2 = j;
    % If we are not bootstrapping, bihistogram normalization is 'count'
    norm_type = 'count';
end

[counts1, binEdges1] = histcounts(d1, 'BinWidth', bin_width, 'Normalization', norm_type);
binCenters1 = (binEdges1(1:end-1) + binEdges1(2:end))/2;

[counts2, binEdges2] = histcounts(d2, 'BinWidth', bin_width, 'Normalization', norm_type);
binCenters2 = (binEdges2(1:end-1) + binEdges2(2:end))/2;

b1 = bar(binCenters1, counts1, 1.0);
b1.FaceColor = [0 0.4470 0.7410];
hold on;

b2 = bar(binCenters2, counts2.*-1.0, 1.0, 'w');
b2.FaceColor = [0.8500 0.3250 0.0980];

grid minor
ylabel(norm_type)
hold off;
return

end

