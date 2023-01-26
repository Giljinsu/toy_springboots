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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.study.toy_springboots.service.MemberService;
import com.study.toy_springboots.utils.MakeUUID;

@Controller
@RequestMapping(value = "/memberlist")
public class MemberListController {

    @Autowired
    MemberService memberService;

    @Autowired
    MakeUUID makeUUID;

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

    @RequestMapping(value = "/insertMulti", method = RequestMethod.POST)
    public Object upload(MultipartHttpServletRequest multipartHttpServletRequest,
        @RequestParam Map params,  ModelAndView modelAndView) {

        Iterator<String> fileNames = multipartHttpServletRequest.getFileNames();
        String relativePath = "C:\\Develops\\toy_springboots\\src\\main\\resources\\static\\files\\";

        String physicalFileName = makeUUID.makeUuid();
        String saveFilePath = relativePath+physicalFileName+"\\";
        File newfile = new File(saveFilePath);
        newfile.mkdir();
        List fileList = new ArrayList<>();
        Map attachfile = null;
        while(fileNames.hasNext()) {
            String fileName = fileNames.next();
            MultipartFile multipartFile = multipartHttpServletRequest.getFile(fileName);
            String originalFileName = multipartFile.getOriginalFilename();
            String filePath = saveFilePath+originalFileName;
            try {
                multipartFile.transferTo(new File(filePath));
                attachfile = new HashMap<>();
                attachfile.put("ATTACHFILE_SEQ", makeUUID.makeUuid());
                attachfile.put("SOURCE_UNIQUE_SEQ", params.get("USER_ID"));
                attachfile.put("ORGINALFILE_NAME", originalFileName);
                attachfile.put("PHYSICALFILE_NAME", physicalFileName);
                attachfile.put("REGISTER_SEQ", params.get("USER_NAME"));
                attachfile.put("MODIFIER_SEQ", params.get("USER_NAME"));
                fileList.add(attachfile);
            } catch (IllegalStateException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        params.put("fileList", fileList);
        Object memberDatas = memberService.insertMultiAndGetList(params);        
        modelAndView.addObject("memberDatas", memberDatas);
        modelAndView.setViewName("/seeMemberList");
        return modelAndView;
    }
}
