package com.study.toy_springboots.controller;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
    @RequestMapping(value = {"","/","/main"})
    public String home() {
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        // 여기서 principal은 userdetails다
        if (principal instanceof UserDetails) {
            //로그인이 되어있을때 UserDetails 
            System.out.println(((UserDetails)principal).getUsername());
            System.out.println(((UserDetails)principal).getAuthorities());
            System.out.println(((UserDetails)principal).getPassword());
            System.out.println(((UserDetails)principal).isAccountNonExpired());
            System.out.println(((UserDetails)principal).isAccountNonLocked());
            System.out.println(((UserDetails)principal).isCredentialsNonExpired());
            System.out.println(((UserDetails)principal).isEnabled());
        } else {
            String username = principal.toString();
        }
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
