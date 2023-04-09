# Visualizing the Dynamics of Periodic and Aperiodic Oscillatory Dynamics in a Circadian Model



## Getting started

## Cloning the Project

- Locate the Clone dropdown icon and copy the link under the header that says "Clone with HTTPS"
- Navigate to your terminal to where you want the repo to live and type: `git clone` **paste copied link here**
- Launch MATLAB from terminal with the following command: `matlab .`

## Running Instructions

There will be a total of 5 files that the user can compile and run, 3 of which are driver files: `rhs.m`, `rhs_ft.m`, `solver.m`, `p_continuation.m`, and `bifurcation.m`.

`rhs.m` and `rhs_ft.m` are the two files which include the parameters necessary to produce solutions that stablize to equilibrium and solutions that stabilize to a limit cycle (a solution with oscillatory behavior).
`rhs.m` is the file of parameter inputs for the system that doesn't have a light function forcing it, our baseline system. `rhs_ft.m` is the file where parameters and the system of differential equations make use of
the sinosudal light function. Note that changes to these files must only be block commenting the parameters that associate with a certain behavior. For example, if the user wishes to view the stable equlibrium solution
of the baseline model, then in `rhs.m`, they should block comment the parameters under the comment *"parameter for stable limit cycle solution"* and uncomment the parameters under the comment *"stable equilibrium solution."* 
Do not make any changes to the equations at the bottom of both files, and do not uncomment the middle block with header comment *"Stable Limit Cycle."* Make sure to compile before running the driver file associated with it, 
`solver.m`.

As for the driver files, they are: `solver.m`, `p_continuation.m`, and `bifurcation.m`. `solver.m` produces nominal model solutions, which include solutions to the baseline system of ODE's with original parameters, 
solution of ODE's with the sinosudal light function, solutions with time course of variables. Note nominal means rigid with original parameters, there will be seven different graphs outputted to the screen by using the same parameters. The user need not make any changes in this file,
can simply press the *Run* play button within the matlab window after making and compiling their changes (if any were made) in the `rhs.m` or `rhs_ft.m` files.

`p_continuation.m` and `bifurcation.m` are the two files that are associated with the Hopf birfurcation analysis at a single parameter, `alpha1`. These two files can be compiled and run independent of `rhs.m`, `rhs_ft.m`, and 
`solver.m`. `p_continuation.m` consists of the numerical continuation scheme in one parameter, `alpha1`, we use numerical solutions and different values of 'alpha1' so that we can understand the influence of the parameter on the dynamics of the system, which can be behavior such as: does
the solution graph oscillate, does the solution converge to a stable equlibrium point, etc. `bifurcation.m` plots the minimum and maximum values of the solutions visualize the Hopf bifurcation. 
It is required to run the 'p_continuation.m' before running 'bifurcation.m', so we can run the bifurcation diagram on the stability diagram given by 'p_continuation.m'.The user may not modify any content of these two files.



## Integrate with your tools

- [ ] [Set up project integrations](https://gitlab.eecs.umich.edu/logm/wn23/circadian-rhythms/circadian/-/settings/integrations)

***

## Description

The goal of this project is to mathematically model circadian rhythms and identify parameters and initial conditions of the model that give us different behavior. Examples of behavior we are interested in are: stable oscillatory behavior, transient behavior, aperiodic and quasiperiodic behavior. We also want to mimic
the circadian rhythm of living organisms to the best of our abilites, so that involves creating a forcing light function and looking at the effects it has on our system since the circadian rhythms of living organisms depend on the presence of a light source. 
As of now, our project proficently observes the stable oscillatory behavior and equilibrium behavior, and we plan to observe more of the effects of transient and aperiodic behavior. Mathematical modelling a stable system will allow us to understand what quantity of biological composition will produce stable circadian rhythm. 
Biological composition in our case is the ratio of different elements in the system such as activator, prepressor protein, mRNA, etc. 
The ODE system in our model includes three equations. First one is dy1/dt =  α1L(t, 10)f (y6, A, Kd ) − β1y2, representing the free activators A that is not bound by P so A can promotes the transcription.The second one is dPc/dt = α2·M − β2Pc, representing how much repressor Pc is produced outside of the nucleus in the secon stage. The Third equation is dP/dt=α3·Pc−β3P, representing the amount of P is produced within the cell nucleus.Note in these three equations, the negative β represents the degradation rate and Kd represents the strength of the bounds between P and A. 
  Also, the mathematical modelling of such behaviors will also allow scientists to detect characteristics of a living organism's circadian rhythm that can cause abnormalities. For example, it is known that when the period of time a rat is exposed to light is longer than the usual 12 hours that most living organisms are used to, it causes the rats to be active at different times, which affects their circadian rhythm. Visualizing the dynamics of the system will allow us to generate expected data that can be used 
as comparisions in experimentation as well. 

Refer to [KimForger](https://pubmed.ncbi.nlm.nih.gov/23212247/) and [YaoTyson](https://journals.plos.org/ploscompbiol/article?id=10.1371/journal.pcbi.1008340) for more information.

## Visuals
Depending on what you are making, it can be a good idea to include screenshots or even a video (you'll frequently see GIFs rather than actual videos). Tools like ttygif can help, but check out Asciinema for a more sophisticated method.

## Installation
Within a particular ecosystem, there may be a common way of installing things, such as using Yarn, NuGet, or Homebrew. However, consider the possibility that whoever is reading your README is a novice and would like more guidance. Listing specific steps helps remove ambiguity and gets people to using your project as quickly as possible. If it only runs in a specific context like a particular programming language version or operating system or has dependencies that have to be installed manually, also add a Requirements subsection.

## Usage
Running solver.m: 

If the user wishes to look at the output of the solution of the system of ODE's without the light function, they can do the following: 

1) Make changes to the right input file - rhs.m is the file where the parameters and the system of equations don't include the light function. Block comment parameters associated with behavior you don't want to see. For example:
![Screenshot of rhs.m]("C:\Users\psark\Pictures\Screenshot 2023-03-27 122151.png")


## Support
Tell people where they can go to for help. It can be any combination of an issue tracker, a chat room, an email address, etc.

## Roadmap
In the future, we would like to observe what happens to circadian rhythms when light behaves differently from what most living organisms experience. So far, we've looked at a sinosudal light function that mimics the gradual change in exposure of light during
the daytime versus the nighttime. Light with different behavior would be turning off and on a light switch, where there is either total exposure to light or entirely no exposure to light. Living organisms that would experience this type of change in light are 
living organisms in a lab setting, where light can be controlled in such a manner, and there is evidence with existing models that the rhythms behave quite differently compared to gradually being exposed to light. We would like to study these effects with our 
existing model as well and see if our observations align with prexisting evidence.

## Authors and acknowledgment
Contributors: Ruby Kim, Jackie Song, Josef Sajonz, Kalinda Yu, Anna Kaplan, Phoebe Sarker

## Project status
Currently working on visualizing the dynamics of the system with a square light function.
