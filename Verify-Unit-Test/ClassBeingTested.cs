using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Verify_Unit_Test
{
    public static class ClassBeingTested
    {
        private static List<Person> Data() =>
            new()
            {
                new()
                {
                    Id = new Guid("ebced679-45d3-4653-8791-3d969c4a986c"),
                    Title = "Mr",
                    GivenNames = "James",
                    FamilyName = "Peach",
                    Spouse = "Grettle",
                    Children = new string[] { "Sam", "Mary" },
                    Address = new("4 Puddleduck Lane", "Australia")
                },
                new()
                {
                    Id = new Guid("1e6063f7-c0af-4f39-92a5-d946ebc9a3a7"),
                    Title = "Mrs",
                    GivenNames = "Janette",
                    FamilyName = "Miller",
                    Spouse = "Eugene",
                    Children = new string[] { "Trisha", "Sally" },
                    Address = new("3 Bright Road", "Australia")
                }
            };

        public static Person FindPerson(Guid guid) => 
            Data().FirstOrDefault(x => x.Id == guid);

        public static IEnumerable<Person> FindAll() => 
            Data();
    }

}
