using System;
using System.Linq;
using Infrastructure;
using donkeymove.Repository.Domain;
using Quartz;

namespace donkeymove.App.Extensions
{
    /// <summary>
    /// 定時任務擴展
    /// </summary>
    public static class OpenJobExt
    {
        /// <summary>
        /// 啟動定時任務
        /// </summary>
        /// <param name="job"></param>
        /// <param name="scheduler">一個Quartz Scheduler</param>
        public static void Start(this OpenJob job, IScheduler scheduler)
        {
            var jobBuilderType = typeof(JobBuilder);
            var method = jobBuilderType.GetMethods().FirstOrDefault(
                    x => x.Name.Equals("Create", StringComparison.OrdinalIgnoreCase) &&
                         x.IsGenericMethod && x.GetParameters().Length == 0)
                ?.MakeGenericMethod(Type.GetType(job.JobCall));

            var jobBuilder = (JobBuilder) method.Invoke(null, null);

            IJobDetail jobDetail = jobBuilder.WithIdentity(job.Id).Build();
            jobDetail.JobDataMap[Define.JOBMAPKEY] = job.Id; //傳遞job信息
            ITrigger trigger = TriggerBuilder.Create()
                .WithCronSchedule(job.Cron)
                .WithIdentity(job.Id)
                .StartNow()
                .Build();
            scheduler.ScheduleJob(jobDetail, trigger);
        }
        
        /// <summary>
        /// 停止一個定時任務
        /// </summary>
        /// <param name="job"></param>
        /// <param name="scheduler"></param>
        public static void Stop(this OpenJob job, IScheduler scheduler)
        {
            TriggerKey triggerKey = new TriggerKey(job.Id);
            // 停止觸發器
            scheduler.PauseTrigger(triggerKey);
            // 移除觸發器
            scheduler.UnscheduleJob(triggerKey);
            // 刪除任務
            scheduler.DeleteJob(new JobKey(job.Id));
        }
    }
}