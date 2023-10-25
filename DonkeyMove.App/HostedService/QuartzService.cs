using System;
using System.Threading;
using System.Threading.Tasks;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using Quartz;

namespace donkeymove.App.HostedService
{
    /// <summary>
    /// 自啟動服務，本服務用于啟動所有狀態為【正在運行】的定時任務
    /// </summary>
    public class QuartzService : IHostedService, IDisposable
    {
        private readonly ILogger<QuartzService> _logger;
        private IScheduler _scheduler;
        private OpenJobApp _openJobApp;

        public QuartzService(ILogger<QuartzService> logger, IScheduler scheduler, OpenJobApp openJobApp)
        {
            _logger = logger;
            _scheduler = scheduler;
            _openJobApp = openJobApp;
        }

        public Task StartAsync(CancellationToken cancellationToken)
        {
            _scheduler.Start();
            var result = _openJobApp.StartAll();
            return result;
        }

        public Task StopAsync(CancellationToken cancellationToken)
        {
            var result =_scheduler.Shutdown();
            _logger.LogInformation("關閉定時job");
            return result;
        }

        public void Dispose()
        {
           
        }
    }
}