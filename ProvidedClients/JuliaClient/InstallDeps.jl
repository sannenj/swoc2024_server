import Pkg; 
Pkg.add("gRPCClient")
Pkg.add("ProtoBuf")
using gRPCClient
gRPCClient.generate("player.proto")