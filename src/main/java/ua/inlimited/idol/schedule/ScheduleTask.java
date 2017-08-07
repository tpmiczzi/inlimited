package ua.inlimited.idol.schedule;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
public class ScheduleTask {
    public ScheduleTask() {
    }

    @Scheduled(
            fixedDelay = 30000L
    )
    public void testDelay() {
    }
}
