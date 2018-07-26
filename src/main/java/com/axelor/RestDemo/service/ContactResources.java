package com.axelor.RestDemo.service;

import java.io.IOException;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.FormParam;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.core.Context;
import org.jboss.resteasy.plugins.providers.html.View;
import com.axelor.RestDemo.db.Contact;
import com.google.inject.Inject;

@Path("contact")
public class ContactResources {

  @Inject
  ContactService csi;

  @POST
  @Path("/create")
//  @Produces(MediaType.APPLICATION_JSON)
  public void createContact(@Context HttpServletResponse response,
      @Context HttpServletRequest request, @FormParam(value = "name") String name,
      @FormParam(value = "phoneNo") String phoneNo) throws IOException {

    Contact c = new Contact(name, phoneNo);
    csi.createContact(c);
    response.sendRedirect(request.getContextPath() + "/contact/get");
  }

  @GET
  @Path("/get")
//  @Produces(MediaType.APPLICATION_JSON)
  public View readContacts(@Context HttpServletRequest request) {
    List<Contact> list = csi.readContacts();
    return new View("/listView.jsp", list, "contactList");
  }

  @GET
  @Path("/get/{id}")
  public View readContactById(@Context HttpServletResponse response,
      @Context HttpServletRequest request, @PathParam("id") Integer id) {
    Contact c = csi.readContactById(id);
    System.out.println("View readContactById--->" + c.getName() + c.getPhoneNo());
    return new View("/view.jsp", c, "ContactObj");
  }

  @POST
  @Path("/get/name")
//  @Produces(MediaType.APPLICATION_JSON)
  public View readContactByName(@Context HttpServletResponse response,
      @Context HttpServletRequest request) {
    String name = request.getParameter("searchText");
    List<Contact> list = csi.readContactByName(name);
    return new View("/listView.jsp", list, "contactList");
  }

  @POST
  @Path("/update")
  public void updateContact(@Context HttpServletResponse response,
      @Context HttpServletRequest request, @FormParam(value = "id") Integer id,
      @FormParam(value = "name") String name, @FormParam(value = "phoneNo") String phoneNo)
      throws IOException {
    Contact c = new Contact(id, name, phoneNo);
    System.out.println("View updateContact--->" + c.getName() + c.getPhoneNo());
    csi.updateContact(c);
    response.sendRedirect(request.getContextPath() + "/contact/get");
  }

  @GET
  @Path("/delete/{id}")
  public void deleteContact(@PathParam("id") Integer id, @Context HttpServletResponse response,
      @Context HttpServletRequest request) throws IOException {
    csi.deleteContactById(id);
    response.sendRedirect(request.getContextPath() + "/contact/get");
  }
}
