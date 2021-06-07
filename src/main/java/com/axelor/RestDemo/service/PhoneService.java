package com.axelor.RestDemo.service;

import com.axelor.RestDemo.db.Phone;

public interface PhoneService {

  public Phone PhoneById(Integer id);
  public boolean updatePhone(Phone phone) ;
  public boolean deletePhoneById(Integer id);
//  public boolean createPhone(Phone phone) ;
}
