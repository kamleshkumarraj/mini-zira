<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String user = (String) session.getAttribute("username");
    String avatar = (String) session.getAttribute("userAvatar");
%>


<div class="header">
    <div class="nav-container">

        <!-- Logo -->
        <div class="logo">MiniZira</div>

        <!-- Navigation Links -->
        <div class="nav-links">
            <a href="dashboard.jsp">Dashboard</a>
            <a href="projects.jsp">Projects</a>
            <a href="tasks.jsp">Tasks</a>
            <a href="teams.jsp">Teams</a>
            <a href="issues.jsp">Issues</a>
            <a href="reports.jsp">Reports</a>
        </div>

        <!-- Right Side -->
        <div class="right">

            <% if(user == null){ %>

            <button  class="login-btn" onclick="location.href='<%= request.getContextPath() %>/auth/login'">
                Login
            </button>

            <% } else { %>

            <div class="avatar-box">
                <img src="<%= avatar != null ? avatar : "https://cdn-icons-png.flaticon.com/512/149/149071.png" %>" />

                <div class="dropdown">
                    <a href="#">👤 <%= user %></a>
                    <a href="profile.jsp">Profile</a>
                    <a href="settings.jsp">Settings</a>
                    <a href="logout">Logout</a>
                </div>
            </div>

            <% } %>

        </div>

    </div>
</div>
