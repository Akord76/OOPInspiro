using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleAppInspiro
{
    class ClassVendingMachine
    {
        public string NamaMakanan { get; set; }
        public float HargaMakanan { get; set; }
        public double StokMakanan { get; set; }

    }

    class Buying
    {
        public string ProductCode { get; set; }
        public string ProductName { get; set; }
        public double ProductPrice { get; set; }
        public double Quantity { get; set; }
        public float Total { get; set; }

    }
}
