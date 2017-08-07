package ua.inlimited.idol.connect;

import com.autonomy.aci.client.services.AciService;
import com.autonomy.aci.client.services.impl.DocumentProcessor;
import com.autonomy.aci.client.util.AciParameters;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Map.Entry;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathExpressionException;
import javax.xml.xpath.XPathFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import ua.inlimited.idol.connect.AuthorItem;
import ua.inlimited.idol.connect.CityPostQty;
import ua.inlimited.idol.connect.Sources;
import ua.inlimited.idol.connect.StatisticItem;
import ua.inlimited.idol.db.DBService;

@Component
public class GatheringService {
    @Autowired
    DBService dbService;
    @Autowired
    AciService aciService;

    public GatheringService() {
    }

    public void searchByWord(String word, String matchDatabase, String dateForQuery, int idtask) {
        HashMap collectByWord = new HashMap();
        Sources[] authorsMap = Sources.values();
        int datespecific = authorsMap.length;

        for(int parameters = 0; parameters < datespecific; ++parameters) {
            Sources response = authorsMap[parameters];
            collectByWord.put(response.toString(), new StatisticItem());
        }

        HashMap var45 = new HashMap();
        String var46 = "WILD{" + dateForQuery + "*}:SIMPLE-DATE";
        System.out.println(var46);
        AciParameters var47 = new AciParameters();
        var47.add("Action", "Query");
        word = "(" + word + "):DRECONTENT";
        var47.add("Text", word);
        System.out.println("word is " + word);
        var47.add("Databasematch", matchDatabase);
        var47.add("maxresults", Integer.valueOf(10000));
        var47.add("anylanguage", "true");
        var47.add("print", "all");
        var47.add("FieldText", var46);
        Document var48 = (Document)this.aciService.executeAction(var47, new DocumentProcessor());
        XPath xpath = XPathFactory.newInstance().newXPath();
        NodeList nodeList = null;

        try {
            nodeList = (NodeList)xpath.evaluate("/autnresponse/responsedata/hit", var48, XPathConstants.NODESET);
        } catch (XPathExpressionException var44) {
            var44.printStackTrace();
        }

        int documents = nodeList.getLength();
        System.out.println("documents " + documents);
        HashSet authors = new HashSet();
        HashMap cityCountry = new HashMap();
        HashMap cityQty = new HashMap();
        String commentTypeItem = "";
        String vibeTypeItem = "";
        String userNameNode = "";
        String userNameNodeLC = "";
        AuthorItem authorNode = null;
        String sourceTypeItem = "";
        String contentTypeItem = "";
        String followersItem = "";
        String userProfileItem = "";
        String cityNameNode = "";
        String countryNameNode = "";
        String datePost = "";
        String authorURL = "";
        String likeQtyItem = "";
        String repostQtyItem = "";
        StatisticItem mapValuetotal = new StatisticItem();
        mapValuetotal.total = 0;
        boolean countPerCity = false;
        boolean countPerCityPos = false;
        boolean countPerCityNeg = false;
        boolean countPerCityNeu = false;
        int likeQty = 0;
        int repostqty = 0;

        for(int ii = 0; ii < documents; ++ii) {
            Node itemCity = nodeList.item(ii);
            NodeList nodechild = itemCity.getChildNodes();
            Node last = nodechild.item(nodechild.getLength() - 1).getFirstChild();

            try {
                datePost = xpath.evaluate("SIMPLE-DATE", last);
                contentTypeItem = xpath.evaluate("CONTENT-TYPE", last);
                commentTypeItem = xpath.evaluate("COMMENT-TYPE", last);
                userNameNode = xpath.evaluate("COMMENTER-NAME", last);
                vibeTypeItem = xpath.evaluate("SENTIMENT", last);
                sourceTypeItem = xpath.evaluate("SOURCE-TYPE", last);
                followersItem = xpath.evaluate("COMMENTER-FOLLOWERS", last);
                if(followersItem.equals("")) {
                    followersItem = "0";
                }

                cityNameNode = xpath.evaluate("CITY-NAME", last);
                countryNameNode = xpath.evaluate("COUNTRY-NAME", last);
                authorURL = xpath.evaluate("COMMENTER-URL", last);
                repostQtyItem = xpath.evaluate("SHARED", last);
                likeQtyItem = xpath.evaluate("LIKE", last);
                System.out.println(commentTypeItem);
                System.out.println(userNameNode);
                System.out.println(vibeTypeItem);
                System.out.println(sourceTypeItem);
                System.out.println(datePost);
                System.out.println("-----");
            } catch (XPathExpressionException var43) {
                System.out.println("Error in xpath");
                var43.printStackTrace();
            }

            ++mapValuetotal.total;
            System.out.println("content type check");
            if(contentTypeItem != null && contentTypeItem.equalsIgnoreCase("post")) {
                ++((StatisticItem)collectByWord.get(sourceTypeItem.toUpperCase())).postqty;
            }

            if(contentTypeItem != null && commentTypeItem.equalsIgnoreCase("share")) {
                ++((StatisticItem)collectByWord.get(sourceTypeItem.toUpperCase())).shareqty;
            }

            System.out.println("post type check");
            if(commentTypeItem != null) {
                if(commentTypeItem.equalsIgnoreCase("love")) {
                    ++((StatisticItem)collectByWord.get(sourceTypeItem.toUpperCase())).loveqty;
                } else if(commentTypeItem.equalsIgnoreCase("like")) {
                    ++((StatisticItem)collectByWord.get(sourceTypeItem.toUpperCase())).likeqty;
                } else if(commentTypeItem.equalsIgnoreCase("wow")) {
                    ++((StatisticItem)collectByWord.get(sourceTypeItem.toUpperCase())).wowqty;
                } else if(commentTypeItem.equalsIgnoreCase("angry")) {
                    ++((StatisticItem)collectByWord.get(sourceTypeItem.toUpperCase())).angryqty;
                } else if(commentTypeItem.equalsIgnoreCase("sad")) {
                    ++((StatisticItem)collectByWord.get(sourceTypeItem.toUpperCase())).sadqty;
                }
            }

            System.out.println("user name check");
            if(userNameNode != null) {
                authors.add(userNameNode.toLowerCase());
            }

            if(userNameNode != null) {
                userNameNodeLC = userNameNode.toLowerCase();
            }

            if(userNameNodeLC != null && !userNameNodeLC.isEmpty()) {
                if(!"".equals(repostQtyItem) && repostQtyItem != null) {
                    repostqty = Integer.parseInt(repostQtyItem);
                }

                if(!"".equals(likeQtyItem) && likeQtyItem != null) {
                    likeQty = Integer.parseInt(likeQtyItem);
                }

                if(var45.containsKey(userNameNodeLC)) {
                    authorNode = (AuthorItem)var45.get(userNameNodeLC);
                    ++authorNode.postqty;
                    authorNode.likeqty += likeQty;
                    authorNode.repostqty += repostqty;
                } else {
                    if(!authorURL.equals((Object)null)) {
                        userProfileItem = authorURL;
                    } else {
                        userProfileItem = "notdefined";
                    }

                    if(followersItem != null) {
                        var45.put(userNameNodeLC, new AuthorItem(userNameNodeLC, 1, Integer.parseInt(followersItem), userProfileItem, cityNameNode, repostqty, likeQty));
                    }
                }
            }

            int var50 = 0;
            int var51 = 0;
            int var52 = 0;
            System.out.println("city check");
            if(cityNameNode != null && !cityNameNode.isEmpty()) {
                cityCountry.put(cityNameNode, countryNameNode);
                if(cityQty.containsKey(cityNameNode)) {
                    int var49 = ((CityPostQty)cityQty.get(cityNameNode)).postqty;
                    var50 = ((CityPostQty)cityQty.get(cityNameNode)).posqty;
                    var51 = ((CityPostQty)cityQty.get(cityNameNode)).negqty;
                    var52 = ((CityPostQty)cityQty.get(cityNameNode)).neuqty;
                    if(vibeTypeItem != null && vibeTypeItem.equalsIgnoreCase("neutral")) {
                        ++var52;
                    } else if(vibeTypeItem != null && vibeTypeItem.equalsIgnoreCase("positive")) {
                        ++var50;
                    } else if(vibeTypeItem != null && vibeTypeItem.equalsIgnoreCase("negative")) {
                        ++var51;
                    }

                    System.out.println("countpercity " + var49);
                    ++var49;
                    cityQty.put(cityNameNode, new CityPostQty(var49, var50, var51, var52));
                } else {
                    if(vibeTypeItem != null && vibeTypeItem.equalsIgnoreCase("neutral")) {
                        ++var52;
                    } else if(vibeTypeItem != null && vibeTypeItem.equalsIgnoreCase("positive")) {
                        ++var50;
                    } else if(vibeTypeItem != null && vibeTypeItem.equalsIgnoreCase("negative")) {
                        ++var51;
                    }

                    cityQty.put(cityNameNode, new CityPostQty(1, var50, var51, var52));
                }

                System.out.println("vibes check");
                if(vibeTypeItem != null && vibeTypeItem.equalsIgnoreCase("positive")) {
                    ++((StatisticItem)collectByWord.get(sourceTypeItem.toUpperCase())).positiveqty;
                }

                if(vibeTypeItem != null && vibeTypeItem.equalsIgnoreCase("negative")) {
                    ++((StatisticItem)collectByWord.get(sourceTypeItem.toUpperCase())).negativeqty;
                }

                if(vibeTypeItem != null && vibeTypeItem.equalsIgnoreCase("neutral")) {
                    ++((StatisticItem)collectByWord.get(sourceTypeItem.toUpperCase())).neutralqty;
                }
            }

            System.out.println("item ended");
        }

        mapValuetotal.authorqty = var45.size();
        Iterator var53 = collectByWord.entrySet().iterator();

        Entry var54;
        while(var53.hasNext()) {
            var54 = (Entry)var53.next();
            mapValuetotal.neutralqty += ((StatisticItem)var54.getValue()).neutralqty;
            mapValuetotal.positiveqty += ((StatisticItem)var54.getValue()).positiveqty;
            mapValuetotal.negativeqty += ((StatisticItem)var54.getValue()).negativeqty;
            mapValuetotal.commentqty += ((StatisticItem)var54.getValue()).commentqty;
            mapValuetotal.shareqty += ((StatisticItem)var54.getValue()).shareqty;
            mapValuetotal.likeqty += ((StatisticItem)var54.getValue()).likeqty;
            mapValuetotal.postqty += ((StatisticItem)var54.getValue()).postqty;
            mapValuetotal.loveqty += ((StatisticItem)var54.getValue()).loveqty;
            mapValuetotal.wowqty += ((StatisticItem)var54.getValue()).wowqty;
            mapValuetotal.hahaqty += ((StatisticItem)var54.getValue()).hahaqty;
            mapValuetotal.sadqty += ((StatisticItem)var54.getValue()).sadqty;
            mapValuetotal.angryqty += ((StatisticItem)var54.getValue()).angryqty;
            this.dbService.insertIntoDatabaseSources(idtask, ((String)var54.getKey()).toString(), ((StatisticItem)var54.getValue()).commentqty + ((StatisticItem)var54.getValue()).postqty, ((StatisticItem)var54.getValue()).positiveqty, ((StatisticItem)var54.getValue()).negativeqty, ((StatisticItem)var54.getValue()).neutralqty, dateForQuery, ((StatisticItem)var54.getValue()).likeqty, ((StatisticItem)var54.getValue()).loveqty, ((StatisticItem)var54.getValue()).wowqty, ((StatisticItem)var54.getValue()).hahaqty, ((StatisticItem)var54.getValue()).sadqty, ((StatisticItem)var54.getValue()).angryqty);
        }

        var53 = var45.entrySet().iterator();

        while(var53.hasNext()) {
            var54 = (Entry)var53.next();
            System.out.println("Authors");
            System.out.println(((AuthorItem)var54.getValue()).userName);
            System.out.println(((AuthorItem)var54.getValue()).postqty);
            System.out.println(((AuthorItem)var54.getValue()).followers);
            System.out.println("user " + ((AuthorItem)var54.getValue()).userProfile);
            this.dbService.insertIntoDatabaseUsers(idtask, ((AuthorItem)var54.getValue()).userName, ((AuthorItem)var54.getValue()).userProfile, ((AuthorItem)var54.getValue()).postqty, ((AuthorItem)var54.getValue()).followers, ((AuthorItem)var54.getValue()).userCity, ((AuthorItem)var54.getValue()).repostqty, ((AuthorItem)var54.getValue()).likeqty, dateForQuery);
        }

        System.out.println("mapValue " + mapValuetotal.neutralqty);
        this.dbService.insertIntoDatabaseStatistics(idtask, mapValuetotal.total, mapValuetotal.authorqty, mapValuetotal.commentqty, mapValuetotal.shareqty, mapValuetotal.likeqty, mapValuetotal.positiveqty, mapValuetotal.negativeqty, mapValuetotal.neutralqty, mapValuetotal.postqty, dateForQuery);
        var53 = cityQty.entrySet().iterator();

        while(var53.hasNext()) {
            var54 = (Entry)var53.next();
            System.out.println("entryset size" + cityQty.entrySet().size());
            this.dbService.insertIntoDatabaseCities(idtask, (String)var54.getKey(), (String)cityCountry.get(var54.getKey()), ((CityPostQty)var54.getValue()).postqty, ((CityPostQty)var54.getValue()).posqty, ((CityPostQty)var54.getValue()).negqty, ((CityPostQty)var54.getValue()).neuqty, dateForQuery);
        }

    }
}
