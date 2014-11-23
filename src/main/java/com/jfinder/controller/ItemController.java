package com.jfinder.controller;

import com.jfinder.model.Item;
import com.jfinder.service.ItemService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/item")
public class ItemController {

  @Autowired
  private ItemService itemService;

  @RequestMapping(value = "add", method = RequestMethod.POST)
  public String addItem(@ModelAttribute Item item) {
    item.setDatefound(new Date());
    itemService.add(item);
    return "redirect:/";
  }

  @RequestMapping(value="getAll")
  public List<Item> getAllItems() {
    return itemService.getAll();
  }

}
