"""
    This is a struct that resembles the AgentBasedModel concept from the package Agents.jl 

    Initial ideas: 

    1. To integrate this code with SocialGroups.jl. Thus, a Group is an ABM. 
    
    2. a MultiAgentBasedModel concept is to be invented

    3. This can be integrated to Agents.jl 
""" 

# import SocialAgents: AbstractAgent

using SocialAgents

export AgentBasedModel, add_agent! 

mutable struct AgentBasedModel{AgentType <: AbstractAgent} 
    agentsList::Array{AgentType,1} 

end # AgentBasedModel  

AgentBasedModel{AgentType}() where AgentType <: AbstractAgent = AgentBasedModel(AgentType[])

#const ABM = AgentBasedModel{AgentType} 
      # where AgentType <: AbstractAgent 

#=
This is how Agents.jl ABM looks like 

mutable struct ABM
    AgentType::DataType  # where agentType <: AbstractAgent
    
    # spaceType  (default is nothing): The space on which the agents are operating 
    # properties dictionary of symbols to values or struct 
    
    agentsList::Array{AbstractAgent,1} #     a list of agents of type A

    # cors:
    # ABM(agentType,spaceType,properties;kwargs...)
    # ABM(agentType,properties;kwargs...)

    function ABM(atype::DataType) 
        atype <: AbstractAgent ? new(atype,[]) : error("$atype is not an agent type")
    end 
end # ABM 

=#

"""
Stepping function for a model of type AgentBasedModel with 
    agent_step!(agentObj,modelObj::AgentBasedModel) 
    model_step!(modelObj::AgentBasedModel)
    n::number of steps 
    agents_first : agent_step! executed first before model_step
"""
function step!(
    model::AgentBasedModel, 
    agent_step!,
    model_step!,  
    n::Int=1,
    agents_first::Bool=true 
)  
    # implementation     
    nothing 
end

# Other versions of the above function
#    model_step! is omitted 
#    n(model,s)::Function 
#    agent_step! function can be a dummystep 

"return the id-th agent"
function getindex(model::AgentBasedModel,id) 
    nothing 
end

# equivalent to operator [], i.e. model[id] 

"random seed of the model"
function seed!(model::AgentBasedModel,seed) 
    nothing 
end 

#= 
Couple of other useful functions may include:

function nagents(model)   : number of agents 

function allagents(model) : iterator over agents

function allids(model)    : iterator over ids

=# 

#=
"add agent to the model"
function add_agent!(agent,pos,model::AgentBasedModel) 
    nothing 
end
=# 

"add agent with its position to the model"
function add_agent!(agent::AbstractAgent,model::AgentBasedModel) # where T <: AbstractAgent
    push!(model.agentsList,agent)
end 

"to a given position" 
function move_agent!(agent,pos,model::AgentBasedModel)
    nothing 
end 

"remove an agent"
function kill_agent!(agent,model::AgentBasedModel) 
    nothing 
end

#=
Other potential functions 

genocide(model::ABM): kill all agents 
=# 