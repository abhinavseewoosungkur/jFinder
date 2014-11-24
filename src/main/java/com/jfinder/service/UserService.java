package com.jfinder.service;

import com.jfinder.model.User;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Service
public class UserService {

  @PersistenceContext
  private EntityManager em;

  @Transactional
  public void add(User user) {
    em.persist(user);
  }

  @Transactional
  public List<User> getAll() {
    List<User> users = em.createQuery("SELECT user FROM User user", User.class).getResultList();
    return users;
  }

}
