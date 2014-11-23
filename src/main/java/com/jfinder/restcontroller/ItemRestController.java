package com.jfinder.restcontroller;

import com.jfinder.model.Item;
import com.jfinder.service.ItemService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/rest/item")
public class ItemRestController {

  @Autowired
  private ItemService itemService;

  @RequestMapping("getall")
  public @ResponseBody List<Item> getAllItems() {
    return itemService.getAll();
  }

}

