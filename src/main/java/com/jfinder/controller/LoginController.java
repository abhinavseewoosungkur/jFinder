package com.jfinder.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by Abhinav on 11/29/2014.
 */
@Controller
@RequestMapping("/login")
public class LoginController  {

  @RequestMapping(method = RequestMethod.GET)
  public String setupForm(Model model) {
    return "../login";
  }

}
