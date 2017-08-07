package ua.inlimited.idol.connect;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import ua.inlimited.idol.User;
import ua.inlimited.idol.connect.ResultList;

@Controller
public class InfoController {
    @Autowired
    User loggedUser;
    @Autowired
    ResultList resultList;

    public InfoController() {
    }

    @Secured({"ROLE_USER"})
    @RequestMapping({"/info"})
    public ModelAndView getInfo() {
        return new ModelAndView("/info");
    }

    @Secured({"ROLE_USER"})
    @RequestMapping({"/graphics"})
    public ModelAndView getGraphics() {
        return new ModelAndView("/infographics");
    }

    @Secured({"ROLE_USER"})
    @RequestMapping({"/analytics"})
    public ModelAndView getAnalytics() {
        return new ModelAndView("/analyticstables");
    }

    @Secured({"ROLE_USER"})
    @RequestMapping({"/concurency"})
    public ModelAndView getConcurency() {
        return new ModelAndView("/concurency");
    }

    @Secured({"ROLE_USER"})
    @RequestMapping({"/account"})
    public ModelAndView getAccount() {
        return new ModelAndView("/account");
    }

    @Secured({"ROLE_USER"})
    @RequestMapping({"/export"})
    public ModelAndView getExport() {
        return new ModelAndView("/export");
    }

    @Secured({"ROLE_USER"})
    @RequestMapping({"/scheduleimport"})
    public ModelAndView getScheduleImport() {
        return new ModelAndView("/scheduleimport");
    }

    @Secured({"ROLE_USER"})
    @RequestMapping({"/adduser"})
    public ModelAndView addUser() {
        return new ModelAndView("/adduser");
    }

    @Secured({"ROLE_USER"})
    @RequestMapping(
            value = {"/excel"},
            method = {RequestMethod.GET}
    )
    public ModelAndView excel() {
        System.out.println("ExcelPDFController excel is called");
        return new ModelAndView("excelDocument", "modelObject", this.resultList.getResultList());
    }
}
