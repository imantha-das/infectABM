using Pkg 
Pkg.activate("infect-env")
using Revise:includet

includet("population_generator.jl")

p1 = Person(
    id = 1, pos = 1, age = 36, health_condition = 0.5,
    gender = 1, family = Family(1,1) 
)

f1 = Family(id = 1, pos = 1)
