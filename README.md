<h1>Collection of scripts for M. polymorpha spore works.</h1>

fitcircle.m: MATLAB script by Richard Brown (2007) that fits a circle to the set of data points.
<br>

findR.m : MATLAB script that extracts xy coordinates of white pixels from a binary image and uses them to fit a circle using fitcircle.m script
<br>

fitRadius.m : MATLAB script that performs an edge detection from bw spore image and uses findR.m script to fit a circle to the spore edge. 
<br>

radiusDynamics.m : MATLAB script that outputs vector of spore radii for a collection of the spore images. Depends on findR.m fircircle.m fitRadius.m

