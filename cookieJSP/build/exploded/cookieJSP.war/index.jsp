<%-- 
    Document   : index
    Created on : 12. 4. 2023, 18:29:01
    Author     : lukas
--%>

<%@page contentType="text/html" pageEncoding="windows-1250"%>
 
<%
    String name = null;
    String surname = null;
    String welcomeMessage = "Welcome! Please enter your name and surname:";
    Cookie[] cookies = request.getCookies();
    
    // Getting cookies and saving them.
    if (cookies != null) {
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("name")) name = cookie.getValue();
            if (cookie.getName().equals("surname")) surname = cookie.getValue();
        }
    }
    
    // If name and surname are set, display a personalized greeting.
    if (name != null && surname != null && (!name.isBlank() || !surname.isBlank())) {
        welcomeMessage = String.format("Hello back, %s %s!", name, surname);
    }
%>
 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1250">
        <meta name="author" content="Lukáš Sukeník">
        <title>JSP Cookies</title>
    </head>
    
    <body>
        <h1>JSP Cookies</h1>
        
        <h2><%= welcomeMessage %></h2>
        
        <% if (name == null || surname == null || (name.isBlank() && surname.isBlank())) { %>
            <form action="" method="post">
                <label for="name">Name:</label>
                <input type="text" name="name" /><br>
                <label for="surname">Surname:</label>
                <input type="text" name="surname" /><br>
                
                <input type="submit" value="Submit" />
            </form>
        <% } else { %>
            <p><a href="?clear=true">Clear cookies</a></p>
        <% } %>
        
        <%
            String nameParam = request.getParameter("name");
            String surnameParam = request.getParameter("surname");
            String clearCookies = request.getParameter("clear");
            
            // When form is submitted with both values, set this values as Cookies.
            if (nameParam != null && surnameParam != null) {
                Cookie nameCookie = new Cookie("name", request.getParameter("name"));
                Cookie surnameCookie = new Cookie("surname", request.getParameter("surname"));
                
                response.addCookie(nameCookie);
                response.addCookie(surnameCookie);
                response.sendRedirect("");
            }
            
            // When user clicks on "Clear cookies" button, then clear cookies.
            if (clearCookies != null && clearCookies.equals("true")) {
                Cookie nameCookie = new Cookie("name", "");
                Cookie surnameCookie = new Cookie("surname", "");
                
                nameCookie.setMaxAge(0);
                surnameCookie.setMaxAge(0);
                
                response.addCookie(nameCookie);
                response.addCookie(surnameCookie);
                response.sendRedirect("");
            }    
        %>
    </body>
</html>
