package ua.inlimited.idol;

public class User {
    private String login;
    private String password;
    private String keywords;
    private String databaseEntities;
    boolean active;
    private String competitors;
    private String email;
    private String dateStart;
    private String dateEnd;
    private String ownName;
    private int idtask;
    private String plan;
    private String resources;
    private boolean alerting;
    private String freqalert;
    private String customer;

    public String toString() {
        return "User{login=\'" + this.login + '\'' + ", password=\'" + this.password + '\'' +
                ", keywords=\'" + this.keywords + '\'' + ", databaseEntities=\'" + this.databaseEntities +
                '\'' + ", active=" + this.active + ", competitors=\'" + this.competitors + '\'' +
                ", email=\'" + this.email + '\'' + ", dateStart=\'" + this.dateStart + '\'' + ", dateEnd=\'"
                + this.dateEnd + '\'' + ", ownName=\'" + this.ownName + '\'' + ", idtask=" + this.idtask +
                ", plan=\'" + this.plan + '\'' + ", resources=\'" + this.resources + '\'' + ", alerting=" +
                this.alerting + ", freqalert=\'" + this.freqalert + '\'' + ", customer=\'" + this.customer + '\'' + '}';
    }

    public String getCustomer() {
        return this.customer;
    }

    public void setCustomer(String customer) {
        this.customer = customer;
    }

    public String getPlan() {
        return this.plan;
    }

    public void setPlan(String plan) {
        this.plan = plan;
    }

    public String getResources() {
        return this.resources;
    }

    public void setResources(String resources) {
        this.resources = resources;
    }

    public boolean isAlerting() {
        return this.alerting;
    }

    public void setAlerting(boolean alerting) {
        this.alerting = alerting;
    }

    public String getFreqalert() {
        return this.freqalert;
    }

    public void setFreqalert(String freqalert) {
        this.freqalert = freqalert;
    }

    public int getIdtask() {
        return this.idtask;
    }

    public void setIdtask(int idtask) {
        this.idtask = idtask;
    }

    public String getOwnName() {
        return this.ownName;
    }

    public void setOwnName(String ownName) {
        this.ownName = ownName;
    }

    public String getLogin() {
        return this.login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getPassword() {
        return this.password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getKeywords() {
        return this.keywords;
    }

    public void setKeywords(String keywords) {
        this.keywords = keywords;
    }

    public String getDatabaseEntities() {
        return this.databaseEntities;
    }

    public void setDatabaseEntities(String databaseEntities) {
        this.databaseEntities = databaseEntities;
    }

    public boolean isActive() {
        return this.active;
    }

    public void setActive(boolean active) {
        this.active = active;
    }

    public User() {
    }

    public String getCompetitors() {
        return this.competitors;
    }

    public void setCompetitors(String competitors) {
        this.competitors = competitors;
    }

    public String getEmail() {
        return this.email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getDateStart() {
        return this.dateStart;
    }

    public void setDateStart(String dateStart) {
        this.dateStart = dateStart;
    }

    public String getDateEnd() {
        return this.dateEnd;
    }

    public void setDateEnd(String dateEnd) {
        this.dateEnd = dateEnd;
    }
}
