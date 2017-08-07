package ua.inlimited.idol.connect;

import java.util.HashSet;
import org.springframework.stereotype.Component;

@Component
public class BannedUserList {
    private HashSet<String> bannedUserList = new HashSet();

    public BannedUserList(HashSet<String> bannedUserList) {
        this.bannedUserList = bannedUserList;
    }

    public BannedUserList() {
    }

    public HashSet<String> getBannedUserList() {
        return this.bannedUserList;
    }

    public void setBannedUserList(HashSet<String> bannedUserList) {
        this.bannedUserList = bannedUserList;
    }
}
