package ua.inlimited.idol.connect;

public class AuthorItem {
    String userName;
    int postqty;
    int followers;
    String userProfile;
    String userCity;
    int repostqty;
    int likeqty;

    public AuthorItem(String userName, int postqty, int followers, String userProfile, String userCity, int repostqty, int likeqty) {
        this.userName = userName;
        this.postqty = postqty;
        this.followers = followers;
        this.userProfile = userProfile;
        this.userCity = userCity;
        this.repostqty = repostqty;
        this.likeqty = likeqty;
    }
}
