# Schlieren Shock Visualization

- We visualize the changing of the direction of light passing through a distorting medium.
- The distance between the point source and the lense or the lense and the knife edge should be the focal distance.
- A shock has a large density gradient which will direct the light elsewhere. If we block half of the redirected light using the knife edge, a shadow will form on the detector.
- The distance between the to lenses is not too important.

# De Laval Nozzle

- This nozzle is used for rocket engins. It has diverging and converging nozzles. This allows us to accelerate the flow from subsonic to supersonic.
- **In the subsonic case:** In a converging nozzle, the velocity increases. In a diverging nozzle, the flow velocity will decrease.
- In the supersonic case: A converging nozzle will decrease the flow velocity. A diverging nozzle will increase the flow velocity.
- The De Laval nozzle converges the nozzle for the flow to reach M=1, and then subsequently diverge the nozzle to accelerate the flow into the supersonic regime.
- In a converging nozzle, you cannot move beyond M=1.
- If the nozzle converges beyond the region where M=1 then the flow at the more constricted nozzle portion will be M=1 and all points before, M<1.
- Due to the accelerating flow throughout the entire length of the De Laval nozzle, density changes will have to occur for the conservation of mass.

# Lab Specifics

- The lab set up is the De Laval half nozzle.
- There are pressure taps on the top half.
- The tube in the center of the tunnel traverses back and forward. It measures the total pressure. This allows us to align the tip of the pitot tube with different regions of the flow and thus in different Mach regimes.
- Since we cannot traverse the pitot tube to the 8th static port, we will not measure the 8th static port.
- The last column of our data is the pitot tube. The first 11 columns are the static pressure tabs. The first seven pressure taps are the ones we will be using.

# Specific Shocks

- In the De Laval nozzle, the flow will either be everywhere subsonic, or subsonic in the converging region and supersonic in the diverging region.
- For subsonic flows, there should be no shocks.
- When M = 1 is reached at the throat then flow is subsonic in the converging region and supersonic in the diverging regime. The supersonic flow very quickly goes back to subsonic due to losses in the tunnel. This transition is the normal shock.
- If we increase the flow further then the normal shock will move further back. Note that we increase the flow by increasing the vacume at the downwind side.
- We will begin to see a bow shock on the pitot tube for M>1.
- There is a sharp drop in velocity when the flow encounters the pitot tube. This causes a sudden compression of the air which propagate laterally and downstream for a bow shock.
- In a bow shock, the Mach number downstream of the shock is still supersonic. In a normal shock, the Mach number downstream of the shock is subsonic.

# Data Analysis

- Supersonic and subsonic static pressure and Mach number for theoretical and experimental data. For the four cases, plot the theoretical vs the experimental case.
- Calculate the pressure and Mach number at each port and plot the theoretical vs experimental for the subsonic Mach, supersonic Mach, subsonic static pressure, and supersonic static pressure.
- Subsonic theoretical: Talk about the equations used and the steps taken to calculate the theoretical curves. Also state the assumptions made.
    - We can assume isentropic since there is no shock. We can also disregard the presence of the pitot tube since we are doing theoretical calculations.
    - We can also use Bernoulli's to relate the static pressure to the total pressure.
        
        $$P_1+\frac{1}{2}\rho_1U_1^2=P_0$$
        
        $P_0$ is the total pressure. $P_1$ is the static pressure.
        
    - We can assume incompressible (we can still assume in a hand wavy way since it will not be largely above). We can use the continuity equation.
        
        $$A_1U_1=A_2U_2$$
        
    - Get $P_0$, $P_1$ from the experimental data and use to calculate the speed at point one (using Bernoulli). Then using the theoretical continuity relation, we can calculate the speed at all points. Knowing the velocity relationship, we can plug back into the Bernoulli equation to get the pressure distribution. We calculate the fist value since the continuity equation only gives the change in velocity.
    - Since incompressible, $\rho=1.225kg.km^3$.
    - Calculate the speed of sound as:
        
        $$a=\sqrt{\frac{\gamma P}{\rho}}$$
        
    - We can then calculate the Mach number with the information we have calculated so far.
- Supersonic theoretical: Things are a bit more complex.
    - Isentropic assumption still holds when we assume there is no shock.
        - This could be a potential source of deviation of our theoretical from our experimental data.
    - We also know that the Mach number will be one at the throat, $M_*=1$.
    - We can also assume a perfect gas.
    - The useful equation will be:
        
        $$\frac{A}{A_*}=\frac{1}{M}\left[\frac{2}{\gamma+1}\left(1 + \frac{\gamma-1}{2}M^2\right)\right]^\frac{\gamma+1}{2(\gamma-1)}$$
        
        This equation will have six roots. Four of them will be complex (which we can ignore), and two are real. Out of the real components, both of magnitude 1. one will correspond to M>1 and the other will correspond to M<1. We will have to choose which roots correspond to the different Mach regimes based on our theoretical understanding.
        
    - Calculate the pressure distribution.
        
        $$\frac{P_0}{P}=\left(1+\frac{\gamma-1}{2}M^2\right)^\frac{\gamma}{\gamma-1}$$
        
- Supersonic experimental: We can use isentropic relations to relate two points in the same "isentropic" regime. When there is a shock between the two points, we cannot use the regular isentropic relation.
    - We measure the static, $P$, and total pressure, $P_0$, of the flow (separated by a bow shock). We create a figment pressure, $P'$.
        
        $$\frac{P_0}{P}=\frac{P_0}{P'}\frac{P'}{P}$$
        
        But $P'$ is a function of the Mach number behind the bow shock but $P$ is a function of the Mach number before the bow shock. There is a function to relate these two Mach numbers to get everything in terms of the Mach number upstream of the bow shock.
        

# Report

- Cover page.
- 10 Pages of content.
- List of symbols.
- List of references.
- Appendices.
- Focus on the quality of writing (using correct jargon, proper explaining of ideas, etc.) since the data handling is not too difficult. Use this as a practice for fourth year thesis. Read up on papers of supersonic flow and imitate the way things are written.
- Due at midnight two weeks from November 11, 2021.
- Plot error bars with precision error.
- Ignore sampling frequency.
- Assume rake position is perfect.