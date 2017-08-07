package ua.inlimited.idol.connect;

public class Top10Date {
    String source;
    String postqty;
    String date;

    public Top10Date() {
    }

    public Top10Date(String source, String postqty, String date) {
        this.source = source;
        this.postqty = postqty;
        this.date = date;
    }

    public String getSource() {
        return this.source;
    }

    public void setSource(String source) {
        this.source = source;
    }

    public String getPostqty() {
        return this.postqty;
    }

    public void setPostqty(String postqty) {
        this.postqty = postqty;
    }

    public String getDate() {
        return this.date;
    }

    public void setDate(String date) {
        this.date = date;
    }
}
