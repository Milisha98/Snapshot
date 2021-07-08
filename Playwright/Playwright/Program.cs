using Microsoft.Playwright;
using System;
using System.Threading.Tasks;

namespace Snapshot
{
    class Program
    {
        public static async Task Main()
        {
            // Instantiate Playwright
            using var playwright = await Playwright.CreateAsync();
            await using var browser = await playwright.Chromium.LaunchAsync(new BrowserTypeLaunchOptions
            {
                Headless = false,               // Set Browser as visible
                SlowMo = 50,                    // Slow motion (so we can see stuff)

            });

            // Create a Page
            var page = await browser.NewPageAsync();           
            await page.SetViewportSizeAsync(1024, 768);            
            await page.GotoAsync(@"C:\Users\nschu\source\repos\TechTalks\Snapshot\elm-contact\Index.html");
            await page.WaitForLoadStateAsync(LoadState.NetworkIdle);

            // Enter in some data
            await page.FillAsync("#contact-name", "Chuck Norris extraordinaire");

            // Take a screenshot
            await page.ScreenshotAsync(new PageScreenshotOptions { Path = "../../../screenshot.png" });

            Console.WriteLine("Press a key to exit");
            Console.ReadKey();
        }
    }
}
