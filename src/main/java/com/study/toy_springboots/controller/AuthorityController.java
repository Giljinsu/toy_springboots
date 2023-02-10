package com.study.toy_springboots.controller;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AuthorityController {
    @RequestMapping(value = {"/admin/*"})
    public String admin() {
        return "/admin/read";
    }
    @RequestMapping(value = {"/manager/*"})
    public String manager() {
        return "/manager/read";
    }
    @RequestMapping(value = {"/user/*"})
    public String member() {
        return "/index";
    }
//     @RequestMapping(value = {"/loginedadmin"})
//     public String homeAdminLogined() {
//         return "/admin";
//     }
}
