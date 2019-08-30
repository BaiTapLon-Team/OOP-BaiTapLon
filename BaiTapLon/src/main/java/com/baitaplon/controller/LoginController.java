package com.baitaplon.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginController {
    @RequestMapping(value = {"/dang-nhap"})
    public String login() {
        return "login";
    }

    //Thử xem nào.
}
