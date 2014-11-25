package com.jfinder.formatter;

import com.jfinder.model.User;
import com.jfinder.service.UserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.Formatter;
import org.springframework.stereotype.Component;

import java.text.ParseException;
import java.util.Locale;

/**
 * Created by Abhinav on 11/24/2014.
 */
@Component
public class UserFormatter implements Formatter<User> {

  @Autowired
  UserService userService;

  @Override
  public User parse(String userId, Locale locale) throws ParseException {
    return userService.getUser(userId);
  }

  @Override
  public String print(User user, Locale locale) {
    return user.getHumberid() + " " + user.getName();
  }
}
