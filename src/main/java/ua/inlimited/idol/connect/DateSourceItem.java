package ua.inlimited.idol.connect;

public class DateSourceItem {
    private String tstamp;
    private int facebook;
    private int vk;
    private int insta;
    private int twitter;
    private int smi;

    public String getTstamp() {
        return this.tstamp;
    }

    public void setTstamp(String tstamp) {
        this.tstamp = tstamp;
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

    public int getInsta() {
        return this.insta;
    }

    public void setInsta(int insta) {
        this.insta = insta;
    }

    public int getTwitter() {
        return this.twitter;
    }

    public void setTwitter(int twitter) {
        this.twitter = twitter;
    }

    public int getSmi() {
        return this.smi;
    }

    public void setSmi(int smi) {
        this.smi = smi;
    }

    public DateSourceItem() {
    }

    public DateSourceItem(String tstamp, int facebook, int vk, int insta, int twitter, int smi) {
        this.tstamp = tstamp;
        this.facebook = facebook;
        this.vk = vk;
        this.insta = insta;
        this.twitter = twitter;
        this.smi = smi;
    }
}
