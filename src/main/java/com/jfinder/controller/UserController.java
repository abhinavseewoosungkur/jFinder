package com.jfinder.controller;

import com.jfinder.model.User;
import com.jfinder.service.UserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller @RequestMapping("/user")
public class UserController {

  @Autowired
  private UserService userService;

  @RequestMapping(value = "add", method = RequestMethod.POST)
  public String addUser(@ModelAttribute User user) {
    userService.add(user);
    return "redirect:/Administrator";
  }

}
