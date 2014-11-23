package com.jfinder.service;

import com.jfinder.model.Item;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

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
  public void add(Item item) {
    em.persist(item);
  }
}
