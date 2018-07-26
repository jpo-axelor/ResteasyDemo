package com.axelor.RestDemo.db;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
@Entity
public class Contact implements Serializable {
  private static final long serialVersionUID = 1L;
  @Id
  @GeneratedValue
  private Integer id;
  private String name;
  private String phoneNo;

  // Constructors
  public Contact(String name, String phoneNo) {
    this.name = name;
    this.phoneNo = phoneNo;
  }

  public Contact() {
    super();
  }

  public Contact(int id, String name, String phoneNo) {
    this.id = id;
    this.name = name;
    this.phoneNo = phoneNo;

  }

  // Getters n Setters
  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public String getPhoneNo() {
    return phoneNo;
  }

  public void setPhoneNo(String phoneNo) {
    this.phoneNo = phoneNo;
  }

  public Integer getId() {
    return id;
  }

  public void setId(Integer id) {
    this.id = id;
  }


}
