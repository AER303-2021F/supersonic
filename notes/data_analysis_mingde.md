# Data Analysis Notes (Mingde)
(Taken in lab)
## Calculate:
* For each of `supersonic` and `subsonic`
  * `Mach number` distr for both theoretical and experimental
  * `Static pressure` distr for both theoretical and experimental

Calculate P and M at each of the points 1 to 7
should look like L6b slide 76

## Calculations - Theoretical Subsonic
Discuss equations we used, and each of the steps we used to arrive at our theoretical predictions. State assumptions.

Assumptions:
* Isentropic
    $$P_1 + \frac{1}{2} \rho_1 U_1^2 = P_\circ$$
    (Bernoulli)
* Incompressible (works OK at M = 0.5)
    $$A_1 U_1 = A_2 U_2$$
    (continuity with density factored out)
* Perfect gas

Use only the FIRST experimental data point.
* $P_\circ$ (total pressure)
* $P_1$ (static pressure)

From this, calculate $U_1$. Then, put into continuity equation to get $U_2$ for an arbitrary point, with $A_2$ from the table.

Assuming $P_\circ$ to be constant, we can sub $U_2$ into Bernoulli to get the static pressure at any other point.

Givens:
* $\rho$ = 1.225 kg/m^3 CNST
* $a$ = $\sqrt{\frac{\gamma P}{\rho}}$

## Calculations - Experimental Subsonic
Use Bernoulli at **each point** to find velocity, and you already have the static measurements.

## Calculations - Theoretical Supersonic
Assumptions:
* Isentropic {Assuming that there are NO shocks, BL, losses etc. No shocks in the main body of the flow.}
* $M_*=1$ (throat Mach number)
* Perfect Gas

### Mach Number
$$\frac{A}{A_*} = \frac{1}{M} \left[\frac{2}{\gamma+1} \left(1 + \frac{\gamma-1}{2}M^2 \right)\right]^{\frac{\gamma+1}{2(\gamma-1)}}$$
6 roots, have MATLAB solve it.

4 roots are complex, which we can reject.

2 are real, one > 1, one < 1, take supersonic number

The reason we have 2 roots is because they each correspond to one side of the de Laval nozzle in area.


### Pressure
Isentropic relationship
$$\frac{P_\circ}{P} = \left(1 + \frac{\gamma-1}{2} M^2\right)$$
Get from first measurement:
* $P_\circ$ (total pressure)
* $P_1$ (static pressure)


## Calculations - Experimental Supersonic
The bow shock cuts between the two measurements we take of the static and total pressure tubes.

We need to find an expression for $P'$, the static pressure as observed at the total pressure measurement tube, in terms of $P$.

i.e. $\frac{P_\circ}{P} = \frac{P_\circ}{P'} \frac{P'}{P}$.
Both functions however, are functions of different Mach numbers.

(Use slides)

# Expectations for Report
* 10 pages of content (not incl. else)
* Title Page
* List of Symbols
* Referneces
* Appendix
* Code

Data analysis is quite simple, not a ton of error analysis. 

Instead, **focus on quality of writing** (correct jargon, explaining thoughts and ideas), as preparation for thesis. Take this as a practice for thesis. Look into different resources that talk about supersonic flow, copy the jargons correspondingly, imitate the way things are written. Read engsci theses if possible.

# Error
* Precision error = RMS/sqrt(N)'
* Rake is perfect