using gRPCClient

include("PlayerInterfaceClients.jl")
include("GameState.jl")

using .PlayerInterfaceClients

import .PlayerInterfaceClients: MessageType, GameSettings, Move, SplitRequest, GameUpdateMessage, UpdatedCell, PlayerScore, RegisterRequest, SubsribeRequest, ServerUpdateMessage, EmptyRequest, PlayerHost, PlayerHostStub, PlayerHostBlockingStub, Register, Subscribe, MakeMove, SplitSnake, SubscribeToServerEvents


moveClient = PlayerHostBlockingClient("http://192.168.178.62:5168");
updatesClient = PlayerHostBlockingClient("http://192.168.178.62:5168");
registerClient = PlayerHostBlockingClient("http://192.168.178.62:5168");

playerName = "Julia";
if length(ARGS) > 0 && length(ARGS[1]) > 0
    playerName = ARGS[1];
end


playerIdentifier = "";
function makeAndSendMove(gameState::GameState)
    splits = GetSplits(gameState);
    if length(splits) > 0
        for split in splits
            SplitSnake(moveClient, split);
            sleep(0.01);
        end
    end
    moves = GetMoves(gameState);
    for move in moves
        MakeMove(moveClient, move);
        sleep(0.01);
    end
end



registerObject = RegisterRequest(; playerName=playerName);
a,b = Register(registerClient, registerObject);

gRPCCheck(b);

playerIdentifier = a.playerIdentifier;
gameState = GameState(tuple(Int.(a.dimensions)...), Int.(a.startAddress), playerName);


subscribeRequest = SubsribeRequest(; playerIdentifier=a.playerIdentifier);
gameUpdateEvents, subscribeStatus = Subscribe(updatesClient, subscribeRequest);
println("ready to go");
#while true
@async begin
    for gameUpdate in gameUpdateEvents
        println("received game update");
        UpdateGameState(gameState, gameUpdate);
        makeAndSendMove(gameState);
    end
    println("game update ended?");
end

gRPCCheck(subscribeStatus); 

println("game ended?");
