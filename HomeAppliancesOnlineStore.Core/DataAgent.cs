using System;
using System.Collections.Generic;
using System.Text;

namespace HomeAppliancesOnlineStore.Core
{
    public class DataAgent<T>
    {
        public T Data { get; set; }
        public string ResponseMessage { get; set; }
        public bool ContainsData => ResponseMessage == null;

        public override bool Equals(object obj)
        {
            return obj is DataAgent<T> agent &&
                   EqualityComparer<T>.Default.Equals(Data, agent.Data) &&
                   ResponseMessage == agent.ResponseMessage &&
                   ContainsData == agent.ContainsData;
        }
    }
}
