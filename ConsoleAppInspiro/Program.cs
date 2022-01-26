using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Globalization;


namespace ConsoleAppInspiro
{
    class Program
    {
       public static string ParamProduct ;
        public static string CodeNUMBER { get; private set; }
        public static double Tot { get; private set; }
        static void Main(string[] args)
        {
            GetProductList();

            Console.WriteLine();
            Console.WriteLine();
            Console.WriteLine();
            Console.Write(String.Format("***************Transaksi Pembelian*************"));
            Console.WriteLine();
            Console.WriteLine();

            Console.WriteLine("[STEP 2] - Input Kode Makanan Yang Akan Di Beli :");
            ParamProduct = Console.ReadLine();

            Console.WriteLine();
            Console.WriteLine();
            BuyProduct(ParamProduct);



            Console.ReadLine();
        }

        private static void GetProductList()
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["connstring"].ToString());
            var dt = new DataTable("TabelProduct");

            SqlCommand cmd = new SqlCommand("SelectAllProduct")
            {
                CommandType = CommandType.StoredProcedure,
                Connection = conn
            };

            conn.Open();
            var r = cmd.ExecuteReader();

            dt.Load(r);
            conn.Close();

            Console.Write(String.Format("****************Vending Machine***************"));
            Console.WriteLine();
            Console.WriteLine();
            Console.WriteLine("[STEP 1]- Menampilkan Data Makanan");
            Console.WriteLine();
            Console.WriteLine();
            Console.Write(String.Format("****************DAFTAR MAKANAN****************"));
            Console.WriteLine();
            Console.Write(String.Format("========================================="));
            Console.WriteLine();
            Console.Write(String.Format("|{0,5}|{1,9}|{2,8}|{3,5}", "Kode      ", "Nama Makanan", "Harga", "Stok"));
            Console.WriteLine();
            Console.Write(String.Format("========================================="));
            Console.WriteLine();
            foreach (DataRow baris in dt.Rows)
            {
              
                Console.Write(String.Format("|{0,5}|{1,9}|{2,8}|{3,5}", baris[0], baris[1], baris[2], baris[3]));
                Console.WriteLine();

            }
        }

        private static void BuyProduct(string ParProduct)
        {

            SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["connstring"].ToString());
            var dt = new DataTable("TabelProduct");

            SqlCommand cmd = new SqlCommand("SelectOneProduct")
            {
                CommandType = CommandType.StoredProcedure,
                Connection = conn
            };
            cmd.Parameters.AddWithValue("@pcode", ParProduct);

            conn.Open();
            var r = cmd.ExecuteReader();

            dt.Load(r);

            foreach (DataRow baris in dt.Rows)
            {
                if (!(string.IsNullOrEmpty(baris[0].ToString())))
                {
                    CodeNUMBER = baris[0].ToString();
                }
                else
                {
                    Console.WriteLine("Kode Product Belum Terdaftar");
                }

                int stok = (int)baris[3];

                if (stok <= 0)
                {
                    Console.WriteLine();
                    Console.WriteLine("Stok Tidak Tersedia");
                    Environment.Exit(0);
                }
            };
            conn.Close();

            SqlCommand cmdInsert = new SqlCommand("InsertBuy")
            {
                CommandType = CommandType.StoredProcedure,
                Connection = conn
            };


            cmdInsert.Parameters.AddWithValue("@Product", CodeNUMBER);
            conn.Open();
            if (!(string.IsNullOrEmpty(CodeNUMBER)))
            {
                cmdInsert.ExecuteNonQuery();

                var _dt = new DataTable("TabelBuying");
                var rr = cmdInsert.ExecuteReader();
               _dt.Load(rr);

                Console.Write(String.Format("==============================================="));
                Console.WriteLine();
                Console.Write(String.Format("|{0,15}|{1,9}|{2,8}|{3,9}", "Product", "Price", "Qty", "Total"));
                Console.WriteLine();
                Console.Write(String.Format("==============================================="));
                Console.WriteLine();
                Console.WriteLine();
                foreach (DataRow _baris in _dt.Rows)
                {
                    Tot += (double)_baris[4];

                    Console.Write(String.Format("|{0,15}|{1,9}|{2,8}|{3,9}", _baris[1], _baris[2], _baris[3], _baris[4]));
                    Console.WriteLine();
                }

            }
            else
            {
                Console.WriteLine("Tidak Ada Data Untuk Di Tambah");
                Environment.Exit(0);
            }


            Console.WriteLine();
      
            Console.Write(String.Format("-----------------------------------------------"));
            Console.WriteLine();
            Console.Write("Total Belanja: {0,30}", Tot);

            Console.WriteLine();
            Console.Write(String.Format("-----------------------------------------------"));
            Console.WriteLine();

            Console.WriteLine();
            Console.Write(String.Format("********************Bayar**********************"));
            Console.WriteLine();

            Console.WriteLine();
            Console.WriteLine("[STEP 3]-[BAYAR]-Masukan Uang Pecahan : 2000, 5000, 10000, 20000, 50000 :");
            Console.WriteLine();

            int UangPecahan =Int32.Parse(Console.ReadLine());

            if (!(UangPecahan == 2000|| UangPecahan == 5000  || UangPecahan == 10000 || UangPecahan == 20000 || UangPecahan == 50000))
            {
                Console.WriteLine("Uang yang dimasukan tidak sesuai");
                Console.WriteLine();
                Console.WriteLine("Input Ulang");
                UangPecahan = Int32.Parse(Console.ReadLine());
            }
            else
            {

               var UP = UangPecahan;
               var kembalian= UP - Tot;
                Console.WriteLine();
                Console.Write("Total Belanja : {0,30}", Tot);
                Console.WriteLine();

                Console.Write("Bayar         : {0,30}", UangPecahan);
                Console.WriteLine();
       
                Console.Write(String.Format("----------------------------------------------"));
                Console.WriteLine();
                Console.Write("Kembalian     : {0,30}", kembalian);
                Console.WriteLine();
                Console.WriteLine();
                Console.WriteLine();

                SqlCommand cmdUpdate = new SqlCommand("UpdateBuy")
                {
                    CommandType = CommandType.StoredProcedure,
                    Connection = conn
                };

                cmdUpdate.Parameters.AddWithValue("@Product", CodeNUMBER);

                //conn.Open();
                cmdUpdate.ExecuteNonQuery();
                var _dtt = new DataTable("TabelBuying");
                var rrr = cmdUpdate.ExecuteReader();
                _dtt.Load(rrr);

                //Console.WriteLine("History Transaksi");
                //Console.WriteLine();
                //Console.Write(String.Format("==============================================="));
                //Console.WriteLine();
                //Console.Write(String.Format("|{0,15}|{1,9}|{2,8}|{3,9}", "Product", "Price", "Qty", "Total"));
                //Console.WriteLine();
                //Console.Write(String.Format("==============================================="));
                //Console.WriteLine();
                //foreach (DataRow __baris in _dtt.Rows)
                //{
                //    Tot += (double)__baris[4];

                //    Console.Write(String.Format("|{0,15}|{1,9}|{2,8}|{3,9}", __baris[1], __baris[2], __baris[3], __baris[4]));
                //    Console.WriteLine();
                //}
            }
        
            conn.Close();

            
        }
   
    }  
}

