package ua.inlimited.idol.connect;

import com.autonomy.aci.client.services.AciService;
import com.autonomy.aci.client.services.impl.DocumentProcessor;
import com.autonomy.aci.client.util.AciParameters;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashSet;
import java.util.Iterator;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathExpressionException;
import javax.xml.xpath.XPathFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import ua.inlimited.idol.User;
import ua.inlimited.idol.connect.BannedUserList;
import ua.inlimited.idol.connect.RecordItem;
import ua.inlimited.idol.connect.ResultList;
import ua.inlimited.idol.connect.Sources;
import ua.inlimited.idol.connect.TextQueryClass;

@Controller
public class TestIdolService {
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

    public TestIdolService() {
    }

    @RequestMapping(
            value = {"/acitest"},
            method = {RequestMethod.GET},
            produces = {"application/json"}
    )
    @ResponseBody
    public void aciConnect(@RequestParam(value = "dateQuery",required = false) String dateQueryStart, @RequestParam(value = "dateQuery2",required = false) String dateQueryEnd, @RequestParam(value = "fbsource",required = false) String fbsource, @RequestParam(value = "vksource",required = false) String vksource, @RequestParam(value = "twisource",required = false) String twisource, @RequestParam(value = "igsource",required = false) String igsource, @RequestParam(value = "ytsource",required = false) String ytsource, @RequestParam(value = "blogsource",required = false) String blogsource, @RequestParam(value = "forumsource",required = false) String forumsource, @RequestParam(value = "websource",required = false) String websource, @RequestParam(value = "posttype",required = false) String posttype, @RequestParam(value = "liketype",required = false) String liketype, @RequestParam(value = "taggedtype",required = false) String taggedtype, @RequestParam(value = "sharetype",required = false) String sharetype, @RequestParam(value = "commenttype",required = false) String commenttype, @RequestParam(value = "posvibe",required = false) String posvibe, @RequestParam(value = "negvibe",required = false) String negvibe, @RequestParam(value = "neuvibe",required = false) String neuvibe, @RequestParam(value = "country",required = false) String country, @RequestParam(value = "language",required = false) String language, @RequestParam(value = "author",required = false) String author, @RequestParam(value = "otherauthor",required = false) String otherautor, @RequestParam(value = "sex",required = false) String sex, @RequestParam(value = "age0017",required = false) String age0017, @RequestParam(value = "age1824",required = false) String age1824, @RequestParam(value = "age2534",required = false) String age2534, @RequestParam(value = "age3544",required = false) String age3544, @RequestParam(value = "age4554",required = false) String age4554, @RequestParam(value = "age5599",required = false) String age5599, @RequestParam(value = "likecomm",required = false) String likecomm, @RequestParam(value = "sharecomm",required = false) String sharecomm, @RequestParam(value = "commcomm",required = false) String commcomm, @RequestParam(value = "discomm",required = false) String discomm) throws XPathExpressionException, InterruptedException {
        new AciParameters();
        String matchDatabase = this.loggedUser.getDatabaseEntities();
        String word;
        if(null != this.textQuery.getTextQuery() && !this.textQuery.getTextQuery().isEmpty()) {
            word = this.textQuery.getTextQuery();
        } else {
            word = this.loggedUser.getKeywords();
            word = "(" + word + ")";
        }

        String ownAuthorName = this.loggedUser.getOwnName();
        new HashSet();
        System.out.println("testing true metod");
        HashSet sourcesSet = new HashSet();
        HashSet posttypeSet = new HashSet();
        HashSet vibeSet = new HashSet();
        HashSet ageSet = new HashSet();
        HashSet commtypeSet = new HashSet();
        if(null != fbsource && fbsource.equals("on")) {
            sourcesSet.add(Sources.FACEBOOK.toString());
        }

        if(null != twisource && twisource.equals("on")) {
            sourcesSet.add(Sources.TWITTER.toString());
        }

        if(null != vksource && vksource.equals("on")) {
            sourcesSet.add(Sources.VK.toString());
        }

        if(null != websource && websource.equals("on")) {
            sourcesSet.add(Sources.WEB.toString());
        }

        if(null != igsource && igsource.equals("on")) {
            sourcesSet.add(Sources.INSTAGRAM.toString());
        }

        if(null != blogsource && blogsource.equals("on")) {
            sourcesSet.add(Sources.BLOG.toString());
        }

        if(null != forumsource && forumsource.equals("on")) {
            sourcesSet.add(Sources.FORUM.toString());
        }

        System.out.println("source set" + sourcesSet);
        if(null != posttype && posttype.equals("on")) {
            posttypeSet.add("POST");
        }

        if(null != liketype && liketype.equals("on")) {
            posttypeSet.add("LIKE");
        }

        if(null != taggedtype && taggedtype.equals("on")) {
            posttypeSet.add("TAGGED");
        }

        if(null != sharetype && sharetype.equals("on")) {
            posttypeSet.add("SHARE");
        }

        if(null != commenttype && commenttype.equals("on")) {
            posttypeSet.add("COMMENT");
        }

        System.out.println("type " + posttypeSet);
        if(null != posvibe && posvibe.equals("on")) {
            vibeSet.add("POSITIVE");
        }

        if(null != negvibe && negvibe.equals("on")) {
            vibeSet.add("NEGATIVE");
        }

        if(null != neuvibe && neuvibe.equals("on")) {
            vibeSet.add("NEUTRAL");
        }

        int maxPage;
        if(null != age0017 && age0017.equals("on")) {
            for(maxPage = 0; maxPage < 18; ++maxPage) {
                ageSet.add(Integer.toString(maxPage));
            }
        }

        if(null != age1824 && age1824.equals("on")) {
            for(maxPage = 18; maxPage < 25; ++maxPage) {
                ageSet.add(Integer.toString(maxPage));
            }
        }

        if(null != age2534 && age2534.equals("on")) {
            for(maxPage = 25; maxPage < 35; ++maxPage) {
                ageSet.add(Integer.toString(maxPage));
            }
        }

        if(null != age3544 && age3544.equals("on")) {
            for(maxPage = 35; maxPage < 45; ++maxPage) {
                ageSet.add(Integer.toString(maxPage));
            }
        }

        if(null != age4554 && age4554.equals("on")) {
            for(maxPage = 45; maxPage < 55; ++maxPage) {
                ageSet.add(Integer.toString(maxPage));
            }
        }

        if(null != age5599 && age5599.equals("on")) {
            for(maxPage = 55; maxPage < 100; ++maxPage) {
                ageSet.add(Integer.toString(maxPage));
            }
        }

        commcomm = null;
        if(null != likecomm && likecomm.equals("on")) {
            commtypeSet.add("LIKE");
        }

        if(null != sharecomm && sharecomm.equals("on")) {
            commtypeSet.add("SHARE");
        }

        if(null != commcomm && commcomm.equals("on")) {
            commtypeSet.add("COMMENT");
        }

        if(null != discomm && discomm.equals("on")) {
            commtypeSet.add("DISLIKE");
        }

        if(dateQueryStart == null || dateQueryEnd == null || dateQueryStart.isEmpty() || dateQueryEnd.isEmpty()) {
            dateQueryStart = this.loggedUser.getDateStart();
            dateQueryEnd = this.loggedUser.getDateEnd();
        }

        this.textQuery.setTextFullQueryRunning(false);
        Thread.sleep(1000L);
        this.resultList.getResultList().clear();
        this.textQuery.setTextFullQueryRunning(true);
        System.out.println("date limits are involved in process" + dateQueryStart + "   " + dateQueryEnd);
        Date var88 = null;
        Date endDate = null;
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

        try {
            var88 = dateFormat.parse(dateQueryStart);
            endDate = dateFormat.parse(dateQueryEnd);
        } catch (ParseException var87) {
            var87.printStackTrace();
        }

        Calendar instance = Calendar.getInstance();
        Calendar instanceEnd = Calendar.getInstance();
        instance.setTime(var88);
        instanceEnd.setTime(endDate);
        instance.add(5, -1);

        do {
            System.out.println(dateFormat.format(instanceEnd.getTime()));
            String datespecific = "WILD{" + dateFormat.format(instanceEnd.getTime()) + "*}:SIMPLE-DATE";
            datespecific = datespecific + " AND MATCH{";

            Iterator idtask;
            String xpath;
            for(idtask = sourcesSet.iterator(); idtask.hasNext(); datespecific = datespecific + xpath + ",") {
                xpath = (String)idtask.next();
            }

            datespecific = datespecific.substring(0, datespecific.length() - 1);
            datespecific = datespecific + "}:SOURCE-TYPE";
            datespecific = datespecific + " AND MATCH{";

            for(idtask = posttypeSet.iterator(); idtask.hasNext(); datespecific = datespecific + xpath + ",") {
                xpath = (String)idtask.next();
            }

            datespecific = datespecific.substring(0, datespecific.length() - 1);
            datespecific = datespecific + "}:CONTENT-TYPE";
            datespecific = datespecific + " AND MATCH{";

            for(idtask = vibeSet.iterator(); idtask.hasNext(); datespecific = datespecific + xpath.toUpperCase() + ",") {
                xpath = (String)idtask.next();
            }

            datespecific = datespecific.substring(0, datespecific.length() - 1);
            datespecific = datespecific + "}:SENTIMENT";
            if(null != country && !"NONE".equalsIgnoreCase(country)) {
                datespecific = datespecific + " AND MATCH{" + country + "}:COUNTRY";
            }

            if(null != language && !"NONE".equalsIgnoreCase(language)) {
                datespecific = datespecific + " AND MATCH{" + language + "}:LANGUAGE";
            }

            if(null != sex && !"NOTHING".equalsIgnoreCase(sex)) {
                datespecific = datespecific + " AND MATCH{" + sex + "}:GENDER";
            }

            System.out.println("query string to dbase " + datespecific);
            int var90 = this.loggedUser.getIdtask();
            AciParameters parameters = new AciParameters();
            parameters.add("Action", "Query");
            parameters.add("Text", word);
            parameters.add("databasematch", matchDatabase);
            parameters.add("maxresults", Integer.valueOf(10000));
            parameters.add("anylanguage", "true");
            parameters.add("print", "all");
            parameters.add("FieldText", datespecific);
            Document response = (Document)this.aciService.executeAction(parameters, new DocumentProcessor());
            XPath var91 = XPathFactory.newInstance().newXPath();
            NodeList nodeList = null;

            try {
                nodeList = (NodeList)var91.evaluate("/autnresponse/responsedata/hit", response, XPathConstants.NODESET);
            } catch (XPathExpressionException var86) {
                var86.printStackTrace();
            }

            int count = 0;
            int documents = nodeList.getLength();
            String authorLink = "";
            String dateNode = "";
            String likesqtyNode = "";
            String commentFolNode = "";
            String follqtyNode = "";
            String sharedNode = "";
            boolean isRight = false;
            boolean isRight1 = false;
            boolean isRight2 = false;
            boolean isRight3 = false;
            boolean isRight4 = false;
            boolean isRight5 = false;
            boolean isRight6 = false;
            boolean isRight7 = false;
            boolean isRight8 = false;
            var91 = XPathFactory.newInstance().newXPath();

            for(int ii = 0; ii < documents; ++ii) {
                Node node = nodeList.item(ii);
                isRight = false;
                isRight1 = false;
                isRight2 = false;
                isRight3 = false;
                isRight4 = false;
                isRight5 = false;
                isRight6 = false;
                isRight7 = false;
                isRight8 = false;
                NodeList nodechild = node.getChildNodes();
                Node last = nodechild.item(nodechild.getLength() - 1).getFirstChild();
                String sourceTypeNode = var91.evaluate("SOURCE-TYPE", last);
                var91.evaluate("CONTENT-TYPE", last);
                String vibeNode = var91.evaluate("SENTIMENT", last);
                var91.evaluate("COUNTRY-NAME", last);
                if(!this.textQuery.isTextFullQueryRunning()) {
                    System.out.println("new text query has been gotten");
                    return;
                }

                String ageNode = var91.evaluate("COMMENTER-AGE", last);
                var91.evaluate("LANGUAGE", last);
                authorLink = var91.evaluate("COMMENTER-URL", last);
                var91.evaluate("GENDER", last);
                var91.evaluate("COMMENT-TYPE", last);
                String dreContentNode = var91.evaluate("DRECONTENT", last);
                String userNameNode = var91.evaluate("COMMENTER-NAME", last);
                String linkNode = var91.evaluate("DREREFERENCE", last);
                dateNode = var91.evaluate("SIMPLE-DATE", last);
                sharedNode = var91.evaluate("SHARED", last);
                if("".equals(dateNode)) {
                    dateNode = "Unknown";
                }

                if("".equals(dreContentNode)) {
                    dreContentNode = "Unknown";
                }

                if("".equals(userNameNode)) {
                    userNameNode = "Unknown";
                }

                if("".equals(linkNode)) {
                    linkNode = "Unknown";
                }

                if("".equals(sourceTypeNode)) {
                    sourceTypeNode = "Unknown";
                }

                if("".equals(vibeNode)) {
                    vibeNode = "Unknown";
                }

                if("".equals(authorLink)) {
                    authorLink = "Unknown";
                }

                follqtyNode = var91.evaluate("COMMENTER-FOLLOWERS", last);
                if("".equals(follqtyNode)) {
                    follqtyNode = "Unknown";
                }

                likesqtyNode = var91.evaluate("LIKE", last);
                if("".equals(likesqtyNode)) {
                    likesqtyNode = "0";
                }

                if("".equals(sharedNode)) {
                    sharedNode = "0";
                }

                commentFolNode = "0";
                isRight1 = true;
                isRight2 = true;
                isRight3 = true;
                isRight4 = true;
                if(ageSet.contains(ageNode.toUpperCase())) {
                    isRight5 = true;
                }

                isRight6 = true;
                isRight7 = true;
                if(userNameNode.equalsIgnoreCase(ownAuthorName) && author.equalsIgnoreCase("OWN")) {
                    isRight8 = true;
                }

                if(!userNameNode.equalsIgnoreCase(ownAuthorName) && author.equalsIgnoreCase("OTHERS")) {
                    isRight8 = true;
                }

                if(author.equalsIgnoreCase("NONE")) {
                    isRight8 = true;
                }

                if(isRight1 && isRight2 && isRight3 && isRight4 && isRight5 && isRight6 && isRight7 && isRight8) {
                    isRight = true;
                }

                if(isRight) {
                    ++count;
                }

                System.out.println("count " + count);
                System.out.println("result list size " + this.resultList.getResultList().size());
                if(isRight && !this.bannedUserList.getBannedUserList().contains(userNameNode)) {
                    this.resultList.getResultList().add(new RecordItem(dreContentNode, userNameNode, linkNode, sourceTypeNode, vibeNode.toUpperCase(), likesqtyNode, sharedNode, dateNode, authorLink, follqtyNode));
                }
            }

            instanceEnd.add(5, -1);
        } while(instance.getTimeInMillis() < instanceEnd.getTimeInMillis());

        boolean var89 = false;
        maxPage = this.resultList.getResultList().size() > 9?10:this.resultList.getResultList().size();
        System.out.println("maxPage " + maxPage);
    }
}
