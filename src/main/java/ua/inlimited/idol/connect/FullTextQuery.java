package ua.inlimited.idol.connect;

import com.autonomy.aci.client.services.AciService;
import com.autonomy.aci.client.services.impl.DocumentProcessor;
import com.autonomy.aci.client.util.AciParameters;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.LinkOption;
import java.nio.file.attribute.BasicFileAttributes;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import javax.servlet.ServletContext;
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
import ua.inlimited.idol.connect.TextQueryClass;

@Controller
public class FullTextQuery {
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
    ServletContext servletContext;

    public FullTextQuery() {
    }

    @RequestMapping(
            value = {"/gettextqueryfull"},
            method = {RequestMethod.GET}
    )
    public void QueryTextFullList(@RequestParam(required = false) String text) throws InterruptedException {
        this.textQuery.setTextFullQueryRunning(false);
        Thread.sleep(500L);
        System.out.println(this.loggedUser);
        this.textQuery.setTextFullQueryRunning(true);
        this.resultList.getResultList().clear();
        System.out.println("size of result list is " + this.resultList.getResultList().size());
        new AciParameters();
        System.out.println("text query is " + text);
        String word;
        if(!"initiallaunch".equals(text) && text != null) {
            word = text;
            this.textQuery.setTextQueryClass(text);
        } else {
            Thread.sleep(2000L);
            word = this.loggedUser.getKeywords();
        }

        System.out.println("word in getfullquery is " + word);
        String ownAuthorName = this.loggedUser.getOwnName();
        ArrayList ListOfDays = new ArrayList();
        String dateQueryStart = this.loggedUser.getDateStart();
        String dateQueryEnd = this.loggedUser.getDateEnd();
        System.out.println("testing true metod");
        Thread.sleep(1000L);
        String dreContentNode = "";
        String userNameNode = "";
        String linkNode = "";
        String sourceTypeNode = "";
        String postTypeNode = "";
        String vibeNode = "";
        String dateNode = "";
        String likesqtyNode = "";
        String commentNode = "";
        String authorLink = "";
        String follqtyNode = "";
        String matchDatabase = this.loggedUser.getDatabaseEntities();
        if(dateQueryStart != null && dateQueryEnd != null) {
            String e = dateQueryStart;
            String endString = dateQueryEnd;
            Date startDate = null;
            Date endDate = null;
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

            try {
                startDate = dateFormat.parse(e);
                endDate = dateFormat.parse(endString);
            } catch (ParseException var41) {
                var41.printStackTrace();
            }

            Calendar instance = Calendar.getInstance();
            Calendar instanceEnd = Calendar.getInstance();
            instance.setTime(startDate);
            instanceEnd.setTime(endDate);

            do {
                System.out.println(dateFormat.format(instanceEnd.getTime()));
                String datespecific = "WILD{" + dateFormat.format(instanceEnd.getTime()) + "*}:SIMPLE-DATE";
                int idtask = this.loggedUser.getIdtask();
                AciParameters parameters = new AciParameters();
                parameters.add("Action", "Query");
                word = "(" + word + "):DRECONTENT";
                parameters.add("Text", word);
                parameters.add("databasematch", matchDatabase);
                parameters.add("maxresults", Integer.valueOf(10000));
                parameters.add("anylanguage", "true");
                parameters.add("print", "all");
                parameters.add("FieldText", datespecific);
                System.out.println("field text " + datespecific);
                Document response = (Document)this.aciService.executeAction(parameters, new DocumentProcessor());
                XPath xpath = XPathFactory.newInstance().newXPath();
                NodeList nodeList = null;

                try {
                    nodeList = (NodeList)xpath.evaluate("/autnresponse/responsedata/hit", response, XPathConstants.NODESET);
                    ListOfDays.add(nodeList);
                } catch (XPathExpressionException var40) {
                    var40.printStackTrace();
                }

                int documents = nodeList.getLength();
                System.out.println("documents number " + documents);

                for(int ii = 0; ii < documents; ++ii) {
                    if(!this.textQuery.isTextFullQueryRunning()) {
                        System.out.println("new text query has been gotten");
                        return;
                    }

                    Node node = nodeList.item(ii);
                    NodeList nodechild = node.getChildNodes();
                    Node last = nodechild.item(nodechild.getLength() - 1).getFirstChild();

                    try {
                        dreContentNode = xpath.evaluate("DRECONTENT", last);
                        if("".equals(dreContentNode)) {
                            dreContentNode = "Unknown";
                        }

                        authorLink = xpath.evaluate("COMMENTER-URL", last);
                        if("".equals(authorLink)) {
                            authorLink = "Unknown";
                        }

                        userNameNode = xpath.evaluate("COMMENTER-NAME", last);
                        if("".equals(userNameNode)) {
                            userNameNode = "Unknown";
                        }

                        linkNode = xpath.evaluate("DREREFERENCE", last);
                        if("".equals(linkNode)) {
                            linkNode = "Unknown";
                        }

                        sourceTypeNode = xpath.evaluate("SOURCE-TYPE", last);
                        if("".equals(sourceTypeNode)) {
                            sourceTypeNode = "Unknown";
                        }

                        vibeNode = xpath.evaluate("SENTIMENT", last);
                        if("".equals(vibeNode)) {
                            vibeNode = "Unknown";
                        }

                        follqtyNode = xpath.evaluate("COMMENTER-FOLLOWERS", last);
                        if("".equals(follqtyNode)) {
                            follqtyNode = "Unknown";
                        }

                        likesqtyNode = xpath.evaluate("LIKE", last);
                        if("".equals(likesqtyNode)) {
                            likesqtyNode = "0";
                        }

                        commentNode = "0";
                        dateNode = xpath.evaluate("SIMPLE-DATE", last);
                        if("".equals(dateNode)) {
                            dateNode = "Unknown";
                        }
                    } catch (XPathExpressionException var39) {
                        var39.printStackTrace();
                    }

                    if(!this.bannedUserList.getBannedUserList().contains(userNameNode)) {
                        this.resultList.getResultList().add(new RecordItem(dreContentNode, userNameNode, linkNode, sourceTypeNode, vibeNode.toUpperCase(), likesqtyNode, commentNode, dateNode, authorLink, follqtyNode));
                    }
                }

                instanceEnd.add(5, -1);
            } while(instance.getTimeInMillis() <= instanceEnd.getTimeInMillis());
        }

        System.out.println("прошли все даты " + this.resultList.getResultList().size());

        try {
            this.Export(this.loggedUser.getKeywords(), this.loggedUser.getDatabaseEntities());
        } catch (FileNotFoundException var38) {
            var38.printStackTrace();
        }

    }

    @RequestMapping(
            value = {"/getexport"},
            method = {RequestMethod.GET}
    )
    public void Export(String word, String databaseMatch) throws FileNotFoundException {
        System.out.println("exporting data");
        File rootFile = new File(this.servletContext.getRealPath("/resources/"), this.loggedUser.getIdtask() + ".txt");

        try {
            FileWriter ex = new FileWriter(rootFile);
            Throwable var5 = null;

            try {
                System.out.println(rootFile.getAbsolutePath());
                new AciParameters();
                System.out.println("export file method");
                AciParameters parameters = new AciParameters();
                parameters.add("Action", "Query");
                parameters.add("Text", word);
                parameters.add("databasematch", databaseMatch);
                parameters.add("maxresults", Integer.valueOf(100));
                parameters.add("anylanguage", "true");
                parameters.add("print", "all");
                System.out.println(this.aciService);
                Document response = (Document)this.aciService.executeAction(parameters, new DocumentProcessor());
                XPath xpath = XPathFactory.newInstance().newXPath();
                NodeList nodeList = null;

                try {
                    nodeList = (NodeList)xpath.evaluate("/autnresponse/responsedata/hit", response, XPathConstants.NODESET);
                } catch (XPathExpressionException var29) {
                    var29.printStackTrace();
                }

                int documents = nodeList.getLength();
                String dreContentNode = "";
                String dateNode = "";
                System.out.println("documents number " + documents);

                for(int ii = 0; ii < documents; ++ii) {
                    Node node = nodeList.item(ii);
                    NodeList nodechild = node.getChildNodes();
                    System.out.println("writing line " + ii);
                    Node last = nodechild.item(nodechild.getLength() - 1).getFirstChild();

                    try {
                        dreContentNode = xpath.evaluate("DRECONTENT", last);
                        dateNode = xpath.evaluate("SIMPLE-DATE", last);
                        if("".equals(dateNode)) {
                            dateNode = "Unknown";
                        }
                    } catch (XPathExpressionException var28) {
                        var28.printStackTrace();
                    }

                    ex.write(dateNode + "\t" + dreContentNode);
                    ex.append('\n');
                    ex.flush();
                }

                System.out.println("closing file output     ");
                ex.close();
            } catch (Throwable var30) {
                var5 = var30;
                throw var30;
            } finally {
                if(ex != null) {
                    if(var5 != null) {
                        try {
                            ex.close();
                        } catch (Throwable var27) {
                            var5.addSuppressed(var27);
                        }
                    } else {
                        ex.close();
                    }
                }

            }
        } catch (IOException var32) {
            System.out.println(var32.getMessage());
        }

    }

    @RequestMapping(
            value = {"/getexportcheck"},
            method = {RequestMethod.GET}
    )
    @ResponseBody
    public String ExportCheck() throws FileNotFoundException {
        File requestedFile = new File(this.servletContext.getRealPath("/resources/"), this.loggedUser.getIdtask() + ".txt");
        if(requestedFile.exists()) {
            System.out.println("file is ");
            BasicFileAttributes attr = null;

            try {
                attr = Files.readAttributes(requestedFile.toPath(), BasicFileAttributes.class, new LinkOption[0]);
            } catch (IOException var4) {
                var4.printStackTrace();
            }

            System.out.println("creationTime: " + attr.creationTime());
            System.out.println("lastAccessTime: " + attr.lastAccessTime());
            System.out.println("lastModifiedTime: " + attr.lastModifiedTime());
            GregorianCalendar dateNow = new GregorianCalendar();
            if(dateNow.getTimeInMillis() - attr.creationTime().toMillis() > 43200000L) {
                System.out.println("File is outdated!");
                requestedFile.delete();
                return "no";
            } else {
                return String.valueOf(this.loggedUser.getIdtask() + ".txt");
            }
        } else {
            System.out.println("file not is ");
            return "no";
        }
    }
}
