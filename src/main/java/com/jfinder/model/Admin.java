package com.jfinder.model;


import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "admin")
public class Admin {

  @Id
  @GeneratedValue
  private int idadmin;

  private String name;
  private String password;

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public String getPassword() {
    return password;
  }

  public void setPassword(String password) {
    this.password = password;
  }

  public int getIdadmin() {
    return idadmin;
  }

  public void setIdadmin(int idadmin) {
    this.idadmin = idadmin;
  }
}
