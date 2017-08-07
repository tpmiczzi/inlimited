package ua.inlimited.idol.connect;

public class TaskItem {
    private String taskKeywords;
    private String taskDatabase;
    private String taskDate;
    private String taskTypetask;
    private String taskIdTask;

    public TaskItem() {
    }

    public String getTaskKeywords() {
        return this.taskKeywords;
    }

    public void setTaskKeywords(String taskKeywords) {
        this.taskKeywords = taskKeywords;
    }

    public String getTaskDatabase() {
        return this.taskDatabase;
    }

    public void setTaskDatabase(String taskDatabase) {
        this.taskDatabase = taskDatabase;
    }

    public String getTaskDate() {
        return this.taskDate;
    }

    public void setTaskDate(String taskDate) {
        this.taskDate = taskDate;
    }

    public String getTaskTypetask() {
        return this.taskTypetask;
    }

    public void setTaskTypetask(String taskTypetask) {
        this.taskTypetask = taskTypetask;
    }

    public String getTaskIdTask() {
        return this.taskIdTask;
    }

    public void setTaskIdTask(String taskIdTask) {
        this.taskIdTask = taskIdTask;
    }

    public String toString() {
        return "TaskItem{taskKeywords=\'" + this.taskKeywords + '\'' + ", taskDatabase=\'" + this.taskDatabase + '\'' + ", taskDate=\'" + this.taskDate + '\'' + ", taskTypetask=\'" + this.taskTypetask + '\'' + ", taskIdTask=\'" + this.taskIdTask + '\'' + '}';
    }
}

