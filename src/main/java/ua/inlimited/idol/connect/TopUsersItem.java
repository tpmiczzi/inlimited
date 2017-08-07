package ua.inlimited.idol.connect;

public class TopUsersItem {
    String linkprofile;
    String username;
    int followers;
    int postqty;

    public TopUsersItem() {
    }

    public String getLinkprofile() {
        return this.linkprofile;
    }

    public void setLinkprofile(String linkprofile) {
        this.linkprofile = linkprofile;
    }

    public String getUsername() {
        return this.username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public int getFollowers() {
        return this.followers;
    }

    public void setFollowers(int followers) {
        this.followers = followers;
    }

    public int getPostqty() {
        return this.postqty;
    }

    public void setPostqty(int postqty) {
        this.postqty = postqty;
    }
}
