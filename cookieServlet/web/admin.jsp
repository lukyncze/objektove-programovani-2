<%-- 
    Document   : home
    Created on : 15. 4. 2023, 20:58:11
    Author     : lukas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="author" content="Lukáš Sukeník">
        <title>Servlet Session</title>
    </head>
    <body>
        <h1>Servlet Session</h1><hr>
        
        <% boolean isAdmin = session.getAttribute("username") != null 
            && session.getAttribute("username").equals("admin"); %>
        
        <% if (isAdmin) { %>
            <%@page import="java.util.Random" %>
            <% 
                String[] jokes = {"Why don't scientifist trust atoms? Because they make up everything!",
                      "Why did the scarecrow win an award? Beacause he was outstanding in his field!",
                      "Why couldn't the bicycle stand up by itself? It was two-tired!",
                      "What's orange and sound like a parrot? A carrot!"};
                
                Random random = new Random();
                int randomIndex = random.nextInt(jokes.length);
            %>
        
            <h2>Welcome, <%= session.getAttribute("username") %>!</h2>
        
            <form action="logout" method="post">
                <input type="submit" value="Logout"><br>
            </form>
            
            <p><%= jokes[randomIndex] %></p>
            
        <% } else { %>
            <h2>Unauthorized access! You must go back to landing page and log-in!</h2>
        <% } %>
        
        <a href="./index.html">Go back to Landing Page</a>
    </body>
</html>
