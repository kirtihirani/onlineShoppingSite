<%@page import="java.sql.*" %>
<%@page import="project.ConnectionProvider" %>
<% 
String id = request.getParameter("id");
String name = request.getParameter("name");
String category = request.getParameter("category");
String price = request.getParameter("price");
String active = request.getParameter("active");
try{
    Connection con = ConnectionProvider.getcon();
    Statement st = con.createStatement();
    st.executeUpdate("update product set name='"+name+"', category='"+category+"', price='"+price+"', active='"+active+"'where id='"+id+"'");
    if(active.equals("No")){
        st.executeUpdate("delete from cart where product_id='"+id+"' and address is null ");
    }
    response.sendRedirect("allProductEditProduct.jsp?msg=done");
}
catch(Exception e){
    out.println(e);
    response.sendRedirect("allProductEditProduct.jsp?msg=wrong");
}

%>