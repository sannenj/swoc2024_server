
const grpc = require("@grpc/grpc-js");
var protoLoader = require("@grpc/proto-loader");
const { GameState } = require("./GameState");
const PROTO_PATH = "./player.proto";

const options = {
  keepCase: true,
  longs: String,
  enums: String,
  defaults: true,
  oneofs: true,
};
console.log(`Node Version: ${process.version}`);
const packageDefinition = protoLoader.loadSync(PROTO_PATH, options);

const PlayerHost = grpc.loadPackageDefinition(packageDefinition).PlayerInterface.PlayerHost;

const client = new PlayerHost(
  "192.168.178.62:5168",
  grpc.credentials.createInsecure()
);

console.log('starting?');

var serverEvents = client.SubscribeToServerEvents({});
  serverEvents.on('data', function(thing) {
      console.log(thing);
  });

  console.log('Started?');

client.Register({playerName: "javascript"}, function(err, response) {
    if(err){
        console.log(err);
    }
    else{
        console.log('response: ', response);
        var gameState = new GameState(response.dimensions, response.startAddress, "javascript", response.playerIdentifier);
        var gameUpdates = client.Subscribe({playerIdentifier:response.playerIdentifier});
        gameUpdates.on('data', function(update) {
            gameState.update(update);
            var splits = gameState.getSplits();
            for (var i=0;i<splits.length;i++ ){
              var split = splits[i];
                console.log('splitted '+split.oldSnakeName + ' into ' + split.newSnakeName);
                client.SplitSnake(split, function(err){
                  if(err){
                    console.log(err);
                  }
                }) 
            }
            var moves = gameState.getMoves();
            for (var i=0;i<moves.length;i++ ){
              var move = moves[i];
                console.log(move.snakeName + ": " + move.nextLocation);
                client.MakeMove(move, function(err){
                  if(err){
                    console.log(err);
                  }
                }) 
            }
        });  
    }
});

 

    

