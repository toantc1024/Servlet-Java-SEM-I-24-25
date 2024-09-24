<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap demo</title>
    <link rel="stylesheet" href="./styles/main.css"/>
    <script>

        // This JavaScript code will be executed when the JSP page is loaded
        window.onload = function () {
            let radios = document.querySelectorAll('input[type="radio"]');
            for (radio of radios) {
                if (radio.getAttribute("value") == "${param.hear_us_option}") {
                    radio.checked = true;
                }
            }
            // Add your JavaScript code here
        };
    </script>
</head>
<body>
<div class="wrapper">

    <div class="murach_logo">
        <img src="./assets/img.png"/>
    </div>

    <div>
        ${error}
    </div>

    <form method="post" action="emailList">
        <h1>Survey</h1>
        <p>If you have a moment, we'd appreciate it if you would fill out this survey.</p>

        <h2>Your information</h2>


        <div class="input_group">
            <div class="input">
                <label>First Name</label>
                <input value="${param.firstName}" onchange="hideError" name="firstName">
            </div>
            <c:if test="${not empty errorMessages.firstNameError}">
                <span id="firstNameError"
                      style="font-style:italic;font-size:0.8rem; color: red;">${errorMessages.firstNameError}</span>
            </c:if>
            <div class="input">
                <label>Last Name</label>
                <input value="${param.lastName}" name="lastName">

            </div>
            <c:if test="${not empty errorMessages.lastNameError}">
                <span onchange="hideError" id="lastNameError"
                      style="font-style:italic;font-size:0.8rem; color: red;">${errorMessages.lastNameError}</span>
            </c:if>
            <div class="input">
                <label>Email</label>
                <input value="${param.email}" onchange="hideError" name="email" type="email">
            </div>
            <c:if test="${not empty errorMessages.emailError}">
                <span id="emailError"
                      style="font-style:italic;font-size:0.8rem; color: red;">${errorMessages.emailError}</span>
            </c:if>
            <div class="input">
                <label>Date of Birth</label>
                <input type="date" data-date-format value="${param.dob}" onchange="hideError" name="dob">
            </div>
            <c:if test="${not empty errorMessages.dobError}">
                <span id="dobError"
                      style="font-style:italic;font-size:0.8rem; color: red;">${errorMessages.dobError}</span>
            </c:if>
        </div>
        <h2>How did you hear about us?</h2>

        <div style="display:flex; gap:1rem">
            <div>
                <input type="radio" id="se" name="hear_us_option" value="Search engine" checked>
                <label for="se">Search engine</label><br>

            </div>

            <div>
                <input type="radio" id="wom" name="hear_us_option" value="ord of mouth">
                <label for="wom">Word of mouth</label><br>
            </div>
            <div>
                <input type="radio" id="soc" name="hear_us_option" value="Social media">
                <label for="soc">Social media</label><br>
            </div>
            <div>
                <input type="radio" id="oth" name="hear_us_option" value="Other">
                <label for="oth">Other</label><br>
            </div>
        </div>

        <h2>Would you like to receive announcements about new CDs and special offers?</h2>
        <input
        ${param.isLike eq "true" ? "checked" : ""}

                type="checkbox" id="isLikeCheckbox" value="true" name="isLike">
        <label

                for="isLikeCheckbox"> YES, I'd like that.</label><br>

        <label for="contacts">Please contact me by:</label>
        <select name="contactMeBy" id="contacts">
            <c:set var="options" value="${['Email or postal', 'Phone', 'In person']}" scope="application"/>
            <c:forEach items="${options}" var="option">

                <option ${param.contactMeBy eq option ? 'selected' : ''} value="${option}">${option}</option>
            </c:forEach>
        </select>
        <br><br>
        <input type="submit" class="button" value="Submit">
    </form>


</div>
</body>
</html>