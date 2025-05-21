using System;

namespace Core.Other
{
    public class ExchangeException : Exception
    {
        public string ErrorMessage;
        public ExchangeException(string errorMessage) : base(errorMessage)
        {
            ErrorMessage = errorMessage;
        }
    }
}