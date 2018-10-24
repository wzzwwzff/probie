package com.app.cq.task;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Lazy;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import java.util.Date;

/**
 * Created by ccj on 2016/7/17.
 */
@Service
@Lazy(value = false)
public class DemoTask {
    private Logger logger = LoggerFactory.getLogger(DemoTask.class);
    /**
     * 每隔五秒执行一次
     */
    @Scheduled(fixedRate=5000)
    public void test() {
//        logger.debug("spring task 注解使用。。。任务进行中，每隔5秒执行一次");
    }

    /**
     * 每分钟执行一次(整数分钟)
      */
    @Scheduled(cron="0 0/1 * * * ?")
    public void execute() {
        logger.debug("丰台区共有产权住房管理系统");
    }
}

