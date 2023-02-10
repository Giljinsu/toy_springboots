package com.study.toy_springboots.configurations;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Map;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

public class PrincipalUser implements UserDetails {
    private Map userInfo;
    private String memberName;
    
    public PrincipalUser(Map userInfo) {
        this.userInfo = userInfo;
        this.memberName = (String)userInfo.get("NAME");
    }

    public Map getUserInfo() {
        return userInfo;
    }

    public String getMemberName() {
        return memberName;
    }

    @Override
    public Collection<GrantedAuthority> getAuthorities() {
        Collection<GrantedAuthority> collection = new ArrayList<>();
        collection.add(new SimpleGrantedAuthority((String)userInfo.get("AUTHORITY")));
        return collection;
    }

    @Override
    public String getPassword() {
        // TODO Auto-generated method stub
        return (String)userInfo.get("PASSWORD");
    }

    @Override
    public String getUsername() {
        // TODO Auto-generated method stub
        return (String)userInfo.get("MEMBER_ID");
    }

    @Override
    public boolean isAccountNonExpired() {
        // TODO Auto-generated method stub
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        // TODO Auto-generated method stub
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        // TODO Auto-generated method stub
        return true;
    }

    @Override
    public boolean isEnabled() {
        // TODO Auto-generated method stub
        return true;
    }
    
}
