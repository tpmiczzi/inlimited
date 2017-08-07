package ua.inlimited.idol.db;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.stereotype.Repository;
import ua.inlimited.idol.User;
import ua.inlimited.idol.connect.CityPostQty;
import ua.inlimited.idol.connect.DateSourceItem;
import ua.inlimited.idol.connect.PeriodItem;
import ua.inlimited.idol.connect.QueryForInfoPage;
import ua.inlimited.idol.connect.StatisticItem;
import ua.inlimited.idol.connect.TaskItem;
import ua.inlimited.idol.connect.Top10Date;
import ua.inlimited.idol.connect.Top10Post;
import ua.inlimited.idol.connect.Top10User;
import ua.inlimited.idol.connect.TotalInfoClass;
import ua.inlimited.idol.db.DBService.1;
import ua.inlimited.idol.db.DBService.10;
import ua.inlimited.idol.db.DBService.11;
import ua.inlimited.idol.db.DBService.12;
import ua.inlimited.idol.db.DBService.13;
import ua.inlimited.idol.db.DBService.14;
import ua.inlimited.idol.db.DBService.15;
import ua.inlimited.idol.db.DBService.16;
import ua.inlimited.idol.db.DBService.17;
import ua.inlimited.idol.db.DBService.18;
import ua.inlimited.idol.db.DBService.19;
import ua.inlimited.idol.db.DBService.2;
import ua.inlimited.idol.db.DBService.20;
import ua.inlimited.idol.db.DBService.21;
import ua.inlimited.idol.db.DBService.22;
import ua.inlimited.idol.db.DBService.3;
import ua.inlimited.idol.db.DBService.4;
import ua.inlimited.idol.db.DBService.5;
import ua.inlimited.idol.db.DBService.6;
import ua.inlimited.idol.db.DBService.7;
import ua.inlimited.idol.db.DBService.8;
import ua.inlimited.idol.db.DBService.9;

@Repository
public class DBService {
    @Autowired
    DataSource dataSource;
    private JdbcTemplate jdbcTemplate;
    @Autowired
    User loggedUser;

    public DBService() {
    }

    @PostConstruct
    public void init() {
        System.out.println("JDBCExample postConstruct is called. datasource = " + this.dataSource);
        this.jdbcTemplate = new JdbcTemplate(this.dataSource);
        System.out.println("jdbcTemplate " + this.jdbcTemplate);
    }

    public List<User> queryAllUsers() {
        System.out.println("JDBCExample: queryAllUsers is called");
        String QUERY_SQL = "SELECT * FROM usertable ORDER BY USERID";
        List userList = this.jdbcTemplate.query("SELECT * FROM usertable ORDER BY USERID", new 1(this));
        System.out.println("size after script " + userList.size());
        return userList;
    }

    public List<StatisticItem> queryStatisticsTable(int idtask, int period) {
        System.out.println("queryStatistics ");
        String QUERY_SQL = "SELECT * FROM public.statistics WHERE TIMESTAMP>(now()-interval \'" + period + " days\') and idtask=\'" + idtask + "\' order by timestamp";
        List fullStatisticAnswer = this.jdbcTemplate.query(QUERY_SQL, new 2(this));
        return fullStatisticAnswer;
    }

    public List<PeriodItem> queryStatisticsTableWeek(int idtask, int period) {
        System.out.println("queryStatistics per Week  ");
        String QUERY_SQL = "SELECT sum(postqty), date_part(\'week\',timestamp) FROM public.statistics WHERE TIMESTAMP>(now()-interval \'" + period + " days\') and idtask=\'" + idtask + "\' group by date_part(\'week\',timestamp) \n    order by date_part;";
        List fullStatisticAnswer = this.jdbcTemplate.query(QUERY_SQL, new 3(this));
        return fullStatisticAnswer;
    }

    public List<PeriodItem> queryStatisticsTableMonth(int idtask, int period) {
        System.out.println("queryStatistics per Month  ");
        String QUERY_SQL = "SELECT sum(postqty), date_part(\'month\',timestamp) FROM public.statistics WHERE TIMESTAMP>(now()-interval \'" + period + " days\') and idtask=\'" + idtask + "\' group by date_part(\'month\',timestamp) \n    order by date_part;";
        List fullStatisticAnswer = this.jdbcTemplate.query(QUERY_SQL, new 4(this));
        return fullStatisticAnswer;
    }

    public List<DateSourceItem> queryStatisticsSources(int idtask, int period) {
        System.out.println("queryStatisticsSources ");
        String QUERY_SQL = "SELECT TSTAMP,\n       SUM(CASE WHEN SOURCE = \'FACEBOOK\'\n           THEN (positiveqty+negativeqty+neutralqty) END) AS FACEBOOK,\n       SUM(CASE WHEN SOURCE = \'VK\'\n           THEN (positiveqty+negativeqty+neutralqty) END) AS VK,\n       SUM(CASE WHEN SOURCE = \'INSTA\'\n           THEN (positiveqty+negativeqty+neutralqty) END) AS INSTA,\n       SUM(CASE WHEN SOURCE = \'TWITTER\'\n           THEN (positiveqty+negativeqty+neutralqty) END) AS TWITTER,\n       SUM(CASE WHEN SOURCE = \'SMI\'\n           THEN (positiveqty+negativeqty+neutralqty) END) AS SMI\nFROM public.statbysource \nWHERE  TSTAMP>(now()-interval \'" + period + " days\') and idtask=" + idtask + "\n GROUP BY TSTAMP\nORDER BY TSTAMP";
        System.out.println("dbquery sources for all");
        List sourceStatisticAnswer = this.jdbcTemplate.query(QUERY_SQL, new 5(this));
        System.out.println("dbquery sources out");
        return sourceStatisticAnswer;
    }

    public List<DateSourceItem> queryStatisticsSourcesOverall(int idtask, int period) {
        System.out.println("queryStatisticsSources ");
        String QUERY_SQL = "SELECT        SUM(CASE WHEN SOURCE = \'FACEBOOK\'\n           THEN (positiveqty+negativeqty+neutralqty) END) AS FACEBOOK,\n       SUM(CASE WHEN SOURCE = \'VK\'\n           THEN (positiveqty+negativeqty+neutralqty) END) AS VK,\n       SUM(CASE WHEN SOURCE = \'INSTA\'\n           THEN (positiveqty+negativeqty+neutralqty) END) AS INSTA,\n       SUM(CASE WHEN SOURCE = \'TWITTER\'\n           THEN (positiveqty+negativeqty+neutralqty) END) AS TWITTER,\n       SUM(CASE WHEN SOURCE = \'SMI\'\n           THEN (positiveqty+negativeqty+neutralqty) END) AS SMI\nFROM public.statbysource \nWHERE  TSTAMP>(now()-interval \'" + period + " days\') and idtask=" + idtask;
        System.out.println("dbquery sources for all");
        List sourceStatisticAnswer = this.jdbcTemplate.query(QUERY_SQL, new 6(this));
        System.out.println("dbquery sources out");
        return sourceStatisticAnswer;
    }

    public List<CityPostQty> queryTotalCountriesTop(int idtask, int period) {
        System.out.println("queryStatisticscountry ");
        String QUERY_SQL = "SELECT country, SUM(postqty), SUM(positiveqty), SUM(negativeqty), SUM(neutralqty) from public.statbycities\nwhere TSTAMP>(now()-interval \'" + period + " days\') and idtask=" + idtask + " GROUP BY country \n order by SUM(postqty) desc limit 5";
        List sourceStatisticAnswer2 = this.jdbcTemplate.query(QUERY_SQL, new 7(this));
        return sourceStatisticAnswer2;
    }

    public List<CityPostQty> queryTotalCities(int idtask, int period) {
        System.out.println("queryStatisticsCities ");
        String QUERY_SQL = "SELECT city, SUM(postqty), SUM(positiveqty), SUM(negativeqty), SUM(neutralqty) from public.statbycities\nwhere TSTAMP>(now()-interval \'" + period + " days\') and idtask=" + idtask + " GROUP BY city \n order by SUM(postqty) desc limit 5";
        List sourceStatisticAnswer2 = this.jdbcTemplate.query(QUERY_SQL, new 8(this));
        return sourceStatisticAnswer2;
    }

    public List<Top10User> queryTop10Followers(int idtask, int period) {
        System.out.println("queryStatisticsTop10Followers ");
        String QUERY_SQL = "select username, linkprofile, max(followers),city from public.statbyusers\nwhere TSTAMP>(now()-interval \'" + period + " days\') and idtask=" + idtask + " GROUP BY username, linkprofile,city\norder by max(followers) desc\nlimit 10;";
        List sourceStatisticAnswer3 = this.jdbcTemplate.query(QUERY_SQL, new 9(this));
        System.out.println("size source3 " + sourceStatisticAnswer3.size());
        return sourceStatisticAnswer3;
    }

    public List<Top10Date> queryTop10Dates(int idtask, int period) {
        System.out.println("queryStatisticsTop10Dates ");
        String QUERY_SQL = "SELECT source, SUM(positiveqty+negativeqty+neutralqty),tstamp from public.statbysource\nwhere TSTAMP>(now()-interval \'" + period + " days\') and idtask=" + idtask + " GROUP BY source,tstamp\norder by sum desc\nlimit 10;";
        List sourceStatisticAnswer3 = this.jdbcTemplate.query(QUERY_SQL, new 10(this));
        System.out.println("size source3 " + sourceStatisticAnswer3.size());
        return sourceStatisticAnswer3;
    }

    public List<Top10Date> queryTop5Sources(int idtask, int period) {
        System.out.println("queryStatisticsTop10Dates ");
        String QUERY_SQL = "SELECT source, SUM(positiveqty+negativeqty+neutralqty) from public.statbysource\nwhere TSTAMP>(now()-interval \'" + period + " days\') and idtask=" + idtask + " and (positiveqty>0 or neutralqty>0 or negativeqty>0) GROUP BY source\norder by sum desc\nlimit 5;";
        List sourceStatisticAnswer3 = this.jdbcTemplate.query(QUERY_SQL, new 11(this));
        System.out.println("size source3 " + sourceStatisticAnswer3.size());
        return sourceStatisticAnswer3;
    }

    public List<Top10Post> queryTop10Posts(int idtask, int period) {
        System.out.println("queryStatisticsTop10Posts ");
        String QUERY_SQL = "SELECT username, sum(postqty) as s1, max(followers), sum(repostqty) as s2, sum(likeqty) as s3 from public.statbyusers\nwhere TSTAMP>(now()-interval \'" + period + " days\') and idtask=" + idtask + " GROUP BY username\norder by s1 desc\nlimit 10;";
        List sourceStatisticAnswer3 = this.jdbcTemplate.query(QUERY_SQL, new 12(this));
        System.out.println("size source3 " + sourceStatisticAnswer3.size());
        return sourceStatisticAnswer3;
    }

    public void insertIntoDatabaseStatistics(int idtask, int total, int authorQty, int commentQty, int shareQty, int likeQty, int positiveQty, int negativeQty, int neutralQty, int postQty, String dateQuery) {
        Date dateTime = Date.valueOf(dateQuery);
        if(this.jdbcTemplate != null) {
            this.jdbcTemplate.update("insert into public.statistics (idtask,total,authorqty,commentqty,shareqty,likeqty,positiveqty,negativeqty,neutralqty,postqty,timestamp) values (?,?,?,?,?,?,?,?,?,?,?)", new Object[]{Integer.valueOf(idtask), Integer.valueOf(total), Integer.valueOf(authorQty), Integer.valueOf(commentQty), Integer.valueOf(shareQty), Integer.valueOf(likeQty), Integer.valueOf(positiveQty), Integer.valueOf(negativeQty), Integer.valueOf(neutralQty), Integer.valueOf(postQty), new Timestamp(dateTime.getTime())});
        } else {
            System.out.println("Error!!!");
        }

        System.out.println("end testing insert !!");
    }

    public void insertIntoDatabaseSources(int idtask, String source, int reminderQty, int positiveQty, int negativeQty, int neutralQty, String dateQuery, int likeqty, int loveqty, int wowqty, int hahaqty, int sadqty, int angryqty) {
        Date dateTime = Date.valueOf(dateQuery);
        if(this.jdbcTemplate != null) {
            this.jdbcTemplate.update("insert into public.statbysource (idtask,source,reminderqty,positiveqty,negativeqty,neutralqty,tstamp,likeqty,loveqty, wowqty,hahaqty, sadqty,angryqty) values (?,?,?,?,?,?,?,?,?,?,?,?,?)", new Object[]{Integer.valueOf(idtask), source, Integer.valueOf(reminderQty), Integer.valueOf(positiveQty), Integer.valueOf(negativeQty), Integer.valueOf(neutralQty), new Timestamp(dateTime.getTime()), Integer.valueOf(likeqty), Integer.valueOf(loveqty), Integer.valueOf(wowqty), Integer.valueOf(hahaqty), Integer.valueOf(sadqty), Integer.valueOf(angryqty)});
        }

    }

    public void insertIntoDatabaseUsers(int idtask, String user, String linkProfile, int postQty, int followersQty, String userCity, int repostqty, int likeqty, String dateQuery) {
        System.out.println("insertIntoDatabaseUsers");
        System.out.println(this.jdbcTemplate);
        Date dateTime = Date.valueOf(dateQuery);
        if(this.jdbcTemplate != null) {
            this.jdbcTemplate.update("insert into public.statbyusers (idtask, username,linkprofile,postqty,followers,tstamp, city,repostqty,likeqty) values (?,?,?,?,?,?,?,?,?)", new Object[]{Integer.valueOf(idtask), user, linkProfile, Integer.valueOf(postQty), Integer.valueOf(followersQty), new Timestamp(dateTime.getTime()), userCity, Integer.valueOf(repostqty), Integer.valueOf(likeqty)});
        }

    }

    public void insertIntoDatabaseCities(int idtask, String city, String country, int postQty, int posQty, int negQty, int neuQty, String dateQuery) {
        System.out.println("insertIntoDatabaseCities");
        Date dateTime = Date.valueOf(dateQuery);
        if(this.jdbcTemplate != null) {
            this.jdbcTemplate.update("insert into public.statbycities (idtask, city, country, postqty, positiveqty, negativeqty, neutralqty, tstamp) values (?,?,?,?,?,?,?,?)", new Object[]{Integer.valueOf(idtask), city, country, Integer.valueOf(postQty), Integer.valueOf(posQty), Integer.valueOf(negQty), Integer.valueOf(neuQty), new Timestamp(dateTime.getTime())});
        }

    }

    public void deleteDataForDate(String dateQueryStart, String dateQueryEnd, int idtask) {
        Date dateTimeStart = Date.valueOf(dateQueryStart);
        Date dateTimeEnd = Date.valueOf(dateQueryEnd);
        String[] databasesList = new String[]{"public.statbycities", "public.statbyusers", "public.statbysource"};
        int databasesListSize = databasesList.length;
        if(this.jdbcTemplate != null) {
            this.jdbcTemplate.update("DELETE FROM public.statistics where (timestamp BETWEEN ? and ? ) and idtask=?", new Object[]{dateTimeStart, dateTimeEnd, Integer.valueOf(idtask)});

            for(int i = 0; i < databasesListSize; ++i) {
                this.jdbcTemplate.update("DELETE FROM " + databasesList[i] + " where (tstamp BETWEEN ? and ?) and idtask=?", new Object[]{dateTimeStart, dateTimeEnd, Integer.valueOf(idtask)});
            }
        }

    }

    public List<QueryForInfoPage> queryForInfoGraphics(int idtask) {
        String QUERY_SQL1 = "SELECT sum(positiveqty+negativeqty+neutralqty) as s1, \nsum(loveqty) as s2, \nsum(wowqty) as s3,\nsum(hahaqty) as s4,\nsum(sadqty) as s5,\nsum(angryqty) as s6,\nsum(likeqty) as s7,\nsum(positiveqty) as s8,\nsum(negativeqty) as s9\n\tFROM public.statbysource\n    where idtask=" + idtask + ";";
        List sourceStatisticAnswer = this.jdbcTemplate.query(QUERY_SQL1, new 13(this));
        return sourceStatisticAnswer;
    }

    public List<Integer> queryForInfoGraphicsAuthors(int idtask) {
        String QUERY_SQL1 = "SELECT count(distinct username)\n\tFROM public.statbyusers\n    where idtask=" + idtask + ";";
        List sourceStatisticAnswer = this.jdbcTemplate.query(QUERY_SQL1, new 14(this));
        return sourceStatisticAnswer;
    }

    public List<Integer> queryForInfoGraphicsReposts(int idtask) {
        String QUERY_SQL1 = "select sum(repostqty) as s1 \n\tFROM public.statbyusers\n    where idtask=" + idtask + ";";
        List sourceStatisticAnswer = this.jdbcTemplate.query(QUERY_SQL1, new 15(this));
        return sourceStatisticAnswer;
    }

    public List<TotalInfoClass> queryTotalNumbersForInfo(int idtask, int period) {
        String QUERY_SQL = "SELECT        SUM(CASE WHEN SOURCE = \'FACEBOOK\'\n           THEN (positiveqty+negativeqty+neutralqty) END) AS FACEBOOK,\n       SUM(CASE WHEN SOURCE = \'VK\'\n           THEN (positiveqty+negativeqty+neutralqty) END) AS VK,\n       SUM(CASE WHEN SOURCE = \'INSTAGRAM\'\n           THEN (positiveqty+negativeqty+neutralqty) END) AS INSTA,\n       SUM(CASE WHEN SOURCE = \'TWITTER\'\n           THEN (positiveqty+negativeqty+neutralqty) END) AS TWITTER,\n       SUM(CASE WHEN SOURCE = \'SMI\'\n           THEN (positiveqty+negativeqty+neutralqty) END) AS SMI,\n       SUM(CASE when source = \'BLOG\'\n           THEN (positiveqty+negativeqty+neutralqty) END) AS BLOG,\n       SUM(CASE when source = \'FORUM\'\n           THEN (positiveqty+negativeqty+neutralqty) END) AS FORUM\nFROM public.statbysource \nWHERE  TSTAMP>(now()-interval \'" + period + " days\') and idtask=" + idtask;
        System.out.println("dbquery sources for all");
        List sourceStatisticAnswer = this.jdbcTemplate.query(QUERY_SQL, new 16(this));
        System.out.println("dbquery sources out");
        return sourceStatisticAnswer;
    }

    public void setDataSource(DriverManagerDataSource dataSource) {
    }

    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
    }

    public DataSource getDataSource() {
        return this.dataSource;
    }

    public JdbcTemplate getJdbcTemplate() {
        return this.jdbcTemplate;
    }

    public void setLoggedUser(String name) {
        System.out.println("name of logged user is " + name);
        String QUERY_SQL = "SELECT * FROM usertable WHERE USERNAME=\'" + name + "\';";
        System.out.println(QUERY_SQL);
        List userList = this.jdbcTemplate.query(QUERY_SQL, new 17(this));
        if(userList.size() > 0) {
            this.loggedUser = (User)userList.get(0);
        }

        System.out.println("logged user name from db " + this.loggedUser.getLogin());
    }

    public ArrayList<String> setIdTask(int idtask) {
        System.out.println("name of idtask getted user is " + idtask);
        ArrayList scheduledParam = new ArrayList();
        String QUERY_SQL = "SELECT * FROM usertable WHERE idtask=\'" + idtask + "\';";
        System.out.println(QUERY_SQL);
        this.jdbcTemplate.query(QUERY_SQL, new 18(this, scheduledParam));
        return scheduledParam;
    }

    public List<TaskItem> getGatheringTasksFromDB() {
        System.out.println("Getting gathering tasks from DB");
        String QUERY_SQL = "SELECT * FROM tasks WHERE typetask=\'import\' order by tstamp";
        System.out.println(QUERY_SQL);
        List taskItems = this.jdbcTemplate.query(QUERY_SQL, new 19(this));
        System.out.println("End getting tasks from DB");
        return taskItems;
    }

    public void putGatheringTasksIntoDB() {
        System.out.println("Start gathering tasks from user table ");
        String QUERY_SQL = "SELECT * FROM usertable WHERE enabled=TRUE";
        System.out.println(QUERY_SQL);
        this.jdbcTemplate.query(QUERY_SQL, new 20(this));
    }

    public void deleteTaskIntoDB(String typetask, int idtask, String dateTask) {
        System.out.println("Start deleting task from user table ");
        String QUERY_SQL = "DELETE  FROM tasks WHERE typetask=? and idtask=? and tstamp::timestamp::date=?;";
        System.out.println(QUERY_SQL);
        this.jdbcTemplate.update(QUERY_SQL, new Object[]{typetask, Integer.valueOf(idtask), dateTask});
        System.out.println("End deleting task");
    }

    public void queryAddUser(String username, String password, String databases, String keywords, String competitors, String email, String datestart, String dateend, String ownname, String plan, String resources, String alerting, String freq, String customer) {
        System.out.println("insertIntoDatabaseUsers");
        System.out.println(this.jdbcTemplate);
        Date dateTime = Date.valueOf(datestart);
        Date dateTime2 = Date.valueOf(dateend);
        if(this.jdbcTemplate != null) {
            this.jdbcTemplate.update("INSERT INTO public.usertable(enabled, username, password, databases, keywords,  competitors, email, datestart, dateend, approle, ownname, plan, resources, alerting, freqalert, customer) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);", new Object[]{Boolean.valueOf(true), username, password, databases, keywords, competitors, email, new Timestamp(dateTime.getTime()), new Timestamp(dateTime2.getTime()), "ROLE_USER", ownname, plan, resources, Boolean.valueOf(true), freq, customer});
            this.jdbcTemplate.update("INSERT INTO public.authorities(username, authority) VALUES (?,?);", new Object[]{username, "ROLE_USER"});
            String[] var17 = competitors.split(",");
            int var18 = var17.length;

            for(int var19 = 0; var19 < var18; ++var19) {
                String item = var17[var19];
                this.jdbcTemplate.update("INSERT INTO public.usertable(enabled, databases, keywords, datestart, dateend, customer) VALUES (?, ?, ?, ?, ?, ?);", new Object[]{Boolean.valueOf(true), databases, keywords, new Timestamp(dateTime.getTime()), new Timestamp(dateTime2.getTime()), item});
            }
        }

    }

    public List<String> getConcurrentIds(int idtask) {
        System.out.println("Getting gathering tasks from DB");
        String QUERY_SQL = "SELECT * FROM usertable WHERE idtask=\'" + idtask + "\';";
        System.out.println(QUERY_SQL);
        ArrayList competitorsFromDB = new ArrayList();
        this.jdbcTemplate.query(QUERY_SQL, new 21(this, competitorsFromDB));
        ArrayList listForAllConcurentIDs = new ArrayList();
        new ArrayList();
        if(competitorsFromDB.size() > 0) {
            String[] var7 = ((String)competitorsFromDB.get(0)).split(",");
            int item = var7.length;

            for(int var9 = 0; var9 < item; ++var9) {
                String item1 = var7[var9];
                String QUERY_SQL_IDTASK = "SELECT * FROM public.usertable WHERE customer=\'" + item1.trim() + "\';";
                System.out.println(QUERY_SQL_IDTASK);
                this.jdbcTemplate.query(QUERY_SQL_IDTASK, new 22(this, listForAllConcurentIDs));
            }
        }

        Iterator var12 = listForAllConcurentIDs.iterator();

        while(var12.hasNext()) {
            String var13 = (String)var12.next();
            System.out.println("concurrent ID - " + var13);
        }

        return listForAllConcurentIDs;
    }
}

