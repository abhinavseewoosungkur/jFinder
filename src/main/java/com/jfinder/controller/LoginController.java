package com.jfinder.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class LoginController  {

  @RequestMapping(value = "/login", method = RequestMethod.GET)
  public String login(Model model) {
    return "../login";
  }

  @RequestMapping(value = "/", method = RequestMethod.GET)
  public String homePage(Model model) {
    return "../itemsearch";
  }

}
