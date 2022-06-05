<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%
String id = request.getParameter("id");
String email = request.getParameter("email");
String status = "cancel";
try{
    Connection con = ConnectionProvider.getcon();
    PreparedStatement ps = con.prepareStatement("update cart set status=? where product_id=? and email=? and address is not null");
    ps.setString(1, status);
    ps.setString(2, id);
    ps.setString(3,email);
    ps.executeUpdate();
    response.sendRedirect("ordersReceived.jsp?msg=cancel");
}
catch(Exception e){
  
    
out.println(e);
response.sendRedirect("ordersReceived.jsp?msg=wrong"); 
}
%>