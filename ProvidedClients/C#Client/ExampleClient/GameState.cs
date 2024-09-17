using PlayerInterface;
using static TestClient.Program;
using System.Linq;
using System.Net;
using System.Xml.Linq;

namespace TestClient
{
    internal partial class Program
    {
        public class GameState
        {
            private Array _map;
            private List<Snake> _snakes;
            private int[] _dimensions;
            private string _playerIdentifier;

            public GameState(int[] dimensions, int[] startAddress, string playerName, string playerIdentifier)
            {
                _map = Array.CreateInstance(typeof(Cell), dimensions);
                _map.Initialize();
                _snakes = new List<Snake>
                {
                    new Snake(playerName, new List<int[]> { startAddress })
                };
                _dimensions = dimensions;
                _playerIdentifier = playerIdentifier;
            }

            private Cell GetCell(int[] addr)
            {
                var cell = _map.GetValue(addr) as Cell;
                if (cell == null)
                {
                    cell = new Cell();
                    _map.SetValue(cell, addr);
                }
                return cell;
            }

            public bool HasPlayer(int[] addr)
            {
                return GetCell(addr).HasPlayer; 
            }

            public bool HasFood(int[] addr)
            {
                return GetCell(addr).HasFood;
            }

            public void UpdateMap(List<UpdatedCell> cells)
            {
                foreach (UpdatedCell update in cells)
                {
                    var addr = update.Address.ToArray();
                    var cell = GetCell(addr);
                    cell.HasPlayer = !string.IsNullOrWhiteSpace(update.Player);
                    cell.HasFood = update.FoodValue > 0;
                }
            }

            public List<SplitRequest> GetSplits()
            {
                var list = new List<SplitRequest>();
                var newSnakes = new List<Snake>();
                foreach (var snake in _snakes)
                {
                    if(snake.Length > 2 && _snakes.Count < 11)
                    {
                        snake.Length -= 1;
                        var newSnakeName = snake.NextKidName;
                        var newHead = snake.Segments[0];
                        snake.Segments.RemoveAt(0);
                        var newSnake = new Snake(newSnakeName, new List<int[]> { newHead });
                        newSnakes.Add(newSnake);

                        var address = GetNextAddress(newHead);
                        newSnake.Head = address;
                        var cell = GetCell(address);
                        newSnake.Segments.Add(address);
                        if (cell.HasFood)
                        {
                            newSnake.Length += 1;
                        }
                        else
                        {
                            newSnake.Segments.RemoveAt(0);
                        }
                        var split = new SplitRequest
                        {
                            SnakeSegment = 1,
                            PlayerIdentifier = _playerIdentifier,
                            NewSnakeName = newSnakeName,
                            OldSnakeName = snake.Name
                        };
                        split.NextLocation.AddRange(address);
                        list.Add(split);
                    }
                }
                _snakes.AddRange(newSnakes);
                return list;
            }

            public List<Move> GetMoves()
            {
                var moves = new List<Move>();
                foreach(var snake in _snakes)
                {
                    var nextLocation = GetNextAddress(snake.Head);
                    snake.Head = nextLocation;
                    var cell = GetCell(nextLocation);
                    snake.Segments.Add(nextLocation);
                    if(cell.HasFood)
                    {
                        snake.Length += 1;
                    }
                    else
                    {
                        snake.Segments.RemoveAt(0);
                    }
                    var move = new Move();
                    move.PlayerIdentifier = _playerIdentifier;
                    move.SnakeName = snake.Name;
                    move.NextLocation.AddRange(nextLocation);
                    moves.Add(move);
                }
                return moves;
            }

            public int[] GetNextAddress(int[] address)
            {
                var rand = new Random();
                while (true)
                {

                    int[] newAddress = new int[address.Length];
                    Array.Copy(address, newAddress, address.Length);
                    var dim = rand.Next(address.Length);
                    var dir = rand.Next(2) == 1;
                    if (dir)
                    {
                        if ((newAddress[dim] + 1) != _dimensions[dim])
                        {
                            newAddress[dim]++;
                            if (!GetCell(newAddress).HasPlayer)
                            {
                                return newAddress;
                            }
                        }
                    }
                    else
                    {
                        if (newAddress[dim] != 0)
                        {
                            newAddress[dim]--;
                            if (!GetCell(newAddress).HasPlayer)
                            {
                                return newAddress;
                            }
                        }
                    }
                }
            }
        }
    }
}