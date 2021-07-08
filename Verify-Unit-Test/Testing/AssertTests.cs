using NUnit.Framework;

using System;
using System.Linq;

using Verify_Unit_Test;


namespace Testing
{
    [TestFixture]
    public class AssertTests
    {

        [Test]
        public void FindPerson_returns_a_valid_person()
        {
            // Arrange
            var expectedId = new Guid("ebced679-45d3-4653-8791-3d969c4a986c");

            // Act
            var person = ClassBeingTested.FindPerson(expectedId);
            var address = person.Address;

            // Assert
            Assert.IsNotNull(person);
            Assert.AreEqual(expectedId, person.Id);
            Assert.AreEqual("Mr", person.Title);
            Assert.AreEqual("James", person.GivenNames);
            Assert.AreEqual("Peach", person.FamilyName);
            Assert.AreEqual("Grettle", person.Spouse);
            Assert.AreEqual("Sam", person.Children[0]);
            Assert.AreEqual("Mary", person.Children[1]);

            Assert.IsNotNull(address);
            Assert.AreEqual("4 Puddleduck Lane", address.Street);
            Assert.AreEqual("Australia", address.Country);
        }

        [Test]
        public void FindAll_returns_all_people()
        {
            // Act
            var peoples = ClassBeingTested.FindAll()
                                          .ToList();

            // Assert
            Assert.AreEqual(2, peoples.Count());

            var person1 = peoples[0];
            var address1 = person1.Address;
            Assert.AreEqual(new Guid("ebced679-45d3-4653-8791-3d969c4a986c"), person1.Id);
            Assert.AreEqual("Mr", person1.Title);
            Assert.AreEqual("James", person1.GivenNames);
            Assert.AreEqual("Peach", person1.FamilyName);
            Assert.AreEqual("Grettle", person1.Spouse);
            Assert.AreEqual("Sam", person1.Children[0]);
            Assert.AreEqual("Mary", person1.Children[1]);

            Assert.IsNotNull(address1);
            Assert.AreEqual("4 Puddleduck Lane", address1.Street);
            Assert.AreEqual("Australia", address1.Country);

            var person2 = peoples[1];
            var address2 = person2.Address;
            Assert.AreEqual(new Guid("1e6063f7-c0af-4f39-92a5-d946ebc9a3a7"), person2.Id);
            Assert.AreEqual("Mrs", person2.Title);
            Assert.AreEqual("Janette", person2.GivenNames);
            Assert.AreEqual("Miller", person2.FamilyName);
            Assert.AreEqual("Eugene", person2.Spouse);
            Assert.AreEqual("Trisha", person2.Children[0]);
            Assert.AreEqual("Sally", person2.Children[1]);

            Assert.IsNotNull(address2);
            Assert.AreEqual("3 Bright Road", address2.Street);
            Assert.AreEqual("Australia", address2.Country);
        }

    }
}
