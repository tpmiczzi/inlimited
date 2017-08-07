package ua.inlimited.idol.connect;

import java.util.ArrayList;
import java.util.List;
import org.springframework.stereotype.Component;
import ua.inlimited.idol.connect.RecordItem;

@Component
public class ResultList {
    private ArrayList<RecordItem> resultList;

    public List<RecordItem> getResultList() {
        return this.resultList;
    }

    public void setResultList(ArrayList<RecordItem> resultList) {
        this.resultList = resultList;
    }

    public ResultList() {
    }
}

