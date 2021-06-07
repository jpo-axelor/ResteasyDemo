package com.axelor.RestDemo.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.Context;
import org.jboss.resteasy.plugins.providers.html.View;

import com.axelor.RestDemo.db.Book;
import com.axelor.RestDemo.db.Contact;
import com.axelor.RestDemo.db.Phone;
import com.google.inject.Inject;


@Path("contact")
public class ContactResources {

  @Inject
  ContactService cs;

  @POST
  @Path("/create")
  public void createContact(@Context HttpServletResponse response,
      @Context HttpServletRequest request) throws IOException {

    int count = Integer.parseInt(request.getParameter("count"));
    List<Phone> list = new ArrayList<Phone>();
    String phoneType, phoneNo;

    for (int i = 0; i < count; i++) {
      phoneType = request.getParameter("phoneType[" + i + "]");
      phoneNo = request.getParameter("phoneNo[" + i + "]");
      list.add(new Phone(phoneType, phoneNo));
    }
    Contact c = new Contact(request.getParameter("name"), list);
    Book book= new Book("test-book-name");
    book.setContact(c);
    c.setBook(book);
    cs.createContact(c);
    response.sendRedirect(request.getContextPath() + "/contact/get");
  }

  @GET
  @Path("/get")
  public View readContacts() {
    List<Contact> list = cs.readContacts();
    return new View("/index.jsp", list, "contactList");
  }

  @GET
  @Path("/get/{id}")
  public View readContactById(@Context HttpServletResponse response,
      @Context HttpServletRequest request, @PathParam("id") Integer id) {
    Contact c = cs.readContactById(id);
    System.out.println(
        "ContactResources.readContactById--->" + c.getName() + c.getPhone() + c.getPhone().size());
    return new View("/view.jsp", c, "ContactObj");
  }

  @GET
  @Path("/get/name/")
  public View readContactByName(@Context HttpServletResponse response,
      @Context HttpServletRequest request, @QueryParam(value = "searchText") String searchText) {
    List<Contact> list = cs.readContactByName(searchText);
    return new View("/index.jsp", list, "contactList");
  }

  @POST
  @Path("/update")
  public void updateContact(@Context HttpServletResponse response,
      @Context HttpServletRequest request) throws IOException {

    int listSize = Integer.parseInt(request.getParameter("size"));
    List<Phone> list = new ArrayList<Phone>();
    for (int i = 0; i < listSize; i++) {
      list.add(new Phone(request.getParameter("phoneType[" + i + "]"),
          request.getParameter("phoneNo[" + i + "]")));
    }
    int id = Integer.parseInt(request.getParameter("id"));
    String name = request.getParameter("name");
    Contact c = new Contact(name, list);
    cs.updateContact(c, id);
    response.sendRedirect(request.getContextPath() + "/contact/get");
  }

  @GET
  @Path("/delete/{id}")
  public void deleteContact(@PathParam("id") Integer id, @Context HttpServletResponse response,
      @Context HttpServletRequest request) throws IOException {
    cs.deleteContactById(id);
    response.sendRedirect(request.getContextPath() + "/contact/get");
  }

}
