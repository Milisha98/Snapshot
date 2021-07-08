using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Verify_Unit_Test
{
    public class Person
    {
        public Guid Id { get; init; }
        public string Title { get; init; }
        public string GivenNames { get; init; }
        public string FamilyName { get; init; }
        public string Spouse { get; init; }
        public string[] Children { get; init; }
        public Address Address { get; init; }

    }

    public record Address(string Street, string Country);
}
