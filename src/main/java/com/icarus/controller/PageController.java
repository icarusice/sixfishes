package com.icarus.controller;

import com.icarus.service.DepositoryService;
import com.icarus.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PageController {
    @Autowired
    private DepositoryService depositoryService;
    @Autowired
    private UserService userService;
    @GetMapping("/index")
    public String index(){
        return "index";
    }

    @GetMapping("/table_in")
    public ModelAndView table_in() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("pages/depository/table-in");
        mv.addObject("depositories", depositoryService.findDepositoryAll());
        return mv;
    }

}
