package com.axelor.RestDemo.service;

import java.util.List;
import com.axelor.RestDemo.db.Contact;

public interface ContactService {
  
  public boolean createContact(Contact c) ;
  public List<Contact> readContacts() ;
  public Contact readContactById(Integer id) ;
  public boolean updateContact(Contact c) ;
  public boolean deleteContactById(Integer id);
  public List<Contact> readContactByName(String name);
  
}
