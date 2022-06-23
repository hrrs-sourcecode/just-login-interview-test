using FizzBuzz.Services;
using FizzBuzz.Services.Interfaces;
using System;

namespace FizzBuzz
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Hello World!");
            IFizzBuzzService fizzBuzzService = new FizzBuzzService();

            Console.WriteLine(fizzBuzzService.PrintFizzNuzzLimitByNumberInserted(100));

            Console.ReadLine();
        }
    }
}
