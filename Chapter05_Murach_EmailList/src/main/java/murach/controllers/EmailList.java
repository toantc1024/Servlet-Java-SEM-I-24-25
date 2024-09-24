package murach.controllers;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import murach.models.User;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.Serializable;
import java.lang.reflect.Field;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

public class EmailList extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // clear all attributes\

        req.getSession().removeAttribute("errorMessages");
        Enumeration<String> parameterNames = req.getParameterNames();
        while (parameterNames.hasMoreElements()) {
            String parameterName = parameterNames.nextElement();
            System.out.println(parameterName);
               req.removeAttribute(parameterName);
        }
        RequestDispatcher dispatcher = req.getRequestDispatcher("form.jsp");
        dispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String url = "/thank.jsp";
        String firstName = req.getParameter("firstName");
        String lastName = req.getParameter("lastName");
        String email = req.getParameter("email");
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Map<String, String> errorMessages = new HashMap<>();
        String dobString = req.getParameter("dob");
Date dob = new Date();
            try {
dob = dateFormat.parse(dobString);
        } catch (ParseException e) {
            errorMessages.put("dobError","Error parsing the date: " + e.getMessage());
        }
        String hearUsOption = req.getParameter("hear_us_option");

        String contactMeBy = req.getParameter("contactMeBy");
        String[] selectedOptions = req.getParameterValues("options");
        boolean isLike  = req.getParameter("isLike") == null ? false : true;
        boolean isSend = req.getParameter("isSend") == null ? false : true;
        User user = new User( firstName, lastName, email, dob, selectedOptions, hearUsOption, contactMeBy, isLike, isSend);

        if(!user.Validate() || !errorMessages.isEmpty()) {
            if(user.getEmail().isEmpty()) {
                errorMessages.put("emailError", "Email can't be empty");
            }
            if (user.getLastName().isEmpty()) {
                errorMessages.put("lastNameError", "Last name can't be empty");
            }
            if(user.getFirstName().isEmpty()) {
                errorMessages.put("firstNameError", "First name can't be empty");
            }

            req.getSession().setAttribute("errorMessages", errorMessages );
            url = "/form.jsp";
        } else {
            req.setAttribute("user", user);
        }

        getServletContext().getRequestDispatcher(url).forward(req, resp);
    }
}
