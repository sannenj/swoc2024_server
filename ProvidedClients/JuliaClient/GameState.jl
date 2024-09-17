using .PlayerInterfaceClients
using Random: bitrand

import .PlayerInterfaceClients: GameUpdateMessage, UpdatedCell, PlayerScore

include("Snake.jl")

mutable struct Cell
    Address::Vector{Int};
    HasFood::Bool;
    HasPlayer::Bool;

    function Cell(address::Vector{Int}, food::Bool, player::Bool)
        return new(address, food, player);
    end
end

mutable struct GameState
    Cells::Array{Cell};
    Dimensions::NTuple{N,Int} where N
    Snakes::Array{Snake}
    function GameState(dims::NTuple{N,Int}, startAddress::Vector{Int}, playerName::String) where N
        snakes = Snake[];
        push!(snakes, Snake(Int.(startAddress) .+ 1, playerName));
        cells = Array{Cell}(undef, dims);
        return new(cells, dims, snakes);
    end
end

function GetCell(state::GameState, address::Vector{Int})
    if !isassigned(state.Cells, address...)
        state.Cells[address...] = Cell(address, false, false);
    end 
    return state.Cells[address...];
end

function SetCell(state::GameState, address::Vector{Int}, food::Bool, player::Bool)
    if !isassigned(state.Cells, address...)
        state.Cells[address...] = Cell(address, food, player);
    else
        cell = state.Cells[address...];
        cell.HasFood = food;
        cell.HasPlayer = player;
    end 
end

function IsValidAndEmpty(state::GameState, address::Vector{Int})
    #println(address);
    if !checkbounds(Bool, state.Cells, address...)
        return false
    end
    return !(GetCell(state, address).HasPlayer);
end

function HasFood(state::GameState, address::Vector{Int})
    if !checkbounds(Bool, state.Cells, address...)
        return false
    end
    return (GetCell(state, address).HasFood);
end

function GetValidAddress(state::GameState, address::Vector{Int})
    while true
        result = copy(address);
        dim = rand(1:length(state.Dimensions),1)[1];
        direction = bitrand(1)
        if direction[1]
            result[dim] += 1;
        else
            result[dim] -= 1;
        end
        if IsValidAndEmpty(state, result)
            return result;
        end
    end
end

function GetMoves(gameState::GameState)
    moves = Move[];
    for snake in gameState.Snakes
        println("making move for snake " * snake.Name);
        address = GetValidAddress(gameState, snake.Head);
        snake.Head = address;
        push!(snake.Segments, address);
        if HasFood(gameState, address)
            snake.Length = snake.Length + 1;
        else
            popfirst!(snake.Segments);
        end
        move = Move(playerIdentifier=playerIdentifier, snakeName=snake.Name, nextLocation=Int32.(address .- 1));
        push!(moves, move);
    end
    return moves;
end

function GetSplits(gameState::GameState)
    splits = SplitRequest[];
    for snake in gameState.Snakes
        if snake.Length > 2 && length(gameState.Snakes) < 11
            println("old snake:");
            for seg in snake.Segments
                println(seg);
            end
            snake.Length = snake.Length - 1;
            snake.KidCount += 1;
            newHead = popfirst!(snake.Segments); #this also removes it from snake
            println(newHead);
            newSnake = Snake(newHead, snake.Name * "." * string(snake.KidCount));
            push!(newSnake.Segments, newHead);
            push!(gameState.Snakes, newSnake);
            address = GetValidAddress(gameState, newSnake.Head);
            println(address);
            newSnake.Head = address;
            push!(newSnake.Segments, address);
            if HasFood(gameState, address)
                newSnake.Length = 2;
            else
                popfirst!(newSnake.Segments);
            end
            split = SplitRequest(playerIdentifier=playerIdentifier, oldSnakeName=snake.Name, newSnakeName=newSnake.Name, snakeSegment=1, nextLocation=Int32.(address .- 1));
            push!(splits, split);
        end
    end
    return splits;
end

function UpdateGameState(state::GameState, update::GameUpdateMessage)
    for cell in update.updatedCells
        address = Int.(cell.address) .+ 1;
        SetCell(state, address, cell.foodValue > 0, !isempty(cell.player));
    end
end

