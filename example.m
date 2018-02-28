%
% Author:       Timothy Zimmerman (timothy.zimmerman@nist.gov)
% Organization: National Institute of Standards and Technology
%               U.S. Department of Commerce
% License:      Public Domain
% Name:         example.m
%
% Description:
%   Produces two figures: a bihistogram of the raw data (d1 and d2), and a 
%   figure of subplots demonstrating how different bootstrap parameters affect
%   a bihistogram plot. This example uses data obtained from the NIST 
%   Cybersecurity for Smart Manufacturing Systems (CSMS) Testbed. The files
%   'bihist.m' and 'bootstrap.m' are required for proper function. 
% 
%   These types of plots are used by the CSMS project researchers to
%   graphically determine the affect of cybersecurity hardware and software
%   tools on manufacturing processes. See 'bihist.m' for more information 
%   on the bihistogram. 
%
%   Bootstrapping is used by the bihistogram function to produce a 'smoothed'
%   histogram. Typically, too few parts are produced by the testbed during 
%   an experiment to generate a 'pretty' histogram. This can be seen in
%   Figure 1, generated by this example.
%
%   NOTE: Bootstrapping is OPTIONAL. 
%
%   To enable bootstrapping, provide the sample size and iterations 
%   parameters (shown below as j and i): 
%
%         bihist(d1, d2, 0.01, [j,i])
%
%   To disable bootstrapping, leave this array empty (but do not remove it): 
%
%         bihist(d1, d2, 0.01, [])
%
%   NOTE: Although this example file varies the bootstrap sample size, it
%         is expected that the bootstrap sample size be kept the same as 
%         the original population sample size. 
%         See: https://en.wikipedia.org/wiki/Bootstrapping_(statistics)
% 

d1 = [105.95; 105.75; 105.84; 105.96; 105.83; 105.96; 106.05; 106.19; 106.07; ...
      106.05; 105.9; 106.06; 105.98; 105.93; 105.95; 106.03; 106.1; 106.19;   ...
      106.09; 105.97; 106.13; 105.93; 106.09; 105.86; 106.03; 105.95; 105.88; ...
      105.91; 106.12; 105.94; 105.93; 105.78; 105.9; 106.01; 105.82; 105.95;  ...
      106.01; 105.94; 106.13; 105.98; 105.87; 105.84; 105.98; 106.03; 105.99; ...
      105.92; 105.97; 106; 106.12; 105.93; 106.02; 105.93; 105.92; 105.95;    ...
      105.94; 106.05; 105.91; 106.06; 105.88; 105.82; 106.09; 106.07; 105.93; ...
      106.09; 106.12; 105.99; 106.06; 106.05; 105.9; 105.86; 105.9; 106.09;   ...
      105.9; 105.9; 106.05; 106.2; 105.95; 106.11; 106; 105.98; 105.87;       ...
      105.87; 105.92; 105.88; 106.12; 105.93; 105.98; 105.8; 105.86; 105.97;  ...
      105.89; 105.99; 106.04; 105.79; 105.87; 106.07; 105.9; 105.85];

d2 = [105.87; 105.83; 106.18; 106.1; 105.98; 105.96; 105.93; 105.9; 105.8;    ...
      105.91; 105.98; 105.92; 106.02; 105.82; 105.92; 105.85; 106; 105.95;    ...
      106.11; 105.94; 105.89; 105.82; 105.87; 105.82; 105.86; 106.21; 105.96; ...
      105.93; 105.98; 106.14; 105.94; 105.78; 105.87; 106.03; 106.12; 105.98; ...
      106.03; 106.1; 106.06; 106.03; 106.03; 106.04; 105.9; 106.06; 106.07;   ...
      106.07; 106; 106.11; 106.04; 105.95; 106.06; 106.29; 106.17; 105.96;    ...
      105.69; 106.01; 106.04; 106.01; 105.96; 106.05; 106.07; 105.99; 106.03; ...
      106.1; 106.23; 106.23; 105.85; 105.94; 105.97; 106.15; 106.11; 106;     ...
      105.87; 105.84; 106.03; 106; 105.84; 105.98; 106.06; 106.07; 105.77;    ...
      106.07; 106.16; 106.11; 106; 106.15; 106.07; 106; 105.94; 105.88;       ...
      106.06; 106.04; 105.98; 106.11; 105.85; 106.03; 106.19; 106.03];

% Generate the raw-data bihistogram
figure();
bihist(d1, d2, 0.01, [])
title('Raw data (d1 and d2)');

% Generate the bootstrapped subplots
figure();
k = 1;
for i = [1000 2500 5000]
    for j = [50 75 100]
        subplot(3,3,k);
        bihist(d1, d2, 0.01, [j,i])
        title(['Bootstrap data (n=' num2str(j) ', i=' num2str(i) ')']);
        ylim([-0.4 0.4])
        xlim([105.9 106.05])
        k = k + 1;
    end
end

