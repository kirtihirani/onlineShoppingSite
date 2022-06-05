<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%
String id = request.getParameter("id");
String email = request.getParameter("email");
String status = "delivered";
try{
Connection con = ConnectionProvider.getcon();

PreparedStatement ps = con.prepareStatement("update cart set status=? where product_id=? and email=? and address is not null");
    ps.setString(1, status);
    ps.setString(2, id);
    ps.setString(3,email);
    ps.executeUpdate();
response.sendRedirect("ordersReceived.jsp?msg=delivered");
}
catch(Exception e){
  response.sendRedirect("ordersReceived.jsp?msg=wrong");  
out.println(e);
}
%>