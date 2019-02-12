using DifferentialEquations


function rössler!(du,u,p,t)
    a,b,c = p
    du[1] = -u[2] - u[3]
    du[2] = u[1] + a*u[2]
    du[3] = b + u[3]*(u[1]-c)
end

u0 = [1.0,1.0,0.0]


p = (0.2,0.2,5.7)

tspan = (0.0,1000.0)
prob = ODEProblem(rössler!,u0,tspan,p)





mutable struct Rössler
    dt; a; b; c; x; y; z
end


function step!(r::Rössler)
    dx = -r.y - r.z      ; r.x += r.dt * dx
    dy = r.x + r.a*r.y ; r.y += r.dt * dy
    dz = r.b + r.z*(r.x-r.c)    ; r.z += r.dt * dz
end

attractor = Rössler((dt = 0.02, a = 0.2, b = 0.2, c = 5.7, x = 1., y = 1., z = 1.)...)
