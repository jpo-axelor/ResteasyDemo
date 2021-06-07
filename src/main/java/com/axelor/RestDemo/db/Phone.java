package com.axelor.RestDemo.db;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Phone {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Integer id;
  private String phoneType;
  private String phoneNo;

  public Phone(String phoneType, String phoneNo) {  //Constructor

    this.phoneType = phoneType;
    this.phoneNo = phoneNo;
  }

  public Phone(Integer id, String phoneType, String phoneNo) { //Constructor with ID for updating Record
    this.id = id;
    this.phoneType = phoneType;
    this.phoneNo = phoneNo;
  }

  public Phone() {}// Default Constructor


  public Integer getId() {
    return id;
  }

  public void setId(Integer id) {
    this.id = id;
  }

  public String getPhoneType() {
    return phoneType;
  }

  public void setPhoneType(String phoneType) {
    this.phoneType = phoneType;
  }

  public String getPhoneNo() {
    return phoneNo;
  }

  public void setPhoneNo(String phoneNo) {
    this.phoneNo = phoneNo;
  }

}
