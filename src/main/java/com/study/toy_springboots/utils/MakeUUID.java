package com.study.toy_springboots.utils;

import java.util.UUID;

import org.springframework.stereotype.Component;

@Component
public class MakeUUID {
    public String makeUuid() {
        UUID uuid = UUID.randomUUID();
        return uuid.toString();
    }
}
