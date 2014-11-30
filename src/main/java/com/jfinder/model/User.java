package com.jfinder.model;

/**
 * Created by Abhinav on 11/23/2014.
 */

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "user")
public class User {
  @Id
  @GeneratedValue
  private int iduser;

  private String humberid;
  private String name;
  private String email;

/*  @OneToMany(fetch = FetchType.EAGER, mappedBy = "finder")
  private List<Item> finderItems;

  @OneToMany(fetch = FetchType.EAGER, mappedBy = "owner")
  private List<Item> ownerItems;*/

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

/*  public List<Item> getFinderItems() {
    return finderItems;
  }

  public void setFinderItems(List<Item> finderItems) {
    this.finderItems = finderItems;
  }

  public List<Item> getOwnerItems() {
    return ownerItems;
  }

  public void setOwnerItems(List<Item> ownerItems) {
    this.ownerItems = ownerItems;
  }*/
}
