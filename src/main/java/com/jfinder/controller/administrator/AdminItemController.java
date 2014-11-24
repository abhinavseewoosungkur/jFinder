package com.jfinder.controller.administrator;

import com.jfinder.model.Item;
import com.jfinder.model.User;
import com.jfinder.service.ItemService;
import com.jfinder.service.UserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import java.util.List;

/**
 * Created by Abhinav on 11/24/2014.
 */
@Controller
@RequestMapping("/Administrator")
@SessionAttributes("administratorSession")
public class AdminItemController {

  @Autowired
  private ItemService itemService;

  @Autowired
  private UserService userService;

  @RequestMapping(method = RequestMethod.GET)
  public String setupForm(Model model) {
    Item item = new Item();
    model.addAttribute("administratorSession", item);
    return "../Administrator";
  }

  @RequestMapping(method = RequestMethod.POST)
  public String submitForm(@ModelAttribute("administratorSession") Item item,
                           BindingResult bindingResult, SessionStatus sessionStatus){
    itemService.add(item);
    return "../Administrator";
  }

  @ModelAttribute("userList")
  public List<User> getUsers() {
    return userService.getAll();
  }

}
