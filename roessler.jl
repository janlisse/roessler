using DifferentialEquations

function rössler!(du,u,p,t)
    x,y,z = u
    a,b,c = p
    du[1] = dx = -y - z
    du[2] = dy = x + a*y
    du[3] = dz = b + z*(x-c)
end

u0 = [1.0,1.0,0.0]
p = (0.2,0.2,5.7)
tspan = (0.0,100.0)
prob = ODEProblem(rössler!,u0,tspan,p)
sol = solve(prob)

using Plots
plot(sol, vars = (1,2,3))
