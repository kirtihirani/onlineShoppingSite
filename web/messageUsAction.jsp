<%@page import="project.ConnectionProvider"  %>
<%@page import="java.sql.*" %>
<%
String email = session.getAttribute("email").toString();
String sub = request.getParameter("subject");
String body = request.getParameter("body");
try{
    Connection con = ConnectionProvider.getcon();
    PreparedStatement ps = con.prepareStatement("insert into message(email,sub,body) values(?,?,?)");
    ps.setString(1,email);
    ps.setString(2, sub);
    ps.setString(3, body);
    ps.executeUpdate();
    response.sendRedirect("messageUs.jsp?msg=valid");
}      
        
        
        
catch(Exception e){
        
        response.sendRedirect("messageUs.jsp?msg=invalid");
        out.println(e);
        }
%>