# MATLAB Bihistogram Plotter

Produces a bihistogram plot of two datasets, with optional bootstrapping.

Author: Timothy Zimmerman (timothy.zimmerman@nist.gov)  
Organization: National Institute of Standards and Technology,
U.S. Department of Commerce  
License: Public Domain  

## Details

The MATLAB script ```bihist.m ``` defines a function to produce a bihistogram plot from two provided datasets. This script also depends on the bootstrap function defined in ```bootstrap.m``` to provide bootstrapping capabilities. Usage of the scripts can be found in their respective comments. Examples of plots using raw data and bootstrapped data are shown in Figure 1.

__Figure 1.__ Example bihistograms of CSMS testbed data (raw and bootstrapped, respectively).
![][_fig1]

## Bihistogram

A detailed description of the bihistogram can be found in the [NIST Engineering Statistics Handbook][_bihist]:

>The bihistogram is an [exploratory data analysis] tool for assessing whether a before-versus-after engineering modification has caused a change in location, variation, or distribution.

>It is a graphical alternative to the two-sample t-test. The bihistogram can be more powerful than the t-test in that all of the distributional features (location, scale, skewness, outliers) are evident on a single plot. It is also based on the common and well-understood histogram.

>The bihistogram is an important EDA tool for determining if a factor "has an effect". Since the bihistogram provides insight into the validity of three (location, variation, and distribution) out of the four (missing only randomness) underlying assumptions in a measurement process, it is an especially valuable tool. Because of the dual (above/below) nature of the plot, the bihistogram is restricted to assessing factors that have only two levels. However, this is very common in the before-versus-after character of many scientific and engineering experiments.

## Bootstrapping

Again, insight into the bootstrapping method can be found in the [NIST Engineering Statistics Handbook][_bootstrap]:

>To generate a bootstrap uncertainty estimate for a given statistic from a set of data, a subsample of a size less than or equal to the size of the data set is generated from the data, and the statistic is calculated. This subsample is generated with replacement so that any data point can be sampled multiple times or not sampled at all. This process is repeated for many subsamples, typically between 500 and 1000. The computed values for the statistic form an estimate of the sampling distribution of the statistic.

The bootstrapping performed by ```bootstrap.m``` produces the bootstrap mean. Future functionality may also provide functionality for bootstrap median and bootstrap midrange.

## Project Information

These scripts were created as part of the [Cybersecurity for Smart Manufacturing Systems (CSMS)][_CSMS] project at the [National Institute of Standards and Technology (NIST)][_NIST] in Gaithersburg, Maryland. The bihistograms created by the scripts in this repo are used by project researchers to graphically determine the affect of cybersecurity hardware and software tools on manufacturing processes.

The file ```example.m``` and the bihistograms in Figure 1 use measurement data obtained from the CSMS testbed.

A detailed description of the collaborative robotics system can be found in the documents [NISTIR 8177, "Metrics and Key Performance Indicators for Robotic Cybersecurity Performance Analysis"][_IR8177], and [NISTIR 8089, "ICS Cybersecurity Performance Testbed Design Report"][_IR8089].

## Disclaimer
Certain commercial entities, equipment, or materials may be identified in this document in order to describe an experimental procedure or concept adequately. Such identification is not intended to imply recommendation or endorsement by the [National Institute of Standards and Technology (NIST)][_NIST], nor is it intended to imply that the entities, materials, or equipment are necessarily the best available for the purpose.

[_NIST]: http://www.nist.gov
[_IR8089]: http://nvlpubs.nist.gov/nistpubs/ir/2015/NIST.IR.8089.pdf
[_IR8177]: http://nvlpubs.nist.gov/nistpubs/ir/2017/NIST.IR.8177.pdf
[_CSMS]: https://www.nist.gov/programs-projects/cybersecurity-smart-manufacturing-systems
[_bihist]: http://www.itl.nist.gov/div898/handbook/eda/section3/bihistog.htm
[_bootstrap]: http://www.itl.nist.gov/div898/handbook/eda/section3/bootplot.htm
[_example-img]: ./raw_data.png
[_fig1]: ./readme_assets/fig1.png "Example bihistogram of bootstrapped CSMS testbed data."
