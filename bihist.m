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
%BIHIST Outputs a bihistogram figure
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

% BUG FIX: Calculate the bin size and round to four decimal places. When data is
% imported into the workspace it is casted as DOUBLE. This introduces floating 
% point precision issues when the HISTCOUNTS attempts to bin each data point. 
% So far, the best solution is to round the bin edges to four decimal places. 
% We also have to cast the bin width calculation to INTEGER, because MATLAB
% takes the floating point approximation literally. While these changes fix
% the issues we are experiencing, they may not be appropriate for all applications
% of the bihistogram function--users should take note and validate the results. 
d1_bins = linspace(min(d1), max(d1)+bin_width, int8(((max(d1)-min(d1))/ bin_width)+2) );
d1_bins = round(d1_bins, 4);
d2_bins = linspace(min(d2), max(d2)+bin_width, int8(((max(d2)-min(d2))/ bin_width)+2) );
d2_bins = round(d2_bins, 4);

[counts1, binEdges1] = histcounts(d1, d1_bins, 'Normalization', norm_type);
binCenters1 = (binEdges1(1:end-1) + binEdges1(2:end))/2;

[counts2, binEdges2] = histcounts(d2, d2_bins, 'Normalization', norm_type);
binCenters2 = (binEdges2(1:end-1) + binEdges2(2:end))/2;

b1 = bar(binCenters1, counts1, 1.0);
b1.FaceColor = [0 0.4470 0.7410];
hold on;

b2 = bar(binCenters2, counts2.*-1.0, 1.0);
b2.FaceColor = [0.8500 0.3250 0.0980];

grid minor
ylabel(norm_type)
hold off;
return

end
