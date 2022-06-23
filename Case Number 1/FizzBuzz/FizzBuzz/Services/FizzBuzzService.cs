using FizzBuzz.Services.Interfaces;
using System;
using System.Collections.Generic;
using System.Text;

namespace FizzBuzz.Services
{
    class FizzBuzzService : IFizzBuzzService
    {
        public string PrintFizzNuzzLimitByNumberInserted(int limit)
        {
            string result = "";


            for(decimal i = 1; i <= limit; i ++ )
            {
                if(i % 3 == 0 )
                {
                    result += "Fizz";
                }
                if (i % 5 == 0)
                {
                    result += "Buzz";
                }
                if ((i % 3 != 0) && (i % 5 != 0))
                {
                    result += ((int)i).ToString();
                }
                if (i < limit)
                {
                    result += ",";
                }
            }
            return result;
        }
    }
}

