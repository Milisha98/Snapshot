using Microsoft.Playwright;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Playwright_Test
{
    public class TestPage : IDisposable, IAsyncDisposable
    {
        private IPlaywright _pw;
        private IBrowser _browser;

        public TestPage()
        {

        }

        public async Task<IPage> InstantiatePageAsync()
        {
            // Instantiate Playwright
            _pw = await Playwright.CreateAsync();
            _browser = await _pw.Chromium.LaunchAsync();

            Page = await _browser.NewPageAsync();
            await Page.SetViewportSizeAsync(1024, 768);
            await Page.WaitForLoadStateAsync(LoadState.NetworkIdle);
            string fileName = System.IO.Path.Combine(GetPath(), "Index.html");
            await Page.GotoAsync(fileName);
            return Page;
        }

        IPage Page { get; set; }

        #region Dispose / DisposeAsync

        private static string GetPath() =>
            (new List<string>
                { @"C:\Users\nschu\source\repos\TechTalks\Snapshot\elm-contact",
                  @"C:\Development\Nathan\techtalks\Snapshot\elm-contact"
                }
            ).FirstOrDefault(d => System.IO.Directory.Exists(d));

        public void Dispose()
        {
            Dispose(disposing: true);
            GC.SuppressFinalize(this);
        }

        public async ValueTask DisposeAsync()
        {
            await DisposeAsyncCore();

            Dispose(disposing: false);
            GC.SuppressFinalize(this);
        }

        protected virtual void Dispose(bool disposing)
        {
            if (disposing)
            {
                _pw?.Dispose();
                (_browser as IDisposable)?.Dispose();
            }

            _pw = null;
            _browser = null;
        }

        protected virtual async ValueTask DisposeAsyncCore()
        {
            if (_browser is not null)
            {
                await _browser.DisposeAsync().ConfigureAwait(false);
            }

            _pw?.Dispose();

            _browser = null;
            _pw = null;
        }

        #endregion

    }
}
