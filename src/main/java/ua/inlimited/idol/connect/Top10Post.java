package ua.inlimited.idol.connect;

public class Top10Post {
    private String name;
    private String postqty;
    private String followers;
    private String likes;
    private String reposts;

    public Top10Post(String name, String postqty, String followers, String likes, String reposts) {
        this.name = name;
        this.postqty = postqty;
        this.followers = followers;
        this.likes = likes;
        this.reposts = reposts;
    }

    public Top10Post() {
    }

    public String getName() {
        return this.name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPostqty() {
        return this.postqty;
    }

    public void setPostqty(String postqty) {
        this.postqty = postqty;
    }

    public String getFollowers() {
        return this.followers;
    }

    public void setFollowers(String followers) {
        this.followers = followers;
    }

    public String getLikes() {
        return this.likes;
    }

    public void setLikes(String likes) {
        this.likes = likes;
    }

    public String getReposts() {
        return this.reposts;
    }

    public void setReposts(String reposts) {
        this.reposts = reposts;
    }
}

