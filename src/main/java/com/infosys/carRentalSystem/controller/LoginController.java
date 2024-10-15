package com.infosys.carRentalSystem.controller;

import com.infosys.carRentalSystem.service.CarUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class LoginController {

    @Autowired
    private BCryptPasswordEncoder bCrypt;

    @Autowired
    private CarUserService service;
    @GetMapping("/loginpage")
    public ModelAndView showLoginPage() {
        return new ModelAndView("loginPage");
    }
    @GetMapping("/loginerror")
    public ModelAndView showLoginErrorPage() {
        return new ModelAndView("loginErrorPage");
    }

    @GetMapping("/index")
    public ModelAndView showIndexPage() {
        return new ModelAndView("index"); // This will resolve to /WEB-INF/jsp/index.jsp
    }
}
