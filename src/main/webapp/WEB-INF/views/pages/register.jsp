<%@ page import="java.io.PrintWriter" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>MiniZira – Register</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/register.css">
</head>

<body>

<div class="register-wrapper">

    <%
        String message = (String) request.getAttribute("message");
        String error = (String) request.getAttribute("error");


    %>

    <%= message %>
    <%= error%>
    <!-- LEFT SIDE STATIC PANEL -->
    <div class="left-panel">
        <h1>Create Your MiniZira Account 🚀</h1>
        <p>Manage your projects, issues, tasks & teams in one powerful modern dashboard.</p>

        <div class="brand-box">
            <h2>MiniZira</h2>
            <p>Simple. Fast. Modern. A clean alternative to Jira.</p>
        </div>
    </div>

    <!-- RIGHT SIDE FORM PANEL -->
    <div class="right-panel">

        <form action="<%= request.getContextPath()%>/register" method="post" enctype="application/x-www-form-urlencoded" class="register-box">

            <h2 class="title">Register</h2>



            <!-- INPUT FIELDS -->
            <div class="input-group">
                <label>Full Name</label>
                <input type="text" name="fullName" required>
            </div>

            <div class="input-group">
                <label>Username</label>
                <input type="text" name="username" required>
            </div>

            <div class="input-group">
                <label>Role</label>
                <input type="text" name="role" required>
            </div>

            <div class="input-group">
                <label>Email</label>
                <input type="email" name="email" required>
            </div>

            <div class="input-group">
                <label>Password</label>
                <input type="password" name="password" required>
            </div>

            <div class="input-group">
                <label>Confirm Password</label>
                <input type="password" name="confirmPassword" required>
            </div>

            <button type="submit" class="register-btn">Create Account</button>

            <p class="login-link">Already have an account? <a href="login">Login</a></p>

        </form>

    </div>

</div>

<!-- Avatar Preview JS -->
<script>
    function previewAvatar(event){
        const img = document.getElementById("avatarPreview");
        img.src = URL.createObjectURL(event.target.files[0]);
    }


</script>

</body>
</html>
