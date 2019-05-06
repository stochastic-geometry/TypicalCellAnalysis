# Distance Distributions for the Type I User Point Porcess
### Authors: Praful D. Mankar, Harpreet S. Dhillon, and Martin Haenggi.
#### Email for correspondence: prafuldm@vt.edu

Description: Matlab code for the distance distributions used in the paper "Meta Distribution Analysis of the Downlink SIR for the Typical Cell in a Poisson Cellular Network".  This code approximates the distributions of distances Rn of the n-th nearest BS from the typical user of the Type I user point process [1].  The apporximated closed form expression for the distribution of Rn is F(r) = Gamma(n,3.14 lambda rho_n r^2)/Gamma(n) where Gamma(.) and Gamma(.,.) respectively are gamma and lower incomplete gamma functions, lambda is BS density and rho_n is the correction factor. 

Use 'Main.m' to verify the distributions of Rn and to obtained the correction factors rho_n. 


#### Reference: [1] M. Haenggi, "User Point Processes in Cellular Networks," in IEEE Wireless Communications Letters, vol. 6, no. 2, pp. 258-261, April 2017.
 
