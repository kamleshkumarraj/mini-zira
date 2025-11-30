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

        <form action="register" method="post" enctype="multipart/form-data" class="register-box">

            <h2 class="title">Register</h2>

            <!-- AVATAR PREVIEW -->
            <div class="avatar-section">
                <img id="avatarPreview" src="https://cdn-icons-png.flaticon.com/512/149/149071.png">
                <label class="upload-btn">
                    Upload Avatar
                    <input type="file" name="avatar" accept="image/*" onchange="previewAvatar(event)">
                </label>
            </div>

            <!-- INPUT FIELDS -->
            <div class="input-group">
                <label>Full Name</label>
                <input type="text" name="fullname" required>
            </div>

            <div class="input-group">
                <label>Username</label>
                <input type="text" name="username" required>
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

            <p class="login-link">Already have an account? <a href="<%= request.getContextPath() %>/app/login">Login</a></p>

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
