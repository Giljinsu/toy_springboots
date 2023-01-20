package com.study.toy_springboots.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.study.toy_springboots.service.MemberService;

@Controller
@RequestMapping(value = "/memberlist")
public class MemberListController {

    @Autowired
    MemberService memberService;

    @RequestMapping(value = {"","/"})
    public Object memberlist(@RequestParam Map params,  ModelAndView modelAndView) {
        Object memberDatas = memberService.getMemberData(modelAndView);
        modelAndView.addObject("memberDatas", memberDatas);
        modelAndView.setViewName("/seeMemberList");
        return modelAndView;
    }

    @RequestMapping(value = {"/delete"})
    public Object delete(@RequestParam Map params,  ModelAndView modelAndView) {
        
        Object memberDatas = memberService.deleteAndGetList(params);
        modelAndView.addObject("memberDatas", memberDatas);
        modelAndView.setViewName("/seeMemberList");
        return modelAndView;
    }

    @RequestMapping(value = "/update")
    public Object update(@RequestParam Map params,  ModelAndView modelAndView) {
        Object memberDatas = memberService.getOneMemberData(params);
        modelAndView.addObject("memberDatas", memberDatas);
        modelAndView.setViewName("/memberList/updateMember");
        return modelAndView;
    }

    @RequestMapping(value = "/create")
    public Object create(@RequestParam Map params,  ModelAndView modelAndView) {
        // Object memberDatas = memberService.getOneMemberData(params);
        // modelAndView.addObject("memberDatas", memberDatas);
        modelAndView.setViewName("/memberList/updateMember");
        return modelAndView;
    }

    @RequestMapping(value = "/save")
    public Object save(@RequestParam Map params,  ModelAndView modelAndView) {
        Object memberDatas = memberService.saveAndGetList(params);
        modelAndView.addObject("memberDatas", memberDatas);
        modelAndView.setViewName("/seeMemberList");
        return modelAndView;
    }

    @RequestMapping(value = {"/edit"})
    public Object edit(@RequestParam Map params,  ModelAndView modelAndView) {
        
        String priv = (String)params.get("PRIVILEGES");
        if(priv == null) {
            params.put("PRIVILEGES", "MEMBER");
        } else {
            params.put("PRIVILEGES", "ADMIN");
        }
        Object memberDatas = memberService.updateAndGetList(params);
        modelAndView.addObject("memberDatas", memberDatas);
        modelAndView.setViewName("/seeMemberList");
        return modelAndView;
    }

}
