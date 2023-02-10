package com.study.toy_springboots.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.annotation.JacksonInject.Value;
import com.study.toy_springboots.service.LoginService;

@Controller
@RequestMapping(value = "/loginpage")
public class LoginController {

    @Autowired
    LoginService loginService;
    
    //로그인 페이지 이동
    @RequestMapping(value ={"/",""})
    public ModelAndView loginPage(ModelAndView modelAndView) {
        modelAndView.addObject("dbUerData","notLogin");
        modelAndView.setViewName("/login/logpage");
        return modelAndView;
    }

    //로그인
    // @RequestMapping(value ={"/login"}, method= RequestMethod.POST)
    // public ModelAndView login(@RequestParam Map params,  ModelAndView modelAndView) {
    //     Object dbUerData = loginService.getLogin(params);
    //     // HashMap<String, Object> hashMap = (HashMap)dbUerData;
    //     ArrayList arrayList = (ArrayList)dbUerData;
    //     modelAndView.addObject("dbUerData", dbUerData);
        
    //     if(arrayList.size()==0) {
    //         modelAndView.addObject("isCorrect", "아이디 또는 비밀번호를 확인해주세요");
    //         modelAndView.setViewName("/login/logpage");
    //     } else {
    //         HashMap<String,Object> hashMap=(HashMap)arrayList.get(0);
    //         String privilege =  (String)hashMap.get("PRIVILEGES");
    //         if(privilege.equals("ADMIN")) {
    //             modelAndView.setViewName("/admin");
    //         } else {
    //             modelAndView.setViewName("/login/indexLogined");
    //         }
    //     }
    //     return modelAndView;
    // }

    //회원가입 페이지 이동
    @RequestMapping(value ={"/joinpage"})
    public ModelAndView joinPage(ModelAndView modelAndView) {
        modelAndView.setViewName("/login/joinMember");
        return modelAndView;
    }

    // 회원가입
    @RequestMapping(value ={"/join/{checkId}"})
    public ModelAndView join(@RequestParam Map<String,Object> params, @PathVariable String checkId , ModelAndView modelAndView) {
        Object dbUerData = loginService.selectId(params);
        ArrayList arrayList = (ArrayList)dbUerData;
        Object isFinish = params.get("isFinish");

        if(params.get("PRIVILEGES")!=null) {
            modelAndView.addObject("isChecked","checked");
        } 

        if(params.get("USER_ID").equals("")) {
            modelAndView.addObject("isDup","아이디를 입력해주세요.");
            modelAndView.setViewName("/login/joinMember");
            return modelAndView;
        } 
        if(isFinish == null) {
            if(arrayList.size()==0) {
                checkId = "true";
                modelAndView.addObject("checkId","true");
                modelAndView.addObject("isDup","사용가능한 ID입니다");
            } else {
                modelAndView.addObject("checkId","false");
                modelAndView.addObject("isDup","중복된 ID입니다");
                checkId = "false";
            }
            modelAndView.setViewName("/login/joinMember");
        } else {
            if(!checkId.equals("true")) {
                modelAndView.setViewName("/login/joinMember");
                modelAndView.addObject("isDup","아이디 중복체크 해주세요.");
            }else {
                //회원가입 성공
                String phoneNumber = params.get("identification_number")+"-"+params.get("number");
                params.put("PHONENUMBER", phoneNumber);
                loginService.insertUserData(params);
                modelAndView.setViewName("/index");
            }
        }
        
        return modelAndView;
    }
}
