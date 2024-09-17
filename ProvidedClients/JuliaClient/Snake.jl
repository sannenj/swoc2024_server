mutable struct Snake
    Head::Vector{Int};
    Segments::Vector{Vector{Int}}
    Length::Int;
    Name::String;
    KidCount::Int;

    function Snake(address::Vector{Int}, name::String)
        println("creating new snake: " * name);
        Segments = Vector{Vector{Int}}(undef, 0);
        push!(Segments, address);
        return new(address, Segments, Int.(1), name, 0);
        println("snake is finished: " * name);
    end
end
