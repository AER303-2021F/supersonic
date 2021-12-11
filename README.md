# AER303F - Supersonic Flow

## Lab 2 for AER303 2021F

This repository holds the data, code, and documentation for the analysis of flow in a supersonic wind tunnel.

### Repo Structure

The repository is structured in five folders:

* The ***code*** directory contains the scripts to perform pressure and Mach analysis on supersonic data.
* The ***data*** directory contains the pressure data captured during the lab.
* The ***latex*** directory contains the files for the latex write up.
* The ***notes*** directory contains pre-lab and data analysis notes.
* The ***reference_papers*** directory contains papers used to model the latex writeup after.

### Running Data Analysis Workflow

The data analysis workflow is structured through a functional programming paradigm where analysis code is called from a single script. To run the data analysis workflow, navigate to the `code` directory in MATLAB and run the `main.m` file. The script will load the data from the ***data*** directory, perform the analysis, and populate the figures folder in the ***latex*** directory with the most recent plots.
