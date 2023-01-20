package com.study.toy_springboots.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
    @RequestMapping(value = {"","/","/main"})
    public String home() {
        return "/index";
    }
    @RequestMapping(value = {"/logined"})
    public String homeLogined() {
        return "/login/indexLogined";
    }
    @RequestMapping(value = {"/loginedadmin"})
    public String homeAdminLogined() {
        return "/admin";
    }
}
