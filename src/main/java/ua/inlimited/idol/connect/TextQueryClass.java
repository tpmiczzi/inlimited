package ua.inlimited.idol.connect;

import org.springframework.stereotype.Component;

@Component
public class TextQueryClass {
    private String textQuery;
    private int sessionCount;
    private boolean isTextFullQueryRunning;

    public boolean isTextFullQueryRunning() {
        return this.isTextFullQueryRunning;
    }

    public void setTextFullQueryRunning(boolean textFullQueryRunning) {
        this.isTextFullQueryRunning = textFullQueryRunning;
    }

    public int getSessionCount() {
        return this.sessionCount;
    }

    public void setSessionCount(int sessionCount) {
        this.sessionCount = sessionCount;
    }

    public String getTextQuery() {
        return this.textQuery;
    }

    public void setTextQueryClass(String textQuery) {
        this.textQuery = textQuery;
    }

    public TextQueryClass() {
    }
}

