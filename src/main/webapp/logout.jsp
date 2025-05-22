<%
    session.invalidate(); // Destroy session
    response.sendRedirect("home.jsp"); // Go back to home
%>
