package ua.inlimited.idol.connect;

import org.springframework.stereotype.Component;

@Component
public class RecordItem {
    private String content;
    private String userName;
    private String link;
    private String source;
    private String sentiment;
    private String likesqty;
    private String commentqty;
    private String date;
    private String authorLink;
    private String follqty;

    public String getAuthorLink() {
        return this.authorLink;
    }

    public void setAuthorLink(String authorLink) {
        this.authorLink = authorLink;
    }

    public String getSource() {
        return this.source;
    }

    public void setSource(String source) {
        this.source = source;
    }

    public String getSentiment() {
        return this.sentiment;
    }

    public void setSentiment(String sentiment) {
        this.sentiment = sentiment;
    }

    public String getLikesqty() {
        return this.likesqty;
    }

    public void setLikesqty(String likesqty) {
        this.likesqty = likesqty;
    }

    public String getCommentqty() {
        return this.commentqty;
    }

    public void setCommentqty(String commentqty) {
        this.commentqty = commentqty;
    }

    public String getDate() {
        return this.date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getFollqty() {
        return this.follqty;
    }

    public void setFollqty(String follqty) {
        this.follqty = follqty;
    }

    public RecordItem(String content, String userName, String link, String source, String sentiment, String likesqty, String commentqty, String date, String authorLink, String follqty) {
        this.content = content;
        this.userName = userName;
        this.link = link;
        this.source = source;
        this.sentiment = sentiment;
        this.likesqty = likesqty;
        this.commentqty = commentqty;
        this.date = date;
        this.authorLink = authorLink;
        this.follqty = follqty;
    }

    public RecordItem(String content, String userName, String link) {
        this.content = content;
        this.userName = userName;
        this.link = link;
    }

    public RecordItem() {
    }

    public String getContent() {
        return this.content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getUserName() {
        return this.userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getLink() {
        return this.link;
    }

    public void setLink(String link) {
        this.link = link;
    }
}

