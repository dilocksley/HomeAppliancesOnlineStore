using System.Collections.Generic;
using System.Data;
using SqlKata.Compilers;
using SqlKata.Execution;

namespace HomeAppliancesOnlineStore.Core.Repositories
{
    public abstract class BaseRepository
    {
        internal IDbConnection DbConnection { get; set; }
       
    }
}
