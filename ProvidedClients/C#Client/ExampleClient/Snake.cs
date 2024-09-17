using PlayerInterface;
using System.Diagnostics.CodeAnalysis;

namespace TestClient
{
    internal partial class Program
    {
        public class Snake
        {
            public string Name { get; set; }
            public int Length { get; set; }
            public List<int[]> Segments { get; set; }
            public int[] Head { get; set; }

            private int _kidCount;
            public string NextKidName
            {
                get
                {
                    return $"{Name}_{_kidCount++}";
                }
            }

            public Snake(string name, List<int[]> segments)
            {
                Name = name;
                Length = segments.Count;
                Head = segments.Last();
                Segments = segments;
            }
        }
    }
}