package ua.inlimited.idol.connect;

public class TotalInfoClass {
    private int total;
    private int facebook;
    private int vk;
    private int twitter;
    private int instagram;
    private int smi;
    private int blog;
    private int forum;

    public TotalInfoClass() {
    }

    public TotalInfoClass(int total, int facebook, int vk, int twitter, int instagram, int smi, int blog, int forum) {
        this.total = total;
        this.facebook = facebook;
        this.vk = vk;
        this.twitter = twitter;
        this.instagram = instagram;
        this.smi = smi;
        this.blog = blog;
        this.forum = forum;
    }

    public void countTotal() {
        this.setTotal(this.facebook + this.vk + this.twitter + this.instagram + this.smi + this.blog + this.forum);
    }

    public int getTotal() {
        return this.total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public int getFacebook() {
        return this.facebook;
    }

    public void setFacebook(int facebook) {
        this.facebook = facebook;
    }

    public int getVk() {
        return this.vk;
    }

    public void setVk(int vk) {
        this.vk = vk;
    }

    public int getTwitter() {
        return this.twitter;
    }

    public void setTwitter(int twitter) {
        this.twitter = twitter;
    }

    public int getInstagram() {
        return this.instagram;
    }

    public void setInstagram(int instagram) {
        this.instagram = instagram;
    }

    public int getSmi() {
        return this.smi;
    }

    public void setSmi(int smi) {
        this.smi = smi;
    }

    public int getBlog() {
        return this.blog;
    }

    public void setBlog(int blog) {
        this.blog = blog;
    }

    public int getForum() {
        return this.forum;
    }

    public void setForum(int forum) {
        this.forum = forum;
    }
}

