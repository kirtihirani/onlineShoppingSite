<%@page import="project.ConnectionProvider"  %>
<%@page import="java.sql.*" %>
<%  try{
    String email = session.getAttribute("email").toString();
    String address = request.getParameter("address");
    String city = request.getParameter("city");
    String state = request.getParameter("state");
    String country = request.getParameter("country");
    Connection con = ConnectionProvider.getcon();
    PreparedStatement ps = con.prepareStatement("update users set address='"+address+"', city='"+city+"',state='"+state+"' ,country='"+country+"' where email='"+email+"'");
    ps.executeUpdate();
    response.sendRedirect("addChangeAddress.jsp?msg=valid");
}
catch(Exception e){
System.out.println(e);
}
    
%>

