# Hodgkin-Huxley Model in MATLAB

This repository contains MATLAB code for simulating neuronal action potentials using the Hodgkin-Huxley model. The code solves a system of four coupled first-order differential equations to model the behavior of voltage-gated ion channels in a neuron's membrane.

## Repository Contents

- `main.m`: The main script that sets up the initial parameters, runs the Hodgkin-Huxley model, and plots the results.
- `hh_diff_eq.m`: Contains the differential equations for the Hodgkin-Huxley model.
- `hhdiff2.m`: Contains the differential equations for the Hodgkin-Huxley model under hyperpolarizing conditions.

## Project Overview

The project is divided into four main parts:

1. **Square Pulse Triggering Action Potential**: This part involves developing a MATLAB program that solves for the membrane potential (Vm), sodium and potassium channel activation variables (m, n, h), and sodium and potassium currents (INa, IK) given a stimulus current (Is).

2. **Change in Sodium and Potassium Currents**: This part involves using a depolarizing square pulse to initiate an action potential and plotting the changes in the sodium and potassium currents.

3. **Action Potential Refractory Period**: This part involves determining how soon after an action potential another one can be initiated by the same depolarizing square pulse. It also involves determining how long one has to wait if the magnitude of the pulse is doubled.

4. **Anode Break Initiation**: This part involves using a hyperpolarizing stimulus to initiate an anode break and plotting the results.

## Results

The results of the simulations are presented in the form of plots in a PDF report included in this repository.

## Usage

To run the simulations, clone this repository and run the scripts in MATLAB.

## Dependencies

- MATLAB
- MATLAB's ODE45 solver

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.
