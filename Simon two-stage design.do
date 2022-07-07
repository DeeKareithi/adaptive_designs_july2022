//Dorcas Kareithi
//July2022
//Adaptive Designs Course 2022.
//Section: Simon two stage design

//install the singlearm package if not installed (I had already installed)
*ssc install singlearm 

*singlearm has multiple commands for designing single-arm trials. We will use the des_fixed and des_gs commands, which find (respectively) single-stage and two-stage designs.

*let p0 be the probability of response in trial participants
*let p1 be the ideal/target probability of response (the clinically relevant difference)
*let alpha be the type 1 error rate (reject H0 when p=p0)
*let 1-beta be the power (reject H0 when p=p1)
*let nmax be the maximum sample size to allow


. des_fixed, pi0(0.2) pi1(0.4) alpha(0.05) beta(0.1) nmax(60)


. des_gs, pi0(0.2) pi1(0.4) alpha(0.05) beta(0.1) optimality(“null_ess”) nmax(60) 
. des_gs, pi0(0.2) pi1(0.4) alpha(0.05) beta(0.1) optimality(“minimax”) nmax(60)


