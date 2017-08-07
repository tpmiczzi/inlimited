package ua.inlimited.idol.connect;

public class SourceStatisticItem {
    String word;
    String source;
    int reminderqty;
    int positiveqty;
    int negativeqty;
    int neutralqty;
    String date;
    int likeqty;
    int loveqty;
    int hahaqty;
    int wowqty;
    int sadqty;
    int angryqty;

    public String getWord() {
        return this.word;
    }

    public void setWord(String word) {
        this.word = word;
    }

    public String getSource() {
        return this.source;
    }

    public void setSource(String source) {
        this.source = source;
    }

    public int getReminderqty() {
        return this.reminderqty;
    }

    public void setReminderqty(int reminderqty) {
        this.reminderqty = reminderqty;
    }

    public int getPositiveqty() {
        return this.positiveqty;
    }

    public void setPositiveqty(int positiveqty) {
        this.positiveqty = positiveqty;
    }

    public int getNegativeqty() {
        return this.negativeqty;
    }

    public void setNegativeqty(int negativeqty) {
        this.negativeqty = negativeqty;
    }

    public int getNeutralqty() {
        return this.neutralqty;
    }

    public void setNeutralqty(int neutralqty) {
        this.neutralqty = neutralqty;
    }

    public String getDate() {
        return this.date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public SourceStatisticItem(String source, int reminderqty, int positiveqty, int negativeqty, int neutralqty, String date) {
        this.source = source;
        this.reminderqty = reminderqty;
        this.positiveqty = positiveqty;
        this.negativeqty = negativeqty;
        this.neutralqty = neutralqty;
        this.date = date;
        this.likeqty = 0;
        this.loveqty = 0;
        this.hahaqty = 0;
        this.wowqty = 0;
        this.sadqty = 0;
        this.angryqty = 0;
    }

    public SourceStatisticItem(String word, String source, int reminderqty, int positiveqty, int negativeqty, int neutralqty, String date, int likeqty, int loveqty, int hahaqty, int wowqty, int sadqty, int angryqty) {
        this.word = word;
        this.source = source;
        this.reminderqty = reminderqty;
        this.positiveqty = positiveqty;
        this.negativeqty = negativeqty;
        this.neutralqty = neutralqty;
        this.date = date;
        this.likeqty = likeqty;
        this.loveqty = loveqty;
        this.hahaqty = hahaqty;
        this.wowqty = wowqty;
        this.sadqty = sadqty;
        this.angryqty = angryqty;
    }

    public SourceStatisticItem() {
    }
}

