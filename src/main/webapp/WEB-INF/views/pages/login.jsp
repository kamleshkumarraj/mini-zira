<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>MiniZira – Login</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/login.css">
</head>

<body>

<div class="login-wrapper">

    <!-- LEFT SIDE PANEL -->
    <div class="left-panel">
        <h1>Welcome Back 👋</h1>
        <p>Login to manage your projects, teams,<br>tasks, issues and workflows with MiniZira.</p>

        <div class="brand-box">
            <h2>MiniZira</h2>
            <p>The lightweight alternative to Jira — fast, clean & modern.</p>
        </div>
    </div>

    <!-- RIGHT SIDE LOGIN FORM -->
    <div class="right-panel">

        <form action="login" method="post" class="login-box">

            <h2 class="title">Login</h2>

            <div class="input-group">
                <label>Email</label>
                <input type="email" name="email" required>
            </div>

            <div class="input-group">
                <label>Password</label>
                <input type="password" name="password" required>
            </div>

            <button type="submit" class="login-btn">Login</button>

            <p class="register-link">Don't have an account? <a href="register.jsp">Create Now</a></p>

        </form>

    </div>

</div>

</body>
</html>
