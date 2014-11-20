package com.jfinder.service;

import com.jfinder.model.Admin;

import org.springframework.stereotype.Service;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

@Service
public class AdminService {

  @PersistenceContext
  private EntityManager em;

  @Transactional
  public List<Admin> getAll() {
    List<Admin> adminList = em.createQuery("SELECT admin FROM Admin admin", Admin.class).getResultList();
    return adminList;
  }

  @Transactional
  public void add(Admin admin) {
    em.persist(admin);
  }

}
