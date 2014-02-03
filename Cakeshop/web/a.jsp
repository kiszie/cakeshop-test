<%@ page import ="java.sql.*" %>
<%
    String username = request.getParameter("username2");
    String pwd = request.getParameter("password2");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Cakeshop",
            "root", "1234");
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from customer where username='" + username + "' and password='" +pwd +"'");
    if (rs.next()) {
        session.setAttribute("username", username);
        //out.println("welcome " + userid);
        //out.println("<a href='logout.jsp'>Log out</a>");
        response.sendRedirect("index.jsp");
    } else {
        out.println("Invalid password <a href='login.jsp'>try again</a>");
    }
%>
