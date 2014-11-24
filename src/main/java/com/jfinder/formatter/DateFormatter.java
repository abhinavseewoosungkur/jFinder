package com.jfinder.formatter;

import org.springframework.format.Formatter;
import org.springframework.stereotype.Component;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

/**
 * Created by Abhinav on 11/24/2014.
 */
@Component
public class DateFormatter implements Formatter<Date> {

  @Override
  public Date parse(String s, Locale locale) throws ParseException {
    Date formattedDate = new SimpleDateFormat("yyyy-MM-d", Locale.CANADA)
        .parse(s);
    return formattedDate;
  }

  @Override
  public String print(Date date, Locale locale) {
    return date.toString();
  }
}
