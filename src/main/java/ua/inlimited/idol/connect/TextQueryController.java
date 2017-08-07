package ua.inlimited.idol.connect;

import com.autonomy.aci.client.services.AciService;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import ua.inlimited.idol.User;
import ua.inlimited.idol.connect.BannedUserList;
import ua.inlimited.idol.connect.FullTextQuery;
import ua.inlimited.idol.connect.GatheringService;
import ua.inlimited.idol.connect.RecordItem;
import ua.inlimited.idol.connect.ResultList;
import ua.inlimited.idol.connect.TextQueryClass;
import ua.inlimited.idol.db.DBService;

@Controller
public class TextQueryController {
    @Autowired
    AciService aciService;
    @Autowired
    TextQueryClass textQuery;
    @Autowired
    ResultList resultList;
    @Autowired
    User loggedUser;
    @Autowired
    BannedUserList bannedUserList;
    @Autowired
    GatheringService gatheringService;
    @Autowired
    FullTextQuery fullTextQuery;
    @Autowired
    DBService dbService;

    public TextQueryController() {
    }

    @Secured({"ROLE_USER"})
    @RequestMapping(
            value = {"/gettextquery"},
            method = {RequestMethod.GET},
            produces = {"application/json"}
    )
    @ResponseBody
    public List<RecordItem> setTextQuery(@RequestParam(required = false) String text) throws InterruptedException {
        Thread.sleep(10000L);
        System.out.println("console text Query!!!!!!!!!!!!!!!!!!!!!!!!");
        ArrayList briefList = new ArrayList();
        Iterator iterator = this.resultList.getResultList().iterator();

        int maxPage;
        for(maxPage = 0; iterator.hasNext() && maxPage < 10; ++maxPage) {
            briefList.add(iterator.next());
        }

        System.out.println("maxPage " + maxPage);
        return briefList;
    }

    @RequestMapping(
            value = {"/pages"},
            method = {RequestMethod.GET},
            produces = {"application/json"}
    )
    @ResponseBody
    public List<RecordItem> setTextQuery(@RequestParam int pageNumber) {
        int sizeOfList = this.resultList.getResultList().size();
        System.out.println("sizeof list " + sizeOfList);
        System.out.println("pagenumber " + pageNumber);
        --pageNumber;
        return pageNumber * 10 + 10 > sizeOfList?this.resultList.getResultList().subList(pageNumber * 10, sizeOfList - 1):this.resultList.getResultList().subList(pageNumber * 10, pageNumber * 10 + 10);
    }

    @RequestMapping(
            value = {"/addbanneduser"},
            method = {RequestMethod.GET}
    )
    public void addBannedUserToList(@RequestParam(required = false) String text, @RequestParam(required = false) boolean isAdded) {
        if(isAdded) {
            this.bannedUserList.getBannedUserList().add(text);
        } else {
            this.bannedUserList.getBannedUserList().remove(text);
        }

        System.out.println("user name banned " + text);
        Iterator var3 = this.bannedUserList.getBannedUserList().iterator();

        while(var3.hasNext()) {
            String item = (String)var3.next();
            System.out.println(item);
        }

    }

    @Secured({"ROLE_USER"})
    @RequestMapping(
            value = {"/scheduleimportback"},
            method = {RequestMethod.GET},
            produces = {"application/json"}
    )
    public ModelAndView importLosted(@RequestParam int idtask, @RequestParam String datestartimport, @RequestParam String dateendimport) {
        System.out.println("datestart " + datestartimport);
        System.out.println("dateend " + dateendimport);
        List competitors = this.dbService.getConcurrentIds(idtask);
        ArrayList concurrentIdTasks = new ArrayList();
        Iterator startString = competitors.iterator();

        String endString;
        while(startString.hasNext()) {
            endString = (String)startString.next();
            concurrentIdTasks.add(Integer.valueOf(Integer.parseInt(endString)));
        }

        if(datestartimport != null && dateendimport != null) {
            this.dbService.deleteDataForDate(datestartimport, dateendimport, idtask);
            String startString1 = datestartimport;
            endString = dateendimport;
            Date startDate = null;
            Date endDate = null;
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

            try {
                startDate = dateFormat.parse(startString1.substring(0, 10));
                endDate = dateFormat.parse(endString.substring(0, 10));
            } catch (ParseException var18) {
                var18.printStackTrace();
            }

            Calendar instance = Calendar.getInstance();
            Calendar instanceEnd = Calendar.getInstance();
            instance.setTime(startDate);
            instanceEnd.setTime(endDate);
            ArrayList scheduledParams = this.dbService.setIdTask(idtask);
            String scheduleKeywords = (String)scheduledParams.get(1);
            String scheduledDB = (String)scheduledParams.get(0);

            do {
                System.out.println(dateFormat.format(instanceEnd.getTime()));
                this.gatheringService.searchByWord(scheduleKeywords, scheduledDB, dateFormat.format(instanceEnd.getTime()), idtask);
                Iterator var16 = concurrentIdTasks.iterator();

                while(var16.hasNext()) {
                    Integer item = (Integer)var16.next();
                    this.gatheringService.searchByWord(scheduleKeywords, scheduledDB, dateFormat.format(instanceEnd.getTime()), item.intValue());
                }

                instanceEnd.add(5, -1);
            } while(instance.getTimeInMillis() <= instanceEnd.getTimeInMillis());
        }

        return new ModelAndView("/info");
    }

    @Secured({"ROLE_USER"})
    @RequestMapping(
            value = {"/adduserback"},
            method = {RequestMethod.GET},
            produces = {"application/json"}
    )
    public ModelAndView addNewUser(@RequestParam String username, @RequestParam String password, @RequestParam String databases, @RequestParam String keywords, @RequestParam String competitors, @RequestParam String email, @RequestParam String datestart, @RequestParam String dateend, @RequestParam String ownname, @RequestParam String plan, @RequestParam String resources, @RequestParam String alerting, @RequestParam String freq, @RequestParam String customer) {
        this.dbService.queryAddUser(username, password, databases, keywords, competitors, email, datestart, dateend, ownname, plan, resources, alerting, freq, customer);
        return new ModelAndView("/info");
    }
}

