using DifferentialEquations

function rössler!(du,u,p,t)
    a,b,c = p
    du[1] = -u[2] - u[3]
    du[2] = u[1] + a*u[2]
    du[3] = b + u[3]*(u[1]-c)
end

u0 = [1.0,1.0,0.0]
p = (0.2,0.2,5.7)
tspan = (0.0,100.0)
prob = ODEProblem(rössler!,u0,tspan,p)
sol = solve(prob)

using Plots
plot(sol, vars = (1,2,3))
