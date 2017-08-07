package ua.inlimited.idol.connect;

public class CityPostQty {
    String name;
    int postqty;
    int posqty;
    int negqty;
    int neuqty;

    public String getNameCountry() {
        return this.name;
    }

    public int getPosqty() {
        return this.posqty;
    }

    public void setPosqty(int posqty) {
        this.posqty = posqty;
    }

    public int getNegqty() {
        return this.negqty;
    }

    public void setNegqty(int negqty) {
        this.negqty = negqty;
    }

    public int getNeuqty() {
        return this.neuqty;
    }

    public void setNeuqty(int neuqty) {
        this.neuqty = neuqty;
    }

    public void setNameCountry(String nameCountry) {
        this.name = nameCountry;
    }

    public CityPostQty() {
    }

    public CityPostQty(String nameCountry, int postqty, int posqty, int negqty, int neuqty) {
        this.name = nameCountry;
        this.postqty = postqty;
        this.posqty = posqty;
        this.negqty = negqty;
        this.neuqty = neuqty;
    }

    public CityPostQty(int postqty, int posqty, int negqty, int neuqty) {
        this.postqty = postqty;
        this.posqty = posqty;
        this.negqty = negqty;
        this.neuqty = neuqty;
    }

    public int getPostqty() {
        return this.postqty;
    }

    public void setPostqty(int postqty) {
        this.postqty = postqty;
    }
}

