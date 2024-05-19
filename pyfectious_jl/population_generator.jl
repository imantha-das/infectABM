using Pkg
Pkg.activate("infect-env")
using Agents
using Base:@kwdef

abstract type AbstractPlace end

@multiagent struct People(GraphAgent)
    @subagent struct Person
        #id : Part of GraphAgent
        #pos : Part of GraphAgent
        age::Integer #Age of the person
        health_condition::Float32 # A float between 0 & 1 used to represent medical history
        #i.e effective illness such as Diabetes  and Asthma
    
        gender::Integer# Gender of the inperson idicated by number (0-> Female, 1-> Male)
        family::Family #Persons family object
        communities::Array{Community} = [] # A array containing persons community

        #? These are of type "connection_edges" in pyfectious
        to_connection_edges::Array{Integer} = []# a array containing connection edges from this person to others
        from_connection_edges::Array{Integer} = [] #a array containing connection edges from others to person

        #? Pyfectious uses "Infectious_Status" which takes the values 0 for CLEAN, 1 for INCUBATION, 2 for CONTAGIOUS and they are of type Enum
        #? for ease of use we will just take :clean, :incubation, :contagious as symbols
        infectious_status::Symbol = :CLEAN
        current_location::Union{AbstractPlace, Nothing} = nothing

        is_alive::Bool = true #dead or is_alive
        is_hospitalized::Bool = true #in hospital or nothing
        has_profession::Bool = true #has a career or nothing
        time_of_infection::Int = 0 #time at which individual is infected 
        is_quarantined::Bool = false #is quarantined or Nothing

        roles::Array{String} = [] #name of the roles of this person
        transmission_ids::Array{Int} = [] #ids of the number of people infected by this individual

    end
    @subagent struct Family
        #id : part of GraphAgent 
        #pos :: Part of GraphAgent
    end
    @subagent struct Community 
        #id : Part of GraphAgent
        #pos : Part of GraphAgent

    end
end

@doc"""
Attributes
person : The person this place represents its location 
community : if mentioned person is in a community 
subcommunity_type_index : Index of the sub community if he/she is in a community 
is_family : Whether the person is near hsi/her family
""" ->
mutable struct Place <: AbstractPlace
    person::Person
    community::Community
    subcommunity_type_index::Union{Integer, Nothing} #? ensure this is the correct type 
    is_family::Bool
end
