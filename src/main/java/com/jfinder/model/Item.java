package com.jfinder.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "item")
public class Item {

  /**
   * Primary key of item
   */
  @Id
  @GeneratedValue
  private int iditem;
  private String name;
  private String description;
  private String location;
  private Date datefound;

  @ManyToOne(fetch = FetchType.EAGER)
  @JoinColumn(name = "finderid", referencedColumnName = "iduser")
  private User finder;

  @ManyToOne(fetch = FetchType.EAGER)
  @JoinColumn(name = "ownerid", referencedColumnName = "iduser")
  private User owner;


  public int getIditem() {
    return iditem;
  }

  public void setIditem(int iditem) {
    this.iditem = iditem;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public String getDescription() {
    return description;
  }

  public void setDescription(String description) {
    this.description = description;
  }

  public String getLocation() {
    return location;
  }

  public void setLocation(String location) {
    this.location = location;
  }

  public Date getDatefound() {
    return datefound;
  }

  public void setDatefound(Date datefound) {
    this.datefound = datefound;
  }

  public User getFinder() {
    return finder;
  }

  public void setFinder(User finder) {
    this.finder = finder;
  }

  public User getOwner() {
    return owner;
  }

  public void setOwner(User owner) {
    this.owner = owner;
  }
}
