<%-- 
    Document   : register.jsp
    Created on : Jan 18, 2018, 3:58:21 PM
    Author     : paper
--%>

<%@ include file = "header.jsp" %>

        <div class="container" style="padding-top: 50px;">
            <%
                String msg = (String) session.getAttribute("ERRORms");
                if( msg!=null ){
                    out.print("<p style='color: red'>"+msg+"</p>");
                    session.removeAttribute("ERRORms");
                }
            %>
            <form action="regis" method="POST">
                <div class="form-group">
                    <label for="exampleInputEmail1">User Name</label>
                    <input type="text" name="userNameValue" value="" placeholder="Enter UserName" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp"/><br/>
                </div>
                <div class="form-group">
                    <label for="exampleInputPassword1">Password</label>
                    <input type="password" name="passwordValue" value="" class="form-control" id="exampleInputPassword1" placeholder="Password"/>
                    <input type="password" name="rePasswordValue" value="" class="form-control" id="exampleInputPassword1" placeholder="re-enter pass"/>
                </div>
                <input type="submit" value="Register NOW" name="btnAction" class="btn btn-primary"/>
                <input type="reset" value="Reset" class="btn"/>
            </form>
        </div>
<%@ include file = "footer.jsp" %>

