//Dorcas Kareithi
//July2022
//Adaptive Designs Course 2022.
//Section: Sample size re-estimation


//changing the working directory

cd "C:\Users\Dorcas\Documents\Newcastle\Key Courses\Adaptive designs\July 2022\Practicals\Practical 8 - Stata"


//////////////////////////////////////////////////////////////////////////////////

*Exercise 1
/*
sim_gs, l(numlist miss) u(numlist miss) [n(integer 50)] ///
		tau(real 0) sd(real 1) RATio(real 1) sd_z(real -1) ///
		t_rest ADJusted ALPha(real 0.05) ///
		REPlicates(integer 1000000)
*/

//example:
sim_gs, l(1,1.88) u(2.76, 1.88) n(50) sd(1) tau(0.3)

//question: what is the value of tau that gives a 90% power? (we do trial and error lol)

sim_gs, l(1,1.88) u(2.76, 1.88) n(50) sd(1) tau(0.4)
sim_gs, l(1,1.88) u(2.76, 1.88) n(50) sd(1) tau(0.5) //this is it

//////////////////////////////////////////////////////////////////////////////////

*Exercise 2


