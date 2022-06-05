<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*"%>
<%
    try{
        Connection con = ConnectionProvider.getcon();
        Statement st = con.createStatement();
        String q1 = "CREATE TABLE users(name varchar(100), email varchar(100)primary key,mobilenumber bigint, securityQuestion varchar(200),answer varchar(200),password varchar(100),address varchar(100),city varchar(100), state varchar(100),country varchar(100))";
        String q2 = "CREATE TABLE product(id int,name varchar(100), category varchar(100),price int,active varchar(10) ";
        System.out.print(q1);
        //st.execute(q1);
        System.out.print("table has been created");
        st.execute(q2);
    }
    catch(Exception e){
        System.out.println(e);
    }
    %>