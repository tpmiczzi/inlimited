package ua.inlimited.idol.scope;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;

@Controller
public class ScopeController {
    public ScopeController() {
    }

    @RequestMapping({"/scopeSessionUser"})
    public ModelAndView scopeUser(HttpSession httpSession) {
        System.out.println("ScopeController scopeSession() is called");
        httpSession.setMaxInactiveInterval(120);
        httpSession.setAttribute("sessionObject", "Hi ! It\'s session project!!");
        return new ModelAndView("/scope/scope");
    }
}
