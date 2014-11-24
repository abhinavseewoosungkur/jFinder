package com.jfinder.model;

/**
 * Created by Abhinav on 11/23/2014.
 */

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

;

@Entity
@Table(name = "user")
public class User {
  @Id
  @GeneratedValue
  private int iduser;

  private String humberid;
  private String name;
  private String email;

  @OneToMany(fetch = FetchType.LAZY, mappedBy = "finder")
  private List<Item> items;

  public String getHumberid() {
    return humberid;
  }

  public void setHumberid(String humberid) {
    this.humberid = humberid;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public String getEmail() {
    return email;
  }

  public void setEmail(String email) {
    this.email = email;
  }

  public int getIduser() {
    return iduser;
  }

  public void setIduser(int iduser) {
    this.iduser = iduser;
  }
}
