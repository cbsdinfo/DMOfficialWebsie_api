using System.Threading.Tasks;
using Infrastructure;
using Quartz;

namespace donkeymove.App.Jobs
{
    public class SysLogJob : IJob
    {
        private SysLogApp _sysLogApp;
        private OpenJobApp _openJobApp;

        public SysLogJob(SysLogApp sysLogApp, OpenJobApp openJobApp)
        {
            _sysLogApp = sysLogApp;
            _openJobApp = openJobApp;
        }

        public Task Execute(IJobExecutionContext context)
        {
            var jobId = context.MergedJobDataMap.GetString(Define.JOBMAPKEY);
            //todo:這里可以加入自己的自動任務邏輯
            _openJobApp.RecordRun(jobId);
            return Task.Delay(1);
        }
    }
}