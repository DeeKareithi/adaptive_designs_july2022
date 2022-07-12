//Dorcas Kareithi
//July2022
//Adaptive Designs Course 2022.
//Section: Simon two stage design

//install the singlearm package if not installed (I had already installed)
*ssc install singlearm 
*ssc install moremata


*singlearm has multiple commands for designing single-arm trials. We will use the des_fixed and des_gs commands, which find (respectively) single-stage and two-stage designs.

*let p0 be the probability of response in trial participants
*let p1 be the ideal/target probability of response (the clinically relevant difference)
*let alpha be the type 1 error rate (reject H0 when p=p0)
*let 1-beta be the power (reject H0 when p=p1)
*let nmax be the maximum sample size to allow


*Example in the slides
*single stage design
des_fixed, pi0(0.2) pi1(0.4) alpha(0.05) beta(0.1) nmax(60)
*retrieving the values from a matrix
mat list r(des)

*two stage optimal design
des_gs, pi0(0.2) pi1(0.4) alpha(0.05) beta(0.1) optimality(null_ess) nmax(60)
mat list r(des)

*two stage mini max design 
des_gs, pi0(0.2) pi1(0.4) alpha(0.05) beta(0.1) optimality(minimax) nmax(60)
mat list r(des)


*Questions in the practical
*1. 1.	For the case p0 = 0.2, p1 = 0.4, type I error rate = 0.05, power = 0.8, find the single-stage, optimal and minimax designs.

*single stage design
des_fixed, pi0(0.2) pi1(0.4) alpha(0.05) beta(0.2) nmax(60)
mat list r(des)

*two stage optimal design
des_gs, pi0(0.2) pi1(0.4) alpha(0.05) beta(0.2) optimality(null_ess) nmax(60)
mat list r(des)

*two stage mini max design 
des_gs, pi0(0.2) pi1(0.4) alpha(0.05) beta(0.2) optimality(minimax) nmax(60)
mat list r(des)

*2. Answer on word
*3. How would you calculate the Probability of Early Termination (PET) using the binomial command? Check that you get the same as the output from singlearm.
	
//here we refer to the optimal design, which says we need 3 people out of 13 to have success, with pi0 of 0.2
	f_binomial(13,3,0.2)

*4. You can use the command in singlearm called opchar_gs to evaluate the properties of specified designs for different values of p. Use this to evaluate how the operating characteristics change as p varies between values of 0.1 and 0.5. E.g., find the optimal design and then evaluate for p = 0.1, 0.2, …, 0.5 with

des_gs, pi0(0.2) pi1(0.4) alpha(0.05) beta(0.1) optimality(null_ess) nmax(60)
 mat list r(des)

opchar_gs, a(4, 15) r(., 16) n(19, 35) pi(0.1, 0.2, 0.3, 0.4, 0.5)
 mat list r(opchar)
 
*5.	*Explore the effect of changing the futility stopping rule after the first stage.
 *we do this using....
 

*6.	Using practical1.do, conduct a simulation study to assess the properties of the optimal design found in Q1. Try nreplicates = 100, nreplicates = 1000, nreplicates = 10000 to see how the number of replicates affects the precision of the estimated properties.
// Uses simulation to evaluate chance of rejecting H0 and of stopping early for
// futility

// Arguments:
// n1, n2, r1, r - as in Lecture 1
// p             - probability of response
// nreplicates   - number of simulation replicates

// Example use
n1          = 20
n2          = 20
r1          = 5
r           = 15
p           = 0.2

nreplicates = 100

stage1responders = rbinomial(nreplicates, 1, n1, p)
stage2responders = rbinomial(nreplicates, 1, n2, p)
totalresponders  = stage1responders + stage2responders
probrejecth0     = mean(stage1responders :>= r1 :& totalresponders :>= r)
PET              = mean(stage1responders :>= r1)
probrejecth0
PET
end

