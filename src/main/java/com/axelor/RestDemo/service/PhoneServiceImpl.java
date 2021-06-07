package com.axelor.RestDemo.service;

import javax.persistence.EntityManager;
import com.axelor.RestDemo.db.Phone;
import com.google.inject.Inject;
import com.google.inject.Provider;
import com.google.inject.Singleton;
import com.google.inject.persist.Transactional;

@Singleton
public class PhoneServiceImpl implements PhoneService {

  @Inject
  Provider<EntityManager> emp;

  @Transactional
  @Override
  public Phone PhoneById(Integer id) {
    EntityManager em = emp.get();
    Phone phone = em.find(Phone.class, id);
    return phone;
  }

  @Transactional
  @Override
  public boolean updatePhone(Phone phone) {
    EntityManager em = emp.get();
    System.out.println("PhoneServiceImpl.updatePhone" + phone.getPhoneNo() + phone.getPhoneType());
    Phone ph = em.find(Phone.class, phone.getId());
    ph.setPhoneNo(phone.getPhoneNo());
    ph.setPhoneType(phone.getPhoneType());
    return true;
  }

  @Transactional
  @Override
  public boolean deletePhoneById(Integer id) {
    EntityManager em = emp.get();
    Phone phone = em.find(Phone.class, id);
    em.remove(phone);
    return true;
  }

}
