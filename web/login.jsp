<%-- 
    Document   : login
    Created on : Jan 10, 2018, 1:23:12 PM
    Author     : paper
--%>

<%@ include file = "header.jsp" %>

        <div class="container" style="padding-top: 50px;">
          <div class="col-8">
            <%
                String msg = (String) session.getAttribute("ERRORms");
                if( msg!=null ){
                    out.print("<h2 style='color: red'>"+msg+"</h2>");
                    session.removeAttribute("ERRORms");
                }
            %>
            <form action="loginProcess" method="POST">
                <div class="form-group">
                    <label for="exampleInputEmail1">User Name</label>
                    <input type="text" name="userNameValue" value="" placeholder="Enter UserName" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp"/><br/>
                </div>
                <div class="form-group">
                    <label for="exampleInputPassword1">Password</label>
                    <input type="password" name="passwordValue" value="" class="form-control" id="exampleInputPassword1" placeholder="Password"/>
                </div>
                <input type="submit" value="Login" name="btnAction" class="btn btn-primary"/>
                <input type="submit" value="Register" name="btnAction" class="btn btn-primary"/>
            </form>
          </div>
        </div>
        
<%@ include file = "footer.jsp" %>
