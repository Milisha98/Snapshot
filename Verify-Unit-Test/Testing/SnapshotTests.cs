using NUnit.Framework;

using System;
using System.Linq;
using System.Threading.Tasks;

using VerifyNUnit;
using Verify_Unit_Test;


namespace Testing
{
    [TestFixture]
    public class SnapshotTests
    {

        [Test]
        public Task FindPerson_returns_a_valid_person()
        {
            // Arrange
            var expectedId = new Guid("ebced679-45d3-4653-8791-3d969c4a986c");

            // Act
            var person = ClassBeingTested.FindPerson(expectedId);

            // Asset
            return Verifier.Verify(person)
                           .UseDirectory("Snapshots");
        }

        [Test]
        public Task FindAll_returns_all_people()
        {
            // Act
            var peoples = ClassBeingTested.FindAll()
                                          .ToList();

            // Asset
            return Verifier.Verify(peoples)
                           .UseDirectory("Snapshots");

        }
    }
}