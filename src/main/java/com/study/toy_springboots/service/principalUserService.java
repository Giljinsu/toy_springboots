package com.study.toy_springboots.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.stereotype.Service;

import com.study.toy_springboots.configurations.PrincipalUser;
import com.study.toy_springboots.dao.LoginDao;

@Service
public class principalUserService implements UserDetailsService {
    @Autowired
    LoginDao loginDao;

    @Override
    public UserDetails loadUserByUsername(String username) {
        String sqlMapId = "Login.selectByUIDWithToyDB";
        Map<String,String> userInfo = (Map)loginDao.getLogin(sqlMapId, username);
        

        PrincipalUser principalUser = new PrincipalUser(userInfo);
        return principalUser;
    }
}
