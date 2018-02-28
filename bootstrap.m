%
% Author:       Timothy Zimmerman (timothy.zimmerman@nist.gov)
% Organization: National Institute of Standards and Technology
%               U.S. Department of Commerce
% License:      Public Domain
% Name:         bootstrap.m
%
% Description:
%   Takes a sample population and performs bootstrapping, based on the
%   provided parameters. Returns an array of means, mean of means, and
%   the stdev of means. This method assumes that the sample population is
%   representative of the population. Random samples are chosen from the
%   sample population (with replacement) to create bootstrap samples. The
%   mean of this bootstrap sample is calculated and stored in an array. 
% 
% References:
%   https://en.wikipedia.org/wiki/Bootstrapping_(statistics)
%

function [ means, mu, sigma ] = bootstrap( d, sample_size, iterations )
%BOOTSTRAP Bootstraps a sample population. 
    s = max(size(d));
    means = zeros(1,iterations);
    for i = 1:iterations
        temp = zeros(1,sample_size);
        for j = 1:sample_size
             temp(j) = d(randi(s));
        end
        means(i) = mean(temp);
        mu    = mean(means);
        sigma = std(means);
    end
end