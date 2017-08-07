package ua.inlimited.idol.connect;

public class Top10User {
    String name;
    String link;
    String followers;
    String city;

    public Top10User() {
    }

    public String getFollowers() {
        return this.followers;
    }

    public void setFollowers(String followers) {
        this.followers = followers;
    }

    public Top10User(String name, String link, String followers, String city) {
        this.name = name;
        this.link = link;
        this.followers = followers;
        this.city = city;
    }

    public String getName() {
        return this.name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLink() {
        return this.link;
    }

    public void setLink(String link) {
        String resource = "";
        System.out.println("link is " + link + " substring " + link.substring(11, 17));
        if(link.length() > 11 && link.substring(11, 17).equals("vk.com")) {
            resource = "VK";
        } else if(link.length() > 11 && link.substring(11, 17).equals("facebo")) {
            resource = "FACEBOOK";
        } else if(link.length() > 11 && link.substring(11, 17).equals("instag")) {
            resource = "INSTAGRAM";
        } else if(link.length() > 11 && link.substring(11, 17).equals("twitte")) {
            resource = "TWITTER";
        } else {
            resource = "SMI";
        }

        this.link = "<a href=" + link + ">" + resource + "</a>";
    }

    public String getCity() {
        return this.city;
    }

    public void setCity(String city) {
        this.city = city;
    }
}
