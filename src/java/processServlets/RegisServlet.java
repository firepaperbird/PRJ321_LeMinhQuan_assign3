/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package processServlets;

import data.StoredUser;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.regex.Pattern;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author paper
 */
public class RegisServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String url = "register.jsp";
        HttpSession session = request.getSession();
        ServletContext servletContext = request.getServletContext();
        try {
            String userName = request.getParameter("userNameValue").toLowerCase();
            String password = request.getParameter("passwordValue");
            String rePassword = request.getParameter("rePasswordValue");
            Pattern pattern = Pattern.compile("[A-Za-z0-9_.]+");
            Pattern passPattern = Pattern.compile("^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*[#?!@$%^&*-_.+=~:;<>?]).{9,}");
            
            if (pattern.matcher(userName).matches() && userName.length() > 6) {
                if (passPattern.matcher(password).matches()) {
                    if (password.equals(rePassword)) {
                        StoredUser su = (StoredUser) servletContext.getAttribute("SU");
                        if (su == null) {   //check if StoredUser is Exis yet ? 
                            su = new StoredUser();
                        }
                        if(su.haveUsed(userName)){
                            session.setAttribute("ERRORms", "User name aready used, try another.");
                        } else {
                            su.addUser(userName, password);
                            servletContext.setAttribute("SU", su);
                            url = "login.jsp";
                        }
                        
                    } else {
                        session.setAttribute("ERRORms", "re-password is not match!");
                    }
                } else {
                    session.setAttribute("ERRORms", "Password: must contains at least one upper case, one number, one special character AND length must be > 8");
                }
            } else
                session.setAttribute("ERRORms", "Username: cannot contains special characters like '\"!@#$%^&*()-+=`~{}\\|:;<>,./ AND length must be > 6");
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            response.sendRedirect(url);
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
