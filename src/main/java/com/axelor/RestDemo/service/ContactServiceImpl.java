package com.axelor.RestDemo.service;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import com.axelor.RestDemo.db.Contact;
import com.google.inject.Inject;
import com.google.inject.Provider;
import com.google.inject.persist.Transactional;

public class ContactServiceImpl implements ContactService {

  @Inject
  Provider<EntityManager> emp;

  @Transactional
  @Override
  public boolean createContact(Contact c) {
    System.out.println("For Checking name :" + c.getName());
    EntityManager em = emp.get();
    em.persist(c);
    return true;
  }

  @Transactional
  @Override
  public List<Contact> readContacts() {
    EntityManager em = emp.get();
    List<Contact> contactList = em.createQuery("from Contact", Contact.class).getResultList();
    return contactList;
  }

  @Transactional
  @Override
  public Contact readContactById(Integer id) {
    EntityManager em = emp.get();
    Contact contact = em.find(Contact.class, id);
    return contact;
  }

  @Transactional
  @Override
  public boolean updateContact(Contact c) {
    EntityManager em = emp.get();
    Contact contact = em.find(Contact.class, c.getId());
    contact.setName(c.getName());
    contact.setPhoneNo(c.getPhoneNo());
    return true;
  }

  @Transactional
  @Override
  public boolean deleteContactById(Integer id) {
    EntityManager em = emp.get();
    Contact contact = em.find(Contact.class, id);
    em.remove(contact);
    return true;
  }

  @Transactional
  @Override
  public List<Contact> readContactByName(String name) {
    System.out.println("CSImpl method() called :"+"name" + name);
    EntityManager em = emp.get();
    TypedQuery<Contact> query =
        em.createQuery("SELECT c FROM Contact c where Lower(c.name) LIKE '%" + name.toLowerCase() + "%'", Contact.class);
    List<Contact> contacts = query.getResultList();
    return contacts;
  }



}
