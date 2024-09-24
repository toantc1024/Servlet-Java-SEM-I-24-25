<%@ page import="murach.models.User" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>Murach's Java Servlets and JSP</title>
    <link rel="stylesheet" href="styles/main.css" type="text/css"/>
</head>

<body>
<h1>Thanks for joining our email list</h1>

<p>Here is the information that you entered:</p>

<label>Email:</label>
<span>${user.email}</span><br>
<label>First Name:</label>
<span>${user.firstName}</span><br>
<label>Last Name:</label>
<span>${user.lastName}</span><br>
<label>Date of Birth:</label>
<span>${user.dateOfBirth}</span><br>
<label>You hear us on: </label>
<span>${user.hearUsOption}</span>
<br/>
<label>Receive offer announcements</label>
<%--<span>${user.isSendEmail}</span>--%>
<br/>
<label>Contact by: </label>
<span>${user.contactMeBy}</span>
<div>
    <div>
        <label>Is like to receive email:</label>
        <input type="checkbox" ${user.isLike() ? 'checked' : ''} disabled>
    </div>
    <div>
        <label>Receive emaill:</label>
        <input type="checkbox" ${user.isSend() ? 'checked' : ''} disabled>

    </div>


    </h3>
</div>


<p>To enter another email address, click on the Back
    button in your browser or the Return button shown
    below.</p>
<form action="" method="get">
    <input hidden="hidden" name="action" value="back"/>
    <button type="submit">Go back</button>
</form>
</body>
</html>
