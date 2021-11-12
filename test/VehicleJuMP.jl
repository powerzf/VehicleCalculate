using JuMP
using GLPK
model = Model(GLPK.Optimizer)
#unregister(model, :x)
@variable(model,1 <= x <= 100,Int)
@variable(model,1 <= y <= 100,Int)

@NLobjective(model,Min,abs(y/x-2.9))
print(model)
optimize!(model)
solution_summary(model)
println("** Optimal objective function value = ", JuMP.objective_value(model))
println("** Optimal x = ", JuMP.value(x))
println("** Optimal y = ", JuMP.value.(y))