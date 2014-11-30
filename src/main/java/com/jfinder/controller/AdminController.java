package com.jfinder.controller;

import com.jfinder.model.Admin;
import com.jfinder.service.AdminService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/admin")
public class AdminController {

  @Autowired
  private AdminService adminService;

  @RequestMapping(value = "addAdmin", method = RequestMethod.POST)
  public String addAdmin(@ModelAttribute Admin admin) {
    adminService.add(admin);
    return "redirect:/";
  }

}
