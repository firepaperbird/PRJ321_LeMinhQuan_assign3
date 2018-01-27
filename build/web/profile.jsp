<%-- 
    Document   : profile
    Created on : Jan 19, 2018, 11:44:08 PM
    Author     : paper
--%>

<%@page import="data.StoredUser"%>
<%@ include file = "header.jsp" %>

        <div class="container" style="padding-top: 50px;">
            <h1>user information</h1>
            <table class="table">
                <thead>
                     <th scope="col">Your UserName</th>
                     <th scope="col">Password</th>
                </thead>
                <tbody>
                    <%  StoredUser su = (StoredUser) request.getServletContext().getAttribute("SU");
                        String id =(String) session.getAttribute("USERNAME");
                        String pss = su.getPss(id);
                        %>
                        <tr>
                            <td><%=id %></td>
                            <td><%=pss %></td>
                        </tr>
                </tbody>
            </table>
        </div>
<%@ include file = "footer.jsp" %>

