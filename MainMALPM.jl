"""
Main simulation of the lone parent model 

under construction 

Run this script from shell as 
# julia MainMALPM.jl

from REPL execute it using 
> include("MainMALPM.jl")
"""

include("./loadLibsPath.jl")

using MultiAgents: initMultiAgents, MAVERSION
using MultiAgents: AbstractMABM 

initMultiAgents()                 # reset agents counter
@assert MAVERSION == v"0.3"   # ensure MultiAgents.jl latest update 


if !occursin("multiagents",LOAD_PATH)
    push!(LOAD_PATH, "src/multiagents") 
end

using MALPM.Demography: MAModel 

# using LPM.ParamTypes.Loaders:    loadUKDemographyPars

#=
using MALPM.Demography.Create:     LPMUKDemography, LPMUKDemographyOpt, createUKDemography 
using MALPM.Demography.Initialize: initializeDemography!
using MALPM.Demography.SimSetup:   loadSimulationParameters

using MultiAgents: MABMSimulation
using MultiAgents: run! 
=# 

include("mainHelpers.jl")

const simPars, pars = getParameters() 

const model = setupModel(pars)

ukDemography = MAModel(model,pars)

if simPars.verbose
    @show "Town Samples: \n"     
    @show ukDemography.towns.agentsList[1:10]
    println(); println(); 
                        
    @show "Houses samples: \n"      
    @show ukDemography.houses.agentsList[1:10]
    println(); println(); 
                        
    @show "population samples : \n" 
    @show ukDemography.pop.agentsList[1:10]
    println(); println(); 
end 


#= 

# Declaration of a simulation 
lpmDemographySim = MABMSimulation(ukDemography,simProperties, 
                                  # example=LPMUKDemography())
                                  example=LPMUKDemographyOpt())


# Execution 

@time run!(lpmDemographySim)
=# 