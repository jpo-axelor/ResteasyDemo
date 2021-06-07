package com.axelor.RestDemo.service;

import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.core.Context;
import org.jboss.resteasy.plugins.providers.html.View;
import com.axelor.RestDemo.db.Phone;
import com.google.inject.Inject;

@Path("phone")
public class PhoneResources {
  @Inject
  PhoneService ps;

  @GET
  @Path("/get/{pid}")
  public View readPhoneById(@PathParam("pid") Integer pid) {
    Phone phone = ps.PhoneById(pid);
    System.out.println("View readContactById--->" + phone.getPhoneNo() + phone.getPhoneType());
    return new View("/phoneview.jsp", phone, "phoneObj");
  }

  @POST
  @Path("/update")
  public void updatePhone(@Context HttpServletResponse response,
      @Context HttpServletRequest request) throws IOException {

    int id = Integer.parseInt(request.getParameter("id"));
    String phoneType = request.getParameter("phoneType");
    String phoneNo = request.getParameter("phoneNo");

    Phone phone = new Phone(id, phoneType, phoneNo);
    ps.updatePhone(phone);
    response.sendRedirect(request.getContextPath() + "/contact/get");
  }

  @GET
  @Path("/delete/{id}")
  public void deleteContact(@PathParam("id") Integer id, @Context HttpServletResponse response,
      @Context HttpServletRequest request) throws IOException {
    ps.deletePhoneById(id);
    response.sendRedirect(request.getContextPath() + "/contact/get");
  }
}
