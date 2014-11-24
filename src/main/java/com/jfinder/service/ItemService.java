package com.jfinder.service;

import com.jfinder.model.Item;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Service
public class ItemService {

  @PersistenceContext
  private EntityManager em;

  @Transactional
  public List<Item> getAll() {
    List<Item>
        itemList =
        em.createQuery("SELECT item FROM Item item", Item.class)
            .getResultList();
    return itemList;
  }

  @Transactional
  public List<Item> getItemByDescription(String description) {

    List<Item>
        itemList =
        em.createQuery("SELECT item FROM Item item "
                       + "WHERE item.description LIKE :description",
                       Item.class)
            .setParameter("description", "%" + description + "%")
            .getResultList();

    return itemList;
  }

  @Transactional
  public void add(Item item) {
    em.persist(item);
  }

  @Transactional
  public List<Item> getItemsByLocation(String location) {
    List<Item>
        itemList =
        em.createQuery("SELECT item FROM Item item "
                       + "WHERE item.location LIKE :location",
                       Item.class)
            .setParameter("location", "%" + location + "%")
            .getResultList();

    return itemList;
  }

  @Transactional
  public List<Item> getItemByDate(String date) {
    Date formattedDate = null;
    try {
      formattedDate =
          new SimpleDateFormat("yyyy-MM-d", Locale.CANADA).parse(date);
    } catch (ParseException e) {
      e.printStackTrace();
    }

    List<Item>
        itemList =
        em.createQuery("SELECT item FROM Item item "
                       + "WHERE item.datefound = :formattedDate",
                       Item.class)
            .setParameter("formattedDate",
                          formattedDate)
            .getResultList();

    return itemList;
  }
}
