using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;

namespace Logqso.mvc.common
{
    public class PeekingStreamReader : StreamReader
    {
        private Queue<string> _peeks;

        public PeekingStreamReader(Stream stream)
            : base(stream)
        {
            _peeks = new Queue<string>();
        }

        public override string ReadLine()
        {
            if (_peeks.Count > 0)
            {
                var nextLine = _peeks.Dequeue();
                return nextLine;
            }
            return base.ReadLine();
        }

        public override int Peek()
        {
            if (_peeks.Count > 0)
            {
                return _peeks.Count;
            }
            return base.Peek();
        }

        public void ClearQueue()
        {
            if (_peeks.Count > 0)
            {
                _peeks.Clear();
            }

        }

        public string PeekReadLine()
        {
            var nextLine = base.ReadLine();
            _peeks.Enqueue(nextLine);
            return nextLine;
        }
    }
}
