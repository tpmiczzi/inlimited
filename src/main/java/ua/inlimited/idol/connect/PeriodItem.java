package ua.inlimited.idol.connect;

public class PeriodItem {
    String numberPeriod;
    int postQty;

    public PeriodItem(String numberPeriod, int postQty) {
        this.numberPeriod = numberPeriod;
        this.postQty = postQty;
    }

    public String toString() {
        return "PeriodItem{numberPeriod=\'" + this.numberPeriod + '\'' + ", postQty=" + this.postQty + '}';
    }

    public PeriodItem() {
    }

    public String getNumberPeriod() {
        return this.numberPeriod;
    }

    public void setNumberPeriod(String numberPeriod) {
        this.numberPeriod = numberPeriod;
    }

    public int getPostQty() {
        return this.postQty;
    }

    public void setPostQty(int postQty) {
        this.postQty = postQty;
    }
}
