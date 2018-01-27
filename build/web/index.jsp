<%-- 
    Document   : index
    Created on : Jan 18, 2018, 3:58:08 PM
    Author     : paper
--%>
<%@ include file = "header.jsp" %>

        <div class="container" style="padding-top: 50px;">
            <h1>Hello <b><%=session.getAttribute("USERNAME") %></b></h1>
            
            <form action="indexMenu" method="POST">
                <input type="submit" name="btnAction" value="profile" class="btn btn-primary" />
                <input type="submit" name="btnAction" value="userCounter" class="btn btn-primary" />
                <input type="submit" name="btnAction" value="Logout" class="btn btn-primary" />
            </form>
        </div>
<%@ include file = "footer.jsp" %>