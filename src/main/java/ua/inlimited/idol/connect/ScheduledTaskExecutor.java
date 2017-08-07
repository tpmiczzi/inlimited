package ua.inlimited.idol.connect;

import java.util.Iterator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import ua.inlimited.idol.connect.GatheringService;
import ua.inlimited.idol.connect.TaskItem;
import ua.inlimited.idol.db.DBService;

@Component
public class ScheduledTaskExecutor {
    @Autowired
    DBService dbService;
    @Autowired
    GatheringService gatheringService;

    public ScheduledTaskExecutor() {
    }

    public void getStatictics() {
        System.out.println("Scheduled service is started");
        this.dbService.putGatheringTasksIntoDB();
        Iterator var1 = this.dbService.getGatheringTasksFromDB().iterator();

        while(var1.hasNext()) {
            TaskItem item = (TaskItem)var1.next();
            this.gatheringService.searchByWord(item.getTaskKeywords(), item.getTaskDatabase(), item.getTaskDate().substring(0, 10), Integer.parseInt(item.getTaskIdTask()));
            this.dbService.deleteTaskIntoDB("import", Integer.parseInt(item.getTaskIdTask()), item.getTaskDate().substring(0, 10));
        }

    }
}

