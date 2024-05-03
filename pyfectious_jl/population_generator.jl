using Pkg
Pkg.activate("infect-env")
using Agents




@multiagent struct People(GraphAgent)
    @subagent struct Person
        id_number::Integer #An identification number 
        age::Integer #Age of the person
        health_condition::Float32 # A float between 0 & 1 used to represent medical history
        #i.e effective illness such as Diabetes  and Asthma
    
        gender::Integer# Gender of the inperson idicated by number (0-> Female, 1-> Male)
        family::Family #Persons family object
        communities::Array{Community} # A array containing persons community



    end
    @subagent struct Family
        id_number::Integer
    end
    @subagent struct Community 
        id_number::Integer

    end
end

