<%-- 
    Document   : userCounter
    Created on : Jan 20, 2018, 8:04:29 AM
    Author     : paper
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="data.StoredUser"%>
<%@ include file = "header.jsp" %>

        <div class="container" style="padding-top: 50px;">
            <h1>all logged-in users</h1>
            <table class="table">
                <thead  class="thead-dark">
                    <th scope="col">#</th>
                    <th scope="col">User Name</th>
                </thead>
                <tbody>
                    <%  ArrayList<String> lst = (ArrayList) request.getServletContext().getAttribute("LST");
                        %>
                        <% for (int i=0; i<lst.size(); i++){ %>
                        <tr>
                            <th scope="row"><%=i+1 %></th>
                            <td><%=lst.get(i) %></td>
                        </tr>
                        <% } %>
                </tbody>
        </div>
<%@ include file = "footer.jsp" %>

