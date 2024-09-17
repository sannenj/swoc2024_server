# syntax: proto3
using ProtoBuf
import ProtoBuf.meta

const MessageType = (;[
    Symbol("gameStateChange") => Int32(0),
    Symbol("playerJoined") => Int32(1),
]...)

mutable struct GameSettings <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function GameSettings(; kwargs...)
        obj = new(meta(GameSettings), Dict{Symbol,Any}(), Set{Symbol}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            if fldval !== nothing
                values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
            end
        end
        obj
    end
end # mutable struct GameSettings
const __meta_GameSettings = Ref{ProtoMeta}()
function meta(::Type{GameSettings})
    ProtoBuf.metalock() do
        if !isassigned(__meta_GameSettings)
            __meta_GameSettings[] = target = ProtoMeta(GameSettings)
            pack = Symbol[:dimensions,:startAddress]
            allflds = Pair{Symbol,Union{Type,String}}[:dimensions => Base.Vector{Int32}, :startAddress => Base.Vector{Int32}, :playerIdentifier => AbstractString, :gameStarted => Bool]
            meta(target, GameSettings, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, pack, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_GameSettings[]
    end
end
function Base.getproperty(obj::GameSettings, name::Symbol)
    if name === :dimensions
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{Int32}
    elseif name === :startAddress
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{Int32}
    elseif name === :playerIdentifier
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :gameStarted
        return (obj.__protobuf_jl_internal_values[name])::Bool
    else
        getfield(obj, name)
    end
end

mutable struct Move <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function Move(; kwargs...)
        obj = new(meta(Move), Dict{Symbol,Any}(), Set{Symbol}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            if fldval !== nothing
                values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
            end
        end
        obj
    end
end # mutable struct Move
const __meta_Move = Ref{ProtoMeta}()
function meta(::Type{Move})
    ProtoBuf.metalock() do
        if !isassigned(__meta_Move)
            __meta_Move[] = target = ProtoMeta(Move)
            pack = Symbol[:nextLocation]
            allflds = Pair{Symbol,Union{Type,String}}[:playerIdentifier => AbstractString, :snakeName => AbstractString, :nextLocation => Base.Vector{Int32}]
            meta(target, Move, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, pack, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_Move[]
    end
end
function Base.getproperty(obj::Move, name::Symbol)
    if name === :playerIdentifier
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :snakeName
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :nextLocation
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{Int32}
    else
        getfield(obj, name)
    end
end

mutable struct SplitRequest <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function SplitRequest(; kwargs...)
        obj = new(meta(SplitRequest), Dict{Symbol,Any}(), Set{Symbol}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            if fldval !== nothing
                values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
            end
        end
        obj
    end
end # mutable struct SplitRequest
const __meta_SplitRequest = Ref{ProtoMeta}()
function meta(::Type{SplitRequest})
    ProtoBuf.metalock() do
        if !isassigned(__meta_SplitRequest)
            __meta_SplitRequest[] = target = ProtoMeta(SplitRequest)
            pack = Symbol[:nextLocation]
            allflds = Pair{Symbol,Union{Type,String}}[:playerIdentifier => AbstractString, :oldSnakeName => AbstractString, :newSnakeName => AbstractString, :snakeSegment => Int32, :nextLocation => Base.Vector{Int32}]
            meta(target, SplitRequest, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, pack, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_SplitRequest[]
    end
end
function Base.getproperty(obj::SplitRequest, name::Symbol)
    if name === :playerIdentifier
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :oldSnakeName
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :newSnakeName
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :snakeSegment
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :nextLocation
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{Int32}
    else
        getfield(obj, name)
    end
end

mutable struct UpdatedCell <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function UpdatedCell(; kwargs...)
        obj = new(meta(UpdatedCell), Dict{Symbol,Any}(), Set{Symbol}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            if fldval !== nothing
                values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
            end
        end
        obj
    end
end # mutable struct UpdatedCell
const __meta_UpdatedCell = Ref{ProtoMeta}()
function meta(::Type{UpdatedCell})
    ProtoBuf.metalock() do
        if !isassigned(__meta_UpdatedCell)
            __meta_UpdatedCell[] = target = ProtoMeta(UpdatedCell)
            pack = Symbol[:address]
            allflds = Pair{Symbol,Union{Type,String}}[:address => Base.Vector{Int32}, :player => AbstractString, :foodValue => Int32]
            meta(target, UpdatedCell, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, pack, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_UpdatedCell[]
    end
end
function Base.getproperty(obj::UpdatedCell, name::Symbol)
    if name === :address
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{Int32}
    elseif name === :player
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :foodValue
        return (obj.__protobuf_jl_internal_values[name])::Int32
    else
        getfield(obj, name)
    end
end

mutable struct GameStateMessage <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function GameStateMessage(; kwargs...)
        obj = new(meta(GameStateMessage), Dict{Symbol,Any}(), Set{Symbol}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            if fldval !== nothing
                values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
            end
        end
        obj
    end
end # mutable struct GameStateMessage
const __meta_GameStateMessage = Ref{ProtoMeta}()
function meta(::Type{GameStateMessage})
    ProtoBuf.metalock() do
        if !isassigned(__meta_GameStateMessage)
            __meta_GameStateMessage[] = target = ProtoMeta(GameStateMessage)
            allflds = Pair{Symbol,Union{Type,String}}[:updatedCells => Base.Vector{UpdatedCell}]
            meta(target, GameStateMessage, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_GameStateMessage[]
    end
end
function Base.getproperty(obj::GameStateMessage, name::Symbol)
    if name === :updatedCells
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{UpdatedCell}
    else
        getfield(obj, name)
    end
end

mutable struct PlayerScore <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function PlayerScore(; kwargs...)
        obj = new(meta(PlayerScore), Dict{Symbol,Any}(), Set{Symbol}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            if fldval !== nothing
                values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
            end
        end
        obj
    end
end # mutable struct PlayerScore
const __meta_PlayerScore = Ref{ProtoMeta}()
function meta(::Type{PlayerScore})
    ProtoBuf.metalock() do
        if !isassigned(__meta_PlayerScore)
            __meta_PlayerScore[] = target = ProtoMeta(PlayerScore)
            allflds = Pair{Symbol,Union{Type,String}}[:playerName => AbstractString, :score => Int64, :snakes => Int32]
            meta(target, PlayerScore, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_PlayerScore[]
    end
end
function Base.getproperty(obj::PlayerScore, name::Symbol)
    if name === :playerName
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :score
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :snakes
        return (obj.__protobuf_jl_internal_values[name])::Int32
    else
        getfield(obj, name)
    end
end

mutable struct GameUpdateMessage <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function GameUpdateMessage(; kwargs...)
        obj = new(meta(GameUpdateMessage), Dict{Symbol,Any}(), Set{Symbol}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            if fldval !== nothing
                values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
            end
        end
        obj
    end
end # mutable struct GameUpdateMessage
const __meta_GameUpdateMessage = Ref{ProtoMeta}()
function meta(::Type{GameUpdateMessage})
    ProtoBuf.metalock() do
        if !isassigned(__meta_GameUpdateMessage)
            __meta_GameUpdateMessage[] = target = ProtoMeta(GameUpdateMessage)
            allflds = Pair{Symbol,Union{Type,String}}[:updatedCells => Base.Vector{UpdatedCell}, :removedSnakes => Base.Vector{AbstractString}, :playerScores => Base.Vector{PlayerScore}]
            meta(target, GameUpdateMessage, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_GameUpdateMessage[]
    end
end
function Base.getproperty(obj::GameUpdateMessage, name::Symbol)
    if name === :updatedCells
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{UpdatedCell}
    elseif name === :removedSnakes
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{AbstractString}
    elseif name === :playerScores
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{PlayerScore}
    else
        getfield(obj, name)
    end
end

mutable struct RegisterRequest <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function RegisterRequest(; kwargs...)
        obj = new(meta(RegisterRequest), Dict{Symbol,Any}(), Set{Symbol}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            if fldval !== nothing
                values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
            end
        end
        obj
    end
end # mutable struct RegisterRequest
const __meta_RegisterRequest = Ref{ProtoMeta}()
function meta(::Type{RegisterRequest})
    ProtoBuf.metalock() do
        if !isassigned(__meta_RegisterRequest)
            __meta_RegisterRequest[] = target = ProtoMeta(RegisterRequest)
            allflds = Pair{Symbol,Union{Type,String}}[:playerName => AbstractString]
            meta(target, RegisterRequest, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_RegisterRequest[]
    end
end
function Base.getproperty(obj::RegisterRequest, name::Symbol)
    if name === :playerName
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    else
        getfield(obj, name)
    end
end

mutable struct SubsribeRequest <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function SubsribeRequest(; kwargs...)
        obj = new(meta(SubsribeRequest), Dict{Symbol,Any}(), Set{Symbol}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            if fldval !== nothing
                values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
            end
        end
        obj
    end
end # mutable struct SubsribeRequest
const __meta_SubsribeRequest = Ref{ProtoMeta}()
function meta(::Type{SubsribeRequest})
    ProtoBuf.metalock() do
        if !isassigned(__meta_SubsribeRequest)
            __meta_SubsribeRequest[] = target = ProtoMeta(SubsribeRequest)
            allflds = Pair{Symbol,Union{Type,String}}[:playerIdentifier => AbstractString]
            meta(target, SubsribeRequest, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_SubsribeRequest[]
    end
end
function Base.getproperty(obj::SubsribeRequest, name::Symbol)
    if name === :playerIdentifier
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    else
        getfield(obj, name)
    end
end

mutable struct ServerUpdateMessage <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function ServerUpdateMessage(; kwargs...)
        obj = new(meta(ServerUpdateMessage), Dict{Symbol,Any}(), Set{Symbol}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            if fldval !== nothing
                values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
            end
        end
        obj
    end
end # mutable struct ServerUpdateMessage
const __meta_ServerUpdateMessage = Ref{ProtoMeta}()
function meta(::Type{ServerUpdateMessage})
    ProtoBuf.metalock() do
        if !isassigned(__meta_ServerUpdateMessage)
            __meta_ServerUpdateMessage[] = target = ProtoMeta(ServerUpdateMessage)
            allflds = Pair{Symbol,Union{Type,String}}[:messageType => Int32, :message => AbstractString]
            meta(target, ServerUpdateMessage, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_ServerUpdateMessage[]
    end
end
function Base.getproperty(obj::ServerUpdateMessage, name::Symbol)
    if name === :messageType
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :message
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    else
        getfield(obj, name)
    end
end

mutable struct EmptyRequest <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function EmptyRequest(; kwargs...)
        obj = new(meta(EmptyRequest), Dict{Symbol,Any}(), Set{Symbol}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            if fldval !== nothing
                values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
            end
        end
        obj
    end
end # mutable struct EmptyRequest
const __meta_EmptyRequest = Ref{ProtoMeta}()
function meta(::Type{EmptyRequest})
    ProtoBuf.metalock() do
        if !isassigned(__meta_EmptyRequest)
            __meta_EmptyRequest[] = target = ProtoMeta(EmptyRequest)
            allflds = Pair{Symbol,Union{Type,String}}[]
            meta(target, EmptyRequest, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_EmptyRequest[]
    end
end

# service methods for PlayerHost
const _PlayerHost_methods = MethodDescriptor[
        MethodDescriptor("Register", 1, RegisterRequest, GameSettings),
        MethodDescriptor("Subscribe", 2, SubsribeRequest, Channel{GameUpdateMessage}),
        MethodDescriptor("GetGameState", 3, EmptyRequest, GameStateMessage),
        MethodDescriptor("MakeMove", 4, Move, EmptyRequest),
        MethodDescriptor("SplitSnake", 5, SplitRequest, EmptyRequest),
        MethodDescriptor("SubscribeToServerEvents", 6, EmptyRequest, Channel{ServerUpdateMessage})
    ] # const _PlayerHost_methods
const _PlayerHost_desc = ServiceDescriptor("PlayerInterface.PlayerHost", 1, _PlayerHost_methods)

PlayerHost(impl::Module) = ProtoService(_PlayerHost_desc, impl)

mutable struct PlayerHostStub <: AbstractProtoServiceStub{false}
    impl::ProtoServiceStub
    PlayerHostStub(channel::ProtoRpcChannel) = new(ProtoServiceStub(_PlayerHost_desc, channel))
end # mutable struct PlayerHostStub

mutable struct PlayerHostBlockingStub <: AbstractProtoServiceStub{true}
    impl::ProtoServiceBlockingStub
    PlayerHostBlockingStub(channel::ProtoRpcChannel) = new(ProtoServiceBlockingStub(_PlayerHost_desc, channel))
end # mutable struct PlayerHostBlockingStub

Register(stub::PlayerHostStub, controller::ProtoRpcController, inp::RegisterRequest, done::Function) = call_method(stub.impl, _PlayerHost_methods[1], controller, inp, done)
Register(stub::PlayerHostBlockingStub, controller::ProtoRpcController, inp::RegisterRequest) = call_method(stub.impl, _PlayerHost_methods[1], controller, inp)

Subscribe(stub::PlayerHostStub, controller::ProtoRpcController, inp::SubsribeRequest, done::Function) = call_method(stub.impl, _PlayerHost_methods[2], controller, inp, done)
Subscribe(stub::PlayerHostBlockingStub, controller::ProtoRpcController, inp::SubsribeRequest) = call_method(stub.impl, _PlayerHost_methods[2], controller, inp)

GetGameState(stub::PlayerHostStub, controller::ProtoRpcController, inp::EmptyRequest, done::Function) = call_method(stub.impl, _PlayerHost_methods[3], controller, inp, done)
GetGameState(stub::PlayerHostBlockingStub, controller::ProtoRpcController, inp::EmptyRequest) = call_method(stub.impl, _PlayerHost_methods[3], controller, inp)

MakeMove(stub::PlayerHostStub, controller::ProtoRpcController, inp::Move, done::Function) = call_method(stub.impl, _PlayerHost_methods[4], controller, inp, done)
MakeMove(stub::PlayerHostBlockingStub, controller::ProtoRpcController, inp::Move) = call_method(stub.impl, _PlayerHost_methods[4], controller, inp)

SplitSnake(stub::PlayerHostStub, controller::ProtoRpcController, inp::SplitRequest, done::Function) = call_method(stub.impl, _PlayerHost_methods[5], controller, inp, done)
SplitSnake(stub::PlayerHostBlockingStub, controller::ProtoRpcController, inp::SplitRequest) = call_method(stub.impl, _PlayerHost_methods[5], controller, inp)

SubscribeToServerEvents(stub::PlayerHostStub, controller::ProtoRpcController, inp::EmptyRequest, done::Function) = call_method(stub.impl, _PlayerHost_methods[6], controller, inp, done)
SubscribeToServerEvents(stub::PlayerHostBlockingStub, controller::ProtoRpcController, inp::EmptyRequest) = call_method(stub.impl, _PlayerHost_methods[6], controller, inp)

export MessageType, GameSettings, Move, SplitRequest, GameUpdateMessage, GameStateMessage, UpdatedCell, PlayerScore, RegisterRequest, SubsribeRequest, ServerUpdateMessage, EmptyRequest, PlayerHost, PlayerHostStub, PlayerHostBlockingStub, Register, Subscribe, GetGameState, MakeMove, SplitSnake, SubscribeToServerEvents
