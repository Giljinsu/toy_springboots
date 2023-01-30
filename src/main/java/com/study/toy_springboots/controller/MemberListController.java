package com.study.toy_springboots.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.study.toy_springboots.service.MemberService;
import com.study.toy_springboots.utils.CommonUtils;

@Controller
@RequestMapping(value = "/memberlist")
public class MemberListController {

    @Autowired
    MemberService memberService;

    @Autowired
    CommonUtils commonUtils;

    @RequestMapping(value = "/{currentPage}")
    public Object memberlist(@RequestParam Map params,  @PathVariable int currentPage,
            ModelAndView modelAndView) {
        params.put("currentPage", currentPage);
        Object memberListDatas = memberService.getMemberDataAndTotalCount(params);
        modelAndView.addObject("memberListDatas", memberListDatas);
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

    @RequestMapping(value = "/insertMulti", method = RequestMethod.POST)
    public Object upload(MultipartHttpServletRequest multipartHttpServletRequest,
        @RequestParam Map params,  ModelAndView modelAndView) {
        List fileList = new ArrayList<>();
        Map attachfile = new HashMap<>();

        Map map = commonUtils.FileUpload(multipartHttpServletRequest);
        String originalFileName = (String)map.get("originalFileName");
        String physicalFileName = (String)map.get("physicalFileName");

        attachfile.put("ATTACHFILE_SEQ", commonUtils.makeUuid());
        attachfile.put("SOURCE_UNIQUE_SEQ", params.get("USER_ID"));
        attachfile.put("ORGINALFILE_NAME", originalFileName);
        attachfile.put("PHYSICALFILE_NAME", physicalFileName);
        attachfile.put("REGISTER_SEQ", params.get("USER_NAME"));
        attachfile.put("MODIFIER_SEQ", params.get("USER_NAME"));
        fileList.add(attachfile);

        params.put("fileList", fileList);
        Object memberDatas = memberService.insertMultiAndGetList(params);        
        modelAndView.addObject("memberDatas", memberDatas);
        modelAndView.setViewName("/seeMemberList");
        return modelAndView;
    }



}
