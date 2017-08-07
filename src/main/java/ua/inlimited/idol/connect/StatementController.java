package ua.inlimited.idol.connect;

import java.util.ArrayList;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
import ua.inlimited.idol.connect.StatementController.ChoiseItem;
import ua.inlimited.idol.connect.StatementController.ConcItem;
import ua.inlimited.idol.connect.StatementController.MockSource;
import ua.inlimited.idol.connect.StatementController.SourceConcur;
import ua.inlimited.idol.db.DBService;

@Controller
public class StatementController {
    @Autowired
    DBService dbService;
    @Autowired
    User loggedUser;

    public StatementController() {
    }

    @RequestMapping(
            value = {"/statement1"},
            method = {RequestMethod.GET},
            produces = {"application/json"}
    )
    @ResponseBody
    public List<StatisticItem> statementAnswer(@RequestParam(required = false) Integer id) {
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String username = "";
        if(principal instanceof UserDetails) {
            username = ((UserDetails)principal).getUsername();
        } else {
            username = principal.toString();
        }

        System.out.println("username from security " + username);
        this.dbService.setLoggedUser(username);
        Iterator var4 = this.dbService.getGatheringTasksFromDB().iterator();

        while(var4.hasNext()) {
            TaskItem item = (TaskItem)var4.next();
            System.out.println(item);
        }

        this.statement1Week(Integer.valueOf(this.loggedUser.getIdtask()));
        return this.dbService.queryStatisticsTable(this.loggedUser.getIdtask(), 90);
    }

    @RequestMapping(
            value = {"/statement1week"},
            method = {RequestMethod.GET},
            produces = {"application/json"}
    )
    @ResponseBody
    public List<PeriodItem> statement1Week(@RequestParam(required = false) Integer id) {
        List answerFromDB = this.dbService.queryStatisticsTableWeek(this.loggedUser.getIdtask(), 90);
        LinkedList answerFromStatement = new LinkedList();
        GregorianCalendar cal = new GregorianCalendar();
        int week = cal.get(3);
        HashMap mapForWeeks = new HashMap();
        Iterator i = answerFromDB.iterator();

        PeriodItem item;
        while(i.hasNext()) {
            item = (PeriodItem)i.next();
            System.out.println(item.toString());
            mapForWeeks.put(Integer.valueOf(Integer.parseInt(item.getNumberPeriod())), Integer.valueOf(item.getPostQty()));
        }

        for(int var12 = 0; var12 < 12; ++var12) {
            if(week == 0) {
                week = 52;
            }

            System.out.println("week - " + week);
            if(mapForWeeks.containsKey(Integer.valueOf(week))) {
                System.out.println("enter to map???");
                cal.set(3, week);
                Date yourDate = cal.getTime();
                cal.setTime(yourDate);
                cal.set(7, 2);
                Date start = cal.getTime();
                cal.add(5, 6);
                cal.set(7, 1);
                Date end = cal.getTime();
                System.out.println(start + " - " + end);
                answerFromStatement.add(0, new PeriodItem(start.toString().substring(4, 10) + " - " + end.toString().substring(4, 10), ((Integer)mapForWeeks.get(Integer.valueOf(week))).intValue()));
            }

            --week;
        }

        i = answerFromStatement.iterator();

        while(i.hasNext()) {
            item = (PeriodItem)i.next();
            System.out.println(item.toString());
        }

        return answerFromStatement;
    }

    @RequestMapping(
            value = {"/statement1month"},
            method = {RequestMethod.GET},
            produces = {"application/json"}
    )
    @ResponseBody
    public List<PeriodItem> statement1Month(@RequestParam(required = false) Integer id) {
        List answerFromDB = this.dbService.queryStatisticsTableMonth(this.loggedUser.getIdtask(), 180);
        LinkedList answerFromStatement = new LinkedList();
        GregorianCalendar cal = new GregorianCalendar();
        int month = cal.get(2) + 1;
        String[] monthNames = new String[]{"January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"};
        HashMap mapForMonth = new HashMap();
        Iterator i = answerFromDB.iterator();

        PeriodItem item;
        while(i.hasNext()) {
            item = (PeriodItem)i.next();
            System.out.println(item.toString());
            mapForMonth.put(Integer.valueOf(Integer.parseInt(item.getNumberPeriod())), Integer.valueOf(item.getPostQty()));
        }

        for(int var13 = 0; var13 < 6; ++var13) {
            if(month < 0) {
                month = 11;
            }

            System.out.println("month - " + month);
            if(mapForMonth.containsKey(Integer.valueOf(month))) {
                System.out.println("enter to map???");
                answerFromStatement.add(0, new PeriodItem(monthNames[month - 1], ((Integer)mapForMonth.get(Integer.valueOf(month))).intValue()));
            }

            --month;
        }

        i = answerFromStatement.iterator();

        while(i.hasNext()) {
            item = (PeriodItem)i.next();
            System.out.println(item.toString());
        }

        return answerFromStatement;
    }

    @RequestMapping(
            value = {"/statement2"},
            method = {RequestMethod.GET},
            produces = {"application/json"}
    )
    @ResponseBody
    public List<DateSourceItem> statementAnswer2() {
        System.out.println("sources query for all");
        return this.dbService.queryStatisticsSources(this.loggedUser.getIdtask(), 90);
    }

    @RequestMapping(
            value = {"/statement3"},
            method = {RequestMethod.GET},
            produces = {"application/json"}
    )
    @ResponseBody
    public List<DateSourceItem> statementAnswer3() {
        return this.dbService.queryStatisticsSourcesOverall(this.loggedUser.getIdtask(), 90);
    }

    @RequestMapping(
            value = {"/statementconcur"},
            method = {RequestMethod.GET},
            produces = {"application/json"}
    )
    @ResponseBody
    public List<MockSource> statementAnswer4(@RequestParam("name") String name) {
        ArrayList mock = new ArrayList();
        if(name.equals("1")) {
            mock.add(new MockSource(this, "2017-01-29", 111, 91, 4, 1667, 14));
            mock.add(new MockSource(this, "2017-01-30", 109, 204, 12, 1489, 20));
            mock.add(new MockSource(this, "2017-01-31", 143, 85, 17, 762, 13));
            mock.add(new MockSource(this, "2017-02-01", 89, 64, 1, 762, 17));
            mock.add(new MockSource(this, "2017-02-02", 30, 7, 4, 738, 8));
            mock.add(new MockSource(this, "2017-02-05", 18, 12, 0, 705, 12));
            mock.add(new MockSource(this, "2017-02-06", 59, 47, 6, 1562, 24));
        }

        if(name.equals("2")) {
            mock.add(new MockSource(this, "2017-01-29", 111, 91, 4, 1667, 14));
            mock.add(new MockSource(this, "2017-01-30", 109, 204, 12, 1489, 20));
            mock.add(new MockSource(this, "2017-01-31", 143, 85, 17, 762, 13));
            mock.add(new MockSource(this, "2017-02-01", 89, 64, 1, 762, 17));
            mock.add(new MockSource(this, "2017-02-02", 30, 7, 4, 738, 8));
            mock.add(new MockSource(this, "2017-02-05", 18, 12, 0, 705, 12));
            mock.add(new MockSource(this, "2017-02-06", 59, 47, 6, 1562, 24));
        }

        if(name.equals("3")) {
            mock.add(new MockSource(this, "2017-01-29", 111, 91, 4, 1667, 14));
            mock.add(new MockSource(this, "2017-01-30", 109, 204, 12, 1489, 20));
            mock.add(new MockSource(this, "2017-01-31", 143, 85, 17, 762, 13));
            mock.add(new MockSource(this, "2017-02-01", 89, 64, 1, 762, 17));
            mock.add(new MockSource(this, "2017-02-02", 30, 7, 4, 738, 8));
            mock.add(new MockSource(this, "2017-02-05", 18, 12, 0, 705, 12));
            mock.add(new MockSource(this, "2017-02-06", 59, 47, 6, 1562, 24));
        }

        return this.loggedUser.getIdtask() == 4?mock:null;
    }

    @RequestMapping(
            value = {"/concur1"},
            method = {RequestMethod.GET},
            produces = {"application/json"}
    )
    @ResponseBody
    public List<ConcItem> statementAnswer5(@RequestParam int idconcur) {
        byte idtask = 4;
        System.out.println("пришел параметр " + idconcur);
        List currentIdStat = this.dbService.queryStatisticsTable(idtask, 90);
        ArrayList answerList = new ArrayList();
        Iterator var5 = currentIdStat.iterator();

        while(var5.hasNext()) {
            StatisticItem item = (StatisticItem)var5.next();
            answerList.add(new ConcItem(this, item.getDate(), item.getPostqty(), (int)((double)item.getPostqty() * Math.random())));
        }

        return this.loggedUser.getIdtask() == 4?answerList:null;
    }

    @RequestMapping(
            value = {"/concur2"},
            method = {RequestMethod.GET},
            produces = {"application/json"}
    )
    @ResponseBody
    public List<SourceConcur> statementAnswer6() {
        ArrayList answerList = new ArrayList();
        answerList.add(new SourceConcur(this, "1", new HashMap()));
        ((SourceConcur)answerList.get(0)).getResults().put("Facebook", Integer.valueOf(43));
        ((SourceConcur)answerList.get(0)).getResults().put("Twitter", Integer.valueOf(15));
        ((SourceConcur)answerList.get(0)).getResults().put("VKontakte", Integer.valueOf(23));
        ((SourceConcur)answerList.get(0)).getResults().put("WEB", Integer.valueOf(17));
        answerList.add(new SourceConcur(this, "2", new HashMap()));
        ((SourceConcur)answerList.get(1)).getResults().put("Facebook", Integer.valueOf(48));
        ((SourceConcur)answerList.get(1)).getResults().put("Twitter", Integer.valueOf(25));
        ((SourceConcur)answerList.get(1)).getResults().put("VKontakte", Integer.valueOf(27));
        ((SourceConcur)answerList.get(1)).getResults().put("WEB", Integer.valueOf(10));
        answerList.add(new SourceConcur(this, "3", new HashMap()));
        ((SourceConcur)answerList.get(1)).getResults().put("Facebook", Integer.valueOf(30));
        ((SourceConcur)answerList.get(1)).getResults().put("Twitter", Integer.valueOf(21));
        ((SourceConcur)answerList.get(1)).getResults().put("VKontakte", Integer.valueOf(16));
        ((SourceConcur)answerList.get(1)).getResults().put("WEB", Integer.valueOf(10));
        return this.loggedUser.getIdtask() == 4?answerList:null;
    }

    @RequestMapping(
            value = {"/graphiccountry"},
            method = {RequestMethod.GET},
            produces = {"application/json"}
    )
    @ResponseBody
    public List<CityPostQty> statementAnswercity() {
        return this.dbService.queryTotalCountriesTop(this.loggedUser.getIdtask(), 90);
    }

    @RequestMapping(
            value = {"/graphiccity"},
            method = {RequestMethod.GET},
            produces = {"application/json"}
    )
    @ResponseBody
    public List<CityPostQty> statementAnswer7() {
        return this.dbService.queryTotalCities(this.loggedUser.getIdtask(), 90);
    }

    @RequestMapping(
            value = {"/accountsettings"},
            method = {RequestMethod.GET},
            produces = {"application/json"}
    )
    @ResponseBody
    public ArrayList<String> statementAnswer9() throws InterruptedException {
        ArrayList propUser = new ArrayList();
        Thread.sleep(3000L);
        propUser.add(this.loggedUser.getCustomer());
        propUser.add(this.loggedUser.getPlan());
        propUser.add(this.loggedUser.getDateStart());
        propUser.add(this.loggedUser.getDateEnd());
        propUser.add(this.loggedUser.getKeywords());
        propUser.add(this.loggedUser.getResources());
        propUser.add("1");
        if(this.loggedUser.isAlerting()) {
            propUser.add("Включено");
        } else {
            propUser.add("Выключено");
        }

        propUser.add(this.loggedUser.getFreqalert());
        propUser.add(this.loggedUser.getEmail());
        propUser.add(this.loggedUser.getCustomer());
        System.out.println(propUser);
        return propUser;
    }

    @RequestMapping(
            value = {"/top10users"},
            method = {RequestMethod.GET},
            produces = {"application/json"}
    )
    @ResponseBody
    public List<Top10User> findTop10Users() {
        return this.dbService.queryTop10Followers(this.loggedUser.getIdtask(), 90);
    }

    @RequestMapping(
            value = {"/top10dates"},
            method = {RequestMethod.GET},
            produces = {"application/json"}
    )
    @ResponseBody
    public List<Top10Date> findTop10Dates() {
        return this.dbService.queryTop10Dates(this.loggedUser.getIdtask(), 90);
    }

    @RequestMapping(
            value = {"/top10sources"},
            method = {RequestMethod.GET},
            produces = {"application/json"}
    )
    @ResponseBody
    public List<Top10Date> findTop10Sources() {
        return this.dbService.queryTop5Sources(this.loggedUser.getIdtask(), 90);
    }

    @RequestMapping(
            value = {"/top10posts"},
            method = {RequestMethod.GET},
            produces = {"application/json"}
    )
    @ResponseBody
    public List<Top10Post> findTop10Posts() {
        return this.dbService.queryTop10Posts(this.loggedUser.getIdtask(), 90);
    }

    @RequestMapping(
            value = {"/getconcurrentnames"},
            method = {RequestMethod.GET},
            produces = {"application/json"}
    )
    @ResponseBody
    public List<ChoiseItem> getConcurrentNames() {
        ArrayList answerList = new ArrayList();
        answerList.add(new ChoiseItem(this, "Intime", 7));
        answerList.add(new ChoiseItem(this, "Нова Пошта", 8));
        return this.loggedUser.getIdtask() == 4?answerList:null;
    }

    @RequestMapping(
            value = {"/getforinfototal"},
            method = {RequestMethod.GET},
            produces = {"application/json"}
    )
    @ResponseBody
    public List<TotalInfoClass> getTotalNumbersForInfo() throws InterruptedException {
        Thread.sleep(1500L);
        return this.dbService.queryTotalNumbersForInfo(this.loggedUser.getIdtask(), 90);
    }

    @RequestMapping(
            value = {"/getalldatainfographics"},
            method = {RequestMethod.GET},
            produces = {"application/json"}
    )
    @ResponseBody
    public QueryForInfoPage getAllNumbersForInfoGraphics() {
        QueryForInfoPage answer = (QueryForInfoPage)this.dbService.queryForInfoGraphics(this.loggedUser.getIdtask()).get(0);
        answer.setAuthorqty(((Integer)this.dbService.queryForInfoGraphicsAuthors(this.loggedUser.getIdtask()).get(0)).intValue());
        answer.setRepostqty(((Integer)this.dbService.queryForInfoGraphicsReposts(this.loggedUser.getIdtask()).get(0)).intValue());
        return answer;
    }
}