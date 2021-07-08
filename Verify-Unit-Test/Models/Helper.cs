using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Verify_Unit_Test
{
    public static class Helper
    {

        public static int CalculateAge(this DateTime dt) =>
            DateTime.Today.Year - dt.Year - 1 +
         (((DateTime.Today.Month > dt.Month) ||
          ((DateTime.Today.Month == dt.Month) && (DateTime.Today.Day >= dt.Day))) ? 1 : 0);
    }
}
