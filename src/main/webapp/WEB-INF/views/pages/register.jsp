<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Register</title>



    <script>
        function previewAvatar(event){
            const img = document.getElementById("avatarImg");
            img.src = URL.createObjectURL(event.target.files[0]);
        }
    </script>

</head>

<body>

<div class="card">

    <h2>Create Account</h2>

    <form action="register" method="post" enctype="multipart/form-data">

        <!-- Avatar Preview -->
        <div class="avatar-preview">
            <img id="avatarImg" src="https://cdn-icons-png.flaticon.com/512/149/149071.png" alt="Avatar">
        </div>

        <div class="inputBox">
            <label>Full Name</label>
            <input type="text" name="fullName" required>
        </div>

        <div class="inputBox">
            <label>Email</label>
            <input type="email" name="email" required>
        </div>

        <div class="inputBox">
            <label>Username</label>
            <input type="text" name="username" required>
        </div>

        <div class="inputBox">
            <label>Password</label>
            <input type="password" name="password" required>
        </div>

        <div class="inputBox">
            <label>Confirm Password</label>
            <input type="password" name="confPassword" required>
        </div>

        <div class="inputBox">
            <label>Upload Avatar</label>
            <input type="file" name="avatar" accept="image/*" onchange="previewAvatar(event)">
        </div>

        <button type="submit">Register</button>

    </form>
</div>

</body>
</html>
