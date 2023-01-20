package com.study.toy_springboots.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.toy_springboots.dao.MemberDao;

@Service
public class MemberService {
    @Autowired
    MemberDao memberDao;
    public Object getMemberData(Object dataMap) {
        String sqlMapId = "memberList.memberData";
        Object userData = memberDao.getMembersData(sqlMapId, dataMap);
        return userData;
    }

    public Object getOneMemberData(Object dataMap) {
        String sqlMapId = "memberList.memberDataOne";
        Object userData = memberDao.getOneMembersData(sqlMapId, dataMap);
        return userData;
    }

    public Object delete(Object dataMap) {
        String sqlMapId = "memberList.deleteMember";
        Object userData = memberDao.delete(sqlMapId, dataMap);
        return userData;
    }

    public Object update(Object dataMap) {
        String sqlMapId = "memberList.updateMember";
        Object userData = memberDao.update(sqlMapId, dataMap);
        return userData;
    }

    public Object save(Object dataMap) {
        String sqlMapId = "memberList.createMember";
        Object userData = memberDao.save(sqlMapId, dataMap);
        return userData;
    }

    public Object deleteAndGetList(Object dataMap) {
        Object result = this.delete(dataMap);
        result = this.getMemberData(dataMap);
        return result;
    }

    public Object updateAndGetList(Object dataMap) {
        Object result = this.update(dataMap);
        result = this.getMemberData(dataMap);
        return result;
    }

    public Object saveAndGetList(Object dataMap) {
        Object result = this.save(dataMap);
        result = this.getMemberData(dataMap);
        return result;
    }
}
