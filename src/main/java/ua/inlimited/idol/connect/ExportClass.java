package ua.inlimited.idol.connect;

import com.autonomy.aci.client.services.AciService;
import com.autonomy.aci.client.services.impl.DocumentProcessor;
import com.autonomy.aci.client.util.AciParameters;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathExpressionException;
import javax.xml.xpath.XPathFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;


public class ExportClass {
    @Autowired
    AciService aciService2;

    public ExportClass() {
    }

    public void Export(String word, String databaseMatch) {
        try {
            PrintWriter ex = new PrintWriter(new OutputStreamWriter(new FileOutputStream("exportfile.csv"), "Cp1251"));
            Throwable var4 = null;

            try {
                new AciParameters();
                System.out.println("export file method");
                AciParameters parameters = new AciParameters();
                parameters.add("Action", "Query");
                parameters.add("Text", word);
                parameters.add("databasematch", databaseMatch);
                parameters.add("maxresults", Integer.valueOf(100));
                parameters.add("anylanguage", "true");
                parameters.add("print", "all");
                System.out.println(this.aciService2);
                Document response = (Document)this.aciService2.executeAction(parameters, new DocumentProcessor());
                XPath xpath = XPathFactory.newInstance().newXPath();
                NodeList nodeList = null;

                try {
                    nodeList = (NodeList)xpath.evaluate("/autnresponse/responsedata/hit", response, XPathConstants.NODESET);
                } catch (XPathExpressionException var28) {
                    var28.printStackTrace();
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
                    } catch (XPathExpressionException var27) {
                        var27.printStackTrace();
                    }

                    ex.write(dateNode + "," + dreContentNode);
                    ex.append('\n');
                    ex.flush();
                }
            } catch (Throwable var29) {
                var4 = var29;
                throw var29;
            } finally {
                if(ex != null) {
                    if(var4 != null) {
                        try {
                            ex.close();
                        } catch (Throwable var26) {
                            var4.addSuppressed(var26);
                        }
                    } else {
                        ex.close();
                    }
                }

            }
        } catch (IOException var31) {
            System.out.println(var31.getMessage());
        }

    }
}

