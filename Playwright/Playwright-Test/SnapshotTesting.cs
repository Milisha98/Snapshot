using NUnit.Framework;
using System.Threading.Tasks;
using VerifyNUnit;
using VerifyTests;

namespace Playwright_Test
{
    public class SnapshotTesting
    {
        [Test]
        public async Task Invalid_Email()
        {
            var pw = new TestPage();
            await using (pw)
            {
                // Arrange
                VerifyPlaywright.Enable();

                // Act
                var page = await pw.InstantiatePageAsync();
                await page.FillAsync("#contact-name", "Chuck Norris");
                await page.FillAsync("#contact-email", "An invalid e-mail address");
                await page.ClickAsync("button.submit-button");

                // Assert
                await Verifier.Verify(page)
                              .UseDirectory("Snapshots");

            }
        }
    }
}