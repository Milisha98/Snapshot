using NUnit.Framework;
using System.Threading.Tasks;



namespace Playwright_Test
{

    public class AssertTesting
    {
        [Test]
        public async Task Invalid_Email()
        {
            var pw = new TestPage();
            await using (pw)
            {
                // Arrange
                string expectedErrorMessage = "This field isn't a valid e-mail address.";
                string expectedEmailBorderColor = "rgb(211, 47, 47)";

                // Act
                var page = await pw.InstantiatePageAsync();
                await page.FillAsync("#contact-name", "Chuck Norris");
                await page.FillAsync("#contact-email", "An invalid e-mail address");
                await page.ClickAsync("button.submit-button");

                // Assert
                var errorMessage = await page.InnerTextAsync(".error-text>span");
                var emailBorderColor = await page.EvalOnSelectorAsync("#contact-email", "e => getComputedStyle(e).borderColor");
 
                Assert.AreEqual(expectedErrorMessage, errorMessage.Trim());
                Assert.AreEqual(expectedEmailBorderColor, emailBorderColor.ToString());

            }
        }
    }

}
