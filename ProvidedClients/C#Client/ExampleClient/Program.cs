﻿using PlayerInterface;
using Grpc.Net.Client;
using System.Diagnostics;
using Grpc.Core;

namespace TestClient
{
    internal partial class Program
    {
        private static GameState _gameState;
        static async Task Main(string[] args)
        {
            var playerName = "C#Client";
            if(args.Length > 0 )
            {
                playerName = args[0];
            }
            var channel = GrpcChannel.ForAddress("http://192.168.178.62:5168");
            var client = new PlayerHost.PlayerHostClient(channel);
            var register = new RegisterRequest
            {
                PlayerName = playerName,
            };
            var settings = client.Register(register);
            Console.WriteLine($"Registered: {playerName}: {settings.PlayerIdentifier}");
            _gameState = new GameState(settings.Dimensions.ToArray(), settings.StartAddress.ToArray(), playerName, settings.PlayerIdentifier);
            var req = new SubsribeRequest
            {
                PlayerIdentifier = settings.PlayerIdentifier,
            };
            var result = client.Subscribe(req);
            Console.WriteLine("subscribed");

            var stateChanges = client.SubscribeToServerEvents(new EmptyRequest { });
            ListenToGameStates(stateChanges);
            
            var source = new CancellationTokenSource();
            while (!source.IsCancellationRequested)
            {
                while (await result.ResponseStream.MoveNext(source.Token))
                {
                    var gameUpdate = result.ResponseStream.Current;
                    _gameState.UpdateMap(gameUpdate.UpdatedCells.ToList());

                    foreach(var move in _gameState.GetMoves())
                    {
                        await client.MakeMoveAsync(move);
                    }

                    foreach (var split in _gameState.GetSplits())
                    {
                        await client.SplitSnakeAsync(split);
                    }
                }
            }
        }

        private static void ListenToGameStates(AsyncServerStreamingCall<ServerUpdateMessage> stateChanges)
        {
            Task.Factory.StartNew(async () =>
            {
                while (await stateChanges.ResponseStream.MoveNext())
                {
                    var message = stateChanges.ResponseStream.Current;
                    await Console.Out.WriteLineAsync($"{message.MessageType}: {message.Message}");
                }
            });
        }
    }

}