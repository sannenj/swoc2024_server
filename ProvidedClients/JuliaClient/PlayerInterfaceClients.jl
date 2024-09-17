module PlayerInterfaceClients
using gRPCClient

include("PlayerInterface.jl")
using .PlayerInterface

import Base: show

# begin service: PlayerInterface.PlayerHost

export PlayerHostBlockingClient, PlayerHostClient

struct PlayerHostBlockingClient
    controller::gRPCController
    channel::gRPCChannel
    stub::PlayerHostBlockingStub

    function PlayerHostBlockingClient(api_base_url::String; kwargs...)
        controller = gRPCController(; kwargs...)
        channel = gRPCChannel(api_base_url)
        stub = PlayerHostBlockingStub(channel)
        new(controller, channel, stub)
    end
end

struct PlayerHostClient
    controller::gRPCController
    channel::gRPCChannel
    stub::PlayerHostStub

    function PlayerHostClient(api_base_url::String; kwargs...)
        controller = gRPCController(; kwargs...)
        channel = gRPCChannel(api_base_url)
        stub = PlayerHostStub(channel)
        new(controller, channel, stub)
    end
end

show(io::IO, client::PlayerHostBlockingClient) = print(io, "PlayerHostBlockingClient(", client.channel.baseurl, ")")
show(io::IO, client::PlayerHostClient) = print(io, "PlayerHostClient(", client.channel.baseurl, ")")

import .PlayerInterface: Register
"""
    Register

- input: PlayerInterface.RegisterRequest
- output: PlayerInterface.GameSettings
"""
Register(client::PlayerHostBlockingClient, inp::PlayerInterface.RegisterRequest) = Register(client.stub, client.controller, inp)
Register(client::PlayerHostClient, inp::PlayerInterface.RegisterRequest, done::Function) = Register(client.stub, client.controller, inp, done)

import .PlayerInterface: Subscribe
"""
    Subscribe

- input: PlayerInterface.SubsribeRequest
- output: Channel{PlayerInterface.GameUpdateMessage}
"""
Subscribe(client::PlayerHostBlockingClient, inp::PlayerInterface.SubsribeRequest) = Subscribe(client.stub, client.controller, inp)
Subscribe(client::PlayerHostClient, inp::PlayerInterface.SubsribeRequest, done::Function) = Subscribe(client.stub, client.controller, inp, done)

import .PlayerInterface: GetGameState
"""
    GetGameState

- input: PlayerInterface.EmptyRequest
- output: PlayerInterface.GameStateMessage
"""
GetGameState(client::PlayerHostBlockingClient, inp::PlayerInterface.EmptyRequest) = GetGameState(client.stub, client.controller, inp)
GetGameState(client::PlayerHostClient, inp::PlayerInterface.EmptyRequest, done::Function) = GetGameState(client.stub, client.controller, inp, done)

import .PlayerInterface: MakeMove
"""
    MakeMove

- input: PlayerInterface.Move
- output: PlayerInterface.EmptyRequest
"""
MakeMove(client::PlayerHostBlockingClient, inp::PlayerInterface.Move) = MakeMove(client.stub, client.controller, inp)
MakeMove(client::PlayerHostClient, inp::PlayerInterface.Move, done::Function) = MakeMove(client.stub, client.controller, inp, done)

import .PlayerInterface: SplitSnake
"""
    SplitSnake

- input: PlayerInterface.SplitRequest
- output: PlayerInterface.EmptyRequest
"""
SplitSnake(client::PlayerHostBlockingClient, inp::PlayerInterface.SplitRequest) = SplitSnake(client.stub, client.controller, inp)
SplitSnake(client::PlayerHostClient, inp::PlayerInterface.SplitRequest, done::Function) = SplitSnake(client.stub, client.controller, inp, done)

import .PlayerInterface: SubscribeToServerEvents
"""
    SubscribeToServerEvents

- input: PlayerInterface.EmptyRequest
- output: Channel{PlayerInterface.ServerUpdateMessage}
"""
SubscribeToServerEvents(client::PlayerHostBlockingClient, inp::PlayerInterface.EmptyRequest) = SubscribeToServerEvents(client.stub, client.controller, inp)
SubscribeToServerEvents(client::PlayerHostClient, inp::PlayerInterface.EmptyRequest, done::Function) = SubscribeToServerEvents(client.stub, client.controller, inp, done)

# end service: PlayerInterface.PlayerHost

end # module PlayerInterfaceClients
